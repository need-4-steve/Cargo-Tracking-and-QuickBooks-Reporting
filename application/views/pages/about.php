about page
<?php

	$bol='6179518010';
		$ch = curl_init('http://elines.coscoshipping.com/NewEBWeb/');
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		// get headers too with this line
		curl_setopt($ch, CURLOPT_HEADER, 1);
		$result = curl_exec($ch);
		// get cookie
		// multi-cookie variant contributed by @Combuster in comments
		preg_match_all('/^Set-Cookie:\s*([^;]*)/mi', $result, $matches);
		$cookies = array();
		foreach($matches[1] as $item) {
			parse_str($item, $cookie);
			$cookies = array_merge($cookies, $cookie);
		}
		curl_close($ch);
echo "got cookie<br/>";
		var_dump($cookies);
		$jsessionid='';
		foreach ($cookies as $key=>$value):
			if ($key==='JSESSIONID') {
				$jsessionid=$value;
				var_dump($jsessionid);
				break;
			}
		endforeach;
		/*$ch = curl_init('');

		$requestUrl = "http://elines.coscoshipping.com/NewEBWeb/public/cargoTracking/cargoTracking.xhtml?language=en&page=null&CARGO_TRACKING_NUMBER_TYPE=BOOKING&&CARGO_TRACKING_NUMBER=$bol&REDIRECT=1";
		curl_setopt($ch,CURLOPT_URL, $requestUrl);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
		curl_setopt($ch, CURLOPT_HTTPHEADER, $cookies);
		curl_setopt ($ch, CURLOPT_SSL_VERIFYHOST, false); 
		curl_setopt ($ch, CURLOPT_SSL_VERIFYPEER, false);   
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'GET'); 
		$output=curl_exec($ch);
		if (curl_error($ch)) {
			var_dump();
			return NULL;
		}
		curl_close($ch);
		var_dump($output);
		return $output;*/
	/*GET http://elines.coscoshipping.com/NewEBWeb/public/cargoTracking/cargoTracking.xhtml?language=en&page=null&CARGO_TRACKING_NUMBER_TYPE=BOOKING&&CARGO_TRACKING_NUMBER=6179518010&REDIRECT=1 HTTP/1.1
			Host: elines.coscoshipping.com
			Connection: keep-alive
			Upgrade-Insecure-Requests: 1
			User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36
			Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*\/*;q=0.8
			DNT: 1
			Referer: http://elines.coscoshipping.com/ebusiness/servers/transmit
			Accept-Encoding: gzip, deflate
			Accept-Language: en-US,en;q=0.9
			Cookie: COSCON_ACCESS_I18N=en-US; JSESSIONID=00003k6qqcPpXP-6g4gr14woa06:1ann3vdlp; language=en_US; number=FSCU8790699; numberType=CONTAINER*/
			$requestUrl = "http://elines.coscoshipping.com/NewEBWeb/public/cargoTracking/cargoTracking.xhtml?language=en&page=null&CARGO_TRACKING_NUMBER_TYPE=BOOKING&&CARGO_TRACKING_NUMBER=$bol&REDIRECT=1";

			$agent= 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0.1';
            $curlHeaders = array (
                    'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
                    'Accept-Encoding: gzip, deflate',
                    'Accept-Language: en-US,en;q=0.9',
                    'User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0.1',
                    'Connection: Keep-Alive',
                    'Pragma: no-cache',
                    'Referer: http://elines.coscoshipping.com/ebusiness/servers/transmit',
                    'Host: elines.coscoshipping.com',
                    'Upgrade-Insecure-Requests: 1',
					'DNT: 1',
                    'Cookie: COSCON_ACCESS_I18N=en-US; JSESSIONID='.$jsessionid.'; language=en_US; number=FSCU8790699; numberType=CONTAINER'

            );
            $ch = curl_init();
            curl_setopt ($ch, CURLOPT_HTTPHEADER, $curlHeaders);
            curl_setopt ($ch, CURLOPT_HEADER, TRUE);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_USERAGENT, $agent);
            curl_setopt($ch, CURLOPT_URL,$requestUrl);
			curl_setopt($ch, CURLOPT_ENCODING, 'gzip,deflate'  );
			$output=curl_exec($ch);
			if (curl_error($ch)) {
				var_dump();
			}
			curl_close($ch);
			var_dump($output);
			

	

?>