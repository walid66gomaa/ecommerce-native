<?php

session_start();
if(isset($_SESSION['user']))
{
    header('location:index.php');
}


   
     
    if(isset($_SERVER['HTTP_REFERER']) && $_SERVER['HTTP_REFERER']!=''&& !strpos($_SERVER['HTTP_REFERER'], 'login.php')){
        $_SESSION['previosPage']=$_SERVER['HTTP_REFERER'];
       
        
    }
  



$pageTitle="login|signup";
include "init.php";



  ?>
    <div class='to-togle'>
      <span class='selected' data-class='login'>LogIn</span>|
      <span data-class='sign-up'>Sign Up</span>
  </div>
<div class='login-signup'>

 <div class="container">
<form action="" class="login" actions="<?php echo $_SERVER['PHP_SELF'] ?>" method="POST">
    <h4 class="text-center"> Login</h4>
<input type="text" placeholder="username" name="user" class="form-control ">
<input type="password" placeholder="password" name="pass" class="form-control " autocomplete="off">
<input type="submit" name="login" id="" value="login" class="btn btn-primary btn-block">


</form>
</div>


 <div class="container ">
       
        <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" class="form-horizontal sign-up hidden" >
        <h1 class=" text-center text-primary"> sign-up</h1>
            <div class="form-group form-group-lg">
                <label for="" class="col-sm-2  control-label"  > User Name</label>
                <div class="col-sm-10 col-md-8">
                    <input type="text"  class="form-control"  name="userName"  required="required">
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
                    <input type="submit" name="signup" class="btn btn-primary btn-block btn-lg" value="Add Member">
                </div>
            </div>



        </form>



    </div>
    </div>

    <?php
// if form =login
    if(isset($_POST['login']))
    {

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

                  //  redirect
                $url='';
                if(isset($_SESSION['previosPage'])){
                    $url=$_SESSION['previosPage'];
                   
                }
                else
                {
                    $url='index.php';  
                   
                }

             
                header('location:'.$url);
            exit();
            }
        }
}  

 else if(isset($_POST['signup'])){  // if form is sign up

    $userName=$_POST['userName'];
    $email      = $_POST['email'];
    $fullName   = $_POST['fullName'];
   
    $pass       = $_POST['password'];
    $hashpass   =sha1( $pass );


     $formError=array();
     if(isset($_POST['userName']))
     {
         $filterUser=filter_var($_POST['userName'],FILTER_SANITIZE_STRING);

         if($filterUser !=$_POST['userName'])
         {
            $formError[]="This CHaracter Not Acceptable";  
         }
         if(strlen($filterUser)< 4)
         {
             $formError[]='User Name Can\'t be less than 4 character';
         }

      
         if(chechExist('userName','users',$filterUser))
         { 
             $formError[]= "This UserName Is Exist"; 
         }   
       
     }


     if(isset($_POST['email']))
     {
         $filteremail=filter_var($_POST['email'],FILTER_SANITIZE_EMAIL);
         if(filter_var($filteremail,FILTER_VALIDATE_EMAIL)!=true)
         {
            $formError[]="This CHaracter Not Acceptable";
         }

         if($filteremail !=$_POST['email'])
         {
            $formError[]="This CHaracter Not Acceptable";  
         }
        
         if(chechExist('email','users',$filteremail))
         { 
             $formError[]= "This email Is Exist"; 
         }   
       
     }

     if(empty($fullName))
		{
			$formError[]='Full Name Cant be empty';
		}
        if(empty($pass))
		{
			$formError[]='Password Cant be empty';
        }
        

     if(sizeof($formError)>0)
     {
       foreach($formError as $error)
       {
        echo '<div class="alert alert-danger">'. $error."</div>";
       }
     }
     else{
        $stmt=$con->prepare("INSERT INTO users( userName,fullName,email,password,date) 
        VALUES (:Zname,:Zfull,:Zemail,:Zpass,now())");
        $stmt->execute(array(
            'Zname'=>$userName,
            'Zfull'=>$fullName,

            'Zemail'=>$email,
            'Zpass'=>$hashpass


        ));  
        $msg='<div class="alert alert-success"> your Account creat successfuly <br> login now</div>';

        redirect($msg,'back',80);
    }
    }

 
    

 



   

     include $tmp."footer.php" ; 

    ?>