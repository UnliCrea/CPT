
<style>
nav{
	font-size: 0;
	background: center top no-repeat;
	background-image: url(/img/NavbarLightNone.png);
	padding-top: 12px;
	margin-top: 3px;
	padding-bottom: 30px;
	-webkit-transition: background-image 0.3s linear;
	-moz-transition: background-image 0.3s linear;
	-o-transition: background-image 0.3s linear;
	-ms-transition: background-image 0.3s linear;
	transition: background-image 0.3s linear;
} 
nav div{
	background: ;
	display: inline-block;
	width: 92px;
	height: 30px;
}
nav a:after{ display:none }
.home{
	background-image: url(/img/BtnHomeN.png);
}
.history{
	background-image: url(/img/BtnHistoryN.png);
}
.presskit{
	background-image: url(/img/BtnPresskitN.png);
}
.contact{
	background-image: url(/img/BtnContactN.png);
}
.facebook{
	background-image: url(/img/BtnFacebookN.png);
}
.twitter{
	background-image: url(/img/BtnTwitterN.png);
}
.home:hover,.home:after{
	background-image: url(/img/BtnHomeO.png);
}
.history:hover,.history:after{
	background-image: url(/img/BtnHistoryO.png);
}
.presskit:hover,.presskit:after{
	background-image: url(/img/BtnPresskitO.png);
}
.contact:hover,.contact:after{
	background-image: url(/img/BtnContactO.png);
}
.facebook:hover,.facebook:after{
	background-image: url(/img/BtnFacebookO.png);
}
.twitter:hover,.twitter:after{
	background-image: url(/img/BtnTwitterO.png);
}
	</style>
	<nav>
		<a href="http://concerned-joe.com/"><div class="home"></div></a>
		<a href="/history"><div class="history"></div></a>
		<a href="/presskit"><div class="presskit"></div></a>
		<a href="mailto:contact@thoseawesomeguys.com"><div class="contact"></div></a>
		<a href="http://www.facebook.com/concernedjoe"><div class="facebook"></div></a>
		<a href="https://twitter.com/ConcernedJoe"><div class="twitter"></div></a>
	</nav>
	<script>

	var imgs = new Array('Home','History','Presskit','Devblog','Contact','Facebook','Twitter');
	for(i=0; i<imgs.length; i++) { 
	  var image_preload = new Image();
	  image_preload.src = 'img/NavbarLight'+imgs[i]+'.png';
	}
	$(document).ready(function(){
		$(window).scroll(function(){
			$('body').css('background-position','0px -'+($('body').scrollTop()/10)+'px');
		});
		$('nav div').hover(function(){
			var link='url(/img/NavbarLight'+capitalise($(this).attr('class'))+'.png)';
			$('nav').css('background-image',link);
		},function(){
			var link='url(/img/NavbarLightNone.png)';
			$('nav').css('background-image',link);
		});
	});
	function capitalise(string)
	{
	    return string.charAt(0).toUpperCase() + string.slice(1);
	}
	</script>