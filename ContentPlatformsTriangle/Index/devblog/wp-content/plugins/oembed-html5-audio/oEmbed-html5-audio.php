<?php
/*
Plugin Name: oEmbed HTML5 Audio
Plugin URI: http://www.honza.info/category/wordpress/
Description: This plugin converts URLs to audio files (MP3, OGG, WAV) into HTML5 audio with Flash-based player backup
Version: 1.1
Author: Honza Skypala
Author URI: http://www.honza.info
License: WTFPL license applies
*/

wp_embed_register_handler( 'html5_audio', '#^http://.+\.(mp3|ogg|wav)$#i', 'wp_embed_handler_html5_audio' );

function wp_embed_handler_html5_audio( $matches, $attr, $url, $rawattr ) {
	$flash_player = plugins_url('3523697345-audio-player.swf', __FILE__);
	
	if (preg_match('#^http://.+\.mp3$#i', $url) && preg_match('/Firefox/', $_SERVER["HTTP_USER_AGENT"])) {
		// For religious reasons Firefox does not support MP3 format in HTML5 audio tag, use Flash player instead
		$embed = sprintf(
				'<embed type="application/x-shockwave-flash" flashvars="audioUrl=%1$s" src="'.$flash_player.'" width="400" height="27" quality="best"></embed>',
				esc_attr($matches[0])
				);
	} else if (preg_match('#^http://.+\.mp3$#i', $url) && preg_match('/Opera/', $_SERVER["HTTP_USER_AGENT"])) {
		// Opera also does not support MP3 format in HTML5 audio tag, use Flash player instead
		$embed = sprintf(
				'<embed type="application/x-shockwave-flash" flashvars="audioUrl=%1$s" src="'.$flash_player.'" width="400" height="27" quality="best"></embed>',
				esc_attr($matches[0])
				);
	} else if (preg_match('#^http://.+\.ogg$#i', $url) && preg_match('/MSIE/', $_SERVER["HTTP_USER_AGENT"])) {
		$embed = '[Internet Explorer does not support OGG format]';
	} else if (preg_match('#^http://.+\.wav$#i', $url) && preg_match('/MSIE/', $_SERVER["HTTP_USER_AGENT"])) {
		$embed = '[Internet Explorer does not support WAV format]';
	} else {	
		$embed = sprintf(
				'<audio controls preload><source src="%1$s" /><embed type="application/x-shockwave-flash" flashvars="audioUrl=%1$s" src="'.$flash_player.'" width="400" height="27" quality="best"></embed></audio>',
				esc_attr($matches[0])
				);
	}

	$embed = apply_filters( 'oembed_html5_audio', $embed, $matches, $attr, $url, $rawattr );
	return apply_filters( 'oembed_result', $embed, $url, '' );
}

?>