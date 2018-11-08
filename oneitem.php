
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
          <p><?php if(strlen($item['description'])>20){echo substr($item['description'],0,60).'...';} else { echo $item['description']; }?></p>
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
    



  <?php
}
?>
   </div><!-- row -->
</div> <!-- container grid -->  






<?php
include $tmp."footer.php" ; 

?>

<!------ Include the above in your HEAD tag ---------->