<?php

namespace View;


class PatchNotesView extends GenericView implements PatchnotesViewInterface
{

	public function __construct() {

		$this->addCSS('Patchnotes');
		$this->setPageName('Patch Notes');
	}

	public function initContent() {

		$this->setContent(
'<div id="joe_title">
            <span id="joe_title_text">
                Patch Notes
            </span>
            <br/>
            <span id="joe_note_text">
                See what changed, what\'s new!
            </span>
        </div>
        <br/>
        <center>
         <a href="/earlyaccess"><input type="image" class="multi_line_image"
         src="' . $this->basePath . 'Theme/Images/Patch Notes/EarlyaccessN.png" onMouseOver="this.src=\'' . $this->basePath . 'Theme/Images/Patch Notes/EarlyaccessO.png\'" onMouseOut="this.src=\'' . $this->basePath . 'Theme/Images/Patch Notes/EarlyaccessN.png\'"></a>
         <a href="/state"><input type="image" class="multi_line_image"
         src="' . $this->basePath . 'Theme/Images/Patch Notes/GamestateN.png" onMouseOver="this.src=\'' . $this->basePath . 'Theme/Images/Patch Notes/GamestateO.png\'" onMouseOut="this.src=\'' . $this->basePath . 'Theme/Images/Patch Notes/GamestateN.png\'"></a>
         <a href="https://docs.google.com/document/d/1xwgRGdKI3hTeOwKYomidgCsC15ddOo09rFfoUqpsDfA/edit" target="_blank"><input type="image" class="multi_line_image"
         src="' . $this->basePath . 'Theme/Images/Patch Notes/TasklistN.png" onMouseOver="this.src=\'' . $this->basePath . 'Theme/Images/Patch Notes/TasklistO.png\'" onMouseOut="this.src=\'' . $this->basePath . 'Theme/Images/Patch Notes/TasklistN.png\'"></a>
         </center>
        <br/><br/>
        <div class="notes">
            ' . \Model\PatchNotesModel::patchNotesFileContent() . '
        </div>
        <br/>
        <br/>
        <br/>
');

	}

}