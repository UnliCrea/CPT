<?php
/**
 * The Header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="main">
 *
 * @package Buttercream
 * @since Buttercream 1.0
 */
?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=10" />
<title><?php
  /*
   * Print the <title> tag based on what is being viewed.
   */
  global $page, $paged;

  wp_title( '|', true, 'right' );

  // Add the blog name.
  bloginfo( 'name' );

  // Add the blog description for the home/front page.
  $site_description = get_bloginfo( 'description', 'display' );
  if ( $site_description && ( is_home() || is_front_page() ) )
    echo " | $site_description";

  // Add a page number if necessary:
  if ( $paged >= 2 || $page >= 2 )
    echo ' | ' . sprintf( __( 'Page %s', 'buttercream' ), max( $paged, $page ) );

  ?></title>
<link rel="profile" href="http://gmpg.org/xfn/11" />
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" media="all" href="<?php echo get_template_directory_uri(); ?>/layouts/ie.css"/>
<![endif]-->
<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
<div id="page" class="hfeed site">
  <?php do_action( 'before' ); ?>
    <a href="<?php echo esc_url( home_url( '/' ) ); ?>" title="<?php echo esc_attr( get_bloginfo( 'name', 'display' ) ); ?>" rel="home">
      <div id="header-image"></div>
      <div id="header-imagesm"></div>
      <div class="bluebar"></div>
    </a>
  <header id="masthead" class="site-header" role="banner">
    <hgroup>
      <h1 class="site-title"><a href="<?php echo home_url( '/' ); ?>" title="<?php echo esc_attr( get_bloginfo( 'name', 'display' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a></h1>
      <h2 class="site-description"><?php bloginfo( 'description' ); ?></h2>
      
      <center>
      <a href="/about/"><img src="http://concerned-joe.com/homepage/buttons/blog-about.png"></a>
      <img src="http://concerned-joe.com/homepage/buttons/blog-space.png">
      <a href="http://www.facebook.com/concernedjoe" target="_blank"><img src="http://concerned-joe.com/homepage/buttons/blog-facebook.png"></a>
      <img src="http://concerned-joe.com/homepage/buttons/blog-space.png">
      <a href="mailto:joe_creator@hotmail.com" target="_blank"><img src="http://concerned-joe.com/homepage/buttons/blog-contact.png"></a>
      <img src="http://concerned-joe.com/homepage/buttons/blog-space.png">
      <a href="/flash/"><img src="http://concerned-joe.com/homepage/buttons/blog-flash.png"></a>
      </center>
    </hgroup>
  </header><!-- #masthead .site-header -->
  <div id="main">
