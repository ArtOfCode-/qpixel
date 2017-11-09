var ready = function () {
	if (window.location.pathname == '/') {
		$('#price').hide();
	}
}

$(document).on('turbolinks:load', ready);