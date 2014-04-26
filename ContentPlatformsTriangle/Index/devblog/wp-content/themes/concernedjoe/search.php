<?php
/**
 * The template for displaying Search Results pages.
 *
 * @package Buttercream
 * @since Buttercream 1.0
 */

get_header(); ?>

		<section id="primary" class="site-content">
			<div id="content" role="main">

			<?php if ( have_posts() ) : ?>

				<header class="page-header">
					<h1 class="page-title"><?php printf( __( 'Search Results for: %s', 'buttercream' ), '<span>' . get_search_query() . '</span>' ); ?></h1>
				</header>

				<?php //buttercream_content_nav( 'nav-above' ); ?>

				<?php /* Start the Loop */ ?>
				<?php while ( have_posts() ) : the_post(); ?>

				<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
					<header class="entry-header">
						<?php edit_post_link( __( 'Edit', 'buttercream' ) , '', ''); ?>
						<div class="entry-meta">
							<?php buttercream_posted_on(); ?>
						</div><!-- .entry-meta -->
						<h1 class="entry-title"><?php the_title(); ?></h1>
					</header><!-- .entry-header -->

					<div class="entry-content">
						<?php the_excerpt(); ?>
						<a href="<?php the_permalink(); ?>" title="<?php the_title() ?>">View full post &raquo;</a>
					</div>
				</article>
				<?php endwhile; ?>

			<?php else : ?>

				<article id="post-0" class="post no-results not-found">
					<header class="entry-header">
						<h1 class="entry-title"><?php _e( 'Nothing Found', 'buttercream' ); ?></h1>
					</header><!-- .entry-header -->

					<div class="entry-content">
						<p><?php _e( 'Sorry, but nothing matched your search terms. Please try again with some different keywords.', 'buttercream' ); ?></p>
						<?php get_search_form(); ?>
					</div><!-- .entry-content -->
				</article><!-- #post-0 -->

			<?php endif; ?>

			</div><!-- #content -->
		</section><!-- #primary .site-content -->

<?php get_footer(); ?>