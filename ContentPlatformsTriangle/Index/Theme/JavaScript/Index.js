$(document).ready(function() {

	preload(
		"http://web.concernedjoe.com/Theme/Images/Index/playjoenowO.png",
		"http://web.concernedjoe.com/Theme/Images/Index/mailO.png",
		"http://web.concernedjoe.com/Theme/Images/Index/indiedbO.png",
		"http://web.concernedjoe.com/Theme/Images/Index/twitterO.png",
		"http://web.concernedjoe.com/Theme/Images/Index/facebookO.png"
	);

	$("#joe_movie").one("click", function() {
		$(this).html('<iframe width="640" height="360" src="//www.youtube.com/embed/YToDUHdwHQ4?rel=0&autoplay=1" frameborder="0" allowfullscreen></iframe>');
	});
	
});