<?php
/**
 * The Template for displaying all single posts.
 *
 * @package Buttercream
 * @since Buttercream 1.0
 */
global $post;

get_header(); ?>

		<div id="primary" class="site-content">
			<div id="content" role="main">

			<?php while ( have_posts() ) : the_post(); ?>

				<?php
				if ( get_post_format() && !has_post_format( 'gallery' ) ) {
					get_template_part( 'content', get_post_format() );
				}
				else {
					get_template_part( 'content', 'single' );
				}

				// If comments are open or we have at least one comment, load up the comment template
				if ( comments_open() || '0' != get_comments_number() )
					comments_template( '', true );
				?>

			<?php endwhile; // end of the loop. ?>

			</div><!-- #content -->
		</div><!-- #primary .site-content -->
<?php get_footer(); ?>