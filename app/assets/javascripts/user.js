/* User controller Js effects */

var ready = function () {
  $( ".hero-unit.col-sm-4" ).hover(
  	function(){
  		hoverInEffect(this)
  	}, 
  	function(){
  		hoverOutEffect(this)
  	}
  )
}

function message() {
	console.log('mouseenter')
};

function hoverInEffect (div) {
  className = $(div).parent()[0].className
  switch (className) {
    case 'row prices':
      $(div).addClass('prices-col-effect');
      $number = $(div).find('.number');
      $number.addClass('prices-h2-effect');
      break;
    case 'row descriptions':
      break
    default: 
  }
}; 

function hoverOutEffect(div) {
	$(div).removeClass('prices-col-effect');
  $number = $(div).find('.number')
  $number.removeClass('prices-h2-effect');
}

$(document).on('turbolinks:load', ready);