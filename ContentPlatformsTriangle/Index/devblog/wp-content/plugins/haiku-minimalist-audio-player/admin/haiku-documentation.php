<?php 
/**
 *
 *  Documentation
 *  @since 0.5.1
 *
 */

global $haiku_player_version;
?>

<div class="haiku-reference">

    <h2><?php _e('Documentation', 'haiku'); ?></h2>

    <h4 style="margin-bottom: 0;"><?php _e('Contents', 'haiku'); ?></h4>
    <ol style="margin-top: 0;padding-top: 5px;">
        <li><a href="#basic"><?php _e('Basic Usage', 'haiku'); ?></a></li>
        <li><a href="#files"><?php _e('File Loaction', 'haiku'); ?></a></li>
        <li><a href="#analytics">Google Analytics</a></li>
        <li><a href="#replacements"><?php _e('Replacements', 'haiku'); ?></a></li>
        <li><a href="#graphical"><?php _e('Graphical Player', 'haiku'); ?></a></li>
        <li><a href="#other_attributes"><?php _e('Other Attributes', 'haiku'); ?></a></li>
        <li><a href="#credits"><?php _e('Credits', 'haiku'); ?></a></li>
    </ol>


    <h3 id="#basic"><?php _e('Basic Usage', 'haiku'); ?></h3>

        <p><?php _e('To get up and running, use a simple shortcode like <code>[haiku url="http://example.com/file.mp3" oga="http://example.com/file.oga" title="Title of audio file"]</code>.', 'haiku'); ?></p>

        <!-- url-->
        <p><?php _e('The <code>url</code> option should be set to <b>the full URL of the .mp3 audio file you\'re trying to use</b>. This can also be a relative URL if you\'ve set a default file location <a href="#files">(see below)</a>.', 'haiku'); ?></p>

        <!-- oga-->
        <p><?php _e('The <code>oga</code> attribute is not required, but <b>strongly</b> recommended. This should be a link to a version of the file you\'re using with your <code>url</code> attribute, but in the <code>.ogg</code> or <code>.oga</code> audio file formats instead of <code>.mp3</code>', 'haiku'); ?></p>
        <p><?php _e('The <code>oga</code> attribute is a backup for your main file. Some web browsers don\'t play <code>.mp3</code> files, meaning that a portion of your audience could be missing out on your audio if you don\'t have a <code>.ogg</code> or <code>.oga</code> fallback. Some browsers actually prefer these formats to <code>.mp3</code> &mdash; for example, most versions of Firefox will play the <code>.ogg</code> or <code>.oga</code> versions of a file even if a <code>.mp3</code> version is provided.', 'haiku'); ?></p>

        <!-- title-->
        <p><?php _e('The <code>title</code> option is an optional attribute. The value you enter for this attribute will display between the contorl buttons and track time in the text player. It\'s also what will be used as a link title for your play buttons and for Google Analytics tracking. ', 'haiku'); ?></p>
        <p><?php _e('If no custom title is set, the default text of "Audio" will be used for link titles and Analytics labels instead.', 'haiku'); ?></p>


    <h3 id="files"><?php _e('File Location', 'haiku'); ?></h3>

        <!-- file location -->
        <p><?php _e('WordPress installations usually have upload size limits. If you\'re experiencing this but need full-size audio files, you can upload your files to a separate folder on your site via FTP.', 'haiku'); ?></p>
        <p><?php _e('<b>The "default file location" field in the Haiku options panel allows you to specify where this folder is</b>, which lets you use relative URLs for your audio files to keep your shortcodes simple and clean.', 'haiku'); ?></p>
        <p><?php _e('If, for example, all of your audio files are in <code>http://yoursite.com/audio</code>, set the default folder to <code>/audio</code>. If you wanted to display <code>file.mp3</code> and <code>file.ogg</code>, your shortcode would look like this: <code>[haiku url="file.mp3" oga="file.ogg" title="Audio Title"]</code>.', 'haiku'); ?><p> 
        <p><?php _e('You can overwrite this setting on a per-player basis with the attribute <code>defaultpath=disabled</code>. For example, if for one player you instead wanted to link to <code>http://theirsite.com/file.mp3</code>, your shortcode would look like this: <code>[haiku url="http://theirsite.com/file.mp3" defaultpath=disabled]</code>.', 'haiku'); ?></p>


    <h3 id="analytics"><?php _e('Google Analytics', 'haiku'); ?></h3>

        <!-- google analytics-->
        <p><?php _e('The Google Analytics setting in the options panel enables a script which tracks "Play" events for your instances of the Haiku player.', 'haiku'); ?></p> 
        <p><?php _e('You <b>must</b> already have Google Analytics tracking installed on your site, <b>using the asynchronous version of the script in the <code>&lt;head&gt;</code> of your HTML document</b>.', 'haiku'); ?></p>
        <p><?php _e('Each event will display in your Google Analytics account as the title you entered for the <code>title</code> option in the shortcode. If no <code>title</code> exists, the events will show up as "Audio".', 'haiku'); ?></p>


    <h3 id="replacements"><?php _e('Replacements', 'haiku'); ?></h3>

        <!-- link replace -->
        <p><?php _e('Haiku includes the ability to automatically turn all <code>.mp3</code> anchor links into a Haiku Player. Simply check the "Replace all mp3 links" box in the options panel.', 'haiku'); ?></p>
        <p><?php _e('For example, <code>&lt;a href="http://example.com/file.mp3"&gt; Audio &lt;/a&gt;</code> will automatically be converted to <code>[haiku url="http://example.com/file.mp3" defaultpath=disabled]</code>.', 'haiku'); ?></p>
        <p><?php _e('You may experience problems if you have other plugins that also override MP3 links, like Shadowbox.', 'haiku'); ?></p>

        <!-- wp audio player -->
        <p><?php _e('The player is also now drop-in compatible with WordPress Audio Player. If you\'re replacing a WordPress Audio Player install, check the "replace WP Audio Player" box to automatically replace all instances of the WP Audio Player shortcode. (WP Audio Player must be disabled or removed for this to work).', 'haiku'); ?></p>
        <p><?php _e('The <code>[haiku]</code> shortcode is still the recommended format, as it allows the "Title" field for Google Analytics support.', 'haiku'); ?></p>


    <h3 id="graphical"><?php _e('Graphical Player', 'haiku'); ?></h3>

        <p><?php _e('The player includes a graphical mode, which is turned off by default. Enable graphical mode by changing the default setting in the settings panel or by adding the attribute <code>graphical=true</code> to your shortcode.', 'haiku'); ?></p>
        <p><?php _e('This can be overridden on a per-player basis. You can also select the option on the options panel above and turn <i>off</i> the graphical interface for specific players by adding <code>graphical=false</code> to your shortcode.', 'haiku'); ?></p>
        <p><?php _e('The graphical player will use the <code>title</code> element for Analytics and for information text when a user hovers over the play button.', 'haiku'); ?></p>
        <p><?php _e('Example: <code>[haiku url="file.mp3" title="A Great Song" graphical=true]</code>', 'haiku'); ?>
            <div><img src ="<?php echo plugins_url( 'img/player-example.png', __FILE__ )?>" alt="Haiku Player Example"></div></p>

    <h3 id="other_attributes"><?php _e('Other Attributes', 'haiku'); ?></h3>

        <h4><?php _e('<code>showtime</code>', 'haiku'); ?></h4>
        <p><?php _e('If you want the current track position and track duration to display next to your players, check the "Show Track Time" option. You can also set this on a per-player basis in your shortcode, with <code>showtime=true</code> or <code>showtime=false</code>.', 'haiku'); ?></p>
        <p><?php _e('For example, the shortcode <code>[haiku url="file.mp3" oga="file.ogg" graphical=true" showtime="true"]</code> will produce this:', 'haiku') ?>
            <div><img src ="<?php echo plugins_url( 'img/showtime-example.png', __FILE__ ); ?>" alt="Haiku showtime=true attribute example"></div></p>
        <p><?php _e('The same player with <code>showtime="false"</code> instead might look something like this:', 'haiku') ?>
            <div><img src ="<?php echo plugins_url( 'img/player-example.png', __FILE__ )?>" alt="Haiku showtime=false attribute example"></div></p>

        <h4><?php _e('<code>loop</code>', 'haiku'); ?></h4>
            <p><?php _e('Sometimes you want your audio to start playing again right after it\'s finished &mdash; simply adding <code>loop=true</code> to your shortcode will enable this.', 'haiku'); ?></p>

        <h4><?php _e('<code>class</code>', 'haiku'); ?></h4>
            <p><?php _e('The <code>class</code> attribute is the easiest way to add a custom CSS class name to a specific player (or multiple players, if you want). For example, you can apply the class name <code>.example-player-class</code> to a player if you simply add <code>class="example-player-class"</code> to its shortcode.', 'haiku'); ?></p>
    
        <h4><?php _e('<code>player</code>', 'haiku'); ?></h4>
            <p><?php _e('If you create a custom player "skin", you can use it by first locating its "Player ID" (see image below). Then, add a <code>player=x</code> attribute to the shortcodes you want this skin to apply to, where <code>x</code> is the Player ID number.', 'haiku'); ?>
            <div><img src ="<?php echo plugins_url( 'img/player-id-example.png', __FILE__ )?>" alt="Example of Player IDs in admin."></div></p>

    <h3 id="credits"><?php _e('Credits', 'haiku'); ?></h3>
        <dl>
            <dt><a href="http://jplayer.org">jPlayer</a></dt>
            <dd><?php _e('A jQuery plugin that powers Haiku, by <a href="http://www.happyworm.com/">Happyworm</a>.', 'haiku'); ?></dd>

            <dt><a href="http://somerandomdude.com/work/iconic/">Iconic</a></dt>
            <dd><?php _e('A beautiful, free icon font.', 'haiku'); ?></dd>

            <dt><a href="http://fontello.com/">Fontello</a></dt>
            <dd><?php _e('A free icon font composer.', 'haiku'); ?></dd>
        </dl>

</div><!--haiku-reference-->    

<div class="made-by">
    <p><?php printf( __('You\'re using Haiku Player v. %s, made by <a href="http://madebyraygun.com">Raygun</a>. Check out our <a href="http://madebyraygun.com/wordpress/plugins/">other plugins</a>, and if you have any problems, stop by our <a href="http://madebyraygun.com/support/">support forums</a>!', 'haiku'), $haiku_player_version ); ?></p>
    <a href="http://madebyraygun.com">
        <img style="margin-top:30px;" src="<?php echo plugins_url( 'img/logo.png', __FILE__ ); ?>" width="225" height="70" alt="Made by Raygun" />
    </a>
</div><!--made-by-->