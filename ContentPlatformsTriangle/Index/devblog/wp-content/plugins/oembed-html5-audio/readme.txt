=== oEmbed HTML5 audio ===
Contributors: honza.skypala
Donate link: http://www.honza.info
Tags: oEmbed, html5, audio, mp3, embed
Requires at least: 3.0
Tested up to: 3.4.1
XXStable tag: 1.1

This plugin converts URLs to audio files (MP3, OGG, WAV) into HTML5 audio with Flash-based player backup

== Description ==

This plugins adds possibility to place audio files into posts and pages using the oEmbed technology used by WordPress for other purposes (YouTube videos etc). Audio files are embeded using HTML5 audio tag, with Flash-based backup player for MP3 format for browsers that don't support either HTML5 or MP3 format (Internet Explorer up to version 8.0, Firefox and Opera).

To put audio file into a post, simply enter the URL link to the audio file as separate paragraph. The plugin will convert it into the player on the page. See screenshots.

Tested support in browsers (all on Windows versions of browsers, I do not have Mac or Linux):

- Google Chrome 14: MP3, OGG, WAV - native HTML5
- Firefox 6: OGG, WAV - native HTML5; MP3 - Flash-based backup player
- Opera 11: OGG, WAV - native HTML5; MP3 - Flash-based backup player
- Internet Explorer 8: MP3 - Flash-based backup player; OGG, WAV - not supported
- Internet Explorer 9: MP3 - native HTML5; OGG, WAV - not supported
- Safari: MP3 - Flash-based backup player; OGG, WAV - not supported

== Installation ==

1.	Upload the full directory to wp-content/plugins
2.	Activate plugin Tags Page in plugins administration
3.	Now, if you place URL to audio file as separate paragraph into post or page, it will be converted into audio player in the browser.

== Screenshots ==

1.	Just put URL to audio file into the post
2.	This is how it looks in Google Chrome browser
3.	This is how it looks in Internet Explorer 9 browser
4.	If the browser does not support HTML5 and/or MP3 format, Flash based player is used

== Changelog ==

= 1.0 =
* Initial release.
= 1.1 =
* Google removed their MP3 Flash player from their website, so we include it in the plugin itself now (it's still the same player)

== Licence ==

WTFPL license applies