<?php
session_start();
if(isset($_SESSION['userName']))
{
    header('location:dashbord.php');
}

$nonavbar="true";

$pageTitle='Login';
include "init.php";

if($_SERVER['REQUEST_METHOD']=='POST')
{  $username=$_POST['user'];
    $pass=$_POST['pass'];
    $hashpass=sha1($pass);
    $stmt=$con->prepare("   SELECT 
                                 userName ,password ,user_id
                            FROM users 
                            WHERE userName=? AND password=? AND group_id=1
                            LIMIT 1");
    $stmt->execute(array($username,$hashpass));
    $row=$stmt->fetch();
    $count=$stmt->rowCount();

    if($count>0)
    {
       $_SESSION['userName']=$username;
       $_SESSION['admin_id']=$row['user_id'];
       header('location:dashbord.php');
       exit();
    }
}




?>





<form action="" class="login" actions="<?php echo $_SERVER['PHP_SELF'] ?>" method="POST">
    <h4 class="text-center">Admin Login</h4>
    <input type="text" placeholder="username" name="user" class="form-control " autocomplete="off">
    <input type="password" placeholder="password" name="pass" class="form-control " autocomplete="off">
    <input type="submit" name="" id="" value="login" class="btn btn-primary btn-block">


</form>




<?php

include $tmp."footer.php";

?>