<?php
/**
 * The template used for displaying link content
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
	<?php
		$linkurl = get_post_meta( $post->ID, '_format_link_url', true );

		if ( $linkurl ) { ?>
			<div class="link-entry-content">
					<img src="<?php echo get_template_directory_uri() ?>/img/link-light.png" alt="Link to <?php the_title(); ?>" />
					<a href="<?php echo $linkurl; ?>" title="<?php the_title(); ?>"><?php the_title(); ?></a>
			</div><!-- .link-entry-content -->
			<div class="entry-content">
		  		<?php the_content(); ?>
		  	</div>
		<?php
		}
		else { ?>
			<div class="entry-content">
	  		<?php the_content(); ?>
	  		</div>
		<?php
		} ?>
</article><!-- #post-<?php the_ID(); ?> -->