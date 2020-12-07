# Provides web and API actions that relate to flagging.
class FlagsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_moderator, only: [:queue, :handled]
  before_action :flag_verify, only: [:resolve]

  def new
    type = if params[:flag_type].present?
             PostFlagType.find params[:flag_type]
           end

    recent_flags = Flag.where(created_at: 24.hours.ago..Time.now, user: current_user).count
    max_flags_per_day = SiteSetting[current_user.privilege?('unrestricted') ? 'RL_Flags' : 'RL_NewUserFlags']

    if recent_flags >= max_flags_per_day
      flag_limit_msg = 'Thank you. Flags from people like you help us keep this site clean.' \
                       " However, you have reached your daily flag limit of #{max_flags_per_day}" \
                       ' flags. Please come back tomorrow to continue flagging.'

      AuditLog.rate_limit_log(event_type: 'flag', related: Post.find(params[:post_id]), user: current_user,
                        comment: "limit: #{max_flags_per_day}\n\ntype:#{type}\ncomment:\n#{params[:reason].to_i}")

      render json: { status: 'failed', message: flag_limit_msg }, status: 403
      return
    end

    @flag = Flag.new(post_flag_type: type, reason: params[:reason], post_id: params[:post_id], user: current_user)
    if @flag.save
      render json: { status: 'success' }, status: 201
    else
      render json: { status: 'failed', message: 'Flag failed to save.' }, status: 500
    end
  end

  def history
    @user = User.find(params[:id])
    unless @user == current_user || (current_user.is_admin || current_user.is_moderator)
      not_found
      return
    end
    @flags = @user.flags.includes(:post).order(id: :desc).paginate(page: params[:page], per_page: 50)
    @statuses = @flags.group(:status).count(:status)
  end

  def queue
    @flags = Flag.unhandled.includes(:post, :user).paginate(page: params[:page], per_page: 20)
  end

  def handled
    @flags = Flag.handled.includes(:post, :user, :handled_by).order(created_at: :desc)
                 .paginate(page: params[:page], per_page: 50)
  end

  def resolve
    if @flag.update(status: params[:result], message: params[:message], handled_by: current_user,
                    handled_at: DateTime.now)
      AbilityQueue.add(@flag.user, "Flag Handled ##{@flag.id}")
      render json: { status: 'success' }
    else
      render json: { status: 'failed', message: 'Failed to save new status.' }, status: 500
    end
  end

  private

  def flag_verify
    @flag = Flag.find params[:id]
    return false if current_user.nil?

    type = @flag.post_flag_type
    unless current_user.is_moderator
      return not_found unless current_user.privilege? 'flag_curate'
      return not_found if type.nil? || type.confidential
      return not_found if current_user.id == @flag.user.id
    end
  end
end
