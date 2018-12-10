<?php

session_start();
if( ! isset($_SESSION['user']))
{
    header('location:index.php');
}
$pageTitle=$_SESSION['user'].'Purchases';
include "init.php";


?>


<!-- // save comment -->

<?php

if ($_SERVER['REQUEST_METHOD']=='POST') {


  $body=filter_var($_POST['body'],FILTER_SANITIZE_STRING);
  $user_id=$sessionUserId;
  $item_id=$_POST['item_id'];

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
               VALUES(?,?,$sessionUserId,0,now())") ;
    $stm->execute(array($body,$item_id));
}

}



?>
<!-- // end save comment -->


<head>
    <link rel="stylesheet" href="layout/css/profile.css">
</head>
<!-- start information sections  -->
<a class="btn btn-info" href="newitem.php">add new item</a>
<div class="container">
    <div class='information block'>
        <div class="panel-group">
            <div class="panel panel-success">
                <div class="panel-heading">user information</div>
                <div class="panel-body">
                    <?php
                           $user=getuser($sessionUserId);
                          
                        ?>
                    <table class="table">

                        <tbody>

                            <tr>
                                <th scope="row">Full Name</th>
                                <td scope="row">
                                    <?=$user['fullName']?>
                                </td>
                            </tr>

                            <tr>
                                <th>User Name</th>
                                <td>
                                    <?=$user['userName']?>
                                </td>
                            </tr>

                            <tr>
                                <th>Email</th>
                                <td>
                                    <?=$user['email']?>
                                </td>
                            </tr>

                        </tbody>
                    </table>


                </div>
            </div>

        </div>
    </div>
</div>




<?php 

$items=getUserPurchases($sessionUserId);
  ?>



<div id="mainBody">
    <div class="container">
        <div class="row">




            <!-- main body  -->


            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="index.html">Home</a> <span class="divider">/</span></li>
                    <li class="active">
                        <?=$sessionUser?>
                    </li>
                </ul>
                <?php 
foreach ($items as $item) {
     ?>
                <div class="row">
                    <div id="gallery" class="span3">
                        <a href="themes/images/products/large/f1.jpg" title="Fujifilm FinePix S2950 Digital Camera">
                            <img src="<?php 
                      if(empty($item['image'])){echo 'upload/item/default.png';}  
                    else {echo 'upload/item/'.$item['id'].'/'. $item['image'];} ?>"
                                style="width:100%" alt="Fujifilm FinePix S2950 Digital Camera" />
                        </a>
                        <div id="differentview" class="moreOptopm carousel slide">
                            <div class="carousel-inner">
                                <div class="item active">
                                    <a href="themes/images/products/large/f1.jpg"> <img style="width:29%" src="themes/images/products/large/f1.jpg"
                                            alt="" /></a>
                                    <a href="themes/images/products/large/f2.jpg"> <img style="width:29%" src="themes/images/products/large/f2.jpg"
                                            alt="" /></a>
                                    <a href="themes/images/products/large/f3.jpg"> <img style="width:29%" src="themes/images/products/large/f3.jpg"
                                            alt="" /></a>
                                </div>
                                <div class="item">
                                    <a href="themes/images/products/large/f3.jpg"> <img style="width:29%" src="themes/images/products/large/f3.jpg"
                                            alt="" /></a>
                                    <a href="themes/images/products/large/f1.jpg"> <img style="width:29%" src="themes/images/products/large/f1.jpg"
                                            alt="" /></a>
                                    <a href="themes/images/products/large/f2.jpg"> <img style="width:29%" src="themes/images/products/large/f2.jpg"
                                            alt="" /></a>
                                </div>
                            </div>
                            <!--  
			  <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
              <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a> 
			  -->
                        </div>


                    </div>
                    <div class="span6">
                        <h3>
                            <?=$item['name']?>
                        </h3>

                        <hr class="soft" />
                        <div class="form-horizontal qtyFrm">
                            <div class="control-group">
                                <label class="control-label"><span>
                                        <?=$item['price']?></span></label>
                                <div class="controls">

                                    <form class="" action="buy.php" method="post">
                                        <input type="hidden" name="item_id" value="<?=$item['id']?>">
                                        <button type="submit" value="submit" class="btn btn-large btn-primary pull-right">Add
                                            to <i class="icon-shopping-cart"></i></button>

                                    </form>
                                </div>
                            </div>
                        </div>



                        <hr class="soft clr" />
                        <p>
                            <?=$item['description']?>
                        </p>

                        <p class='date'>
                            <?=$item['addDate']?>
                        </p>



                        <hr class="soft" />
                    </div>



                </div>
                <!-- // comment section -->
                <?php
if( isset($_SESSION['user']))
{

    ?>
                <!-- Comments Form -->
                <div class="col-lg-12">
                    <div class="card my-4">
                        <h5 class="card-header">Leave a Comment:</h5>
                        <div class="card-body">
                            <form action="<?php echo $_SERVER['PHP_SELF']?>" method="post">
                                <input type="hidden" name="item_id" value="<?=$item['id']?>">
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


$comments=getcomments($item['id']);



foreach ($comments as $comment) {
 

 ?>
                <!-- Single Comment -->
                <div class="media mb-4">
                    <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
                    <div class="media-body">
                        <h5 class="mt-0">
                            <?=$comment['userName']?>
                        </h5>
                        <p>
                            <?=$comment['body']?>
                        </p>
                    </div>
                </div>



                <?php }}?>



                <!-- //  end comment section -->




            </div>

            <!-- end main body -->



        </div>
    </div>
</div>







<?php
include $tmp."footer.php" ; 

?>

<!------ Include the above in your HEAD tag ---------->