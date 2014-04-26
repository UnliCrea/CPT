<?php
/**
 * Buttercream functions and definitions
 *
 * @package Buttercream
 * @since Buttercream 1.0
 */

/**
 * Set the content width based on the theme's design and stylesheet.
 *
 * @since Buttercream 1.0
 */
if ( ! isset( $content_width ) )
	$content_width = 740; /* pixels */

if ( ! function_exists( 'buttercream_setup' ) ):
/**
 * Sets up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which runs
 * before the init hook. The init hook is too late for some features, such as indicating
 * support post thumbnails.
 *
 * @since Buttercream 1.0
 */
function buttercream_setup() {

	/**
	 * Custom template tags for this theme.
	 */
	require( get_template_directory() . '/inc/template-tags.php' );

	/**
	 * Custom functions that act independently of the theme templates
	 */
	//require( get_template_directory() . '/inc/tweaks.php' );

	/**
	 * Custom Theme Options
	 */
	require( get_template_directory() . '/inc/theme-options/theme-options.php' );

	/**
	 * WordPress.com-specific functions and definitions
	 */
	//require( get_template_directory() . '/inc/wpcom.php' );

	/**
	 * Make theme available for translation
	 * Translations can be filed in the /languages/ directory
	 * If you're building a theme based on Buttercream, use a find and replace
	 * to change 'buttercream' to the name of your theme in all the template files
	 */
	load_theme_textdomain( 'buttercream', get_template_directory() . '/languages' );

	$locale = get_locale();
	$locale_file = get_template_directory() . "/languages/$locale.php";
	if ( is_readable( $locale_file ) )
		require_once( $locale_file );

	/**
	 * Add default posts and comments RSS feed links to head
	 */
	add_theme_support( 'automatic-feed-links' );

	/**
	 * This theme uses wp_nav_menu() in one location.
	 */
	register_nav_menus( array(
		'headermenu' => __( 'Header Menu', 'buttercream' ),
	) );

	/**
	 * Add support for Post Formats
	 */
	add_theme_support( 'post-formats', array( 'aside', 'gallery', 'image', 'audio', 'video', 'status', 'quote', 'link', 'chat' ) );

	/**
	* Add support for editor style
	*/
	add_editor_style();

	/**
	* Add support for post thumbs
	*/
	add_theme_support( 'post-thumbnails' );
	set_post_thumbnail_size( 300, 300, true );

	/**
	 * Add support for custom backgrounds
	 */
	 add_custom_background();

}
endif; // buttercream_setup
add_action( 'after_setup_theme', 'buttercream_setup' );

/**
 * Register widgetized area and update sidebar with default widgets
 *
 * @since Buttercream 1.0
 */
function buttercream_widgets_init() {

	register_sidebar( array(
		'id' => 'first-sidebar',
		'name' => __( 'First Sidebar' , 'buttercream' ),
		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
		'after_widget' => '</aside>',
		'before_title' => '<h2 class="widget-title">',
		'after_title' => '</h2>'
		)
	);

	register_sidebar( array(
		'id' => 'second-sidebar',
		'name' => __( 'Second Sidebar' , 'buttercream' ),
		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
		'after_widget' => '</aside>',
		'before_title' => '<h2 class="widget-title">',
		'after_title' => '</h2>'
		)
	);

	register_sidebar( array(
		'id' => 'third-sidebar',
		'name' => __( 'Third Sidebar' , 'buttercream' ),
		'before_widget' => '<aside id="%1$s" class="widget %2$s">',
		'after_widget' => '</aside>',
		'before_title' => '<h2 class="widget-title">',
		'after_title' => '</h2>'
		)
	);
}
add_action( 'widgets_init', 'buttercream_widgets_init' );

/**
 * Enqueue scripts and styles
 */
function buttercream_scripts() {
	global $post;

	$options = get_option('buttercream_theme_options');

	$buttercream_themestyle = $options['theme_style'];
	$buttercream_customcss = $options['custom_css'];

	wp_register_style( 'googlefonts', 'http://fonts.googleapis.com/css?family=Norican|Alegreya:400italic,700italic,400,700|Stint+Ultra+Condensed' );
	wp_enqueue_style( 'googlefonts' );

	if ( isset( $options['responsive'] ) && $options['responsive'] == "on" ) {
		wp_register_style( 'mediacss', get_template_directory_uri() . '/layouts/media.css', 'media-css' );
		wp_enqueue_style( 'mediacss');
	}
	else {
		wp_register_style( 'mediaie', get_template_directory_uri() . '/layouts/ie.css', 'media-css' );
		wp_enqueue_style( 'mediaie');
	}

	wp_enqueue_style( 'style', get_stylesheet_uri() );

	wp_enqueue_script( 'jquery' );

	wp_enqueue_script( 'small-menu', get_template_directory_uri() . '/js/small-menu.js', array( 'jquery' ), '20120206', true );

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}

	if ( is_singular() && wp_attachment_is_image( $post->ID ) ) {
		wp_enqueue_script( 'keyboard-image-navigation', get_template_directory_uri() . '/js/keyboard-image-navigation.js', array( 'jquery' ), '20120202' );
	}

	if ( file_exists( get_template_directory() . '/css/yellow.css' ) && 'yellow' == $buttercream_themestyle ) {
		wp_register_style( 'buttercream_yellow', get_template_directory_uri() . '/css/yellow.css' );
		wp_enqueue_style( 'buttercream_yellow' );
	} else if ( file_exists( get_template_directory() . '/css/red.css' ) && 'red' == $buttercream_themestyle ) {
		wp_register_style( 'buttercream_red', get_template_directory_uri() . '/css/red.css' );
		wp_enqueue_style( 'buttercream_red' );
	} else {
		wp_register_style( 'buttercream_cupcake', get_template_directory_uri() . '/css/cupcake.css' );
		wp_enqueue_style( 'buttercream_cupcake' );
	}

	if ( $buttercream_customcss ) {
		echo "<style type='text/css'>";
		echo $buttercream_customcss;
		echo "</style>";
	}

}
add_action( 'wp_enqueue_scripts', 'buttercream_scripts' );

function buttercream_head() { ?>

	<!--[if lt IE 9]>
	<script src="<?php echo get_template_directory_uri(); ?>/js/html5.js" type="text/javascript"></script>
	<![endif]-->

<?php
}

add_action( 'wp_head', 'buttercream_head', 1 );

/**
 * Implement the Custom Header feature
 */
//require( get_template_directory() . '/inc/custom-header.php' );