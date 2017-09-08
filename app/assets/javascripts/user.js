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
	$(div).css( "background-color", 'red' );
	h2 = $(div).children();
	h2.addClass('h2-hover-effect');
}; 

function hoverOutEffect(div) {
	$(div).css( "background-color", '#29b2fe' );
  h2 = $(div).children();
  h2.removeClass('h2-hover-effect');
}

$(document).on('turbolinks:load', ready);