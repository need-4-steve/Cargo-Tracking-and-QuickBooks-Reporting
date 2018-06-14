<?php
function test(){
    $string = "/brown fox jumped [0-9]/";

    $paragraph = "The brown fox jumped 1 time over the fence. The green fox did not. Then the brown fox jumped 2 times over the fence";

    if (preg_match_all($string, $paragraph, $matches)) {
		echo count($matches[0]) . " matches found";
    } else {
        echo "match NOT found";
    }
	print_r($matches);
}

  test();
  
  function console_log( $data ){
  echo '<script>';
  echo 'console.log('. json_encode( $data ) .')';
  echo '</script>';
}
/*
Usage:
$myvar = array(1,2,3);
console_log( $myvar ); // [1,2,3]
*/
  ?>