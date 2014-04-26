<?php
//// New code
$num_of_tweets = 5;

session_start();
require_once('twitteroauth/twitteroauth.php');
define('CONSUMER_KEY', 'Oir0z87nrnBcDDHm5aMtg');
define('CONSUMER_SECRET', 'u73iZlr1GupM98c61rMlGB42uQoqx51ueuVQyftWwU');
define('OAUTH_CALLBACK', 'callback.php');
	function objectToArray($d) {
		if (is_object($d)) {$d = get_object_vars($d);} 
		if (is_array($d)) {return array_map(__FUNCTION__, $d);}
		else {return $d;}
	}

    function getConnectionWithAccessToken($oauth_token, $oauth_token_secret) {
      return new TwitterOAuth(CONSUMER_KEY, CONSUMER_SECRET, $oauth_token, $oauth_token_secret);
    }
$connection = getConnectionWithAccessToken("180744647-jf90bFPZEVWF2Hu2xUjLJJWIEbGrromLwGqaIJwU", "yvRwLfYKT8C82nSkCn1Xhhf9XI46F1lhaGUS1HpSA44n5");
$content = $connection->get("statuses/user_timeline.json?screen_name=concernedjoe&count=".$num_of_tweets."");
	
for ($x=0; $x<$num_of_tweets; $x++)
  {
print_r(objectToArray($content[$x])['text']);
  echo "\n";
  } 
?>
 