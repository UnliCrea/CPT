<?php

//May the help of God be with that who tries to understand this code.

namespace Controller;

class HistoryController extends GenericController implements HistoryControllerInterface {

	public function index() {
		$myView = new \View\HistoryView();
		/* Start checking if user is logged in, and setting UserID accordingly */

		$UserID = false;

		if(isset($_SESSION['Username']) && !empty($_SESSION['Username'])) {
			$UserID = \Model\UserOperationsModel::IDFromUsername($_SESSION['Username']);
		}

		if(!$UserID) {
			header("Location:/login/");
		}

		$Username = $_SESSION['Username'];
		
		$hasEarlyAccess = \Model\UserOperationsModel::ownsEarlyAccessLicense($UserID);
		
		if($hasEarlyAccess == true) { $myView->hasEarlyAccess = true;} 
		
		///////////////////////

		
		$myView->setAvatarLink($this->AvatarLink);
		$myView->initContent();
		echo $myView->run();
	}
	
	public function getVersions() {

		$path = '../Build/patchnotes.txt';
		$content = file_get_contents($path);

		$array = array();
		$verArray = array();
		$dateArray = array();
		$noteArray = array();
		
		//Find all the versions
		$lastPos = 0;
		$needle = '<span id="version">';
		while(($lastPos = strpos($content,$needle,$lastPos)) !== false){
			$endIndex = strpos($content,"</span>",$lastPos);
			$ver = substr($content,$lastPos+strlen($needle),($endIndex-$lastPos-strlen($needle)));
			$dateIndex = strpos($content,'<span id="date">',$lastPos);
			$endIndex = strpos($content,"</span>",$dateIndex);
			$date = substr($content,$dateIndex+strlen('<span id="date">'),($endIndex-$dateIndex-strlen('<span id="date">')));
			$noteIndex = strpos($content,'Note: ',$lastPos);
			$endIndex = strpos($content,"\n",$noteIndex);
			$note = substr($content,$noteIndex+strlen('Note: '),($endIndex-$noteIndex-strlen('Note: ')));
			
			array_push($verArray,$ver);
			array_push($dateArray,$date);
			array_push($noteArray,$note);
			
			$lastPos = $lastPos + strlen($needle);
		}
		
		array_push($array,$verArray);
		array_push($array,$dateArray);
		array_push($array,$noteArray);
		
		return $array;
	}
	
	public function checkFile($filename){
		$name = str_replace("Version","Build",$filename);
		$name = str_replace("BBB"," ",$name);
		$name = str_replace("AAA",".",$name);
		$path = "../Build/history/" . $name . ".zip";
		return file_exists($path);
	}
	
	public function downloadBuild($filename){
		
		if(!isset($_SESSION['Username']) || !$_SESSION['Username'] || is_null($_SESSION['Username']) || $_SESSION['Username'] == "") {
			header("HTTP/1.0 400 Bad Request");
			return;
		}

		$name = str_replace("Version","Build",$filename);
		$name = str_replace("BBB"," ",$name);
		$name = str_replace("AAA",".",$name);
		$path = "../Build/history/" . $name . ".zip";
		
		
		$UserID = \Model\UserOperationsModel::IDFromUsername($_SESSION['Username']);
		if(!$UserID) {
			header("HTTP/1.0 401 Unauthorized");
			return;
		}

		$hasEA = \Model\UserOperationsModel::ownsEarlyAccessLicense($UserID);

		if(!$hasEA) {
			header("HTTP/1.0 401 Unauthorized");
			return;
		}
		//Finished all the checks, now download the damned file
		header("Content-Type: application/octet-stream");
		header("Content-Disposition: attachment; filename=\"".pathinfo($path)["basename"]."\"");
		header("Pragma: public");
		header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
		
		set_time_limit(0);
		$file = @fopen($path, "rb");
		$line = fread($file, 1024*8);

		while(!is_null($line) && !empty($line)) {
			print($line);
			ob_flush();
			flush();
			$line = fread($file, 1024*8);
			
		}
	}
}

?>