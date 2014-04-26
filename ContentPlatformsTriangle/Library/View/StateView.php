<?php

namespace View;

class StateView extends GenericView implements StateViewInterface
{

	public function __construct() {

		$this->addCSS('State');
		$this->setPageName('State');
	}

	public function initContent() {

		$this->setContent(
'<div id="joe_title">
            <span id="joe_title_text">
                Current state of the game
            </span>
            <br/>
            <span id="joe_subtitle_text">
                Status report! Woooo
            </span>
        </div>

        <br/>

        <div class="container" style="text-align: center;">
            <span class="section_text">
                Since the game is still in development, it\'s current state has to be clear for those who are interested in getting an early access pass.
                This list is updated in real time with each feature added to the game. Please take a look over it before you decide to purchase an early access pass.
                Thank you :)
            </span>
        </div>
        <br/>
        <center>
         <a href="/earlyaccess"><input type="image" class="multi_line_image"
         src="' . $this->basePath . 'Theme/Images/State/EarlyaccessN.png" onMouseOver="this.src=\'' . $this->basePath . 'Theme/Images/State/EarlyaccessO.png\'" onMouseOut="this.src=\'' . $this->basePath . 'Theme/Images/State/EarlyaccessN.png\'"></a>
         <a href="/patchnotes"><input type="image" class="multi_line_image"
         src="' . $this->basePath . 'Theme/Images/State/PatchnotesN.png" onMouseOver="this.src=\'' . $this->basePath . 'Theme/Images/State/PatchnotesO.png\'" onMouseOut="this.src=\'' . $this->basePath . 'Theme/Images/State/PatchnotesN.png\'"></a>
         <a href="https://docs.google.com/document/d/1xwgRGdKI3hTeOwKYomidgCsC15ddOo09rFfoUqpsDfA/edit" target="_blank"><input type="image" class="multi_line_image"
         src="' . $this->basePath . 'Theme/Images/State/TasklistN.png" onMouseOver="this.src=\'' . $this->basePath . 'Theme/Images/State/TasklistO.png\'" onMouseOut="this.src=\'' . $this->basePath . 'Theme/Images/State/TasklistN.png\'"></a>
         </center>
        <br/><br/>
        <div class="container">
            <div class="left_section">
                <span class="section_title_green">
                    What\'s currently in the game
                </span>

                <span class="section_text">
                <ul>
                        <li>
                            <a href="http://www.youtube.com/watch?v=VlgmAALlb0c" target="_blank">Level editor</a> (work in progress)
                            </li><br/>
                            </ul><ul id="list-indent"><li>
                            Placing and editing tiles
                            </li><br/><li>
                            Creating events
                            </li><br/><li>
                            Ability to use custom assets and sounds
                            </li></ul><ul><li>
                            Modding support
                            </li><br/><li>
                            Controller support
                            </li><br/><li>
                            Local multiplayer
                            </li><br/><li>
                            User made levels
                            </li><br/><li>
                            Multiple game modes
                            </li><br/></ul><ul id="list-indent"><li>
                            Stomp
                            </li><br/><li>
                            Ghost
                            </li><br/><li>
                            Bomb Tag
                            </li></ul><ul><li>
                            Developer console
                        </li>
                    </ul>
                </span>
            </div>

                <div class="image_block_right">
                <img src="' . $this->basePath . 'Theme/Images/State/checks.jpg">
            </div>  

               <div class="left_section">
                <span class="section_title_red">
                    What is the game missing
                </span>

                <span class="section_text">
                    <ul>
                            <li>
                            No single player campaign
                            </li><br/><li>
                            No co-op campaign
                            </li><br/><li>
                            Finished Level Editor
                            </li><br/>
                    </ul><ul id="list-indent"><li>
                            No visual decorations
                            </li></ul><ul><li>
                            No advance settings screen
                            </li><br/><li>
                            No subtitle support
                            </li><br/><li>
                            No one click level sharing
                            </li><br/><li>
                            No Music and sound effects
                            </li><br/><li>
                            Native Linux support.
                        </li>
                    </ul>
                </span>
            </div>  
        </div>
        
        <div style="clear: left;"></div><br/><br/>
');

	}

}