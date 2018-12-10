<div class="container-fluid header  fixed-top  ">



    <!-- user car -->
    <div class="row upper-bar w-100">
        <?php
if(isset($_SESSION['user']))
{
$stm2=$con->prepare("SELECT SUM(num) FROM purchases WHERE user_id=? "); 
$stm2->execute(array($sessionUserId));
 $cartsSum=$stm2->fetchColumn();
?>


        <div class="col-md-9 width-75">Welcome!<strong>
                <?=$_SESSION['user']?></strong></div>

        <div class=" col-md-3 width-25 ">
            <a href="purchase.php"><span class="btn btn-sm btn-primary float-right"><i class="icon-shopping-cart icon-white"></i>
                    [
                    <?=$cartsSum ?> ] Itemes in your cart </span> </a>
        </div>


        <?php }
else
{?>


        <div class="col-md-10"><a href="login.php" class='btn btn-success btn-sm  '> login | signUp</a> to use all
            features</div>



        <?php }

?>
    </div>
    <!-- end row -->
    <!--  -->

    <nav class="navbar navbar-expand-lg  navbar-dark bg-dark  ">
        <a class="navbar-brand" href="index.php"><img src="themes/images/logo.png"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="newitem.php">New</a>
                </li>

                <!--        -->
                <?php 
     if($sessionUser!=''){?>


                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                        <?=$sessionUser?>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="profile.php">profile</a>
                        <a class="dropdown-item" href="purchase.php">My Purchase</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="logout.php">Logout</a>
                    </div>
                </li>



                <?php }

     
     if($sessionUser!=''){
      $user=getuser($sessionUserId);
    $isadmin=$user['group_id'];
    if ($isadmin==1) {?>



                <li class="nav-item">
                    <a class="nav-link" href="admin">admin</a>
                </li>
                <?php }}
     
     ?>


            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>

</div>
<!-- //  -->





<!-- ////////////////////////////////////////////////////// -->