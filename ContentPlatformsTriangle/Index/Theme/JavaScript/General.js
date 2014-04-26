var tdWidth = 0;
var user = 0;

function CheckHeaderSize(){
	if($(window).width() < 1300) {
		$(".navbar-right").css({"padding-right": '0%'});
		$(".navbar-default").css({"padding-left": '0%'});
	}else{
		$(".navbar-right").css({"padding-right": '10%'});
		$(".navbar-default").css({"padding-left": '10%'});
	}

	if(user == 0){
		user = $("#UsernameSpan").html();
	}

	if(user) {
			if($(window).width() < 1030 && user.length > 4) {
			$("#UsernameSpan").html(user.substring(0,4) + "...");
		} else {
			$("#UsernameSpan").html(user);
		}
	}

}


$("#bootstrapcontainer").ready(function(){
	CheckHeaderSize();
})

$(document).ready(function() {
	
	var audioArray = [];

	for (var i = 1; i <= 20; i++) {
		var audio = new Audio();
		audio.src = "http://concernedjoe.com/Theme/Sound/" + String(i) + ".mp3";
		audioArray.push(audio);
		audio.preload = "auto";
	}

	var soundIndex = 0;
	
	if (window.addEventListener) {
		var keys = [],
			konami = "38,38,40,40,37,39,37,39,66,65";
		
		window.addEventListener("keydown", function(e){
			keys.push(e.keyCode);
			
			if (keys.toString().indexOf(konami) >= 0) {
				audioArray[19].play();
				keys = [];
			};
		}, true);
	};


	var _paq = _paq || [];
	_paq.push(['trackPageView']);
	_paq.push(['enableLinkTracking']);

	(function() {

		var u = (("https:" == document.location.protocol) ? "https" : "http") + "://concernedjoe.com/analytics/";
		_paq.push(['setTrackerUrl', u+'piwik.php']);
		_paq.push(['setSiteId', 1]);
		var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0]; g.type='text/javascript';
		g.defer=true; g.async=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
	})();
	
	$("#jeff").click(function() {
		if(soundIndex <= audioArray.length - 2) {
			audioArray[soundIndex].play()
			soundIndex +=1;
		} else {
			 var win=window.open("http://johnnyutah.newgrounds.com/", '_blank');
			win.focus();
			
		}
	});

	$('#Header #HeaderTable td.leftNavBar').each(function(){

		if(!$(this).hasClass('active')) {
			$(this).hover(
				function() {
					$(this).find('.NavBG').slideDown(100);
				}, function() {
					$(this).find('.NavBG').slideUp(100);
				}
			);
		}

	});

	$('#Header #HeaderTable td.rightNavBar .HeaderTableLink').each(function(){

		if(!$(this).hasClass('active')) {
			$(this).hover(
				function() {
					$(this).parent().find('.NavBG').slideDown(100);
				}, function() {
					$(this).parent().find('.NavBG').slideUp(100);
				}
			);
		}

	});

	$('#LightsContentContainer').click(function(){
		turnOnLight();
	});

	$('.ExitButton').click(function(){
		turnOnLight();
	})

	//$('#Header #NavbarContainer #HeaderTable td.rightNavBar#SignUp .HeaderTableLink').click(function(){
	$('#TheRegister').click(function(){
		var url = window.location.href.toLowerCase();
		if(url.search("register") == -1 && url.search("login") == -1 && url.search("contact") == -1 && !$(".navbar-wrapper").hasClass("mobile") ){
			turnOffLight('RegistrationBox');
		}else{
			window.location.href = "http://concernedjoe.com/register"
		}
	});
	

	//$('#Header #NavbarContainer #HeaderTable td.rightNavBar#Login .HeaderTableLink').click(function(){
	$('#TheLogin').click(function(){
		var url = window.location.href.toLowerCase();
		if( url.search("register") == -1 && url.search("login") == -1 && url.search("contact") == -1 && !$(".navbar-wrapper").hasClass("mobile") ) {
			turnOffLight('LoginBox');
		} else {
			window.location.href = "http://concernedjoe.com/login"
		}
	});
	
	$('.GenericLightBox').click(function(e){
		e.stopPropagation();
	});

	$(window).scroll(function(){
		var scrollTop = $('html').scrollTop() > 0 ? $('html').scrollTop() : $('body').scrollTop();
		$('body').css('background-position','center +'+(scrollTop/3)+'px');
	});

	//Start Registration Form

	var registrationInputTexts = $('#RegistrationBoxForm input[type=text], #RegistrationBoxForm input[type=password]');

	registrationInputTexts.each(function( index ) {

		if($(this).hasClass('missing')) {
			$('#RegistrationBox #RegistrationBoxAlert').fadeOut(100, function() {
				$('#RegistrationBox #RegistrationBoxAlert').html('A field is missing');
				$('#RegistrationBox #RegistrationBoxAlert').fadeIn(100);
			});
		}
	});

	document.getElementById('RegistrationBoxForm').onsubmit = function() {

		var fieldMissing = false;

		registrationInputTexts.each(function(index) {

			if(!$(this).val() || $(this).val() == "") {

				$('#RegistrationBox #RegistrationBoxAlert').fadeOut(100, function() {
					$('#RegistrationBox #RegistrationBoxAlert').html('A field is missing');
					$('#RegistrationBox #RegistrationBoxAlert').fadeIn(100);
				});

				fieldMissing = true;
				return false;
			}
		});

		if(!fieldMissing) {

			if($('#RegistrationBoxForm #RegistrationPasswordField').val() != $('#RegistrationBoxForm #RegistrationConfirmPasswordField').val()) {

				$('#RegistrationBoxForm #RegistrationConfirmPasswordField').val('');

				$('#RegistrationBox #RegistrationBoxAlert').fadeOut(100, function() {
					$('#RegistrationBox #RegistrationBoxAlert').html('Passwords don\'t match');
					$('#RegistrationBox #RegistrationBoxAlert').fadeIn(100);
				});

				fieldMissing = true;
			}
		}

		if(!fieldMissing) {
			document.getElementById('RegistrationBoxForm').submit();
		}

		return false;
		
	}

	if($('#RegistrationBox.fieldsMissing').length > 0) { turnOffLight('RegistrationBox'); }

	//End Registration Form

	//Start Login Form

	var loginInputTexts = $('#LoginBoxForm input[type=text], #LoginBoxForm input[type=password]');

	loginInputTexts.each(function( index ) {

		if($(this).hasClass('missing')) {
			$('#LoginBox #LoginBoxAlert').fadeOut(100, function() {
				$('#LoginBox #LoginBoxAlert').html('A field is missing');
				$('#LoginBox #LoginBoxAlert').fadeIn(100);
			});
		}
	});

	document.getElementById('LoginBoxForm').onsubmit = function() {

		var fieldMissing = false;

		loginInputTexts.each(function(index) {

			if(!$(this).val() || $(this).val() == "") {

				$('#LoginBox #LoginBoxAlert').fadeOut(100, function() {
					$('#LoginBox #LoginBoxAlert').html('A field is missing');
					$('#LoginBox #LoginBoxAlert').fadeIn(100);
				});

				fieldMissing = true;
				return false;
			}

		});

		if(!fieldMissing) {
			document.getElementById('LoginBoxForm').submit();
		}

		return false;
		
	}

	if($('#LoginBox.fieldsMissing').length > 0) { turnOffLight('LoginBox'); }

	$('.SignUpLink').click(function(e){
			turnOffLight('RegistrationBox');
	});

	//End Login Form

	preload(
		"http://concernedjoe.com/Theme/Images/Generic/exitO.png"
	);
	
});

