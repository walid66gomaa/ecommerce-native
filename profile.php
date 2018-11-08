
<?php

session_start();
if( ! isset($_SESSION['user']))
{
    header('location:index.php');
}

include "init.php";


?>
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
                            <td scope="row"><?=$user['fullName']?></td>   
                        </tr>

                        <tr>
                           <th>User Name</th>
                            <td><?=$user['userName']?></td>
                         </tr>

                        <tr>
                           <th>Email</th>
                            <td><?=$user['email']?></td>    
                        </tr>

                        </tbody>
                        </table>  
                                    
            
                </div>
            </div>

        </div>
    </div>
</div>




<?php 

$items=getDataWhere('items','user_id',$sessionUserId,'id');
    echo '<div class="container">';
    echo'<div class="row grid">';
foreach ($items as $item) {
  ?>

 

  
    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 col-xl-4 card grid-item">
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