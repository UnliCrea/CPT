<?php

define('IN_WP', true);
require(dirname(__FILE__) . '/../../../../index.php');
$myController = new \Controller\GenericController();

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
<link rel="stylesheet" type="text/css" media="screen" href="/Theme/CSS/bootstrap2.css">
<link rel="stylesheet" type="text/css" media="screen" href="/Theme/CSS/fonts.css">
<link rel="stylesheet" type="text/css" media="screen" href="/Theme/CSS/HeaderFooter.css">
<script type='text/javascript' src='/Theme/JavaScript/jquery-2.0.3.min.js'></script>
<script type='text/javascript' src='/Theme/JavaScript/General.js'></script>
<script type='text/javascript' src='/Theme/JavaScript/FancyCaptcha2.js'></script>
<script type='text/javascript' src='/Theme/JavaScript/jquery-ui-1.10.4.custom.min.js'></script>
<script type='text/javascript' src='/Theme/JavaScript/bootstrap.min.js'></script>

<!-- Piwik -->
<script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(["trackPageView"]);
  _paq.push(["enableLinkTracking"]);

  (function() {
    var u=(("https:" == document.location.protocol) ? "https" : "http") + "://concernedjoe.com/analytics/";
    _paq.push(["setTrackerUrl", u+"piwik.php"]);
    _paq.push(["setSiteId", "1"]);
    var d=document, g=d.createElement("script"), s=d.getElementsByTagName("script")[0]; g.type="text/javascript";
    g.defer=true; g.async=true; g.src=u+"piwik.js"; s.parentNode.insertBefore(g,s);
  })();
</script>
<!-- End Piwik Code -->

<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" media="all" href="<?php echo get_template_directory_uri(); ?>/layouts/ie.css"/>
<![endif]-->
<?php wp_head(); ?>
</head>
<style type="text/css">
#preloadedImages {
       width: 0px;
       height: 0px;
       display: inline;
       background-image: url(Buttons/About-O.png);
}
</style>

<body <?php body_class(); ?>>

<?php echo $myController->wordPressHeader(); ?>

<div id="page" class="hfeed site">
  <?php do_action( 'before' ); ?>
    <!--<a href="<?php echo esc_url( home_url( '/' ) ); ?>" title="<?php echo esc_attr( get_bloginfo( 'name', 'display' ) ); ?>" rel="home">
      <div id="header-image"></div>
      <div id="header-imagesm"></div>
      <div class="bluebar"></div>        
    </a>-->
    <br><br><br><br><br>
  <header id="masthead" class="site-header" role="banner">
    <hgroup>
      <a href="/devblog"><div align="center">
          <span style="color:#4F4F4F; font-size: 55px; font-family: 'bebas_neueregular';text-shadow: 2px 2px #d5d5d5;">
                Concerned Joe Dev Blog
            </span>
            <br/>
            <span style="color:#939393;font-size: 20px;font-family: 'contentfont';text-shadow: 2px 2px #d5d5d5;">
                Where we post what we work on
            </span></a>
        </div>
        <br>
        <center>
        <form method="get" id="searchform" action="<?php bloginfo('home'); ?>/">
<div><input type="text" size="30" name="s" id="s" value="Write your search and hit enter" onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;"/>
<input type="hidden" id="searchsubmit"/>
</div>
</form>
</center>
        <br>
      <!--<h1 class="site-title"><a href="<?php echo home_url( '/' ); ?>" title="<?php echo esc_attr( get_bloginfo( 'name', 'display' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a></h1>
      <h2 class="site-description"><?php bloginfo( 'description' ); ?></h2>-->
    </hgroup>
  </header><!-- #masthead .site-header -->
  <div id="main">
