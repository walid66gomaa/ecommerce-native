<?php
 
    $pageTitle='faker';
    include"init.php" ;
    

  
    $stmt=$con->prepare("   SELECT user_id  FROM users  ORDER BY user_id ASC ");
    $stmt->execute();
    $users=$stmt->fetchAll();
?>
<form action="" method="post" class="form-horizontal" enctype="multipart/form-data">
    <div class="form-group form-group-md">
        <label for="" class="col-sm-2 control-label"> Category</label>
        <div class="col-sm-10 col-md-8">
            <select class="form-control" name="user_id" id="">
                <?php 
               
                
           foreach($users as $Category)
           {
               echo "<option value='".$Category['user_id']."'";
             

               echo ">".$Category['user_id']."</option>"; 
           }


              ?>

            </select>
        </div>

    </div>
    <div class="form-group form-group-md row">
        <label for="" class="col-sm-2 control-label"> add images</label>
        <div class="col-sm-10 col-md-8 row">


            <div class="lead col-sm-12">
                First image will be main image
            </div>
            <div id="filediv" class="col-lg-3">

                <input name="file[]" type="file" id="file" />
            </div>
            <div class=" col-md-12" id="add_more">
                <input type="button" class="btn btn-info upload" value="Add More Image" />
            </div>
        </div>


    </div>
    <input type="submit" value="adddd">
</form>




<?php
   if($_SERVER['REQUEST_METHOD']=='POST')
   {
 
        
    
            // image  start
            $item_id=$_POST['user_id'];
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
  
   $stmt=$con->prepare("UPDATE users SET avatar=? WHERE user_id=?");
//    $stmt->bindParam();
   $stmt->execute(array($image,$item_id)); 
   
  
     if(!empty($allImage['name']))
     {   

         $path =  $path = 'upload/user/avatar/'.$item_id;
         if (file_exists($path)) {

            rrmdir($path);
          
       
     }
mkdir($path, 0777, true);
     $targe=$path.'/'.$image; //save first image main image 
     
     move_uploaded_file($allImage['tmp_name'][0],$targe); //mave first image main image


    //  for($i=1;$i<sizeof($allImage['name']);$i++)
    //        {
    //            $image=rand(0,1000000).'_'.$allImage['name'][$i]; 
    //            $targe=$path.'/'.$image; 
    //            move_uploaded_file($allImage['tmp_name'][$i],$targe); 
    //            $stmt=$con->prepare("INSERT INTO itemimages ( item_id,image) VALUES (:Zitem,:Zimage)");
    //            $stmt->execute(array(
    //                'Zitem'=> $item_id ,
    //                'Zimage'=>$image,
                  
 
   
    //            ));
     
     
    //        }

     }


    $msg='<div class="alert alert-success"> New Item inserted successfuly</div>';
echo $msg;
   // redirect($msg,'oneitem.php?item_id='.$item_id,2);
}



}







     
 
 
 



?>

<?php
    include $tmp."footer.php" ;
    ?>