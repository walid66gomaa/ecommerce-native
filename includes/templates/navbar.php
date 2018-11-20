<?php 

if(!isset($_SESSION['user']))
{?>
<div class='container-fluid upper-bar'>
<a href="login.php" class='pull-right'> logn|signUp</a>

</div>

<?php }

?>   
<!-- // ////////////////////////// -->

<nav class="navbar navbar-expand-lg  navbar-dark bg-dark">
  <a class="navbar-brand" href="index.php"><?php echo lan('home_admin') ?></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto navbar-right">
      
      <?php
         $categories=getDataWhere('categories','parent',NULL,'name');
         foreach ($categories as $cat) {
           echo '<li  class="nav-item"><a class="nav-link" href="categorys.php?cat_id='.$cat['id'].'&catName='.$cat['name'].'">'.$cat['name']. '</a></li>';
         }
         
         if($sessionUser!=''){
           $user=getuser($sessionUserId);
         $isadmin=$user['group_id'];
         if ($isadmin==1) {
      
         echo '<li  class="nav-item"><a class="nav-link" href="admin">Admin </a></li>';
         }
        }
      ?>
      
      
    </ul>

    <?php 
     if($sessionUser!=''){?>
        <ul class="navbar-nav mr-auto navbar-right">
       <li class="nav-item dropdown navbar-right">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <?=$_SESSION['user']?>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        <a class="dropdown-item " href="profile.php"> view profile</a>
        <a class="dropdown-item " href="purchase.php"> purchases menu</a>
          
          <div class="dropdown-divider"></div>
         
          <a class="dropdown-item" href="logout.php">LogOut</a>
        </div>
      </li>

      </ul>
        <?php }?>
   
    

    
  
  </div>
</nav>



