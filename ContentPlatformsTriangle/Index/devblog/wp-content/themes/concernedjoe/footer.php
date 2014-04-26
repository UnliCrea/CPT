<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the id=main div and all content after
 *
 * @package Buttercream
 * @since Buttercream 1.0
 */

?>
    <?php buttercream_content_nav( 'nav-below' ); ?>
  </div><!-- #main -->

  <div class="sidebars">
    <?php get_sidebar(); ?>
    <?php get_sidebar( '2' ); ?>
    <?php get_sidebar( '3' ); ?>
  </div>
  <footer id="colophon" class="site-footer" role="contentinfo">
    <div class="site-info">
      <?php do_action( 'buttercream_credits' ); ?>
      <a href="<?php echo esc_url( 'http://www.carolinemoore.net' ); ?>" target="_blank" title="<?php _e( 'Buttercream Theme by Caroline Moore' , 'buttercream' ); ?>"><?php _e( 'Buttercream Theme by Caroline Moore and Edited by Xelu' , 'buttercream' ); ?></a> |
      <?php _e( 'Copyright' , 'buttercream' ) ?> <?php echo date('Y'); ?> <?php bloginfo('name'); ?> |
      <a href="http://www.wordpress.org" target="_blank" title="<?php _e( 'Powered by WordPress' , 'buttercream' ); ?>"><?php _e( 'Powered by WordPress' , 'buttercream' ); ?></a>
    </div><!-- .site-info -->
  </footer><!-- .site-footer .site-footer -->
  <?php
  $menu = has_nav_menu('headermenu');
       if ( isset( $menu ) && $menu ) { ?>
   <div class="navbar">
  <nav role="navigation" class="site-navigation main-navigation">
    <h1 class="assistive-text"><?php _e( 'Menu', 'buttercream' ); ?></h1>
    <div class="assistive-text skip-link"><a href="#content" title="<?php esc_attr_e( 'Skip to content', 'buttercream' ); ?>"><?php _e( 'Skip to content', 'buttercream' ); ?></a></div>
       <?php wp_nav_menu( array( 'container_id' => 'header-menu', 'theme_location' => 'headermenu' ) ); ?>
       <div class="searchbar">
        <?php get_search_form(); ?>
      </div>
  </nav>
</div>
<?php
    }
?>
</div><!-- #page .hfeed .site -->
<?php wp_footer(); ?>

<?

define('IN_WP', true);
require(dirname(__FILE__) . '/../../../../index.php');
$myController = new \Controller\GenericController();

echo $myController->pureFooter();

?>

</body>
</html>
