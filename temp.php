<?php
    session_start();
    if(! isset($_SESSION['user']))
    {
    header('location:index.php');
    exit();

    }
    $pageTitle='Members';
    include"init.php" ;



    $do='';
    if(isset($_GET['do']))
    {
    $do=$_GET['do'];
    }
    else{
    $do='manage';
    }


    if($do=='manage')
    {


    }

      

   
elseif($do=='saveuser')
{
	
}
elseif($do=='edit'){
        
        
   
   
 }
 elseif($do=='saveedit'){

   


 }
 elseif($do=='delete')
 {
   
 }

 elseif($do=='activate')
 {
    
 }







        include $tmp."footer.php" ;