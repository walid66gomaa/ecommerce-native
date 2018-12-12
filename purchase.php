<?php

session_start();
if( ! isset($_SESSION['user']))
{
    header('location:index.php');
}
$pageTitle=$_SESSION['user'];
include "init.php";


?>


<!-- // save comment -->

<?php

if ($_SERVER['REQUEST_METHOD']=='POST') {


  $body=filter_var($_POST['body'],FILTER_SANITIZE_STRING);
  $user_id=$sessionUserId;

  $user=getuser($sessionUserId);
 



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


<!-- // image profile -->


<!------ Include the above in your HEAD tag ---------->

<div class="container">
    <div class="time-line-top">
        <div class="time-line-top2 position-relative">
            <div class="row">

                <div class="col-lg-3 col-sm-12">
                    <figure>
                        <img class="img-thumbnail profile-img" src="<?php 
                      if(empty($user['avatar'])){echo 'upload/user/avatar/default1.png';}  
                    else {echo 'upload/user/avatar/'.$user['user_id'].'/'. $user['avatar'];} ?>"
                            alt="">
                    </figure>
                    <div class="h4  full-name text-center">
                        <?=$user['fullName']?>
                    </div>
                </div>




                <div class="edit"><a class="btn btn-danger " href="editProfile.php">Edit Profile</a></div>


            </div>
        </div>
    </div>
</div>


<!-- // end image -->



<!-- start information sections  -->

<div class="container">

    <div class='information block'>
        <div class="panel-group">
            <div class="panel panel-success">

                <div class="panel-body">

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



<div id="">
    <div class="container">
        <div class="row">




            <!-- main body  -->


            <div class="col-lg-12">
                <ul class="breadcrumb">
                    <li><a href="index.php">Home</a> <span class="divider">/</span></li>
                    <li class="active">
                        <?=$sessionUser?>
                    </li>
                </ul>
                <?php 
foreach ($items as $item) {
     ?>
                <div class="row">
                    <div id="gallery" class="col-lg-5">
                        <a href="<?php 
                      if(empty($item['image'])){echo 'upload/item/default.png';}  
                    else {echo 'upload/item/'.$item['id'].'/'. $item['image'];} ?>"
                            title="Fujifilm FinePix S2950 Digital Camera">

                            <img src="<?php 
                      if(empty($item['image'])){echo 'upload/item/default.png';}  
                    else {echo 'upload/item/'.$item['id'].'/'. $item['image'];} ?>"
                                style="width:100%" alt="" />
                        </a>
                        <div class="">
                            <?php
                    $oneItemImages=getDataWhere('itemimages','item_id',$item['id'],'id');
                    foreach ($oneItemImages as $index=>$image) {
                    ?>
                            <a data-target="#exampleModal<?=$item['id']?>" data-toggle="modal" data-slide-to="<?=$index?>"
                                class="<?php if($index==0){echo 'active';}?>">
                                <img style="width:29%" src="<?php echo 'upload/item/'.$item['id'].'/'. $image['image']; ?>"
                                    alt="" />

                            </a>
                            <?php }?>
                        </div>


                    </div>
                    <div class="col-lg-7 position-relative">
                        <h2 class="d-inline">
                            <?=$item['name']?>
                        </h2>
                        <div class="dropdown item-option">
                            <a class=" float-right" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                <ul class="float-right ">
                                    <div class="point">...</div>
                                </ul>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

                                <a class="dropdown-item" href="itemOption.php?do=edit&item_id=<?=$item['id']?>">edit</a>
                                <a class="dropdown-item confirm" href="itemOption.php?do=delete&item_id=<?=$item['id']?>">delete</a>


                            </div>
                        </div>
                        <hr class="" />
                        <div class="form-horizontal ">
                            <div class="control-group">
                                <label class="control-label"><span>
                                        <?=$item['price']?></span></label>
                                <div class="pull-right">

                                    <form class="" action="buy.php" method="post">
                                        <input type="hidden" name="item_id" value="<?=$item['id']?>">
                                        <button type="submit" value="submit" class="btn btn-large btn-primary ">Add to
                                            <i class="icon-shopping-cart"></i></button>

                                    </form>
                                </div>
                            </div>
                        </div>



                        <hr class="soft clr" />
                        <p class="lead">
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


                    <div class="comment">
                        <form action="<?php echo $_SERVER['PHP_SELF']?>" method="post">
                            <input type="hidden" name="item_id" value="<?=$item['id']?>">
                            <div class="form-group">
                                <textarea class="form-control" rows="1" onkeyup="auto_grow(this)" name="body"
                                    placeholder="Leave Your Comment" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Comment</button>
                        </form>
                    </div>

                </div>
                <?php

}
else {
    echo "You must log in to comment";
}


$comments=getcomments($item['id']);

?>
                <div class="view-hide">
                    <span class="view-hide-comments" data-id="<?=$item['id']?>" href="#">view All Comments</span>
                </div>
                <div class="all-comments d-none" id="<?=$item['id']?>">

                    <?php
foreach ($comments as $comment) {
 

 ?>
                    <!-- Single Comment -->
                    <div class="media comment-box">
                        <img class="d-flex mr-3 rounded-circle" style="width:50px;height:50px" src="<?php 
                      if(empty($comment['avatar'])){echo 'upload/user/avatar/default1.png';}  
                    else {echo 'upload/user/avatar/'.$comment['user_id'].'/'. $comment['avatar'];} ?>"
                            alt="">
                        <div class="media-body lead">
                            <h5 class="mt-0">
                                <?=$comment['userName']?>
                            </h5>
                            <p>
                                <?=$comment['body']?>
                            </p>
                        </div>
                    </div>



                    <?php }?>

                </div>

                <!-- Modal -->
                <div class="modal fade and carousel slide" id="exampleModal<?=$item['id']?>" data-ride="carousel"
                    tabindex="-1" role="dialog" aria-labelledby="exampleModal<?=$item['id']?>Label" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">

                            <div class="modal-body">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <ol class="carousel-indicators">
                                    <?php
  foreach ($oneItemImages as $index=>$image) {
                    ?>
                                    <li data-target="#exampleModal<?=$item['id']?>" data-slide-to="<?=$index?>" class="<?php if($index==0){echo 'active';}?>"></li>
                                    <?php }?>
                                </ol>

                                <div class="carousel-inner">
                                    <?php
  foreach ($oneItemImages as $index=>$image) {
                    ?>
                                    <div class="carousel-item <?php if($index==0){echo 'active';}?>">
                                        <img class="d-block w-100" src="<?php echo 'upload/item/'.$item['id'].'/'. $image['image']; ?>"
                                            alt="Third slide">
                                    </div>
                                    <?php }?>
                                </div>
                                <a class="carousel-control-prev" href="#exampleModal<?=$item['id']?>" role="button"
                                    data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#exampleModal<?=$item['id']?>" role="button"
                                    data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>

                            </div>

                        </div>
                    </div>
                </div>

                <!-- end more image -->



                <?php
}?>



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