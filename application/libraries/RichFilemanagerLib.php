<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class RichFilemanagerLib 
{

        private  $RICH_FILE_MANAGER_CONFIG = array();
    
	function __construct($config = array())
	{	        
                $this->RICH_FILE_MANAGER_CONFIG = $config;                		
	}

	public function local() 
	{          
                $app = new \RFM\Application();
                // local filesystem storage
                $local = new \RFM\Repository\Local\Storage($this->RICH_FILE_MANAGER_CONFIG["local"]);
                $app->setStorage($local);        
                // local filesystem API
                $app->api = new \RFM\Api\LocalApi();

                return $app;
	}

	public function s3()
	{
                $this->RICH_FILE_MANAGER_CONFIG["s3"] = array_merge_recursive($this->RICH_FILE_MANAGER_CONFIG["local"], $this->RICH_FILE_MANAGER_CONFIG["s3"]);
		$app = new \RFM\Application();
                // AWS S3 storage instance
                $s3 = new \RFM\Repository\S3\Storage($this->RICH_FILE_MANAGER_CONFIG["s3"]);
                $app->setStorage($s3);        
                // AWS S3 API
                $app->api = new RFM\Api\AwsS3Api();
                return $app;
        }       
        
}

/* End of file RichFilemanagerLib.php */
/* Location: ./application/libraries/RichFilemanagerLib.php */