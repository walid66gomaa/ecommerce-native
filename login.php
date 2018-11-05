<?php

session_start();
if(isset($_SESSION['user']))
{
    header('location:index.php');
}

include "init.php";

if($_SERVER['REQUEST_METHOD']=='POST')
{  $username=$_POST['user'];
    $pass=$_POST['pass'];
    $hashpass=sha1($pass);
    $stmt=$con->prepare("   SELECT *
                                
                            FROM users 
                            WHERE userName=? AND password=? 
                            LIMIT 1");
    $stmt->execute(array($username,$hashpass));
    $row=$stmt->fetch();
    $count=$stmt->rowCount();

    if($count>0)
    {  
        if($row['regStatus']==0)
        {
            //echo "not active";
        }

        $_SESSION['user']=$username;
        $_SESSION['user_id']=$row['user_id'];
        header('location:index.php');
       exit();
    }
}

  ?>
    <div class='to-togle'>
      <span class='selected' data-class='login'>LogIn</span>|
      <span data-class='sign-up'>Sign Up</span>
  </div>
<div class='login-signup'>

 <div class="container">
<form action="" class="login" actions="<?php echo $_SERVER['PHP_SELF'] ?>" method="POST">
    <h4 class="text-center"> Login</h4>
<input type="text" placeholder="username" name="user" class="form-control " autocomplete="off" >
<input type="password" placeholder="password" name="pass" class="form-control " autocomplete="off">
<input type="submit" name="" id="" value="login" class="btn btn-primary btn-block">


</form>
</div>


 <div class="container ">
       
        <form action="?do=saveuser" method="post" class="form-horizontal sign-up hidden" >
        <h1 class=" text-center text-primary"> sign-up</h1>
            <div class="form-group form-group-lg">
                <label for="" class="col-sm-2  control-label"  > User Name</label>
                <div class="col-sm-10 col-md-8">
                    <input type="text" class="form-control"  name="userName"  required="required">
                </div>
            </div>
            <div class="form-group form-group-lg">
                <label for="" class="col-sm-2 control-label"  > Full Name</label>
                <div class="col-sm-10 col-md-8">
                    <input type="text" class="form-control"  name="fullName"  required>
                </div>
            </div>
            <div class="form-group form-group-lg">
                <label for="" class="col-sm-2 control-label"> Email</label>
                <div class="col-sm-10 col-md-8">
                    <input type="email" class="form-control" name="email"   required>
                </div>
            </div>
            <div class="form-group form-group-lg">
                
                <label for="" class="col-sm-2 control-label"> Password</label>
                <div class="col-sm-10 col-md-8">
                    <input type="password" class="form-control password" name="password"  required>
                    <i class="show-pass fa fa-eye-slash fa-2x"></i>
                </div>
            </div>
            <div class="form-group form-group-lg ">
               
                <div class="col-sm-2 col-sm-offset-2">
                    <input type="submit" class="btn btn-primary btn-block btn-lg" value="Add Member">
                </div>
            </div>



        </form>



    </div>
    </div>

    <?php








     include $tmp."footer.php" ; 
    ?>