<?php
    session_start();
    if(! isset($_SESSION['userName']))
    {
    header('location:index.php');
    exit();

    }
    $pageTitle='Items';
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
        if(isset($_GET['approve'])&& ($_GET['approve']==0||$_GET['approve']==1)&&is_numeric($_GET['approve']))
        {
            $quiry='AND approve='.$_GET['approve'];
        }
        
        $stmt=$con->prepare("SELECT items.* ,categories.name as catName,users.userName 
                            FROM items ,categories,users 
                            WHERE items.cat_id=categories.id AND items.user_id=users.user_id $quiry");
        $stmt->execute();
        $rows=$stmt->fetchAll();
        
        ?> 
    
    <h1 class=" text-center text-primary"> Manage Items</h1>
    <div class="container">
       
   <a href='?do=add' class="btn btn-primary"><i class="fa fa-plus"></i> New Items </a>
   <div class="table-responsive">
   <table class="table table-bordered main-table">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">image</th>
      <th scope="col">Item Name</th>
      <th scope="col">Description</th>
      <th scope="col">Price</th>
      <th scope="col">Category</th>
      <th scope="col">User</th>
      <th scope="col">Adding Date</th>
      <th scope="col">control</th>
    </tr>
  </thead>
  <tbody>
    <tr>
        <?php
    foreach($rows as $row){
        
        ?>
      <td scope="row"><?=$row['id'];?></td>
      <td><img class="avatar" src="<?php 
        if(empty($row['image'])){echo 'bb';}  
       else {echo $row['image'];} ?>" 
       alt="image">
  
    </td>
      <td><?=$row['name'];?></td>
      <td><?php if(strlen($row['description'])>20){echo substr($row['description'],0,20).'...';} else { echo $row['description']; }?></td>
      <td><?=$row['price'];?></td>
      <td><?=$row['catName'];?></td>
      <td><?=$row['userName'];?></td>
      <td><?=$row['addDate'];?></td>
    
      <td>
      <a href="items.php?do=edit&item_id=<?=$row['id'];?>" class="btn btn-success"><i class="fa fa-edit"></i> Edit</a>
      <a href="items.php?do=delete&item_id=<?=$row['id'];?>" class="btn btn-danger confirm"><i class="fa fa-close"></i> Delete</a>
      <?php
      if($row['approve']==0){
        echo '<a href="items.php?do=approve&item_id='. $row['id'] .'" class="btn btn-info "><i class="fa fa-check"></i> acivate</a>'; 
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
            <h1 class="text-center text-primary"> Add New Item</h1>
            <form action="?do=insert" method="post" class="form-horizontal" enctype="multipart/form-data"  >
               
               
                 <!-- start category name section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label"> Item Name</label>
                    <div class="col-sm-10 col-md-8">
                        <input type="text" class="form-control" name="name"
                        placeholder="Name Of The Item" required="required">
                    </div>
                </div>

                  <div class="form-group form-group-lg">
                <label for="" class="col-sm-2  control-label"  > Image</label>
                <div class="col-sm-10 col-md-8">
                    <input type="file" class="form-control"  name="image">
                </div>
                 </div>
                  <!-- start descreption section -->
                  <div class="form-group ">
                    <label for="" class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-10 col-md-8">

                       <textarea name="description" id="desc" onkeyup="auto_grow(this)"  class="form-control"
                       placeholder="Description Of The Item"  ></textarea>
                        
                    </div>
                </div>
                 <!-- start Price section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label"> Price</label>
                    <div class="col-sm-10 col-md-8">
                        <input type="text" class="form-control" name="price" placeholder="Price Of The Item">
                    </div>
                </div>
                 <!-- start Price section -->
                 <div class="form-group form-group-md">
                    <label for="" class="col-sm-2 control-label"> Country</label>
                    <div class="col-sm-10 col-md-8">
                    <select class="form-control" name="country" id="">
                 <?php

	$countries = array("Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica",
					   "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", 
					   "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", 
					   "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", 
					   "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde",
					   "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands",
					   "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", 
					   "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti",
					   "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea",
					   "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", 
					   "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", 
					   "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", 
					   "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands",
					   "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", 
					   "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan",
					   "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of",
					   "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", 
					   "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein",
					   "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", 
					   "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands",
					   "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia,
                       Federated States of", "Moldova, Republic of", "Monaco", "Mongolia",
					   "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", 
					   "Nauru", "Nepal", "Netherlands", "Netherlands Antilles","New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", 
					   "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", 
					   "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar",
					   "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", 
					   "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia",
					   "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", 
					   "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain",
					   "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", 
					   "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland",
					   "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan",
					   "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau",
					   "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands",
					   "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States",
					   "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam",
					   "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara",
                       "Yemen", "Yugoslavia", "Zambia", "Zimbabwe");
                       
                       foreach($countries as $country)
                       {
                           echo "<option value='".$country."'>".$country."</option>";
                       }


                  ?>
                
                       </select>
                    </div>
                </div>
                  <!-- start Category section -->
                  <div class="form-group form-group-md">
                    <label for="" class="col-sm-2 control-label"> Category</label>
                    <div class="col-sm-10 col-md-8">
                        <select class="form-control" name="category" id="">
                        <?php 
                        $stm=$con->prepare("SELECT id,name from categories ORDER BY name ASC");
                        $stm->execute();
                        $categories=$stm->fetchAll();
                        
                   foreach($categories as $Category)
                   {
                       echo "<option value='".$Category['id']."'>".$Category['name']."</option>";
                   }


                      ?>
                         
                        </select>
                    </div>
                </div>
                  <!-- start user_id section -->
                  <div class="form-group form-group-md">
                    <label for="" class="col-sm-2 control-label"> Member</label>
                    <div class="col-sm-10 col-md-8">
                        <select class="form-control" name="user" id="">
                        <?php 
                        $stm=$con->prepare("SELECT user_id,userName from users ORDER BY userName ASC");
                        $stm->execute();
                        $users=$stm->fetchAll();

                   foreach($users as $user)
                   {
                       echo "<option value='".$user['user_id']."'>".$user['userName']."</option>";
                   }


                      ?>
                         
                        </select>
                    </div>
                </div>
                 <!-- start status section -->
                <div class="form-group form-group-md">
                    <label for="" class="col-sm-2 control-label"> Status</label>
                    <div class="col-sm-10 col-md-8">
                        <select class="form-control" name="status" id="">
                        
                           
                            <option value="1">New</option>
                            <option value="2">Like New</option>
                            <option value="3">Used</option>
                            <option value="4">Very Old</option>
                        
                        </select>
                    </div>
                </div>
               

               

              
              
                <div class="form-group form-group-lg">
        
                    <div class="col-sm-2 col-sm-offset-2">
                        <input type="submit" class="btn btn-primary btn-block btn-lg"
                            value="Add Item">
                    </div>
                </div>
        
        
        
            </form>
        
        
        
        </div>
        
        
        <?php }
      


      

      elseif($do=='insert')
      {
          if($_SERVER['REQUEST_METHOD']=='POST')
        {
      
              $name          = $_POST['name'];
              $desc          = $_POST['description'];
              $price         = $_POST['price'];
              $country       = $_POST['country'];
              $status        = $_POST['status'];
              $cat_id        = $_POST['category'];
              $user_id        = $_POST['user'];
            
             $imageName=$_FILES['image']['name']; 
             $imagetype=$_FILES['image']['type'];
             $imagesize=$_FILES['image']['size'];
             $imageTmpName=$_FILES['image']['tmp_name'];

             if(!empty($imageName)){
                $imageAllawedExtention=array("jpeg","jpg","gif","png");
                 $name_parts=explode('.',$imageName);
                 $imageExtention=strtolower( end ( $name_parts ) );
               if (!in_array($imageExtention,$imageAllawedExtention)) {
               $formEditErorr[]=$imageExtention.' Extention Is Not Allawed'; 
             }
       if ($imagesize>(4*1024*1024)) {
              $formEditErorr[]='Image can\'t be larger than <strong>4MB</strong>';
           }
     
     
               }
        
              $formEditErorr=array();
      
              if(empty($name))
              {
                  $formEditErorr[]='Name Can\'t be empty';
              }
              if(empty($price))
              {
                  $formEditErorr[]='Price Can\'t be empty';
              }
              if(empty($country))
              {
                  $formEditErorr[]='country Can\'t be empty';
              }
              if(empty($status))
              {
                  $formEditErorr[]='Status Can\'t be empty';
              }
            
              if(sizeof($formEditErorr)>0){
                  foreach($formEditErorr as $error)
                  {
                      echo '<div class="alert alert-danger">'. $error."</div>";
                  }
      
                  redirect('','back',4);
      
      
              }
              else{

                $image='';
                if(!empty($imageName))
                {
                   $image=rand(0,1000000).'_'.$imageName;
                
                move_uploaded_file($imageTmpName,$image);
                }
                  $stmt=$con->prepare("INSERT INTO items( name,image,description,price,countryMade,status,addDate,user_id,cat_id) 
                  VALUES (:Zname,:Zimage,:Zdesc,:Zprice,:Zcountry,:Zstatus,now(),:Zuser,:Zcat)");
                  $stmt->execute(array(
                      'Zname'=> $name ,
                      'Zimage'=>$image,
                      'Zdesc'=>$desc,
                      'Zprice'=>$price,
                      'Zcountry'=>$country,
                     'Zstatus'=>$status,
                     'Zuser'=>$user_id,
                     'Zcat'=>$cat_id

      
                  ));  
                  
                  $msg='<div class="alert alert-success"> New Item inserted successfuly</div>';
      
                  redirect($msg,'back',4);
              }
      
      
      
        }
      
    }

    elseif($do=='edit'){
        $item_id=isset($_GET['item_id'])&& is_numeric($_GET['item_id'])?intval($_GET['item_id']):0;
        $stmt=$con->prepare("   SELECT * FROM items WHERE id=? ");
        $stmt->execute(array($item_id));
        $item=$stmt->fetch();
        $count=$stmt->rowCount();

        if($count>0)
        {?>
             <div class="container">
            <h1 class="text-center text-primary"> Add New Category</h1>
            <form action="?do=saveedit" method="post" class="form-horizontal">
                <input type="hidden" name="item_id" value="<?=$item_id?>">
               
                 <!-- start category name section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label"> Item Name</label>
                    <div class="col-sm-10 col-md-8">
                        <input type="text" class="form-control" name="name"
                        placeholder="Name Of The Item" required="required" value="<?=$item['name']?>">
                    </div>
                </div>
                 <!-- start descreption section -->
                <div class="form-group ">
                    <label for="" class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-10 col-md-8">

                       <textarea name="description" id="desc" onkeyup="auto_grow(this)"  class="form-control"
                       placeholder="Description Of The Item"  ><?=$item['description']?></textarea>
                        
                    </div>
                </div>
            
                 <!-- start Price section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label"> Price</label>
                    <div class="col-sm-10 col-md-8">
                        <input type="text" class="form-control" name="price"
                         placeholder="Price Of The Item" value="<?=$item['price']?>">
                    </div>
                </div>
                 <!-- start Price section -->
                 <div class="form-group form-group-md">
                    <label for="" class="col-sm-2 control-label"> Country</label>
                    <div class="col-sm-10 col-md-8">
                    <select class="form-control" name="country" id="">
                 <?php

	$countries = array("Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antarctica",
					   "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", 
					   "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", 
					   "Bosnia and Herzegowina", "Botswana", "Bouvet Island", "Brazil", "British Indian Ocean Territory", 
					   "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde",
					   "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands",
					   "Colombia", "Comoros", "Congo", "Congo, the Democratic Republic of the", "Cook Islands", "Costa Rica", 
					   "Cote d'Ivoire", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti",
					   "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea",
					   "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", 
					   "France", "France Metropolitan", "French Guiana", "French Polynesia", "French Southern Territories", 
					   "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", 
					   "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard and Mc Donald Islands",
					   "Holy See (Vatican City State)", "Honduras", "Hong Kong", "Hungary", "Iceland", "India", 
					   "Indonesia", "Iran (Islamic Republic of)", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan",
					   "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of",
					   "Korea, Republic of", "Kuwait", "Kyrgyzstan", "Lao, People's Democratic Republic", 
					   "Latvia", "Lebanon", "Lesotho", "Liberia", "Libyan Arab Jamahiriya", "Liechtenstein",
					   "Lithuania", "Luxembourg", "Macau", "Macedonia, The Former Yugoslav Republic of", 
					   "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands",
					   "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia,
                       Federated States of", "Moldova, Republic of", "Monaco", "Mongolia",
					   "Montserrat", "Morocco", "Mozambique", "Myanmar", "Namibia", 
					   "Nauru", "Nepal", "Netherlands", "Netherlands Antilles","New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", 
					   "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", 
					   "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar",
					   "Reunion", "Romania", "Russian Federation", "Rwanda", "Saint Kitts and Nevis", "Saint Lucia", 
					   "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia",
					   "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia (Slovak Republic)", "Slovenia", 
					   "Solomon Islands", "Somalia", "South Africa", "South Georgia and the South Sandwich Islands", "Spain",
					   "Sri Lanka", "St. Helena", "St. Pierre and Miquelon", "Sudan", "Suriname", 
					   "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland",
					   "Syrian Arab Republic", "Taiwan, Province of China", "Tajikistan",
					   "Tanzania, United Republic of", "Thailand", "Togo", "Tokelau",
					   "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands",
					   "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States",
					   "United States Minor Outlying Islands", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam",
					   "Virgin Islands (British)", "Virgin Islands (U.S.)", "Wallis and Futuna Islands", "Western Sahara",
                       "Yemen", "Yugoslavia", "Zambia", "Zimbabwe");
                       
                       foreach($countries as $country)
                       {
                           echo "<option value='".$country."'";
                            if($country==$item['countryMade'])
                            {
                                echo 'selected';
                            }
                           
                           echo ">".$country."</option>";
                       }


                  ?>
                
                       </select>
                    </div>
                </div>
                  <!-- start Category section -->
                  <div class="form-group form-group-md">
                    <label for="" class="col-sm-2 control-label"> Category</label>
                    <div class="col-sm-10 col-md-8">
                        <select class="form-control" name="category" id="">
                        <?php 
                        $categories=getDate('categories','name');
                        
                   foreach($categories as $Category)
                   {
                       echo "<option value='".$Category['id']."'";
                       if($Category['id']==$item['cat_id'])
                       {
                           echo 'selected';
                       }

                       echo ">".$Category['name']."</option>"; 
                   }


                      ?>
                         
                        </select>
                    </div>
                </div>
                  <!-- start user_id section -->
                  <div class="form-group form-group-md">
                    <label for="" class="col-sm-2 control-label"> Member</label>
                    <div class="col-sm-10 col-md-8">
                        <select class="form-control" name="user" id="">
                        <?php 
                        $users=getDate('user','userName');

                   foreach($users as $user)
                   {
                       

                       echo "<option value='".$user['user_id']."'";
                       if($user['user_id']==$item['user_id'])
                       {
                           echo 'selected';
                       }

                       echo ">".$user['userName']."</option>"; 
                   }


                      ?>
                         
                        </select>
                    </div>
                </div>
                 <!-- start status section -->
                <div class="form-group form-group-md">
                    <label for="" class="col-sm-2 control-label"> Status</label>
                    <div class="col-sm-10 col-md-8">
                        <select class="form-control" name="status" id="">
                        
                           
                            <option value="1"<?php if($item['status']==1){ echo 'selected';}?> >New</option>
                            <option value="2"<?php if($item['status']==2){ echo 'selected';}?>>Like New</option>
                            <option value="3"<?php if($item['status']==3){ echo 'selected';}?>>Used</option>
                            <option value="4"<?php if($item['status']==4){ echo 'selected';}?>>Very Old</option>
                        
                        </select>
                    </div>
                </div>
               

               

              
              
                <div class="form-group form-group-lg">
        
                    <div class="col-sm-2 col-sm-offset-2">
                        <input type="submit" class="btn btn-primary btn-block btn-lg"
                            value="Add Item">
                    </div>
                </div>
        
        
        
            </form>
        
        
        
        </div>

        <?php }
            
    
    
    }
 elseif($do=='saveedit'){

    if($_SERVER['REQUEST_METHOD']=='POST')
    {
  
        $item_id       = $_POST['item_id'];
        $name          = $_POST['name'];
        $desc          = $_POST['description'];
        $price         = $_POST['price'];
        $country       = $_POST['country'];
        $status        = $_POST['status'];
        $cat_id        = $_POST['category'];
        $user_id       = $_POST['user'];
        
        
  
          $formEditErorr=array();
  
          if(empty($name))
          {
              $formEditErorr[]='Name Can\'t be empty';
          }
          if(empty($price))
          {
              $formEditErorr[]='Price Can\'t be empty';
          }
          if(empty($country))
          {
              $formEditErorr[]='country Can\'t be empty';
          }
          if(empty($status))
          {
              $formEditErorr[]='Status Can\'t be empty';
          }
        
          if(sizeof($formEditErorr)>0){
              foreach($formEditErorr as $error)
              {
                  echo '<div class="alert alert-danger">'. $error."</div>";
              }
  
              redirect('','back',4);
  
  
          }
          else{
              $stmt=$con->prepare("UPDATE items
                                    SET  name=?,description=?,price=?,countryMade=?,status=?,user_id=?,cat_id=? 
                                    WHERE id=?") ;
            
              $stmt->execute(array( $name ,$desc,$price,$country,$status,$user_id,$cat_id,$item_id));  
              
              
      
              $msg='<div class="alert alert-success"> Items Updeted successfuly</div>';
      
      redirect($msg,'back',4);
          }
  
  
  
    }

   


 }
 elseif($do=='delete')
 {
    $item_id=isset($_GET['item_id'])&& is_numeric($_GET['item_id'])?intval($_GET['item_id']):0;
    $stmt=$con->prepare("   SELECT * FROM items WHERE id=? LIMIT 1");
    $stmt->execute(array($item_id));
    $row=$stmt->fetch();
    $count=$stmt->rowCount();
    if($count>0){
        $stmt=$con->prepare("DELETE FROM items WHERE id=:zid");
        $stmt->bindParam('zid',$item_id);
        $stmt->execute();
        $msg= "<div class='alert alert-success'>".$row['name']." Deleted successfuly"."</div>";
        
        

            redirect($msg,'back',0);
    }
    else
    {
        
        redirect('there is error','back',3);
    }
 }

 elseif($do=='approve')
 {
    $item_id=isset($_GET['item_id'])&& is_numeric($_GET['item_id'])?intval($_GET['item_id']):0;
    $stmt=$con->prepare("SELECT * FROM items WHERE id=? LIMIT 1");
    $stmt->execute(array($item_id));
    $row=$stmt->fetch();
    $count=$stmt->rowCount();
    if($count>0){
        $stmt=$con->prepare("UPDATE items SET approve=1 WHERE id=:zid");
        $stmt->bindParam('zid',$item_id);
        $stmt->execute();

        $msg= "<div class='alert alert-success'>".$row['name']."Approved successfuly"."</div>";
        
        

        redirect($msg,'back',0);

    }
    else
    {
        
        redirect('there is error','back',3);
    } 
 }







        include $tmp."footer.php" ;