<?php
session_start();
$pageTitle=$_GET['catName'];

include "init.php";


$items=getItems('items.cat_id',$_GET['cat_id'],1);
 
?>
<div id="mainBody">
    <div class="container">
        <div class="row">
            <?php include $tmp."sidebar.php";?>



            <!-- main body  -->
            <div class="col-lg-9">
                <ul class="breadcrumb">
                    <li><a href="index.php">Home</a> <span class="divider">/</span></li>
                    <li class="active">
                        <?=$_GET['catName']?>
                    </li>
                </ul>
                <h3>
                    <?= $_GET['catName']?><small class="pull-right">
                        <?=sizeof($items)?> products are available </small></h3>
                <hr class="" />




                <div class="">
                    <div class="">
                        <?php
        foreach ($items as $item) {
  ?>
                        <div class="row">
                            <div class="col-lg-4 ">
                                <img class="w-100 max-height" src="<?php 
                      if(empty($item['image'])){echo 'upload/item/default.png';}  
                    else {echo 'upload/item/'.$item['id'].'/'. $item['image'];} ?>"
                                    alt="image">
                            </div>
                            <div class="col-lg-5">
                                <h5>
                                    <?=$item['name']?>
                                </h5>
                                <hr class="" />

                                <p>
                                    <?php if(strlen($item['description'])>120){echo substr($item['description'],0,120).'...';} else { echo $item['description']; }?>
                                </p>

                                <p class='date text-right'>
                                    <?=$item['addDate']?>
                                </p>
                                <p>
                                    <i class="fa fa-eye"></i>
                                    <?=$item['viewNum']++?>

                                    <a class="btn btn-small pull-right" href="oneitem.php?item_id=<?=$item['id']?>">View
                                        Details</a>
                                </p>
                                <br class="clr" />
                            </div>
                            <div class="col-lg-3">
                                <div class="float-right">
                                    <h3>
                                        <?=$item['price']?>
                                    </h3>

                                    </label><br />

                                    <?php
               if($sessionUser !='')
               {
            ?>

                                    <form class="" action="buy.php" method="post">
                                        <input type="hidden" name="item_id" value="<?=$item['id']?>">
                                        <button class="btn btn-large btn-primary" type="submit" value="submit" class="btn btn-default">Add
                                            to <i class="icon-shopping-cart"></i></button>

                                    </form>
                                    <?php }?>


                                    <!-- <a href="product_details.html" class="btn btn-large btn-primary"> Add to <i class=" icon-shopping-cart"></i></a> -->
                                    <a href="oneitem.php?item_id=<?=$item['id']?>" class="btn btn-large"><i class="icon-zoom-in"></i></a>

                                </div>
                            </div>
                        </div>

                        <hr class="soft" />
                        <?php } 
               ?>
                    </div>


                </div>


            </div>
            <!-- end main body -->



        </div>
    </div>
</div>



<?php

include $tmp."footer.php";

?>