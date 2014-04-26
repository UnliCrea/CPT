<?php
/*
Plugin Name: Compact Audio Player
Description: Plays a specified audio file (.mp3 or .ogg) using a simple and compact audio player. The audio player is compatible with all major browsers and devices (Android, iPhone).
Version: 1.7
Author: Tips and Tricks HQ
Author URI: http://www.tipsandtricks-hq.com/
License: GPL2  
*/

define('SC_AUDIO_PLUGIN_VERSION', '1.7');
define('SC_AUDIO_BASE_URL', plugins_url('/',__FILE__));

add_action('init', 'wp_sc_audio_init');
function wp_sc_audio_init()
{
	if (!is_admin()){
		wp_register_script('scap.soundmanager2', SC_AUDIO_BASE_URL.'js/soundmanager2-nodebug-jsmin.js');
		wp_enqueue_script('scap.soundmanager2');
		wp_register_style('scap.flashblock', SC_AUDIO_BASE_URL.'css/flashblock.css');
        wp_enqueue_style('scap.flashblock');
		wp_register_style('scap.player', SC_AUDIO_BASE_URL.'css/player.css');
        wp_enqueue_style('scap.player');
	}
}

function scap_footer_code(){
	$debug_marker = "<!-- WP Audio player plugin v" . SC_AUDIO_PLUGIN_VERSION . " - http://www.tipsandtricks-hq.com/wordpress-audio-music-player-plugin-4556/ -->";
	echo "\n${debug_marker}\n";
	?>
	<script type="text/javascript">
    soundManager.useFlashBlock = true; // optional - if used, required flashblock.css
    soundManager.url = '<?php echo SC_AUDIO_BASE_URL; ?>swf/soundmanager2.swf';
    function play_mp3(flg,ids,mp3url,volume,loops)
    {
      soundManager.createSound({
        id:'btnplay_'+ids,
        volume: volume,
        url: mp3url
      });

      if(flg == 'play'){
        <?php 
        if(get_option('sc_audio_disable_simultaneous_play') == '1'){
        	echo 'stop_all_tracks();';
        }
        ?>
		soundManager.play('btnplay_'+ids,{
			onfinish: function() {
				if(loops == 'true'){
					loopSound('btnplay_'+ids);
				}
				else{
					document.getElementById('btnplay_'+ids).style.display = 'inline';
					document.getElementById('btnstop_'+ids).style.display = 'none';
				}
			}
		});
      }
      else if(flg == 'stop'){
        //soundManager.stop('btnplay_'+ids);
    	soundManager.pause('btnplay_'+ids);
      }
    }
    function show_hide(flag,ids)
    {
      if(flag=='play'){
        document.getElementById('btnplay_'+ids).style.display = 'none';
        document.getElementById('btnstop_'+ids).style.display = 'inline';
      }
      else if (flag == 'stop'){
        document.getElementById('btnplay_'+ids).style.display = 'inline';
        document.getElementById('btnstop_'+ids).style.display = 'none';
      }
    }
    function loopSound(soundID) 
    {
    	window.setTimeout(function() {
    		soundManager.play(soundID,{onfinish:function(){loopSound(soundID);}});
    	},1);
    }
    function stop_all_tracks()
    {
    	soundManager.stopAll();
		var inputs = document.getElementsByTagName("input");
    	for (var i = 0; i < inputs.length; i++) {
    		if(inputs[i].id.indexOf("btnplay_") == 0){
    			inputs[i].style.display = 'inline';//Toggle the play button
        	}
    		if(inputs[i].id.indexOf("btnstop_") == 0){
    	    	inputs[i].style.display = 'none';//Hide the stop button
    		}
    	}        
    }
	</script>
	<?php
}
add_action('wp_footer', 'scap_footer_code');

