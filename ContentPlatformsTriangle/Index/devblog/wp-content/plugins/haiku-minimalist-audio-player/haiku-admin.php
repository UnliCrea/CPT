<?php 

// create the admin menu
// hook in the action for the admin options page
add_action('admin_menu', 'add_haiku_player_option_page');

function add_haiku_player_option_page() {
	// hook in the options page function
	add_options_page('Haiku Player', 'Haiku Player', 'manage_options', __FILE__, 'haiku_player_options_page');
}
function haiku_player_options_page() { 	// Output the options page
	global $haiku_player_analytics, $haiku_player_version, $haiku_player_show_support, $haiku_player_default_location,  $haiku_player_show_graphical, $haiku_player_replace_audio_player, $haiku_player_replace_mp3_links; ?>
	<div class="wrap" style="width:800px">
	

<form method="post" action="options.php">

<?php wp_nonce_field('update-options'); ?>

	<div class="updated fade"><p style="line-height: 1.4em;">Thanks for downloading Haiku! If you like it, please be sure to give us a positive rating in the <a href="http://wordpress.org/extend/plugins/haiku-minimalist-audio-player/">WordPress repository</a>, it will help other people find the plugin and means a lot to us.<br /></div>
	
<h2>Haiku Player Settings</h2>

<table class="form-table">

<tr valign="top">
	<th scope="row">Default file location (optional)</th><br />
	<td><?php echo site_url();?><input type="text" name="haiku_player_default_location" value="<?php if (!empty($haiku_player_default_location)) {echo $haiku_player_default_location; }?>"/>
	</td>
</tr>

<tr valign="top">
	<th scope="row">Enable Google Analytics</th>
	<td><input type="checkbox" name="haiku_player_analytics" value="true" <?php if ($haiku_player_analytics=="true") {echo' checked="checked"'; }?>/>
	</td>
</tr>

<tr valign="top">
	<th scope="row">Use graphical player</th>
	<td><input type="checkbox" name="haiku_player_show_graphical" value="true" <?php if ($haiku_player_show_graphical=="true") {echo' checked="checked"'; }?>/>
	</td>
</tr>

<tr valign="top">
	<th scope="row">Replace all mp3 links</th>
	<td><input type="checkbox" name="haiku_player_replace_mp3_links" value="true" <?php if ($haiku_player_replace_mp3_links=="true") {echo' checked="checked"'; }?>/>
	</td>
</tr>

<tr valign="top">
	<th scope="row">Replace WP Audio Player [audio: file.mp3] syntax</th>
	<td><input type="checkbox" name="haiku_player_replace_audio_player" value="true" <?php if ($haiku_player_replace_audio_player=="true") {echo' checked="checked"'; }?>/>
	</td>
</tr>
</table>

<input type="hidden" name="page_options" value="haiku_player_show_graphical, haiku_player_analytics, haiku_player_default_location,haiku_player_replace_audio_player, haiku_player_replace_mp3_links" />
<input type="hidden" name="action" value="update" />	
<p class="submit">
<input type="submit" class="button-primary" value="<?php _e('Save Changes') ?>" />
</p>
</form>
		<h2>Reference</h2>
		<p>Use the shortcode <code>[haiku url="http://example.com/file.mp3" title="Title of audio file"]</code> to play an audio file. Use the full URL of the audio file unless you've set a default file location. The title field is recommended for search engine and accessibility purposes and required if you are using Google Analytics.</p>
		
		<p>The default file location field allows you to specify a folder in your site for your MP3 files. If, for example, all of your audio files are in http://yoursite.com/audio, set the default folder to /audio, and use the shortcode like this: [haiku url="file.mp3"]. This is also helpful if you're replacing an existing WordPress Audio Player installation. You can overwrite this setting on a per-player basis with the attribute defaultpath=disabled. For example, if you wanted to link to a file in a different folder you would use the shortcode [haiku url="http://yoursite/audiofolder2/file.mp3" defaultpath=disabled].</p>
		
		<p>The Google Analytics setting enables a script which tracks play events in your Google Analytics account using the title field. You must already have Google Analytics tracking installed on your site, using the asynchronous version of the script in the head of your HTML document.</p>
		
		<p>The player includes the ability to automatically turn all MP3 links into an audio player instance. Simply check the "Replace all mp3 links" box. You may experience problems if you have other plugins that also override MP3 links, like Shadowbox.</p>
		
		<p>The player is now drop-in compatible with WordPress Audio Player. If you're replacing a WordPress Audio Player install, check the "replace WP Audio Player" box to automatically replace all instances of the WP Audio Player shortcode. (WP Audio Player must be disabled or removed for this to work). The Haiku shortcode is still the recommended format as it allows the "Title" field for Google Analytics support.</p>
				
		<p>The player includes a graphical mode, which is turned off by default. Enable graphical mode by changing the default setting in the settings panel or by adding the attribute <code>graphical="true"</code> to your shortcode. Can be overridden on a per-player basis.</p>
		
		<p>The graphical player looks like this:</p>
		<img src ="<?php echo plugins_url( 'resources/player-example.png', __FILE__ )?>" alt="player example" height="50" width="178"/>
	
	
	<a href="http://madebyraygun.com"><img style="margin-top:30px;" src="<?php echo plugins_url( 'resources/logo.png', __FILE__ );?>" width="225" height="70" alt="Made by Raygun" /></a>
	<p>You're using Haiku Player v. <?php echo $haiku_player_version;?> by <a href="http://madebyraygun.com">Raygun</a>. Check out our <a href="http://madebyraygun.com/wordpress/plugins/">other plugins</a>, and if you have any problems, stop by our <a href="http://madebyraygun.com/support/">support forum</a>!</p>
	
	<p>Based on jPlayer, by <a href="http://www.happyworm.com/jquery/jplayer/">Happyworm</a>.</p>
	</div><!--//wrap div-->
<?php } ?>