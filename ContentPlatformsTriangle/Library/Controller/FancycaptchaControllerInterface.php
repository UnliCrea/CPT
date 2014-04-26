<?php

namespace Controller;

interface FancycaptchaControllerInterface {
	public function getRand();
	public function checkCaptcha();
}