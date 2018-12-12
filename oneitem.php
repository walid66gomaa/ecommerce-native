<?php

session_start();


include "init.php";

?>




<?php 
$item_id=isset($_GET['item_id'])&& is_numeric($_GET['item_id'])?intval($_GET['item_id']):0;
$oneItem=getItems('items.id',$item_id);








//  increase number of item view
$stmt=$con->prepare("UPDATE items SET  viewNum=? WHERE id=?") ;

$stmt->execute(array( ++$oneItem[0]['viewNum'],$item_id ));
?>




<div id="mainBody">
    <div class="container">
        <div class="row">
            <?php include $tmp."sidebar.php";?>



            <!-- main body  -->


            <div class="col-lg-9">
                <ul class="breadcrumb">
                    <li><a href="index.php">Home</a> <span class="divider">/</span></li>
                    <li><a href="categories.php?cat_id=<?=$oneItem[0]['cat_id']?>&catName=<?=$oneItem[0]['catName']?>">
                            <?=$oneItem[0]['catName']?></a> <span class="divider">/</span></li>
                    <li class="active">
                        <?=$oneItem[0]['name']?>
                    </li>
                </ul>

                <div class="row">
                    <div id="gallery" class="col-lg-5">
                        <a href="<?php 
                      if(empty($oneItem[0]['image'])){echo 'upload/item/default.png';}  
                    else {echo 'upload/item/'.$oneItem[0]['id'].'/'. $oneItem[0]['image'];} ?>"
                            title="Fujifilm FinePix S2950 Digital Camera">
                            <img src="<?php 
                      if(empty($oneItem[0]['image'])){echo 'upload/item/default.png';}  
                    else {echo 'upload/item/'.$oneItem[0]['id'].'/'. $oneItem[0]['image'];} ?>"
                                style="width:100%" alt="Fujifilm FinePix S2950 Digital Camera" />
                        </a>

                        <!-- start more image -->
                        <div class="more-image">
                            <?php
                    $oneItemImages=getDataWhere('itemimages','item_id',$item_id,'id');
                    foreach ($oneItemImages as $index=>$image) {
                    ?>
                            <a data-target="#exampleModal" data-toggle="modal" data-slide-to="<?=$index?>" class="<?php if($index==0){echo 'active';}?>">
                                <img style="width:29%" src="<?php echo 'upload/item/'.$item_id.'/'. $image['image']; ?>"
                                    alt="" />

                            </a>
                            <?php }?>
                        </div>


                    </div>
                    <div class="col-lg-7">
                        <h3>
                            <?=$oneItem[0]['name']?>
                        </h3>

                        <hr>
                        <div class="form-horizontal ">
                            <div class="">
                                <label class=""><span>
                                        <?=$oneItem[0]['price']?></span></label>
                                <div class="float-right">

                                    <form class="" action="buy.php" method="post">
                                        <input type="hidden" name="item_id" value="<?=$oneItem[0]['id']?>">
                                        <button type="submit" value="submit" class="btn btn-large btn-primary ">Add to
                                            <i class="icon-shopping-cart"></i></button>

                                    </form>
                                </div>
                            </div>
                        </div>



                        <hr />
                        <p class="lead">
                            <?=$oneItem[0]['description']?>
                        </p>

                        <p class='date'>
                            <?=$oneItem[0]['addDate']?>
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
                        <form action="<?php echo $_SERVER['PHP_SELF'].'?item_id='.$item_id?>" method="post">


                            <div class="form-group">
                                <textarea class="form-control" placeholder="leave your comment" onkeyup="auto_grow(this)"
                                    rows="1" name="body"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">comment</button>
                        </form>
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

?>
                <div class="view-hide">
                    <span class="view-hide-comments" data-id="<?=$item_id?>" href="#">view All Comments</span>
                </div>
                <div class="all-comments d-none" id="<?=$item_id?>">

                    <?php

foreach ($comments as $comment) {
 

 ?>
                    <!-- Single Comment -->
                    <div class="media mb-4 comment-box">
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


                <!-- //  end comment section -->




            </div>

            <!-- end main body -->



        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade and carousel slide" id="exampleModal" data-ride="carousel" tabindex="-1" role="dialog"
    aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                    <li data-target="#exampleModal" data-slide-to="<?=$index?>" class="<?php if($index==0){echo 'active';}?>"></li>
                    <?php }?>
                </ol>

                <div class="carousel-inner">
                    <?php
  foreach ($oneItemImages as $index=>$image) {
                    ?>
                    <div class="carousel-item <?php if($index==0){echo 'active';}?>">
                        <img class="d-block w-100" src="<?php echo 'upload/item/'.$item_id.'/'. $image['image']; ?>"
                            alt="Third slide">
                    </div>
                    <?php }?>
                </div>
                <a class="carousel-control-prev" href="#exampleModal" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#exampleModal" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>

            </div>

        </div>
    </div>
</div>

<!-- end more image -->
<?php

include $tmp."footer.php" ; 

?>

<!------ Include the above in your HEAD tag ---------->