<?php
/**
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
		<?php the_content(); ?>
		<?php wp_link_pages( array( 'before' => '<div class="page-links">', 'after' => '</div>', 'next_or_number' => 'number', 'link_before' => '<span class="active-link">', 'link_after' => '</span>', ) ); ?>
	</div><!-- .entry-content -->

	<footer class="entry-meta">
		<?php
			$category_list = '<span class="cat-links">' . get_the_category_list( ' ' ) . '</span>';

			$tag_list = get_the_tag_list( '<span class="tag-links">', ' ', '</span>' );

			if ( ! buttercream_categorized_blog() ) {
				// This blog only has 1 category so we just need to worry about tags in the meta text
				echo $tag_list;

			} else {
				// But this blog has loads of categories so we should probably display them here
				echo $category_list;
				echo $tag_list;

			} // end check for categories on this blog

		?>
	</footer><!-- .entry-meta -->
</article><!-- #post-<?php the_ID(); ?> -->