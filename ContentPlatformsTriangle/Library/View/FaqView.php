<?php

namespace View;

class FaqView extends GenericView implements FaqViewInterface
{

	public function __construct() {

		$this->addCSS('FAQ');
		$this->setPageName('FAQ');
	}

	public function initContent() {

		$this->setContent(
'<div id="joe_title">
            <span id="joe_title_text">
                It\'s ok, you are not the only one
            </span>
            <br/>
            <span id="joe_subtitle_text">
                Who giggles when he reads "FAQ".
            </span>
        </div>

        <br/>

        <div class="container">
             <div class="left_section">
                <span class="section_title">
                    When will the game come out?
                </span>
                <br/>
                <span class="section_text">
                   <p>
                    Sometime in 2014... It will become more clear as we get closer to the finished game.
                </p>
                <p>
                    We are trying really hard not to make this the next Duke Nukem Forever or HL3.
                    </p>
                    <p>
                    Afterall, we are only two guys working on this whenever time allows us to.
                    </p>
                </span>
            </div>
            <div class="left_section">
                <span class="section_title">
                    What is Early Access?
                </span>
                <br/>
                <span class="section_text">
                   <p>
                    Early Access allows you to download the current version of the game "as it is".
                </p>
                <p>
                    Keep in mind that it is an unfinished version that will get updated as we develop it. Check out the
                </p>
                <p>
                    <a href="/earlyaccess" target="_blank">Early Access</a> page for more information on what you\'ll get!
                    </p>
                    <span style="color: #DA4837;"><p>
                    If you plan to purchase Early Access, please make sure the email you use is the same one as your
                    </p>
                    <p>
                    PayPal account, otherwise the transaction won\'t work.
                    </p></span>
                </span>
            </div>
            <div class="left_section">
                <span class="section_title">
                    Is it like a pre-order?
                </span>
                <br/>
                <span class="section_text">
                   <p>
                    Nope, Early Access gives you instant access to the game as it is developed, as well as the full
                </p>
                <p>game once it\'s released, all this at a significantly lower price than the final release one.
                    </p>
                </span>
            </div>
            <div class="left_section">
                <span class="section_title">
                    What is the current state of the game?
                </span>
                <br/>
                <span class="section_text">
                   <p>
                    Being aware of what you buy is very important, so we made this <a href="/state" target="_blank">state of the game</a> page that
                </p>
                <p>updates in real time to show you what is currently implemented in the game and what features are missing.
                    </p>
                </span>
            </div>
            <div class="left_section">
                <span class="section_title">
                    I have Windows\OSX\Linux\SteamOS on my PC, will the game work?
                </span>
                <br/>
                <span class="section_text">
                   <p>
                    Yes.
                    </p>
                </span>
            </div>
            <div class="left_section">
                <span class="section_title">
                    Is this Super Meat Boy?
                </span>
                <br/>
                <span class="section_text">
                   <p>
                    Nope, <span class="invisible"> Fuck you..........</span>
                    </p>
                </span>
            </div>
            <div class="left_section">
                <span class="section_title">
                    Steam?
                </span>
                <br/>
                <span class="section_text">
                   <p>
                    Yes, if you get the Early Access pass, you will receive a Steam key once the game is out.
                    </p>
                    <p>
                    (Or earlier on when it passes through greenlight in early access mode).
                    </p>
                </span>
            </div>
            <div class="left_section">
                <span class="section_title">
                    What are you wearing right now?
                </span>
                <br/>
                <span class="section_text">
                   <p>
                    Pijama pants and a longer than usual shirt... Why am I answering this?
                    </p>
                </span>
            </div>
             <div class="left_section">
                <span class="section_title">
                    Where will I download the game after I get Early Access?
                </span>
                <br/>
                <span class="section_text">
                   <p>
                    After getting an Early Access pass, when you visit the Early Access page, you will see a download
                    </p>
                    <p>
                    page instead. From there you will be able to download the latest version of the game as well as
                    </p>
                    <p>
                    older builds in case you ever need one.
                    </p>
                </span>
            </div>
             <div class="left_section">
                <span class="section_title">
                    How will I get the latest update?
                </span>
                <br/>
                <span class="section_text">
                   <p>
                    The game will automatically update itself through the launcher when you open it.
                    </p>
                    <p>
                    You can keep track of what each update contains by checking out the <a href="/patchnotes" target="_blank">patch notes</a> page.
                    </p>
                </span>
            </div>
             <div class="left_section">
                <span class="section_title">
                    How much will the game cost when it comes out?
                </span>
                <br/>
                <span class="section_text">
                   <p>
                    We\'re not sure yet, but we can say it will be affordable! Our main goal is to get the</p>
                    <p>
                        game to YOU guys! Entertainment first, profit later.
                    </p>
                </span>
            </div>
             <div class="left_section">
                <span class="section_title">
                    What are the requirements in order to run the game?
                </span>
                <br/>
                <span class="section_text">
                   <p>
                    It\'s too soon to know for sure what the requirements will be. We are trying</p>
                    <p>
                        to make it run on as many systems as we can. More info on this closer to release.
                    </p>
                </span>
            </div>
             <div class="left_section">
                <span class="section_title">
                    Why isn\'t my question in here?
                </span>
                <br/>
                <span class="section_text">
                   <p>
                    You were asleep when we tried to contact you for your question :( But it\'s ok!</p>
                    <p>
                        If you have a question that is not answered here, please <a href="/contact" target="_blank">contact us</a> right away!
                    </p>
                </span>
            </div>



            <div class="image_block">
            </div> 
       </div>

        <div style="clear: left;"></div>

        <br/>
');

	}

}