<?php

$curl_h = curl_init('https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=concernedjoe&count=5');
curl_setopt($curl_h, CURLOPT_HTTPHEADER,
    array(
      'Authorization: OAuth oauth_consumer_key="Oir0z87nrnBcDDHm5aMtg", oauth_nonce="5069800bb9477c9dd89526f533b11f9c", oauth_signature="tKBuF0spSj8FmcYhkM7Dsdt2ofo%3D", oauth_signature_method="HMAC-SHA1", oauth_timestamp="1390397550", oauth_token="180744647-jf90bFPZEVWF2Hu2xUjLJJWIEbGrromLwGqaIJwU", oauth_version="1.0"',

		)
);
curl_setopt($curl_h, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($curl_h, CURLOPT_SSL_VERIFYPEER, false); 
$response = curl_exec($curl_h);
$tweets = explode('"text":"',$response);
for ($x=1; $x<=5; $x++)
  {
  echo explode('","source',$tweets[$x])[0];
  echo "\n";
  } 
?>
 