function CheckFooterSize(){
	var paddingVar = 0;

		if($(window).width() < 1400) {
			paddingVar = 388 - tdWidth - (1175 - $(window).width());
			$("#Header #HeaderTable").css({"margin" : 0});
			$('#FooterContent span#Copyrights').css({"margin-left" : '0px'});
			$('#FooterContent span#ButtonsContainer').css({"float": "right"});
			$('#FooterContent span#ButtonsContainer').css({"margin-right": "0px"});
		} else {
			paddingVar = 388 - tdWidth;
			$("#Header #HeaderTable").css({"margin" : 'auto'});
			$('#FooterContent span#Copyrights').css({"margin-left" : '10%'});
			$('#FooterContent span#ButtonsContainer').css({"float": "right"});
			$('#FooterContent span#ButtonsContainer').css({"margin-right": "10%"});
		}

		if(paddingVar < 0) paddingVar = 0;

		$("#Header #HeaderTable td.pushRight").css({"padding-left": paddingVar});
		$.post( "/user/navBarWidthAJAX", { padding: paddingVar + 'px' } );
}

$("#FooterContainer").ready(function(){
	CheckFooterSize();
})

window.onload = function(){

	tdWidth = $( '#Header #HeaderTable td.pushRight .HeaderTableLink' ).width();
	$('.pushRight .NavBG').width(tdWidth + 16);
	
	$(window).resize(function() {
		CheckHeaderSize();
		CheckFooterSize();
		

 	});
}

function turnOffLight(divName) {

	if($(".LightContainerElement:visible").length > 0) {
		$("#TheLightsContainer").animate({opacity: 0}, 200, function(){
			document.getElementById("TheLightsContainer").style.display = "none";
			$('.LightContainerElement').hide();
			turnOffLight(divName);
		});
	} else {
		document.getElementById(divName).style.display = "block";
		document.getElementById("TheLightsContainer").style.display = "block";
		$("#TheLightsContainer").animate({opacity: 1}, 200);
	}

}

function turnOnLight() {
	$("#TheLightsContainer").animate({opacity: 0}, 200, function(){
		document.getElementById("TheLightsContainer").style.display = "none";
		$('.LightContainerElement').hide();
	});
}

function preload() {
	var images = new Array();
	for (i = 0; i < preload.arguments.length; i++) {
		images[i] = new Image()
		images[i].src = preload.arguments[i]
	}
}

