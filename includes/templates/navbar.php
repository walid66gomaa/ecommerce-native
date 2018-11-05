<?php 

if(!isset($_SESSION['user']))
{?>
<div class='container-fluid upper-bar'>
<a href="login.php" class='pull-right'> logn|signUp</a>

</div>

<?php }
else {
  echo "welcome ". $_SESSION['user'];
  echo "<a href='profile.php'> View Profile </a>";
}
?>   
<!-- // ////////////////////////// -->

<nav class="navbar navbar-expand-lg  navbar-dark bg-dark">
  <a class="navbar-brand" href="#"><?php echo lan('home_admin') ?></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto navbar-right">
      
      <?php
         $categories=getData('categories','id');
         foreach ($categories as $cat) {
           echo '<li  class="nav-item"><a class="nav-link" href="categorys.php?cat_id='.$cat['id'].'&catName='.$cat['name'].'">'.$cat['name']. '</a></li>';
         }
         if($sessionUser!=''){
         echo '<li  class="nav-item"><a class="nav-link" href="profile.php">'.$sessionUser. '</a></li>';
         }
      ?>
      
      
    </ul>
    <ul class="navbar-nav mr-auto navbar-right">
       <li class="nav-item dropdown navbar-right">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        <a class="dropdown-item " href="member.php?do=edit&user_id=<?=$_SESSION['user'] ?>">Edit Profile</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
          <a class="dropdown-item" href="logout.php">LogOut</a>
        </div>
      </li>

      </ul>

    
  
  </div>
</nav>



