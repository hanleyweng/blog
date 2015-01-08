<?php
$original_url = $_GET['url'];
echo $original_url;
$url = urldecode($original_url);
echo $url;
$contents = file_get_contents($url);
echo $contents;
?>