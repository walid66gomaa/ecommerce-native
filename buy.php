<?php
    session_start();
    if(! isset($_SESSION['user']))
    {
   header('location:login.php');
   exit();

    }
    $pageTitle='Buy';
    include"init.php" ;
  if ($_SERVER['REQUEST_METHOD']=='POST') {
      
      $item_id=isset($_POST['item_id'])&& is_numeric($_POST['item_id'])?intval($_POST['item_id']):0;
      
    //   check if exist or not
    $stm=$con->prepare("SELECT id ,num from purchases WHERE user_id=? AND item_id=? LIMIT 1");
    
$stm->execute(array($sessionUserId,$item_id));
$purchase=$stm->fetchAll();
$count=$stm->rowCount();
// end check exist 

      if ($count==0) {
        $stmt=$con->prepare("INSERT INTO purchases( item_id,user_id) VALUES (:Zitem,:Zuser)");
        $stmt->execute(array(
           'Zitem'=>$item_id,
           'Zuser'=>$sessionUserId 	
  
  
        )); 
      } else {
        $stmt=$con->prepare("UPDATE purchases
        SET  num=? 
        WHERE id=?") ;

$stmt->execute(array( ++$purchase[0]['num'],$purchase[0]['id']));
      }
      

       
      
      $msg='<div class="alert alert-success"> you buy it successfuly  it added to your purchases purchase menu </div>';

      redirect($msg,'purchase.php',2);
 
 
 
 
 
 
 
    }
  else {
      $msg="not allow to access this page directray ";
      redirect($msg);
  }







        include $tmp."footer.php" ;