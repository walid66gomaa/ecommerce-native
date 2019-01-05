<?php

session_start();
if( ! isset($_SESSION['user']))
{
    header('location:login.php');
}
$pageTitle=$_SESSION['user'];
include "init.php";


?>

<div class="container">
    <div class="time-line-top">
        <div class="time-line-top2 position-relative">
            <div class="row">

                <div class="col-lg-3 col-sm-12">
                    <figure>
                        <img class="img-thumbnail profile-img" src="<?php 
                      if(empty($user['avatar'])){echo 'upload/user/avatar/default1.png';}  
                    else {echo 'upload/user/avatar/'.$user['user_id'].'/'. $user['avatar'];} ?>"
                            alt="">
                    </figure>
                    <div class="h4  full-name text-center">
                        <?=$user['fullName']?>
                    </div>
                </div>




                <div class="edit"><a class="btn btn-danger " href="editProfile.php">Edit Profile</a></div>


            </div>
        </div>
    </div>
</div>


<!-- // end image -->



<!-- start information sections  -->

<div class="container">

    <div class='information block'>
        <div class="panel-group">
            <div class="panel panel-success">

                <div class="panel-body">

                    <table class="table">

                        <tbody>

                            <tr>
                                <th scope="row">Full Name</th>
                                <td scope="row">
                                    <?=$user['fullName']?>
                                </td>
                            </tr>

                            <tr>
                                <th>User Name</th>
                                <td>
                                    <?=$user['userName']?>
                                </td>
                            </tr>

                            <tr>
                                <th>Email</th>
                                <td>
                                    <?=$user['email']?>
                                </td>
                            </tr>

                        </tbody>
                    </table>


                </div>
            </div>

        </div>
    </div>
</div>
<?php








        $user_id=$sessionUserId;
        $stmt=$con->prepare("   SELECT * FROM users WHERE user_id=? LIMIT 1");
        $stmt->execute(array($user_id));
        $row=$stmt->fetch();
        $count=$stmt->rowCount();
    
        if($count>0)
        {?>
<div class="container">


    <h1 class=" text-center "> Edit profile</h1>
    <div class="change-image">
        <form action="?do=saveImage" method="post" enctype="multipart/form-data">
            <div class="form-group form-group-md row">
                <label for="" class="col-sm-2 control-label"> </label>
                <div class="col-sm-10 col-md-8 row">
                    <div id="filediv" class="col-lg-3">

                        <input name="avatar" type="file" id="file" required />
                    </div>

                </div>
                <div class="col-sm-10 col-md-8 row">
                    <div id="filediv" class="col-lg-3">

                        <input type="submit" name="" id="" class="btn btn-primary" value="change image">

                    </div>

                </div>

            </div>

        </form>
    </div>
    <form action="?do=saveedit" method="post" class="form-horizontal">


        <div class="form-group form-group-lg row">
            <label for="" class="col-sm-2  control-label"> User Name</label>
            <div class="col-sm-10 col-md-8">
                <input type="text" class="form-control" name="userName" value="<?=$row['userName']?>" autocomplete="off"
                    required="required">
            </div>
        </div>
        <div class="form-group form-group-lg row">
            <label for="" class="col-sm-2 control-label"> Full Name</label>
            <div class="col-sm-10 col-md-8">
                <input type="text" class="form-control" value="<?=$row['fullName']?>" name="fullName" autocomplete="off"
                    required>
            </div>
        </div>
        <div class="form-group form-group-lg row">
            <label for="" class="col-sm-2 control-label"> Email</label>
            <div class="col-sm-10 col-md-8">
                <input type="email" class="form-control" name="email" value="<?=$row['email']?>" autocomplete="off"
                    required>
            </div>
        </div>
        <div class="form-group form-group-lg row">

            <label for="" class="col-sm-2 control-label"> Password</label>
            <div class="col-sm-10 col-md-8">
                <input type="password" class="form-control password" name="password">
                <i class="show-pass fa fa-eye-slash fa-2x"></i>
            </div>
        </div>
        <div class="form-group form-group-lg row ">

            <div class="col-sm-2 col-sm-offset-2">
                <input type="submit" class="btn btn-primary btn-block btn-lg" value="Save">
            </div>
        </div>



    </form>



</div>





<?php }?>

