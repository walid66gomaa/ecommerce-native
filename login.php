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
<div class='sign-in-signup'>
    <section class="sign-in ">


        <div class="container ">
            <div class="row">
                <div class="signin-image col-md-6">
                    <figure><img src="layout/images/signin-image.jpg" alt="sing up image"></figure>
                    <a href="#" class="signup-image-link" data-class='signup'>Create an account</a>
                </div>
                <div class="signin-content col-md-6">
                    <div class="signin-form  ">
                        <h2 class="form-title text-center">Sign in</h2>
                        <form action="" class="login" actions="<?php echo $_SERVER['PHP_SELF'] ?>" method="POST">

                            <div class="form-group col-sm-10">
                                <label for="your_name"><i class="fa fa-user" aria-hidden="true"></i></label>
                                <input type="text" name="user" id="your_name" placeholder="Your Name" />
                            </div>
                            <div class="form-group col-sm-10">
                                <label for="your_pass"><i class="fa fa-lock" aria-hidden="true"></i></label>
                                <input type="password" name="pass" id="your_pass" placeholder="Password" />
                            </div>
                            <div class="form-group text-center col-sm-3">

                                <input type="submit" name="login" id="signin" value="login" class="form-submit btn btn-primary">
                            </div>


                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>








    <section class="signup d-none">
        <div class="container ">
            <div class="row">
                <div class="signup-image col-md-6">
                    <figure><img src="layout/images/signup-image.jpg" alt="sing up image"></figure>
                    <a href="" class="signup-image-link" data-class='sign-in'>I am already member</a>
                </div>
                <div class="signin-content col-md-6">
                    <div class="signup-form">
                        <h2 class="form-title text-center">Sign up</h2>
                        <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" class=" sign-up hidden">

                            <div class="form-group col-sm-10">
                                <label for="name"><i class="fa fa-user" aria-hidden="true"></i></label>
                                <input type="text" name="userName" id="name" placeholder="User Name" required="required" />
                            </div>
                            <div class="form-group col-sm-10">
                                <label for="name"><i class="fa fa-address-book" aria-hidden="true"></i></label>
                                <input type="text" name="fullName" id="name" placeholder="Full Name" required="required" />
                            </div>



                            <div class="form-group col-sm-10">
                                <label for="email"><i class="fa fa-envelope" aria-hidden="true"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email" required="required" />
                            </div>

                            <div class="form-group col-sm-10">
                                <label for="pass"><i class="show-pass fa fa-eye-slash " aria-hidden="true"></i></label>
                                <input type="password" name="password" id="pass" class="password" placeholder="Password"
                                    required="required" />

                            </div>

                            <div class="form-group text-center col-sm-4">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
                            </div>





                        </form>
                    </div>

                </div>
            </div>
        </div>
    </section>
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

<head>
    <style>
        body {

            background: #f8f8f8;
        }
    </style>
</head>