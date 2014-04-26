<?php
/*
Plugin Name: Haiku - Minimalist Audio Player
Plugin URI: http://wordpress.org/extend/plugins/haiku-minimalist-audio-player/
Description: A simple HTML5-based audio player.
Author: Momnt
Version: 1.1.0
Author URI: http://momnt.co
Text Domain: haiku
*/ 


/**
 *  globals + text domain
 *  @since 0.5.0
 */
global $haiku_options, $haiku_player_version;

$haiku_options = get_option( 'haiku_player_options' ); 
$haiku_player_version = '1.0.0';

function haiku_text_domain() {
    load_plugin_textdomain('haiku', false, basename(dirname(__FILE__)) . '/languages');
}
add_action('plugins_loaded', 'haiku_text_domain');



/**
 *  Replace default WP audio player with Haiku
 *  @since 0.4.7
 */
function haiku_replace_audio($content) {

  $content = preg_replace('/\[audio:/','[haiku url=',$content,-1);
  return $content;

}
if ( !empty($haiku_audio_replace) ) add_filter('the_content', 'haiku_replace_audio');



/**
 *  Replace embedded mp3 links with Haiku
 *  @since 0.4.7
 */
function haiku_replace_mp3_links($content) {

  $pattern = "/<a ([^=]+=['\"][^\"']+['\"] )*href=['\"](([^\"']+\.mp3))['\"]( [^=]+=['\"][^\"']+['\"])*>([^<]+)<\/a>/i"; //props to WordPress Audio Player for the regex
  $replacement = '[haiku url=$2 defaultpath=disabled]';
  $content = preg_replace($pattern, $replacement, $content);
  
  return $content;

}
if ( !empty($haiku_mp3_replace) ) add_filter('the_content', 'haiku_replace_mp3_links');



/**
 *  The [haiku] shortcode
 *  @since 0.4.7
 */
add_shortcode('haiku', 'haiku_player_shortcode');

