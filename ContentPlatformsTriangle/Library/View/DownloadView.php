<?php

namespace View;

class DownloadView extends GenericView implements DownloadViewInterface {
	
		public function __construct() {

		$this->addJS('Olark');
		$this->addJS('Download');
		$this->addCSS('EarlyAccess');
		$this->addCSS('Download');
		$this->setPageName('Download');
	}

	public function initContent() {

		$verNum = file_get_contents('http://concernedjoe.com/launcher/version/');
		$verDate = file_get_contents('http://concernedjoe.com/launcher/date/');
	
		$this->setContent(
'<div id="joe_title">
			<span id="joe_title_text">
				Download Alpha - Concerned Joe
			</span>
			<br/>
			<span id="joe_subtitle_text">
				Thanks again for getting early access!
			</span>
		</div>

		<br/>

		<div class="container">
			<div class="left_section">
				<span class="section_title">
					Latest version: ' .$verNum.'
				</span>
				<span class="Disclaimer">
				'.$verDate.'
				</span>

				<span class="section_text">
					<p>
						This will download the game files in the same folder once you open it.
					</p>
					<p>
						It will also keep the game constantly updated without you having to manually re-download the launcher everytime.
					</p>
				</span>
			</div>

			<div class="image_block_right">
				<table>
					<td><div class="WindowsDownload DownloadButton" id="win"></div></td>
					<td><div class="MacDownload DownloadButton" id="mac"></div></td>
					<td><div class="LinuxDownload DownloadButton" id="linux"></div></td>
				</table>

				<p class="Disclaimer Download">We highly advise you to read the "Readme" file packed in each version</p>
			</div>
		</div>

		<!-- This here is needed in order to clear the floating stuff from the container -->
		<div style="clear: left;"></div>

		<br/>
		<br/>



		<div class="WideButtons">
		 <a href="https://bitbucket.org/xelu/concerned-joe-alpha/issues/new"><input type="image" class="multi_line_image"
         src="' . $this->basePath . 'Theme/Images/Download/BugN.png" onMouseOver="this.src=\'' . $this->basePath . 'Theme/Images/Download/BugO.png\'" onMouseOut="this.src=\'' . $this->basePath . 'Theme/Images/Download/BugN.png\'"></a>
         <br><br>
         <a href="/patchnotes"><input type="image" class="multi_line_image"
         src="' . $this->basePath . 'Theme/Images/Download/PatchnotesN.png" onMouseOver="this.src=\'' . $this->basePath . 'Theme/Images/Download/PatchnotesO.png\'" onMouseOut="this.src=\'' . $this->basePath . 'Theme/Images/Download/PatchnotesN.png\'"></a>
         <br><br>
         <a href="/history"><input type="image" class="multi_line_image"
         src="' . $this->basePath . 'Theme/Images/Download/HistoryN.png" onMouseOver="this.src=\'' . $this->basePath . 'Theme/Images/Download/HistoryO.png\'" onMouseOut="this.src=\'' . $this->basePath . 'Theme/Images/Download/HistoryN.png\'"></a>
         <br><br>
         <a href="/community/viewforum.php?f=11" target="_blank"><input type="image" class="multi_line_image"
         src="' . $this->basePath . 'Theme/Images/Download/ForumN.png" onMouseOver="this.src=\'' . $this->basePath . 'Theme/Images/Download/ForumO.png\'" onMouseOut="this.src=\'' . $this->basePath . 'Theme/Images/Download/ForumN.png\'"></a>
		</div>

		<div class="OlarkChat">
			<div  id="olark-box-container">
			</div>
		</div>

		<!-- This here is needed in order to clear the floating stuff from the container -->
		<div style="clear: left;"></div>
		
		<br><br><br>


		<div>
			<span class="Problems">
					<p><span class="Red">If you have any problems</span>, you can easily contact us directly through that chat up there.<br />
						If we are not online there, you can <a href="/contact">contact us through mail</a>.</p>
				</span>
		</div>

		<br/>
		<br/>

		<p class="Disclaimer">Developer\'s Note: Keep in mind that this is an early version of the game. We trust you that you won\'t copy or redistribute it.<br />
		Appearing anywhere in this state would damage the game\'s image. Please don\'t send the game to anybody and don\'t attempt to resell it.<br />
		We trust you, pinkie promise?</p>

		<br />
		<br />
		
		
		
');

	}
}