<?php
/**
 *
 *  Admin functions and options registering
 *  @since 0.5.1
 *
 */



/**
 *  setup options var + settings page
 *  @since 0.5.1
 */
global $options;
       $options = get_option('haiku_player_options');

function haiku_player_add_options_page() {

    add_options_page( 
        __('Haiku Player', 'haiku'), 
        __('Haiku Player Settings', 'haiku'), 
        'manage_options', 
        'haiku_player',
        'haiku_player_build_options_page'
    );

}
add_action('admin_menu', 'haiku_player_add_options_page');



/**
 *  build settings page
 *  @since 0.5.1
 */
function haiku_player_build_options_page() { 

?>
    <div class="wrap" style="max-width: 61.727777777%">  

        <div class="haiku-admin-head">
            <?php screen_icon(); ?>
            <h2><?php _e('Haiku - Minimalist Audio Player', 'haiku'); ?></h2>
            <p><?php _e('Thanks for downloading Haiku! If you like it, please be sure to <a href="http://wordpress.org/extend/plugins/haiku-minimalist-audio-player/">give us a positive rating in the WordPress repository</a>, it will help other people find the plugin and means a lot to us.', 'haiku'); ?></p>
        </div>

        <div class="haiku-admin-settings">

            <form action="options.php" method="post">
                <?php settings_fields('haiku_player_options'); ?>
                <?php do_settings_sections('haiku_player'); ?>
                <p class="submit">
                    <input type="submit" class="button-primary" value="<?php _e('Save Changes', 'haiku'); ?>" />
                </p>
            </form>

        </div><!--haiku-admin-settings-->
 
        <?php include_once('haiku-documentation.php'); ?>

    </div><!--wrap-->

<?php
}



/**
 *  the settings
 *  @since 0.5.1
 */
function haiku_player_settings_init() {

    // register setting + only one section for now
    register_setting(
        'haiku_player_options',
        'haiku_player_options',
        'haiku_player_validate_options'
    );
    add_settings_section(
        'haiku_player_main_settings',
        __('Main Settings','haiku'),
        'haiku_player_main_info',
        'haiku_player'
    );

    // default file location 
    add_settings_field(
        'haiku_player_default_location',
        __( 'Default File Location (optional)', 'haiku' ),
        'haiku_player_default_location_input',
        'haiku_player',
        'haiku_player_main_settings'
    );

    // analytics
    add_settings_field(
        'haiku_player_analytics',
        __( 'Enable Google Analytics', 'haiku'),
        'haiku_player_analytics_input',
        'haiku_player',
        'haiku_player_main_settings'
    );

    // graphical player
    add_settings_field(
        'haiku_player_show_graphical',
        __( 'Use Graphical Player', 'haiku'),
        'haiku_player_show_graphical_input',
        'haiku_player',
        'haiku_player_main_settings'
    );

    // show time
    add_settings_field(
        'haiku_player_show_time',
        __( 'Show Track Time', 'haiku'),
        'haiku_player_show_time_input',
        'haiku_player',
        'haiku_player_main_settings'
    );

    // replace mp3 links
    add_settings_field(
        'haiku_player_replace_mp3_links',
        __( 'Replace all `.mp3` Links', 'haiku'),
        'haiku_player_replace_mp3_links_input',
        'haiku_player',
        'haiku_player_main_settings'
    );

    // replace wp audio player
    add_settings_field(
        'haiku_player_replace_audio_player',
        __( 'Replace WP Audio Player [audio: file.mp3] Syntax', 'haiku'),
        'haiku_player_replace_audio_player_input',
        'haiku_player',
        'haiku_player_main_settings'
    );

}

add_action('admin_init', 'haiku_player_settings_init');



/**
 *  info for main settings section
 *  @since 0.5.1
 */
function haiku_player_main_info() {

    // one flew east

}



/**
 *  input for default location
 *  @since 0.5.1
 */
function haiku_player_default_location_input() {
    $options = get_option( 'haiku_player_options' ); ?>
    <input type="text" name="haiku_player_options[default_location]" class="widefat" value="<?php echo $options['default_location']; ?>">

    <?php 
        if( $options['default_location'] != '' ) :
    
            $haiku_full_default = site_url() . $options['default_location'] . '/';
            printf( __('(<i>Right now, your audio files should be located at</i> %s)', 'haiku'), $haiku_full_default );
        
        endif;
}



/**
 *  input for analytics
 *  @since 0.5.1
 */
function haiku_player_analytics_input() {
    $options = get_option( 'haiku_player_options' );?>
    <input type="checkbox" name="haiku_player_options[analytics]" value="true" <?php checked( "true", $options['analytics'] ); ?>>
<?php }



/**
 *  input for graphical player
 *  @since 0.5.1
 */
function haiku_player_show_graphical_input() {
    $options = get_option( 'haiku_player_options' );?>
    <input type="checkbox" name="haiku_player_options[show_graphical]" value="true" <?php checked( "true", $options['show_graphical'] ); ?>>
<?php }



/**
 *  input for "show time"
 *  @since 0.5.1
 */
function haiku_player_show_time_input() {
    $options = get_option( 'haiku_player_options' );?>
    <input type="checkbox" name="haiku_player_options[show_time]" value="true" <?php checked( "true", $options['show_time'] ); ?>>
<?php }



/**
 *  input for mp3 link replace
 *  @since 0.5.1
 */
function haiku_player_replace_mp3_links_input() {
    $options = get_option( 'haiku_player_options' );?>
    <input type="checkbox" name="haiku_player_options[replace_mp3_links]" value="true" <?php checked( "true", $options['replace_mp3_links'] ); ?>>
<?php }



/**
 *  input for audio syntax replace
 *  @since 0.5.1
 */
function haiku_player_replace_audio_player_input() {
    $options = get_option( 'haiku_player_options' );?>
    <input type="checkbox" name="haiku_player_options[replace_audio_player]" value="true" <?php checked( "true", $options['replace_audio_player'] ); ?>>
<?php }



/**
 *  basic validation inspired by portfolio slideshow pro's settings validation
 *  @link http://madebyraygun.com/wordpress/plugins/portfolio-slideshow-pro/
 *  @since 0.5.1
 */
function haiku_player_validate_options( $input ) {

    // file location
    if (! $input['default_location']) $input['default_location'] = '';
      
    // analytics
    if (! isset($input['analytics'])) $input['analytics'] = null;
    $input['analytics'] = ( $input['analytics'] == "true" ? "true" : "false" );

    // graphical
    if (! isset($input['show_graphical'])) $input['show_graphical'] = null;
    $input['show_graphical'] = ( $input['show_graphical'] == "true" ? "true" : "false" );

    // show track time
    if (! isset($input['show_time'])) $input['show_time'] = null;
    $input['show_time'] = ( $input['show_time'] == "true" ? "true" : "false" );

    // mp3 replace
    if (! isset($input['replace_mp3_links'])) $input['replace_mp3_links'] = null;
    $input['replace_mp3_links'] = ( $input['replace_mp3_links'] == "true" ? "true" : "false" );

    // audio syntax replace
    if (! isset($input['replace_audio_player'])) $input['replace_audio_player'] = null;
    $input['replace_audio_player'] = ( $input['replace_audio_player'] == "true" ? "true" : "false" );

    return $input;
}



?>