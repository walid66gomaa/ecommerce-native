<?php
ob_start();
ini_set('display_errors','on');
error_reporting(E_ALL);

$sessionUser='';
if(isset($_SESSION['user']))
{
$sessionUser=$_SESSION['user'];
$sessionUserId=$_SESSION['user_id'];

}


include 'connectDB.php';
$func   ='includes/functions/';
$lang  ="includes/languages/";
$tmp   ='includes/templates/';
$css   ="layout/css/";
$js    ="layout/js/";

include $func."function.php";
include $lang."english.php";
include $tmp."header.php";
include $tmp."navbar.php";




?>