function haiku_player_shortcode($atts) {

    global $haiku_options;

    $haiku_graphical = $haiku_options['show_graphical'];
    $haiku_showtime = $haiku_options['show_time'];
    $haiku_analytics = $haiku_options['analytics'];
    $haiku_default_location  = $haiku_options['default_location'];
    $haiku_mp3_replace = $haiku_options['replace_mp3_links'];
    $haiku_audio_replace = $haiku_options['replace_audio_player'];

    static $i = 1;

    extract(shortcode_atts(array(
        'url'         => '',
        'oga'         => '',
        'title'       => '',
        'defaultpath' => '',
        'noplayerdiv' => '',
        'graphical'   => $haiku_graphical,
        'showtime'    => $haiku_showtime,
        'player'      => '',
        'class'       => '',
        'loop'        => false
    ), $atts));


    $class_output = !empty($class) ? strtolower($class) : '';

    if(!empty($loop) && $loop != 'false')
        $class_output .= ' haiku-loop';
    
    /**
     *  Text player
     *  @since 0.4.7
     */
    if ($graphical == "false") {
    
        if ( $noplayerdiv != "true" ) {
            $haiku_player_shortcode = '<div id="haiku-text-player'.$i.'" class="haiku-player haiku-text-player '.$class_output.'"></div>';
        } else {
            $haiku_player_shortcode = '';
        }

        // will make a.titles "Listen to Audio" instead of "Listen to" if no title exists
        if ( $title ) {
            $title = $title;
        } else {
            $title = __('Audio', 'haiku');
        }


        if( $oga ) {
            if (!empty($haiku_default_location) && $defaultpath != 'disabled' ) {
                $oga_url = site_url() . $haiku_default_location . '/' . $oga;
            } else {
                $oga_url = $oga;
            }
            $oga_output = 'data-haikuoga="'.$oga_url.'"';
        } else {
            $oga_output = '';
        }


        if ($haiku_analytics == "true") {
            $haiku_ga_output = 'onClick="_gaq.push([\'_trackEvent\', \'Audio\', \'Play\', \''.$title.'\']);"';
        } else {
            $haiku_ga_output = '';
        }

        // load "default location" if set up. fallback to /wp-content
        if (!empty($haiku_default_location) && $defaultpath != 'disabled' ) {
            $audio_url = site_url() . $haiku_default_location . '/' . $url;
        } else {
            $audio_url = $url;
        }


        ob_start(); 

        ?>
        <div class="haiku-container haiku-text-container haiku-container-<?php echo $i; ?> <?php echo $class_output; ?>">

            <ul class="haiku-controls haiku-text-controls-<?php echo $i; ?>">

                <li><a title="<?php printf( __('Listen to %s', 'haiku'), $title ); ?>" class="haiku-play" <?php echo $haiku_ga_output; ?> href="<?php echo $audio_url; ?>" <?php echo $oga_output; ?> id="haiku-play-<?php echo $i; ?>"><?php _e('Play', 'haiku'); ?></a></li>
                <li><a title="<?php _e('Pause','haiku'); ?>" class="haiku-pause" href="" id="haiku-pause-<?php echo $i; ?>"><?php _e('Pause', 'haiku'); ?></a></li>
                <li><a title="<?php _e('Stop', 'haiku'); ?>" class="haiku-stop" href="" id="haiku-stop-<?php echo $i; ?>"><?php _e('Stop', 'haiku'); ?></a></li>
                
                <?php if ($title) : ?>
                    <li class="haiku-title"><?php echo esc_attr($title); ?></li>
                <?php endif; ?>

                <?php if ($showtime == "true") : ?>
            
                <li class="haiku-time-holder">
                    <span id="haiku-current-time-<?php echo $i; ?>" class="haiku-current-time"></span>
                    <span class="haiku-time-separator">/</span>
                    <span id="haiku-duration-<?php echo $i; ?>" class="haiku-duration"></span>
                </li><!--haiku-time-holder-->

                <?php endif; ?>

            </ul>

            <div class="haiku-no-solution">
                <?php _e('<strong>Update Required</strong><br><span>To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.</span>', 'haiku'); ?>
            </div>

        </div><!--haiku-container-<?php echo $i; ?>-->
    
        <?php

        $haiku_player_shortcode .= ob_get_contents();
        ob_end_clean();

    
    /**
     *  Graphical player
     *  @since 0.4.7
     */
    } elseif ($graphical == "true") {
    

        if ( $noplayerdiv != "true" ) { 
            $haiku_player_shortcode = '<div id="haiku-graphical-player-'.$i.'" class="haiku-player haiku-graphical-player '.$class_output.'"></div>';
        } else {
            $haiku_player_shortcode = '';
        }


        if ($title) {
            $title = $title;
        } else {
            $title = 'Audio';
        }


        if ($oga) {

            if (!empty($haiku_default_location) && $defaultpath != 'disabled' ) {
                $oga_url = site_url() . $haiku_default_location . '/' . $oga;
            } else {
                $oga_url = $oga;
            }

            $oga_output = 'data-haikuoga="'.$oga_url.'"';

        } else {
            $oga_output = '';
        }


        if ($haiku_analytics == "true") {
            $haiku_ga_output = 'onClick="_gaq.push([\'_trackEvent\', \'Audio\', \'Play\', \''.$title.'\']);"';
        } else {
            $haiku_ga_output = '';
        }


        // load "default location" if set up. fallback to /wp-content
        if (!empty($haiku_default_location) && $defaultpath != 'disabled' ) {
            $audio_url = site_url() . $haiku_default_location . '/' . $url;
        } else {
            $audio_url = $url;
        }


        ob_start();
        ?>
        
        <?php 
            if( $player ) { 

                $haiku_pro_custom_bg   = get_post_meta( $player, 'haiku_pro_background_meta_box', true );
                $haiku_pro_custom_gui  = get_post_meta( $player, 'haiku_pro_gui_meta_box', true );
                $haiku_pro_custom_time = get_post_meta( $player, 'haiku_pro_time_meta_box', true );

                // player background
                if( $haiku_pro_custom_bg != '' ) {
                    $hp_custom_bg = 'style="background-color: '.$haiku_pro_custom_bg.';"';
                }

                 // player gui
                if( $haiku_pro_custom_gui != '') {
                    $hp_custom_gui = 'style="background-color: '.$haiku_pro_custom_gui.';"'; 
                    $hp_custom_btns = 'style="color: '.$haiku_pro_custom_gui.';"';
                }


                // player seek bar
                if( $haiku_pro_custom_bg != '' && $haiku_pro_custom_gui != '') {
                    
                    $hp_custom_seek  = 'style="background: '.$haiku_pro_custom_bg.';';
                    $hp_custom_seek .= ' background: -moz-linear-gradient(top, '.$haiku_pro_custom_bg.' 0%, '.$haiku_pro_custom_bg.' 39%, '.$haiku_pro_custom_gui.' 40%, '.$haiku_pro_custom_gui.' 60%, '.$haiku_pro_custom_bg.' 61%, '.$haiku_pro_custom_bg.' 100%);';
                    $hp_custom_seek .= ' background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, '.$haiku_pro_custom_bg.'), color-stop(39%, '.$haiku_pro_custom_bg.'), color-stop(40%, '.$haiku_pro_custom_gui.'), color-stop(60%, '.$haiku_pro_custom_gui.'), color-stop(61%, '.$haiku_pro_custom_bg.'), color-stop(100%, '.$haiku_pro_custom_bg.'));';
                    $hp_custom_seek .= ' background: -webkit-linear-gradient(top, '.$haiku_pro_custom_bg.' 0%, '.$haiku_pro_custom_bg.' 39%, '.$haiku_pro_custom_gui.' 40%, '.$haiku_pro_custom_gui.' 60%, '.$haiku_pro_custom_bg.' 61%, '.$haiku_pro_custom_bg.' 100%);';
                    $hp_custom_seek .= ' background: -o-linear-gradient(top, '.$haiku_pro_custom_bg.' 0%, '.$haiku_pro_custom_bg.' 39%, '.$haiku_pro_custom_gui.' 40%, '.$haiku_pro_custom_gui.' 60%, '.$haiku_pro_custom_bg.' 61%, '.$haiku_pro_custom_bg.' 100%);';
                    $hp_custom_seek .= ' background: -ms-linear-gradient(top, '.$haiku_pro_custom_bg.' 0%, '.$haiku_pro_custom_bg.' 39%, '.$haiku_pro_custom_gui.' 40%, '.$haiku_pro_custom_gui.' 60%, '.$haiku_pro_custom_bg.' 61%, '.$haiku_pro_custom_bg.' 100%);';
                    $hp_custom_seek .= ' background: linear-gradient(top, '.$haiku_pro_custom_bg.' 0%, '.$haiku_pro_custom_bg.' 39%, '.$haiku_pro_custom_gui.' 40%, '.$haiku_pro_custom_gui.' 60%, '.$haiku_pro_custom_bg.' 61%, '.$haiku_pro_custom_bg.' 100%);';
                    $hp_custom_seek .= '"';

                }

                // player time/duration
                if( $haiku_pro_custom_time != '' ) {
                    $hp_custom_time = 'style="color: '.$haiku_pro_custom_time.';"';
                }

            } else {
                $hp_custom_bg = '';
                $hp_custom_seek = '';
                $hp_custom_gui = '';
                $hp_custom_btns = '';
                $hp_custom_time = '';
            }
        ?>
        <div class="haiku-container haiku-graphical-container haiku-container-<?php echo $i; ?> <?php echo $class_output; ?>" <?php echo $hp_custom_bg; ?>>

            <ul class="haiku-controls haiku-graphical-controls-<?php echo $i; ?>">

                <li class="haiku-gui">
                    <a <?php echo $hp_custom_btns; ?> title="<?php printf( __('Listen to %s', 'haiku'), $title ); ?>" class="haiku-play" <?php echo $haiku_ga_output; ?> href="<?php echo $audio_url; ?>" <?php echo $oga_output; ?> id="haiku-play-<?php echo $i; ?>"></a>
                    <a <?php echo $hp_custom_btns; ?> title="<?php _e('Pause', 'haiku'); ?>" class="haiku-pause" href="" id="haiku-pause-<?php echo $i; ?>"></a>
                    <a <?php echo $hp_custom_btns; ?> title="<?php _e('Stop', 'haiku'); ?>" class="haiku-stop" href="" id="haiku-stop-<?php echo $i; ?>"></a>
                </li>

                <li class="haiku-seek-container">
                    <div class="haiku-seek-bar" id="haiku-seek-bar-<?php echo $i; ?>" <?php echo $hp_custom_seek; ?> >
                        <div class="haiku-play-bar" id="haiku-play-bar-<?php echo $i; ?>" <?php echo $hp_custom_gui; ?>></div>
                    </div>
                </li>
                
                <?php if ($showtime == "true") : ?>
            
                <li class="haiku-time-holder" <?php echo $hp_custom_time; ?>>
                    <span id="haiku-current-time-<?php echo $i; ?>" class="haiku-current-time"></span>
                    <span class="haiku-time-separator">/</span>
                    <span id="haiku-duration-<?php echo $i; ?>" class="haiku-duration"></span>
                </li><!--haiku-time-holder-->

                <?php endif; ?>

            </ul>

            <div class="haiku-no-solution">
                <?php _e('<strong>Update Required</strong><br><span>To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.</span>', 'haiku'); ?>
            </div>

        </div><!--haiku-container-<?php echo $i; ?>-->


        <?php
        $haiku_player_shortcode .= ob_get_contents();
        ob_end_clean();
    }

    
    $i++;
    
    return $haiku_player_shortcode;
}



