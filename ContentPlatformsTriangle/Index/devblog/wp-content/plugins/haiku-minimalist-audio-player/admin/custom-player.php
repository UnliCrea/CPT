<?php
/**
 *
 *  "Custom skin" player functions and relevant script loading
 *  @todo more OOP integration maybe
 *  @since 0.5.1
 *
 */
global $haiku_player_version,
       $haiku_custom_player_vars;



/**
 *  player "skeleton" for custom player page
 *  @todo extend with filters
 *  @since 0.5.1
 */
function haiku_pro_default_preview() {
    ?>
    <div class="custom-player-preview">
         <div class="haiku-container haiku-graphical-container">
            <ul class="haiku-controls">
                <li class="haiku-gui">
                    <a class="haiku-play">p</a>
                    <a class="haiku-pause">o</a>
                </li>
                <li class="haiku-seek-container">
                    <div class="haiku-seek-bar">
                        <div class="haiku-play-bar"></div>
                    </div>
                </li>
                <li class="haiku-time-holder">
                    <span class="haiku-current-time">2:53</span>
                    <span class="haiku-time-separator">/</span>
                    <span class="haiku-duration">4:35</span>
                </li><!--haiku-time-holder-->
            </ul>
        </div><!--haiku-container-->
    </div><!--custom-player-preview--> 
    <?php
}
add_action('haiku_pro_player_preview','haiku_pro_default_preview');



/**
 *  register the player post type
 *  @since 0.5.1
 */
function haiku_post_type_init() {

    $haiku_custom_args = array(
        'labels' => array(
            'name' => __('Haiku Custom Players', 'haiku'),
            'description' => __('Build custom, reusable Haiku audio players.', 'haiku'),
            'singular_name' => __('Custom Players', 'haiku'),
            'add_new' => __('Add Custom Player', 'haiku'),
            'add_new_item' => __('Add Custom Player', 'haiku'),
            'edit_item' => __('Edit Custom Player', 'haiku'),
            'new_item' => __('New Custom Player', 'haiku'),
            'view_item' => __('View Custom Player', 'haiku'),
            'search_items' => __('Search Custom Players', 'haiku'),
            'not_found' => __('Nothing Found', 'haiku'),
            'not_found_in_trash' => __('Nothing Found in Trash', 'haiku'),
        ),
        'supports' => array(''),
        'public' => true,
        'publicly_queryable' => true,
        'exclude_from_search' => true,
        'show_in_menu' => 'options-general.php',
        'show_in_admin_bar' => false,
        'hierarchical' => false,
        'has_archive' => true,
        'menu_position' => 100
    );

    register_post_type('custom-player', $haiku_custom_args);

}
add_action('init','haiku_post_type_init');



/**
 *  Register meta boxes
 *  @since 0.5.1
 */
function haiku_add_meta_boxes() {

    add_meta_box(
        'haiku_pro_custom_player_meta_box', 
        __('What your custom player will look like:'), 
        'haiku_pro_build_metaboxes', 
        'custom-player', 
        'normal', 
        'high'
    );

}
add_action( 'add_meta_boxes', 'haiku_add_meta_boxes' );



/**
 *  Output for meta boxes in post editor
 *  @since 1.0
 */
function haiku_pro_build_metaboxes( $post ) {

    global $haiku_custom_player_vars;

    $haiku_pro_background_color = get_post_meta( $post->ID, 'haiku_pro_background_meta_box', true );      
    $haiku_pro_gui_color = get_post_meta( $post->ID, 'haiku_pro_gui_meta_box', true );      
    $haiku_pro_time_color = get_post_meta( $post->ID, 'haiku_pro_time_meta_box', true );      

    wp_nonce_field( 'haiku_pro_meta_box_nonce', 'meta_box_nonce' ); 
    ?>
  
    <!-- Player Preview -->
    <?php do_action('haiku_pro_player_preview'); ?>

    <!-- Background Color -->
    <p>
        <label for="haiku_pro_background_meta_box"><?php _e('Background color: ', 'haiku'); ?></label>
        <input class="color-picker custom-bg" size="8" id="haiku-custom-bg"  type="text" name="haiku_pro_background_meta_box" value="<?php if($haiku_pro_background_color) { echo $haiku_pro_background_color; } else { echo '#969696'; } ?>" />
    </p>

     <!-- GUI Color -->
    <p>
        <label for="haiku_pro_gui_meta_box"><?php _e('Icon and bar color: ', 'haiku'); ?></label>
        <input class="color-picker custom-gui" size="8" id="haiku-custom-bg"  type="text" name="haiku_pro_gui_meta_box" value="<?php if($haiku_pro_gui_color) { echo $haiku_pro_gui_color; } else { echo '#ffffff'; } ?>" />
    </p>

     <!-- GUI Color -->
    <p>
        <label for="haiku_pro_time_meta_box"><?php _e('Time text color: ', 'haiku'); ?></label>
        <input class="color-picker custom-time" size="8" id="haiku-custom-bg"  type="text" name="haiku_pro_time_meta_box" value="<?php if($haiku_pro_time_color) { echo $haiku_pro_time_color; } else { echo '#ffffff'; } ?>" />
    </p>
  

    <?php 

    $haiku_custom_player_vars = array(
        'custom_bg' => $haiku_pro_background_color,
        'custom_gui' => $haiku_pro_gui_color,
        'custom_time' => $haiku_pro_time_color
    );

    wp_localize_script(
        'custom-player-js', 
        'haiku_custom_opts', 
        $haiku_custom_player_vars
    );

}



