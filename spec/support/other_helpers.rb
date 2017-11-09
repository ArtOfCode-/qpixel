module Helpers
	def build_attributes(*args)
		FactoryGirl.build(*args).attributes.delete_if do |k, v|
			["id", "created_at", "updated_at"].member?(k) || v.nil?
		end
	end
end