/**
 *  Scripts + styles
 *  @since 0.4.7
 */
function haiku_scripts() {

    global $haiku_player_version;

    if ( !is_admin() ) {

        wp_enqueue_script('jplayer', plugins_url( '/js/jquery.jplayer.min.js', __FILE__ ), array('jquery'), '2.1.2', true);
        wp_enqueue_script('haiku-script', plugins_url( '/js/haiku-player.js', __FILE__ ), array('jplayer'), $haiku_player_version, true);
        wp_enqueue_style('haiku-style', plugins_url( '/haiku-player.css', __FILE__ ), false, $haiku_player_version, 'screen');
    
    }

}
add_action('init', 'haiku_scripts');



/**
 *  Make our swfPath var availalbe to scripts in footer
 *  @since 0.5.0
 *  @todo integrate into wp-ajax
 */
function haiku_player_head() {
    echo '<script type="text/javascript">/* <![CDATA[ */ var haiku_jplayerswf_path =  \''. plugins_url( '/js', __FILE__ ) . '\'; /* ]]> */</script>';
}
add_action('wp_head', 'haiku_player_head');



/**
 *  Load admin page, admin scripts, custom player, and documentation when needed
 *  @since 0.5.0
 */
if( is_admin() ) { 

    function haiku_admin_scripts() {

        global $haiku_player_version;
        
        // color picker css + js
        wp_enqueue_style('color-picker-css', plugins_url( '/inc/color-picker/jquery.miniColors.css', __FILE__ ), false, '0.1', 'screen'); 
        wp_enqueue_script('color-picker-js', plugins_url( '/inc/color-picker/jquery.miniColors.min.js', __FILE__ ), array('jquery'), '0.1', true); 
    
        // haiku css + js
        wp_enqueue_style('haiku-admin-css', plugins_url( '/admin/haiku-admin.css', __FILE__ ), false, $haiku_player_version, 'screen');
      
    }
    add_action('admin_init','haiku_admin_scripts');

    include('admin/haiku-admin.php');
    include('admin/custom-player.php');

}



