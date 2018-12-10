<?php

session_start();
if( ! isset($_SESSION['user']))
{
    header('location:index.php');
}

include "init.php";
?>



<!-- start information sections  -->


<div class="container">
    <div class='row'>

        <div class="col-lg-12">
            <div class="panel-heading text-center">Add New item</div>
        </div>

        <div class="col-md-12">

            <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post" class="form-horizontal" enctype="multipart/form-data">


                <!-- start category name section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label"> Item Name</label>
                    <div class="col-sm-10 col-md-8">
                        <input type="text" class="form-control live-name" name="name" placeholder="Name Of The Item"
                            required="required" onkeyup="view(this)">
                    </div>
                </div>
                <!-- start descreption section -->
                <div class="form-group ">
                    <label for="" class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-10 col-md-8">

                        <textarea name="description" id="desc" onkeyup="auto_grow(this);view(this); " class="form-control"
                            placeholder="Description Of The Item"></textarea>

                    </div>
                </div>
                <!-- start Price section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label"> Price</label>
                    <div class="col-sm-10 col-md-8">
                        <input type="text" class="form-control" onkeyup="view(this)" name="price" placeholder="Price Of The Item">
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

                <!-- start status section -->
                <div class="form-group form-group-md ">
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

                 <div class="form-group form-group-md ">
                    <label for="" class="col-sm-2 control-label"> add image</label>
                    <div class="col-sm-10 col-md-8">
                      

                       <div class="lead">  
                           First image will be main image 
                      </div>
                               <div id="filediv">
                            <input name="file[]" type="file" id="file"/></div>
                        <input type="button" id="add_more" class="upload" value="Add More Files"/>
                
                       
                    </div>
                
                </div>





                <div class="form-group form-group-sm">

                    <div class="col-sm-2 col-sm-offset-2">
                        <input type="submit" class="btn btn-primary btn-block btn-lg" value="next Step">
                    </div>
                </div>



            </form>



        </div>
        <!-- start show  inserted item -->

    </div>

</div>

















<?php
   if($_SERVER['REQUEST_METHOD']=='POST')
   {
 
         $name          = filter_var( $_POST['name'],FILTER_SANITIZE_STRING);
         $desc          = filter_var($_POST['description'],FILTER_SANITIZE_STRING);
         $price         =  filter_var($_POST['price'],FILTER_SANITIZE_STRING);
         $country       =  filter_var($_POST['country'],FILTER_SANITIZE_STRING);
         $status        = filter_var($_POST['status'],FILTER_SANITIZE_STRING);
         $cat_id        = filter_var($_POST['category'],FILTER_SANITIZE_STRING);
         $user_id        = $sessionUserId;
    
            // image  start
            $formEditErorr=array();
         $imageAllawedExtention=array("jpeg","jpg","gif","png");
          $allImage=array();
       
     
             // Declaring Path for uploaded images.
           $imageAllawedExtention=array("jpeg","jpg","gif","png");
            for ($i = 0; $i < count($_FILES['file']['name']); $i++) {

                $imageName=$_FILES['file']['name'][$i]; 
                $imagetype=$_FILES['file']['type'][$i];
                $imagesize=$_FILES['file']['size'][$i];
                $imageTmpName=$_FILES['file']['tmp_name'][$i];

                if(!empty($imageName)){
                   
                     $name_parts=explode('.',$imageName);
                     $imageExtention=strtolower( end ( $name_parts ) );

                   if (in_array($imageExtention,$imageAllawedExtention)
                       && $imagesize<(4*1024*1024) && $imagesize>(100)) 
                       {
                           $allImage['name'][]=$imageName;
                           $allImage['tmp_name'][]=$imageTmpName;

                    }
                    else
                    {
                        $formEditErorr[]=' this image Extention Is Not Allawed or its size'; 

                      }
           
         
         
                   }
                
            }
       
     
// end check image part









        
 
         if(empty($name))
         {
             $formEditErorr[]="Name Can\'t be empty";
         }
         if(empty($price))
         {
             $formEditErorr[]="Price Can\'t be empty";
         }
         if(empty($country))
         {
             $formEditErorr[]="country Can\'t be empty";
         }
         if(empty($status))
         {
             $formEditErorr[]="Status Can\'t be empty";
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
            if(!empty($allImage['name']))
            {  
               $image=rand(0,1000000).'_'.$allImage['name'][0];
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
             
              if(!empty($allImage['name']))
              {   $item_id = $con->lastInsertId();

                  $path = 'upload/item/'.$item_id;
                  if (!file_exists($path)) {
                   mkdir($path, 0777, true);
                
              }

              $targe=$path.'/'.$image; //save first image main image 
              
              move_uploaded_file($allImage['tmp_name'][0],$targe); //mave first image main image


              for($i=1;$i<sizeof($allImage['name']);$i++)
                    {
                        $image=rand(0,1000000).'_'.$allImage['name'][$i]; 
                        $targe=$path.'/'.$image; 
                        move_uploaded_file($allImage['tmp_name'][$i],$targe); 
                        $stmt=$con->prepare("INSERT INTO itemimages ( item_id,image) VALUES (:Zitem,:Zimage)");
                        $stmt->execute(array(
                            'Zitem'=> $item_id ,
                            'Zimage'=>$image,
                           
          
            
                        ));
              
              
                    }

              }


             $msg='<div class="alert alert-success"> New Item inserted successfuly</div>';
 
             redirect($msg,'addMoreDetails.php',2);
         }
 
 
 
   }
include $tmp."footer.php" ; 

?>y