<?php
/**
 * Sample implementation of the Custom Header feature
 * http://codex.wordpress.org/Custom_Headers
 *
 * You can add an optional custom header image to header.php like so ...

	<?php $header_image = get_header_image();
	if ( ! empty( $header_image ) ) { ?>
		<a href="<?php echo esc_url( home_url( '/' ) ); ?>" title="<?php echo esc_attr( get_bloginfo( 'name', 'display' ) ); ?>" rel="home">
			<img src="<?php header_image(); ?>" width="<?php echo HEADER_IMAGE_WIDTH; ?>" height="<?php echo HEADER_IMAGE_HEIGHT; ?>" alt="" />
		</a>
	<?php } // if ( ! empty( $header_image ) ) ?>

 *
 * @package Buttercream
 * @since Buttercream 1.0
 */

function buttercream_custom_header_setup() {
	// The default header text color
	define( 'HEADER_TEXTCOLOR', 'ef3d46' );

	// By leaving empty, we allow for random image rotation.

	$options = get_option( 'buttercream_theme_options' );
	$headerstyle = $options['theme_style'];

	if( isset( $headerstyle ) && "" == $headerstyle || false == $headerstyle ) {
		$headerstyle = "cupcake";
	}

	define( 'HEADER_IMAGE', '%s/img/' . $headerstyle . '.png' );

	// The height and width of your custom header.
	// Add a filter to buttercream_header_image_width and buttercream_header_image_height to change these values.
	define( 'HEADER_IMAGE_WIDTH', apply_filters( 'buttercream_header_image_width', 850 ) );
	define( 'HEADER_IMAGE_HEIGHT', apply_filters( 'buttercream_header_image_height', 265 ) );

	// Turn on random header image rotation by default.
	add_theme_support( 'custom-header', array( 'random-default' => true ) );

	// Add a way for the custom header to be styled in the admin panel that controls custom headers
	add_custom_image_header( 'buttercream_header_style', 'buttercream_admin_header_style', 'buttercream_admin_header_image' );
}
add_action( 'after_setup_theme', 'buttercream_custom_header_setup' );

if ( ! function_exists( 'buttercream_header_setup' ) ) :
/**
 * Styles the header image and text displayed on the blog
 *
 * @since Buttercream 1.0
 */
function buttercream_header_style() {

	// If no custom options for text are set, let's bail
	// get_header_textcolor() options: HEADER_TEXTCOLOR is default, hide text (returns 'blank') or any hex value
	if ( HEADER_TEXTCOLOR == get_header_textcolor() )
		return;
	// If we get this far, we have custom styles. Let's do this.
	?>
	<style type="text/css">
	<?php
		// Has the text been hidden?
		if ( 'blank' == get_header_textcolor() ) :
	?>
		.site-title,
		.site-description {
			position: absolute !important;
			clip: rect(1px 1px 1px 1px); /* IE6, IE7 */
			clip: rect(1px, 1px, 1px, 1px);
		}
	<?php
		// If the user has set a custom color for the text use that
		else :
	?>
		.site-title a,
		.site-description {
			color: #<?php echo get_header_textcolor(); ?> !important;
		}
	<?php endif; ?>
	</style>
	<?php
}
endif; // buttercream_header_style

if ( ! function_exists( 'buttercream_admin_header_style' ) ) :
/**
 * Styles the header image displayed on the Appearance > Header admin panel.
 *
 * Referenced via add_custom_image_header() in Buttercream_s().
 *
 * @since Buttercream 1.0
 */
function buttercream_admin_header_style() {
?>
	<style type="text/css">
	.appearance_page_custom-header #headimg {
		border: none;
	}
	#headimg h1,
	#desc {
	}
	#headimg h1 {
		font-family: Norican, sans-serif;
		font-size: 48px;
		clear: both;
		text-align: center;
		margin: 0px;
		line-height: normal;
		font-weight: normal;
	}
	#headimg h1 a {
		text-decoration: none;
	}
	#desc {
		font-family: "Stint Ultra Condensed", serif;
		margin-top: 15px;
		text-align: center;
		clear: both;
		margin: -10px 0px 20px 0px;
		line-height: normal;
		font-size: 200%;
	}
	#headimg img {
		margin: 0 auto;
	}
	</style>
<?php
}
endif; // buttercream_admin_header_style

if ( ! function_exists( 'buttercream_admin_header_image' ) ) :
/**
 * Custom header image markup displayed on the Appearance > Header admin panel.
 *
 * Referenced via add_custom_image_header() in buttercream_setup().
 *
 * @since Buttercream 1.0
 */
function buttercream_admin_header_image() { ?>
	<div id="headimg">

		<?php
		if ( 'blank' == get_theme_mod( 'header_textcolor', HEADER_TEXTCOLOR ) || '' == get_theme_mod( 'header_textcolor', HEADER_TEXTCOLOR ) )
			$style = ' style="display:none;"';
		else
			$style = ' style="color:#' . get_theme_mod( 'header_textcolor', HEADER_TEXTCOLOR ) . ';"';
		?>
		<h1><a id="name"<?php echo $style; ?> onclick="return false;" href="<?php echo esc_url( home_url( '/' ) ); ?>"><?php bloginfo( 'name' ); ?></a></h1>
		<h2 id="desc"<?php echo $style; ?>><?php bloginfo( 'description' ); ?></h2>
	</div>
<?php }

endif; // buttercream_admin_header_image

?>