<?php   
     $do='';
     if(isset($_GET['do']))
     {
     $do=$_GET['do'];
     }
     else{
     $do='manage';
     }


if($do=='saveedit'){

if($_SERVER['REQUEST_METHOD']=='POST')
{
    $user_id    =$sessionUserId;
    $email      =$_POST['email'];
    $fullName   = $_POST['fullName'];
    $userName   = $_POST['userName'];


    $pass=empty($_POST['password'])?$_POST['oldPass']:sha1($_POST['password']);//check if pasword changed
    $formEditErorr=array();


    if(!empty($_POST['password']) && strlen($_POST['password'])<4)
    {
         $formEditErorr[]='password Cant be less than 4 char';
    }
    if(empty($userName))
    {
         $formEditErorr[]='User Name Cant be empty';
    }
    if(strlen($userName)<4 && !empty($userName))
    {
         $formEditErorr[]='User Name Cant be less than 4 char';
    }
    if(empty($fullName))
    {
         $formEditErorr[]='Full Name Cant be empty';
    }
    if(empty($email))
    {
         $formEditErorr[]='email Cant be empty';
    }

    if( chechExist('userName','users',$userName,'user_id',$user_id))
    {
        $formEditErorr[]='this user name is exist try anther one ';   
    }
    if( chechExist('email','users',$email,'user_id',$user_id))
    {
        $formEditErorr[]='this email is exist try anther one ';   
    }

  if(sizeof($formEditErorr)>0){
      foreach($formEditErorr as $error)
      {
          echo '<div class="alert alert-danger">'. $error."</div>";
      }

      redirect('','back',4);
    

  }
 else{
        $stmt=$con->prepare("UPDATE users SET userName=? ,fullName=?,email=? ,password=? WHERE user_id=?");
    $stmt->execute(array($userName,$fullName,$email,$pass,$user_id));  

    $msg='<div class="alert alert-success"> Usere Updeted successfuly</div>';

redirect($msg,'back',0);
      }
    
    
    }



}  

elseif($do=='saveImage'){

    if($_SERVER['REQUEST_METHOD']=='POST')
    {
        $avatarName=$_FILES['avatar']['name'];
        $avatartype=$_FILES['avatar']['type'];
        $avatarsize=$_FILES['avatar']['size'];
        $avatarTmpName=$_FILES['avatar']['tmp_name'];
        $formEditErorr=array();

          if(!empty($avatarName)){
           $avatarAllawedExtention=array("jpeg","jpg","gif","png");
            $name_parts=explode('.',$avatarName);
            $avatarExtention=strtolower( end ( $name_parts ) );
          if (!in_array($avatarExtention,$avatarAllawedExtention)) {
          $formEditErorr[]=$avatarExtention.' Extention Is Not Allawed'; 
        }
  if ($avatarsize>(4*1024*1024)) {
         $formEditErorr[]='Image can\'t be larger than <strong>4MB</strong>';
      }


          }

          if(sizeof($formEditErorr)>0){
			foreach($formEditErorr as $error)
			{
				echo '<div class="alert alert-danger">'. $error."</div>";
			}

    }  

    else{
        $avatar='';
   
    if(!empty($avatarName))
    {  $user_id = $sessionUserId;
        $avatar=rand(0,1000000).'_'.$avatarName;

      
            
       $path = 'upload/user/avatar/'.$user_id;
       if (file_exists($path)) {
       
        
    }
    mkdir($path, 0777, true);
    $targe=$path.'/'.$avatar;
       
    move_uploaded_file($avatarTmpName,$targe);
    } 
    }

    $stmt=$con->prepare("UPDATE users SET avatar=? Where user_id=? ");
    $stmt->execute(array($avatar,$sessionUserId));  

    $msg='<div class="alert alert-success"> Usere Updeted successfuly</div>';

redirect($msg,'back',0);
    
   


}
}
?>













<?php
include $tmp."footer.php" ; 

?>