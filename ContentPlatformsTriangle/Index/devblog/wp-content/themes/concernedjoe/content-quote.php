<?php
/**
 * The template used for displaying quote content
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
			$url = get_post_meta( $post->ID, '_format_quote_source_url', true );
			$name = get_post_meta( $post->ID, '_format_quote_source_name', true ); ?>
			<blockquote>
				<a href="<?php the_permalink(); ?>" title="<?php the_title(); ?>"><img src="<?php echo get_template_directory_uri() ?>/img/quote-light.png" alt="Link to <?php the_title(); ?>" /></a><?php the_content(); ?>
				<?php if ( isset( $name ) && $name ) { ?>
					<cite>
						<?php if ( isset( $url ) && $url ) { ?>
						<a href="<?php echo $url ?>">
						<?php } ?>
						<?php echo $name; ?>
						<?php if ( isset( $url ) && $url ) { ?>
						</a>
						<?php } ?>
					</cite>
				<?php } ?>
			</blockquote>
	</div><!-- .entry-content -->
</article><!-- #post-<?php the_ID(); ?> -->