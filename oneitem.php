
<?php

session_start();


include "init.php";


?>




<?php 
$item_id= $item_id=isset($_GET['item_id'])&& is_numeric($_GET['item_id'])?intval($_GET['item_id']):0;
$items=getDataWhere('items','id',$item_id,'id');
    echo '<div class="container">';
    echo'<div class="row grid">';
foreach ($items as $item) {
  ?>

 

  
    <div class="col-xs-12  card grid-item">
      <div class="thumbnail">
        <img src="https://weddu.files.wordpress.com/2010/07/dancing-disco-lights-copy1.jpeg" class="">
        <div class="caption">
          <h3 id="thumbnail-label"><?=$item['name']?></h3>
          <p><?php  echo $item['description']; ?></p>
          <p>Price:<?=$item['price']?></p>
          <p class='date'><?=$item['addDate']?></p>
        </div>
        <div class="caption card-footer">
          <ul class="list-inline">
            <li><i class="fa fa-user"></i></li>
            <li>14</li>
          </ul>
        </div>
      </div><!-- thumbnail -->
    </div><!-- card -->
    
  <hr>
  <?php
    



}

if( isset($_SESSION['user']))
{

    ?>
    <!-- Comments Form -->
    <div class="col-lg-12">
            <div class="card my-4">
            <h5 class="card-header">Leave a Comment:</h5>
            <div class="card-body">
              <form action="<?php echo $_SERVER['PHP_SELF'].'?item_id='.$item_id?>" method="post">
             
                <div class="form-group">
                  <textarea class="form-control" rows="3" name="body"></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
              </form>
            </div>
          </div>
    </div>
<?php

}
else {
    echo "You must log in to comment";
}
if ($_SERVER['REQUEST_METHOD']=='POST') {


     $body=filter_var($_POST['body'],FILTER_SANITIZE_STRING);
     $user_id=$sessionUserId;

     $formEditErorr=array();
 
     if(empty($body))
     {
         $formEditErorr[]='Comment Can\'t be empty';
     }

     if(sizeof($formEditErorr)>0){
      foreach($formEditErorr as $error)
      {
          echo '<div class="alert alert-danger">'. $error."</div>";
      }

     


  }
  else{
      $stm=$con->prepare("INSERT INTO comments(body,item_id,user_id,status,date)
                  VALUES(?,$item_id,$sessionUserId,0,now())") ;
       $stm->execute(array($body));
  }

}

$comments=getcomments($item_id);
echo '<div class="col-lg-12">';


foreach ($comments as $comment) {
 

 ?>          
          <!-- Single Comment -->
          <div class="media mb-4">
            <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
            <div class="media-body">
              <h5 class="mt-0"><?=$comment['userName']?></h5>
             <p><?=$comment['body']?> </p>
            </div>
          </div>
         
      

<?php }?>
        
          </div>
         
   </div><!-- row -->
</div> <!-- container grid -->  






<?php
$date1=date_create("2013-03-15");
$date2=date_create("2013-12-12");
$datetime = new DateTime();
$diff=date_diff($datetime,$date2);
echo $diff->format("%R%a days");
include $tmp."footer.php" ; 

?>

<!------ Include the above in your HEAD tag ---------->