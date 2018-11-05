<nav class="navbar navbar-default navbar-inverse">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="dashbord.php"><?php echo lan('home_admin') ?></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="categories.php">  <?php echo lan('cat') ?> <span> </span></a></li>
        <li><a href="items.php"> <?php echo lan('items') ?></a></li>
        <li><a href="comments.php"> <?php echo lan('COM') ?></a></li>
        <li><a href="member.php"> <?php echo lan('members') ?></a></li>
        <li><a href="#"> <?php echo lan('stat') ?></a></li>
        <li><a href="#"> <?php echo lan('logs') ?></a></li>
        <li><a href="member.php?do=edit&user_id=<?=$_SESSION['user_id'] ?>">Edit Profile</a></li>
        <li><a href="logout.php">LogOut</a></li>
       
      </ul>
    
      <ul class="nav navbar-nav navbar-right">
      
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Walid <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="member.php?do=edit&user_id=<?=$_SESSION['user_id'] ?>">Edit Profile</a></li>
            <li><a href="#">Setting</a></li>
            <li><a href="../index.php">work Shop</a></li>
           
            <li role="separator" class="divider"></li>
            <li><a href="logout.php">LogOut</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

