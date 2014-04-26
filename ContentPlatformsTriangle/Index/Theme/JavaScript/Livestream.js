$(document).ready(function() {

  var user_name, api_key, twitch_widget;
  
  user_name = "xelubest";
  api_key = "5j0r5b7qb7kro03fvka3o8kbq262wwm";
  twitch_widget = $("#twitch-widget");

  twitch_widget.attr("href","http://twitch.tv/" + user_name);

  $.getJSON('https://api.twitch.tv/kraken/streams/' + user_name + '?client_id=' + api_key + '&callback=?', function(data) {	
	  if (data.stream) {
		  twitch_widget.html("<span class='online'></span> Online! " + "<span class='viewers'>Viewers: " + data.stream.viewers + "</span>");
	  } else {
		  twitch_widget.html("<span class='offline'></span> Offline");
	  }  
  });

})();