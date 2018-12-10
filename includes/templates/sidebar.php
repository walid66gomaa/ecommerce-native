<!-- Sidebar ================================================== -->
<?php
 $categories=getDataWhere('categories','parent',NULL,'name');

?>
<div class="col-md-3 slide-bar">
    <?php
if(isset($_SESSION['user']))

{?>
    <div class="col-lg-12 cart"><a href="purchases.php"><img src="themes/images/ico-cart.png" alt="cart">
            <?=$cartsSum?> Items in your cart </a></div>
    <?php }?>

    <div class=categories>
        <?php
        
        foreach( $categories as $cat)
        {?>



        <!--   categories        colabse-->



        <div class="card ">
            <div id="accordion" class="col-lg-12">
                <a class="" data-toggle="collapse" data-target="#cat<?=$cat['id']?>" aria-expanded="true" aria-controls="collapseOne">
                    <div class="card-header " id="headingOne"> <i class="fa fa-angle-down"></i>
                        <?=$cat['name']?>
                    </div>
                </a>

                <div id="cat<?=$cat['id']?>" class="collapse " aria-labelledby="headingOne" data-parent="#accordion">
                    <div class="card-body">



                        <ul class="list-unstyled">
                            <li class="">
                                <a href="categories.php?cat_id=<?=$cat['id']?>&catName=<?=$cat['name']?>">
                                    <?=$cat['name']?>
                                </a></li>

                            <?php $children=getDataWhere('categories','parent',$cat['id'],'name');
                if(!empty($children)){
                 foreach ($children as $child) {?>
                            <li class=""><a href="categories.php?cat_id=<?=$child['id']?>&catName=<?=$child['name']?>">
                                    <?=$child['name']?></a></li>
                            <?php } }?>
                        </ul>

                    </div>
                </div>
            </div>


        </div>

        <!--end collabse            -->





        <?php }?>
    </div>

    <br />
    <?php 
		$item=getData('items','RAND()','ASC',2);
		?>
    <!-- start item one -->

    <div class="card col-lg-12 mycard">
        <img class="card-img-top img-thumbnail" src="<?php 
                      if(empty($item[0]['image'])){echo 'upload/item/default.png';}  
                    else {echo 'upload/item/'.$item[0]['id'].'/'. $item[0]['image'];} ?>"
            alt="Card image cap">
        <div class="card-body">
            <p class="card-text item-name text-center">
                <?php echo (strlen($item[0]['name'])>10) ?  substr($item[0]['name'],0,10).'...' : $item[0]['name'] ;?>
            </p>
            <div class="option">
                <a class="btn btn-danger" href="oneitem.php?item_id=<?=$item[0]['id']?>"><i class="icon-zoom-in"></i></a>
                <form class="d-inline" action="buy.php" method="post">
                    <input type="hidden" name="item_id" value="<?=$item[0]['id']?>">
                    <button type="submit" value="submit" class="btn btn-default">Add to <i class="icon-shopping-cart"></i></button>

                </form>
                <a class="btn btn-primary d-inline" href="#">
                    <?=$item[0]['price']?></a>
            </div>
        </div>
    </div>

    <br>

    <!-- start item 2 -->

    <div class="card col-lg-12 mycard">
        <img class="card-img-top img-thumbnail" src="<?php 
                      if(empty($item[1]['image'])){echo 'upload/item/default.png';}  
                    else {echo 'upload/item/'.$item[1]['id'].'/'. $item[1]['image'];} ?>"
            alt="Card image cap">
        <div class="card-body">
            <p class="card-text item-name text-center">
                <?php echo (strlen($item[1]['name'])>10) ?  substr($item[1]['name'],0,10).'...' : $item[1]['name'] ;?>
            </p>
            <div class="option">
                <a class="btn btn-danger" href="oneitem.php?item_id=<?=$item[1]['id']?>"> <i class="icon-zoom-in"></i></a>
                <form action="buy.php" method="post" class="d-inline">
                    <input type="hidden" name="item_id" value="<?=$item[1]['id']?>">
                    <button type="submit" value="submit" class="btn btn-default">Add to <i class="icon-shopping-cart"></i></button>

                </form>
                <a class="btn btn-primary" href="#">
                    <?=$item[1]['price']?></a>
            </div>
        </div>
    </div>
    <!-- // end item 2 -->
    <br>
    <div class="card col-lg-12">
        <img class="card-img-top img-thumbnail" src="themes/images/payment_methods.png" title="Bootshop Payment Methods"
            alt="Payments Methods">
        <div class="card-body">
            <p class="card-text">
                Payment Methods
            </p>

        </div>
    </div>
</div>
<div>


</div>

<!-- Sidebar end=============================================== -->