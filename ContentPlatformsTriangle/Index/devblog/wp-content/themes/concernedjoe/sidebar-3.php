<?php
/**
 * The Sidebar containing the main widget areas.
 *
 * @package Buttercream
 * @since Buttercream 1.0
 */
?>
		<div id="sidebar-3" class="widget-area" role="complementary">
			<?php do_action( 'before_sidebar' ); ?>
			<?php if ( ! dynamic_sidebar( __( 'Third Sidebar' , 'buttercream' ) ) ) : ?>
			<?php endif; // end sidebar widget area ?>
		</div><!-- #secondary .widget-area -->
