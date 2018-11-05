<?php
    session_start();
    if(! isset($_SESSION['userName']))
    {
    header('location:index.php');
    exit();

    }
    $pageTitle='Members';
    include"init.php" ;



    $do='';
    if(isset($_GET['do']))
    {
    $do=$_GET['do'];
    }
    else{
    $do='manage';
    }


    if($do=='manage')
    {

        $quiry='';
        if(  isset($_GET['pending']) && ($_GET['pending'] ==0||$_GET['pending']==1) && is_numeric($_GET['pending']) )
        {
            $quiry='AND regStatus='.$_GET['pending'];
            
        }
      
        $stmt=$con->prepare("SELECT * FROM users WHERE group_id !=1 $quiry");
        $stmt->execute();
        $rows=$stmt->fetchAll();
        
        ?> 
    
    <h1 class=" text-center text-primary"> Manage Member</h1>
    <div class="container">
       
   <a href='?do=add' class="btn btn-primary"><i class="fa fa-plus"></i> New Member </a>
   <div class="table-responsive">
   <table class="table table-bordered main-table">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">User Name</th>
      <th scope="col">Email</th>
      <th scope="col">Full Name</th>
      <th scope="col">Regester Date</th>
      <th scope="col">control</th>
    </tr>
  </thead>
  <tbody>
    <tr>
        <?php
    foreach($rows as $row){
        
        ?>
      <td scope="row"><?=$row['user_id'];?></td>
      <td><?=$row['userName'];?></td>
      <td><?=$row['email'];?></td>
      <td><?=$row['fullName'];?></td>
      <td><?=$row['date'];?></td>
      
      <td>
      <a href="member.php?do=edit&user_id=<?=$row['user_id'];?>" class="btn btn-success"><i class="fa fa-edit"></i> Edit</a>
      <a href="member.php?do=delete&user_id=<?=$row['user_id'];?>" class="btn btn-danger confirm"><i class="fa fa-close"></i> Delete</a>
      <?php
      if($row['regStatus']==0){
        echo '<a href="member.php?do=activate&user_id='. $row['user_id'] .'" class="btn btn-info "><i class="fa fa-check"></i> acivate</a>'; 
      }
      ?>
      </td>
    </tr>
   <?php } ?>
  
  </tbody>
</table>
</div>
    </div>
    <?php }

    elseif($do=='add'){?>

     <div class="container">
        <h1 class=" text-center text-primary"> Add New Member</h1>
        <form action="?do=saveuser" method="post" class="form-horizontal" >
  
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


   <?php }

