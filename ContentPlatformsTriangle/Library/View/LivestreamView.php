<?php

namespace View;

class LivestreamView extends GenericView implements LivestreamViewInterface
{

	public function __construct() {

		$this->addCSS('Livestream');
        $this->addJS('Livestream');
		$this->setPageName('Live Stream');
	}

	public function initContent() {

		$this->setContent(
'<div id="joe_title">
            <span id="joe_title_text">
                Live Stream
            </span>
            <br/>
            <span id="joe_subtitle_text">
                Stalk us in real time!
            </span>
        </div>
        <br/>
        <div class="container" style="text-align: center;">
            <span class="section_text">
                Hey there stalker, enjoy the stream whenever it\'s on and please don\'t yell at me when I\'m playing games or doing something else instead of working on Joe.
            </span>
        </div>
        <br/>

        <center>
        <object type="application/x-shockwave-flash" height="506" width="900" id="live_embed_player_flash" data="http://www.twitch.tv/widgets/live_embed_player.swf?channel=xelubest" bgcolor="#000000"><param name="allowFullScreen" value="true" /><param name="allowScriptAccess" value="always" /><param name="allowNetworking" value="all" /><param name="movie" value="http://www.twitch.tv/widgets/live_embed_player.swf" /><param name="flashvars" value="hostname=www.twitch.tv&channel=xelubest&auto_play=true&start_volume=25" /></object>
        <br>
        <a href="#" class="twitch-widget" id="twitch-widget" target="_blank"></a>
        <br>
        <iframe frameborder="0" scrolling="no" id="chat_embed" src="http://twitch.tv/chat/embed?channel=xelubest&popout_chat=true" height="335" width="900"></iframe>
        </center>
        <br/><br/>
');

	}

}