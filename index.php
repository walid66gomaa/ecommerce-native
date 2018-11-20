<?php
session_start();
$pageTitle='Home';

include "init.php";
$items=getData('items','id');
    echo '<div class="container">';
    echo'<div class="row grid">';
foreach ($items as $item) {
  ?>

 

  
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 col-xl-4 card grid-item cat-item ">
      <div class="thumbnail">
        <img src="https://weddu.files.wordpress.com/2010/07/dancing-disco-lights-copy1.jpeg" class="">
        <div class="caption">
          <h3 id="thumbnail-label"><?=$item['name']?></h3>
          <p><?php if(strlen($item['description'])>20){echo substr($item['description'],0,60).'...';} else { echo $item['description']; }?></p>
          <p>Price:<?=$item['price']?></p>
          <p class='date text-right'><?=$item['addDate']?></p>
        </div>
        <div class="caption card-footer">
          <ul class="list-inline">
            <li><i class="fa fa-eye"></i></li>
            <li><?=$item['viewNum']++?></li>
           <li class="pull-right "><a class="btn btn-primary btn-group-sm" href="oneitem.php?item_id=<?=$item['id']?>" >Details</a></li>
          </ul>

         
        </div>
      </div><!-- thumbnail -->
    </div><!-- card -->
    



  <?php
}
?>
   </div><!-- row -->
</div> <!-- container grid -->  








<?php

include $tmp."footer.php";

?>

