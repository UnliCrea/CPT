<?php

namespace View;

class HistoryView extends GenericView implements HistoryViewInterface {

	public $hasEarlyAccess = false;
	
	public function __construct() {

		$this->addCSS('History');
		$this->setPageName('History');

	}

	public function initContent() {

		$data = \Controller\HistoryController::getVersions();
		$versions = $data[0];
		$dates = $data[1];
		$notes = $data[2];
	
		$trueContent = '<div id="joe_title">
            <span id="joe_title_text">
                History Builds
            </span>
            <br/>
            <span id="joe_subtitle_text">
                A blast from the past
            </span>
</div>

     <br/>
<center>
<div style="width: 950px">
	    <span class="regulartext">
	    <p>
	        From here you you can download previously released builds should you ever need to do so.
	    </p>
	    </span>
	    <span class="Disclaimer">
	    <p>
	    Dev Note: These are universal builds, meaning they don\'t have separate branches for PC, MAC and Linux, however it does support them. 
	    These versions don\'t have the launcher packed with them so you\'ll have to run the game from the apropriate file on each OS
	    (game.exe on windows, game.command on mac, so on)
	    It\'s not advised to put a launcher in these versions because it would instantly detect the older version and attempt to update it, 
	    which defeats the whole purpose of this page.
	    </p>
	    </span>
	    <br>
	    <span class="regulartext">
	    <p>
	        It\'s also a nice display showing how far we\'ve come. Enjoy!
	    </p>
	    </span>
</div>

<br><br>

<table class="tablelines" style="margin-bottom:10%">
<tr>
  <th style="width: 200px;">Build Version</th>
  <th style="width: 100px;">Date</th>		
  <th>Patch Note</th>
  </tr>';
  for($i=0;$i<count($versions);$i++){
	$trueContent .= '<tr>';
	$ver = $versions[$i];
	$date = $dates[$i];
	$note = $notes[$i];
	$linkVer = str_replace(" ","BBB",$ver);
	$linkVer = str_replace(".","AAA",$linkVer);
	if(\Controller\HistoryController::checkFile($linkVer)){
		$trueContent .= '<td><a href="http://concernedjoe.com/history/downloadBuild/'.$linkVer.'">' . $ver . '</a></td>';
	}else{
		$trueContent .= '<td>' . $ver . '</td>';
	}
	$trueContent .= '<td>'.$date.'</td>';
	$trueContent .= '<td class="notetext">'.$note.'</td>';
	$trueContent .= '</tr>';
  }
	
			
	
  $trueContent .= '
</table>
</center>
';
	$fauxContent = '<div id="joe_title">
            <span id="joe_title_text">
                History Builds
            </span>
            <br/>
            <span id="joe_subtitle_text">
                A blast from the past
            </span>
</div>

     <br/>
<center>
<div style="width: 950px">
	    <span class="regulartext">
	    <p>
	        You cannot access previous builds because you do not have Early Access :\'( 
	    </p>
	    </span>
	   
</center>
';
	
	if($this->hasEarlyAccess == true){
		
		$this->setContent($trueContent);
		}
		else{
		$this->setContent($fauxContent);
		}

	}
}