elseif($do=='saveuser')
{
	if($_SERVER['REQUEST_METHOD']=='POST')
	{

		$email      = $_POST['email'];
		$fullName   = $_POST['fullName'];
		$userName   = $_POST['userName'];
		$pass       = $_POST['password'];
		$hashpass   =sha1( $pass );

		$formEditErorr=array();


		if(!empty($_POST['password']) && strlen($_POST['password'])<4)
		{
			$formEditErorr[]='password Cant be less than 4 char';
		}
		if( chechItem('userName','users',$userName))
		{
			$formEditErorr[]='this user name is exist try anther one ';   
		}
		if( chechItem('email','users',$email))
		{
			$formEditErorr[]='this email is exist try anther one ';   
		}
		if(empty($pass))
		{
			$formEditErorr[]='Password Cant be empty';
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

		if(sizeof($formEditErorr)>0){
			foreach($formEditErorr as $error)
			{
				echo '<div class="alert alert-danger">'. $error."</div>";
			}

			redirect('','back',4);


		}
		else{
			$stmt=$con->prepare("INSERT INTO users( userName,fullName,email,password,date,regstatus) 
            VALUES (:Zname,:Zfull,:Zemail,:Zpass,now(),1)");
			$stmt->execute(array(
				'Zname'=>$userName,
				'Zfull'=>$fullName,

				'Zemail'=>$email,
				'Zpass'=>$hashpass


			));  
			$msg='<div class="alert alert-success"> Usere inserted successfuly</div>';

			redirect($msg,'back',4);
		}



	}

}
    elseif($do=='edit'){
        
        
    $user_id=isset($_GET['user_id'])&& is_numeric($_GET['user_id'])?intval($_GET['user_id']):0;
    $stmt=$con->prepare("   SELECT * FROM users WHERE user_id=? LIMIT 1");
    $stmt->execute(array($user_id));
    $row=$stmt->fetch();
    $count=$stmt->rowCount();

    if($count>0)
    {?>
     <div class="container">
        <h1 class=" text-center text-primary"> Edit Member</h1>
        <form action="?do=saveedit" method="post" class="form-horizontal" >
   <input type="hidden" value="<?=$user_id ?>" name="user_id">
   <input type="hidden" value="<?=$row['password'] ?>" name="oldPass">
            <div class="form-group form-group-lg">
                <label for="" class="col-sm-2  control-label"  > User Name</label>
                <div class="col-sm-10 col-md-8">
                    <input type="text" class="form-control"  name="userName" value="<?=$row['userName']?>" autocomplete="off" required="required">
                </div>
            </div>
            <div class="form-group form-group-lg">
                <label for="" class="col-sm-2 control-label"  > Full Name</label>
                <div class="col-sm-10 col-md-8">
                    <input type="text" class="form-control" value="<?=$row['fullName']?>" name="fullName" autocomplete="off" required>
                </div>
            </div>
            <div class="form-group form-group-lg">
                <label for="" class="col-sm-2 control-label"> Email</label>
                <div class="col-sm-10 col-md-8">
                    <input type="email" class="form-control" name="email" value="<?=$row['email']?>" autocomplete="off" required>
                </div>
            </div>
            <div class="form-group form-group-lg">
                
                <label for="" class="col-sm-2 control-label"> Password</label>
                <div class="col-sm-10 col-md-8">
                    <input type="password" class="form-control password" name="password">
                    <i class="show-pass fa fa-eye-slash fa-2x"></i>
                </div>
            </div>
            <div class="form-group form-group-lg ">
               
                <div class="col-sm-2 col-sm-offset-2">
                    <input type="submit" class="btn btn-primary btn-block btn-lg" value="Save">
                </div>
            </div>



        </form>



    </div>





       
   <?php }
    else
    {
        echo "there is no User with this id";
    }

       
    
   

   
 }
 elseif($do=='saveedit'){

    if($_SERVER['REQUEST_METHOD']=='POST')
    {
        $user_id    =$_POST['user_id'];
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

        if( chechItem('userName','users',$userName,'user_id',$user_id))
		{
			$formEditErorr[]='this user name is exist try anther one ';   
		}
		if( chechItem('email','users',$email,'user_id',$user_id))
		{
			$formEditErorr[]='this email is exist try anther one ';   
		}

      if(sizeof($formEditErorr)>0){
          foreach($formEditErorr as $error)
          {
              echo '<div class="alert alert-danger">'. $error."</div>";
          }

          redirect('','back',5);
        

      }
     else{
            $stmt=$con->prepare("UPDATE users SET userName=? ,fullName=?,email=? ,password=? WHERE user_id=?");
        $stmt->execute(array($userName,$fullName,$email,$pass,$user_id));  

        $msg='<div class="alert alert-success"> Usere Updeted successfuly</div>';

redirect($msg,'back',4);
          }
        
        
        }
    else{

    
        redirect('sorry cant access this','',4);
    }


 }
 elseif($do=='delete')
 {
    $user_id=isset($_GET['user_id'])&& is_numeric($_GET['user_id'])?intval($_GET['user_id']):0;
    $stmt=$con->prepare("   SELECT * FROM users WHERE user_id=? LIMIT 1");
    $stmt->execute(array($user_id));
    $row=$stmt->fetch();
    $count=$stmt->rowCount();
    if($count>0){
        $stmt=$con->prepare("DELETE FROM users WHERE user_id=:zid");
        $stmt->bindParam('zid',$user_id);
        $stmt->execute();
        echo $row['fullName']." deleted successfuly";

    }
    else
    {
        
        redirect('there is error','back',3);
    }
 }

 elseif($do=='activate')
 {
    $user_id=isset($_GET['user_id'])&& is_numeric($_GET['user_id'])?intval($_GET['user_id']):0;
    $stmt=$con->prepare("SELECT * FROM users WHERE user_id=? LIMIT 1");
    $stmt->execute(array($user_id));
    $row=$stmt->fetch();
    $count=$stmt->rowCount();
    if($count>0){
        $stmt=$con->prepare("UPDATE users SET regStatus=1 WHERE user_id=:zid");
        $stmt->bindParam('zid',$user_id);
        $stmt->execute();
        echo $row['fullName']." Activated successfuly";
        redirect('','back',0);

    }
    else
    {
        
        redirect('there is error','back',3);
    }
 }







        include $tmp."footer.php" ;