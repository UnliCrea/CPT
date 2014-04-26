<?php
/**
 * The template used for displaying video content
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
		<h1 class="entry-title"><?php the_title(); ?></h1>
	</header><!-- .entry-header -->

	<div class="entry-content">
		<?php
		$embed = get_post_meta( $post->ID, '_format_video_embed', true );

		if ( isset( $embed ) && $embed ) {
	  		$embed = apply_filters( 'the_content', $embed );
	  		$embed = str_replace( ']]>', ']]&gt;', $embed ); ?>
		  	<div class="filmstrip"></div>
		  	<?php echo $embed; ?>
		  	<div class="filmstrip"></div>
		<?php
			the_content();
		}
		else {
			the_content();
		} ?>
	</div><!-- .entry-content -->
</article><!-- #post-<?php the_ID(); ?> -->