function sc_embed_player_handler($atts, $content = null) 
{
	extract(shortcode_atts(array(
		'fileurl' => '',
		'autoplay' => '',
		'volume' => '',
		'class' => '',
		'loops' => '',
	), $atts));	
	if(empty($fileurl)){
		return '<div style="color:red;font-weight:bold;">Compact Audio Player Error! You must enter the mp3 file URL via the "fileurl" parameter in this shortcode. Please check the documentation and correct the mistake.</div>';
	}
	if(empty($volume)){$volume = '80';}
	if(empty($class)){$class = "sc_player_container1";}//Set default container class
	if(empty($loops)){$loops = "false";}
	$ids = uniqid();

	$player_cont = '<div class="'.$class.'">';
	$player_cont .= '<input type="button" id="btnplay_'.$ids.'" class="myButton_play" onClick="play_mp3(\'play\',\''.$ids.'\',\''.$fileurl.'\',\''.$volume.'\',\''.$loops.'\');show_hide(\'play\',\''.$ids.'\');" />';
	$player_cont .= '<input type="button"  id="btnstop_'.$ids.'" style="display:none" class="myButton_stop" onClick="play_mp3(\'stop\',\''.$ids.'\',\'\',\''.$volume.'\',\''.$loops.'\');show_hide(\'stop\',\''.$ids.'\');" />';
 	$player_cont .= '<div id="sm2-container"><!-- flash movie ends up here --></div>';
 	$player_cont .= '</div>';

	if(!empty($autoplay)){
$path_to_swf = SC_AUDIO_BASE_URL.'swf/soundmanager2.swf';
$player_cont .= <<<EOT
<script type="text/javascript" charset="utf-8">
soundManager.setup({
	url: '$path_to_swf',
	onready: function() {
		var mySound = soundManager.createSound({
		id: 'btnplay_$ids',
		volume: '$volume',
		url: '$fileurl'
		});
		var auto_loop = '$loops';
		mySound.play({
    		onfinish: function() {
				if(auto_loop == 'true'){
					loopSound('btnplay_$ids');
				}
				else{
					document.getElementById('btnplay_$ids').style.display = 'inline';
					document.getElementById('btnplay_$ids').style.display = 'none';
				}
    		}
		});
		document.getElementById('btnplay_$ids').style.display = 'none';
        document.getElementById('btnstop_$ids').style.display = 'inline';
	},
	ontimeout: function() {
		// SM2 could not start. Missing SWF? Flash blocked? Show an error.
		alert('Error! Audio player failed to load.');
	}
});
</script>
EOT;
}//End autopay code

	return $player_cont;
}
add_shortcode('sc_embed_player', 'sc_embed_player_handler');
if (!is_admin()){add_filter('widget_text', 'do_shortcode');}
add_filter('the_excerpt', 'do_shortcode',11);

//Create admin page 
add_action('admin_menu', 'scap_mp3_player_admin_menu');
function scap_mp3_player_admin_menu() {
	add_options_page('SC Audio Player', 'SC Audio Player', 8, __FILE__, 'scap_mp3_options');
}

function scap_mp3_options() 
{
	echo '<div class="wrap">';
	echo '<div id="poststuff"><div id="post-body">';
	echo '<div id="icon-upload" class="icon32"><br></div><h2>SC Audio Player</h2>';
	
	echo '<div style="background: #FFF6D5; border: 1px solid #D1B655; color: #3F2502; padding: 15px 10px">Visit the <a href="http://www.tipsandtricks-hq.com/wordpress-audio-music-player-plugin-4556" target="_blank">Compact Audio Player</a> plugin page for documentation and update.</div>';
	echo "<p>This is a Simple All Browser Supported Audio Player. There is no extra settings. Just add the shortcode with the MP3 file URL in a WordPress post or page to embed the audio player.</p>";
	echo "<h3>Shortcode Format</h3>";
	echo '<p><code>[sc_embed_player fileurl="URL OF THE MP3 FILE"]</code></p>';	
	echo '<p><strong>Example:</strong></p>';
	echo '<p><code>[sc_embed_player fileurl="http://www.example.com/wp-content/uploads/my-music/mysong.mp3"]</code></p>';
	
	if(isset($_POST['sc_audio_player_settings'])){
		update_option('sc_audio_disable_simultaneous_play', isset($_POST["sc_audio_disable_simultaneous_play"])?'1':'');
	}
	?>
    <form method="post" action="<?php echo $_SERVER["REQUEST_URI"]; ?>">

	<div class="postbox">
	<h3><label for="title">Audio Player Settings</label></h3>
	<div class="inside">
	
    <table class="form-table">
    
    <tr valign="top"><td width="25%" align="left">
    Disable Simultaneous Play: 
    </td><td align="left">    
    <input name="sc_audio_disable_simultaneous_play" type="checkbox"<?php if(get_option('sc_audio_disable_simultaneous_play')!='') echo ' checked="checked"'; ?> value="1"/>
    <br /><p class="description">Check this option if you only want to allow one audio file to be played at a time (helpful if you have multiple audio files on a page). It will automatically stop the audio file that is currently playing when a user plays a new file.</p>
    </td></tr>
    
    </table>	
	
    <div class="submit">
   	<input type="submit" class="button-primary" name="sc_audio_player_settings" value="<?php _e('Update'); ?>" />
    </div>
    
    
    </div></div>
	</form>

	<?php
	echo '</div></div>';//end of post-stuff  
	echo '</div>';//end of wrap    		
}
