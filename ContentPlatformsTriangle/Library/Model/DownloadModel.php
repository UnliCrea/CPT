<?php

namespace Model;

class DownloadModel implements DownloadModelInterface {
	
	private $encryptionKey = "251CFD25EF619";

	/**
	* Crypt/decrypt strings with RC4 stream cypher algorithm.
	* @param string $string Encrypted/pure data
	* @see   http://pt.wikipedia.org/wiki/RC4
	* @return string
	*/

	public function process($string) {

	    // Store the vectors "S" has calculated
	    static $SC;
	    // Function to swaps values of the vector "S"
	    $swap = create_function('&$v1, &$v2', '
	        $v1 = $v1 ^ $v2;
	        $v2 = $v1 ^ $v2;
	        $v1 = $v1 ^ $v2;
	    ');
	    $ikey = crc32($this->encryptionKey);
	    if (!isset($SC[$ikey])) {
	        // Make the vector "S", based in the key
	        $S    = range(0, 255);
	        $j    = 0;
	        $n    = strlen($this->encryptionKey);
	        for ($i = 0; $i < 255; $i++) {
	            $char  = ord($this->encryptionKey{$i % $n});
	            $j     = ($j + $S[$i] + $char) % 256;
	            $swap($S[$i], $S[$j]);
	        }
	        $SC[$ikey] = $S;
	    } else {
	        $S = $SC[$ikey];
	    }
	    // Crypt/decrypt the data
	    $n    = strlen($string);
	    $string = str_split($string, 1);
	    $i    = $j = 0;
	    for ($m = 0; $m < $n; $m++) {
	        $i        = ($i + 1) % 256;
	        $j        = ($j + $S[$i]) % 256;
	        $swap($S[$i], $S[$j]);
	        $char     = ord($string[$m]);
	        $char     = $S[($S[$i] + $S[$j]) % 256] ^ $char;
	        $string[$m] = chr($char);
	    }
	    return implode('', $string);
	}

}

?>