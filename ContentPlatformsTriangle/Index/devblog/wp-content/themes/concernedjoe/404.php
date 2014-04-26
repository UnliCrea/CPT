<?php
/**
 * The template for displaying 404 pages (Not Found).
 *
 * @package Buttercream
 * @since Buttercream 1.0
 */

get_header(); ?>

	<div id="primary" class="site-content">
		<div id="content" role="main">

			<article id="post-0" class="post error404 not-found">
				<header class="entry-header">
					<h1 class="entry-title"><?php _e( 'Oops! 404 Not Found', 'buttercream' ); ?></h1>
				</header>

				<div class="entry-content">
					<p><?php _e( 'Well, this is awkward. Can I interest you in a search?', 'buttercream' ); ?></p>

					<p><?php get_search_form(); ?></p>

				</div><!-- .entry-content -->
			</article><!-- #post-0 -->

		</div><!-- #content -->
	</div><!-- #primary .site-content -->

<?php get_footer(); ?>