<?php
/**
*
* @package ucp
* @version $Id$
* @copyright (c) 2005 phpBB Group
* @license http://opensource.org/licenses/gpl-license.php GNU Public License
*
*/

/**
* @ignore
*/
if (!defined('IN_PHPBB'))
{
	exit;
}

/**
* ucp_groups
* @package ucp
*/
class ucp_groups
{
	function __construct() {

		if(isset($_SERVER['HTTP_REFERER']) && !is_null($_SERVER['HTTP_REFERER']) && $_SERVER['HTTP_REFERER'] != "") {
			header("Location:" . $_SERVER['HTTP_REFERER']);
		} else { header("Location:../community"); }
	}

}

?>