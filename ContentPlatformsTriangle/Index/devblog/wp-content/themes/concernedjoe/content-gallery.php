<?php
/**
 * The template used for displaying gallery content
 *
 * @package Buttercream
 * @since Buttercream 1.0
 */

global $post;

?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<header class="entry-header">
		<?php edit_post_link( __( 'Edit', 'buttercream' ) , '', ''); ?>
		<div class="entry-meta">
			<?php buttercream_posted_on(); ?>
		</div><!-- .entry-meta -->
	</header><!-- .entry-header -->

	<div class="entry-content">
		<?php

			$images = get_children( array( 'post_parent' => $post->ID, 'post_type' => 'attachment', 'post_mime_type' => 'image', 'orderby' => 'menu_order', 'order' => 'ASC', 'numberposts' => 999 ) );
			if ( $images ) { ?>
				<div class="wp-caption">
				<?php

				$total_images = count( $images );
				$count = 1;
				foreach( $images as $image ) {
					if( $count <=3 ) {
						echo wp_get_attachment_image( $image->ID, 'thumbnail' );
						$count++;
					}
				}

				?>
				<p class="wp-caption-text"><a href="<?php the_permalink() ?>" title="<?php the_title(); ?>"><?php the_title(); ?></a> - <?php printf( _n( '<a %1$s>%2$s photo &#187;</a>', '<a %1$s>%2$s photos &#187;</a>', $total_images, "vintage-camera" ), 'href="' . get_permalink() . '" title="' . sprintf( esc_attr__( 'Permalink to %s', "magazine-premium" ), the_title_attribute( 'echo=0' ) ) . '" rel="bookmark"', number_format_i18n( $total_images ) ); ?></a></p></div>
			<?php
			}
			else {
				the_content();
			} ?>
	</div><!-- .entry-content -->
</article><!-- #post-<?php the_ID(); ?> -->