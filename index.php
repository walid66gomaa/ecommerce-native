<?php
session_start();
$pageTitle='Home';

include "init.php";

?>


<div>
    <div class="container">
        <div class="row">
            <?php include $tmp."sidebar.php";?>


            <!-- Sidebar end=============================================== -->
            <div class="col-md-9">


                <?php 
        $items=getData('items','id','DESC',50);
        $first4item=array_slice($items,0,4);
        $lastitem=array_slice($items,4,sizeof($items));
        
       ?>
                <div class="feature d-none d-md-block">
                    <h4>Featured Products <small class="pull-right">
                            <?=sizeof($items)-4?>+ featured products</small></h4>
                    <div class="row " style="height: 300px; ">
                        <div id="carouselExampleControls" class="carousel slide " data-ride="carousel">
                            <div class="carousel-inner  ">
                                <div class="row">
                                    <div class="carousel-item active col-md-12 ">
                                        <div class="row margin-first">
                                            <?php 
       foreach($first4item as $index=>$item)
       {
       ?>

                                            <div class="card mycarousel-item width-22 ">
                                                <img class="card-img-top mycarousel-image" src="<?php 
                      if(empty($item['image'])){echo 'upload/item/default.png';}  
                    else {echo 'upload/item/'.$item['id'].'/'. $item['image'];} ?>"
                                                    alt="Card image cap">
                                                <div class="card-body carousel-item-option">
                                                    <p class="card-text item-name text-center">
                                                        <?php echo (strlen($item['name'])>10) ?  substr($item['name'],0,10).'...' : $item['name'] ;?>
                                                    </p>
                                                    <a class="btn btn-danger btn-sm" href="oneitem.php?item_id=<?=$item['id']?>">View</a>

                                                    <span class=" d-inline" href="#">
                                                        <?=$item['price']?></span>
                                                </div>
                                            </div>

                                            <?php }?>

                                        </div>


                                    </div>
                                    <?php 
        $index=4;
        while($index <=sizeof($lastitem) ){
            $next4item=array();
            
         $next4item= array_slice($lastitem,$index,4);
      
        
         $index+=4;    
       
       ?>
                                    <div class="carousel-item col-md-12">
                                        <div class="row margin-first">
                                            <?php  foreach($next4item as $item)
       {
         
         ?>

                                            <div class="card mycarousel-item width-22 ">
                                                <img class="card-img-top mycarousel-image" src="<?php 
                      if(empty($item['image'])){echo 'upload/item/default.png';}  
                    else {echo 'upload/item/'.$item['id'].'/'. $item['image'];} ?>"
                                                    alt="Card image cap">
                                                <div class="card-body carousel-item-option">
                                                    <p class="card-text  text-center item-name">
                                                        <?php echo (strlen($item['name'])>10) ?  substr($item['name'],0,10).'...' : $item['name'] ;?>
                                                    </p>
                                                    <a class="btn btn-danger btn-sm" href="oneitem.php?item_id=<?=$item['id']?>">view</a>

                                                    <span class=" d-inline" href="#">
                                                        <?=$item['price']?></span>
                                                </div>
                                            </div>
                                            <?php }?>
                                        </div>

                                    </div>
                                    <?php }?>

                                </div>

                                <a class="carousel-control-prev" href="#carouselExampleControls" role="button"
                                    data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleControls" role="button"
                                    data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>


                </div>


                <!-- courser -->




                <!--    end feature product-->

                <!--    start latest product-->
                <h4>Latest Products </h4>
                <?php 
        $items=getData('items','id','DESC');
        
       ?>
                <div class="row ">
                    <?php  foreach($items as $item)
       {
         ?>
                    <div class=" col-lg-4 ">
                        <div class="mycard card">
                            <img class="card-img-top " src="<?php 
                      if(empty($item['image'])){echo 'upload/item/default.png';}  
                    else {echo 'upload/item/'.$item['id'].'/'. $item['image'];} ?>"
                                alt="Card image cap">
                            <div class="card-body">
                                <p class="text-center item-name">
                                    <?php echo (strlen($item['name'])>10) ?  substr($item['name'],0,10).'...' : $item['name'] ;?>
                                </p>
                                <p class="lead">
                                    <?php
           
           echo (strlen($item['description'])>20) ?  substr($item['description'],0,20).'...' : $item['description'] ;
            
            
            ?>
                                </p>
                                <div class="option">
                                    <a class="btn btn-danger" href="oneitem.php?item_id=<?=$item['id']?>"><i class="icon-zoom-in"></i></a>
                                    <form class="d-inline" action="buy.php" method="post">
                                        <input type="hidden" name="item_id" value="<?=$item['id']?>">
                                        <button type="submit" value="submit" class="btn btn-default">Add to <i class="icon-shopping-cart"></i></button>

                                    </form>
                                    <a class="btn btn-primary" href="#">
                                        <?=$item['price']?></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php }?>

                </div>


                <!--    end latest item -->

            </div>


        </div>
    </div>
</div>
<?php
include $tmp."footer.php";

?>