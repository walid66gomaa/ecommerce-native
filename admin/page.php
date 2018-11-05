<?php
include "init.php";
$do='';
if(isset($_GET['do']))
{
    $do=$_GET['do'];
}
else{
    $do='manage';
    echo 'you are in manage page';
    echo "<a href='page.php?do=add'>adddd<a>";
    exit;
}

if($do=='add')
{
   
    echo 'you are in add page';
}
elseif($do=='manage')
{

 echo 'you are in manage page gggggg';
}
else{
    echo 'you are in default page';
}