/**
 *  Save our metabox values
 *  @since 1.0
 */
function haiku_pro_meta_box_save( $post_id ) {

    // checks
    if( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) return;
    if( !isset( $_POST['meta_box_nonce'] ) || !wp_verify_nonce( $_POST['meta_box_nonce'], 'haiku_pro_meta_box_nonce' ) ) return;
        
    if( isset( $_POST['haiku_pro_background_meta_box'] ) )
        update_post_meta( $post_id, 'haiku_pro_background_meta_box', $_POST['haiku_pro_background_meta_box']);

    if( isset( $_POST['haiku_pro_gui_meta_box'] ) )
        update_post_meta( $post_id, 'haiku_pro_gui_meta_box', $_POST['haiku_pro_gui_meta_box'] );

    if( isset( $_POST['haiku_pro_time_meta_box'] ) )
        update_post_meta( $post_id, 'haiku_pro_time_meta_box', $_POST['haiku_pro_time_meta_box'] );

}
add_action( 'save_post', 'haiku_pro_meta_box_save' );



/**
 *  Make columns for the idea post type edit page
 *  @since 1.0
 */
function haiku_pro_register_columns( $columns ) {

    $columns = array(
        'custom_player_preview' => __('Player Preview', 'haiku'),
        'custom_player_id' => __('Player ID', 'haiku'),
        'custom_player_shortcode' => __('Basic Shortcode', 'haiku'),
        'date' => __('Date', 'haiku')
    );

    return $columns;
}



/**
 *  Output for custom players and relevant columns
 *  @since 1.0
 */
function haiku_pro_render_columns( $column, $post_id ) {
    global $post, $haiku_player_version;

    $haiku_pro_column_bg = get_post_meta( $post_id, 'haiku_pro_background_meta_box', true );
    $haiku_pro_column_gui = get_post_meta( $post_id, 'haiku_pro_gui_meta_box', true );
    $haiku_pro_column_time = get_post_meta( $post_id, 'haiku_pro_time_meta_box', true );
    $haiku_pro_column_link = get_edit_post_link( $post_id );

    $haiku_custom_player_vars = array(
        'custom_bg' => $haiku_pro_column_bg,
        'custom_gui' => $haiku_pro_column_gui,
        'custom_time' => $haiku_pro_column_time
    );

    wp_localize_script(
        'custom-player-column-js', 
        'haiku_player_'.$post_id, 
        $haiku_custom_player_vars
    );

    switch( $column ) {

        case 'custom_player_preview' :
            do_action('haiku_pro_player_preview');
            break;

        case 'custom_player_id' :
            echo '<span class="haiku-column-player-id">' . $post_id . '</span>';
            echo '<a href="'.$haiku_pro_column_link.'" class="button-secondary">'. __('Edit Player &rarr;') .'</a>';
            break;

        case 'custom_player_shortcode' :
            echo '<span class="haiku-code">[haiku player='.$post_id.']</span>';

        default :
            break;
    }

    wp_enqueue_script('custom-player-column-js', plugins_url( 'custom-columns.js', __FILE__ ), array('jquery'), $haiku_player_version, true);

}

 
/**
 *  Add the custom columns
 *  @since 1.0
 */
add_filter( 'manage_edit-custom-player_columns', 'haiku_pro_register_columns' ) ;
add_action( 'manage_custom-player_posts_custom_column', 'haiku_pro_render_columns', 10, 2 );



?>