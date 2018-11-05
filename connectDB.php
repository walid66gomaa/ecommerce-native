<?php
$dst="mysql:host=localhost;dbname=shop";
$user='root';
$pass='';
$option=array(
    PDO::MYSQL_ATTR_INIT_COMMAND=>'SET NAMES utf8'

);
try{
    $con=new PDO ($dst,$user,$pass,$option);
    $con->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    
  
}
catch(PDOEXCEPTION $e)
{
echo 'failed to connect to database'.$e->getmessage();
}







