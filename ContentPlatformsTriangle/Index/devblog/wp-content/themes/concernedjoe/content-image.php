<?php
/**
 * The template used for displaying image content
 *
 * @package Buttercream
 * @since Buttercream 1.0
 */
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
			if ( has_post_thumbnail() ) { ?>
				<div class="wp-caption">
					<?php the_post_thumbnail(); ?>
					<div class="wp-caption-text"><?php the_title(); ?></div>
				</div>
				<div class="entry-content">
		  			<?php the_content(); ?>
		  		</div>
			<?php
			}
			else { ?>
				<div class="entry-content">
					<?php the_content(); ?>
				</div>
			<?php } ?>
	</div><!-- .entry-content -->
</article><!-- #post-<?php the_ID(); ?> -->