$(document).ready(function() {

	preload(
		"http://web.concernedjoe.com/Theme/Images/About/flashplayO.jpg"
	);
	
	$('#FlashPrototypePlaceholder').click(function() {
		$('#FlashPrototype').html('');
		flashembed("FlashPrototype", "/Theme/FlashJoe.swf");
		$("object[type='application/x-shockwave-flash']").append('<param name="wMode" value="transparent"/>');
	});

});