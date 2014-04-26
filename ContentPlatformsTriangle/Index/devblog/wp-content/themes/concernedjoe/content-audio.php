<?php
/**
 * The template used for displaying audio content
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

		$embed = get_post_meta( $post->ID, '_format_audio_embed', true );

		if ( isset( $embed ) && $embed ) { ?>

			<div class="audio-entry-content">
				<img src="<?php echo get_template_directory_uri() ?>/img/music-light.png" alt="Audio: <?php the_title(); ?>" />
				<?php
		  			$embed = apply_filters( 'the_content', $embed );
		  			$embed = str_replace( ']]>', ']]&gt;', $embed );

		  			echo $embed; ?>
		  	</div><!-- .audio-entry-content -->
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