/**
 *  Load custom player script only on custom player edit page
 *  @link http://wordpress.stackexchange.com/questions/34894/load-a-script-just-to-custom-post-type-in-admin
 *  @since 0.5.1
 */
function haiku_custom_player_script() {
    global $post_type, $haiku_player_version;
    if( 'custom-player' == $post_type )
        wp_enqueue_script('custom-player-js', plugins_url( '/admin/custom-player.js', __FILE__ ), array('jquery'), $haiku_player_version, true);
}
add_action( 'admin_print_scripts-post-new.php', 'haiku_custom_player_script', 11 );
add_action( 'admin_print_scripts-post.php', 'haiku_custom_player_script', 11 );




/**
 *  Cusotm action links
 *  @link http://www.wpmods.com/adding-plugin-action-links
 *  @since 0.4.7
 */
function haiku_action_links($links, $file) {

    static $this_plugin;
 
    if ( !$this_plugin ) $this_plugin = plugin_basename(__FILE__);
 
    if ( $file == $this_plugin ) {
        $settings_link = '<a href="' . get_bloginfo('wpurl') . '/wp-admin/options-general.php?page=haiku-minimalist-audio-player/haiku-admin.php">'. __('Settings','haiku') .'</a>';
        array_unshift( $links, $settings_link );
    }
 
    return $links;
}
add_filter('plugin_action_links', 'haiku_action_links', 10, 2);



/**
 *  Custom meta links
 *  @link http://thematosoup.com/development/add-action-meta-links-wordpress-plugins/
 *  @todo "go pro" link? 
 */
function haiku_meta_links( $links, $file ) {

    if ( $file == plugin_basename(__FILE__) ) {

        return array_merge($links, array( 
            '<a href="//madebyraygun.com/support/">' . __('Get Support', 'haiku') . '</a>',
            '<a href="//wordpress.org/extend/plugins/haiku-minimalist-audio-player/">' . __('Rate Plugin', 'haiku') . '</a>' 
        ));
    }

    return $links;
}
add_filter( 'plugin_row_meta', 'haiku_meta_links', 10, 2 );