/* User controller Js effects */

var ready = function () {
  /*$('.price-left-unit').hover(hoverInEffect(this), hoverOutEffect(this));*/
  /*$('.price-left-unit').mouseenter(message());*/
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
      h2 = $(div).children();
      h2.addClass('prices-h2-effect');
      break;
    case 'row descriptions':
      break
    default: 
  }
}; 

function hoverOutEffect(div) {
	$(div).removeClass('prices-col-effect');
  h2 = $(div).children();
  h2.removeClass('prices-h2-effect');
}

$(document).on('turbolinks:load', ready);