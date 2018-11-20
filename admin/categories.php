<?php
    session_start();
    if(! isset($_SESSION['userName']))
    {
    header('location:index.php');
    exit();

    }
    $pageTitle='Categories';
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
        $sort='ASC';
        $sort_array=array('ASC','DESC');
        if(isset($_GET['sort'])&& in_array($_GET['sort'],$sort_array))
        {
            $sort=$_GET['sort'];
        }
     
       $categories=getDataWhere('categories','parent',NULL,'name');
       ?>

       <h1 class=" text-center text-primary"> Manage Categories</h1>
       <div class="container categories">
       <a href='?do=add' class="btn btn-primary add-cat-btn"><i class="fa fa-plus"></i> New Category </a>
       <div class="panel panel-default">
    <div class="panel-heading">
        <i class="fa fa-user" aria-hidden="true"></i> manage categories
        <div class='ordering pull-right'>
        <i class='fa fa-sort'></i> ordering: [
            <a href="?sort=ASC" class="<?php if($sort=='ASC'){echo 'active';}?>" >ASC </a>|
            <a href="?sort=DESC" class="<?php if($sort=='DESC'){echo 'active';}?>">DESC</a>]

           <i class='fa fa-eye'></i> View:[
            <span data-view='full' class='active'>Full</span> |
            <span >classic</span>]





        </div>
    </div>
    <div class="panel-body">
        
            <?php
        
                foreach( $categories as $cat)
                {

                echo"<div class='cat '>";
                echo "<div class='hidden-btn'>";
                    echo "<a href='categories.php?do=edit&cat_id=".$cat['id']."' class='btn btn-xs btn-primary'><i class='fa fa-edit'></i> Edit </a>";
                    echo "<a href='categories.php?do=delete&cat_id=".$cat['id']."' class='btn btn-xs btn-danger confirm'> <i class='fa fa-close'></i> Delete </a>";
                   

                echo "</div>";
                 echo "<h3>".$cat['name']."</h3>";
              
                
               
                    echo "<div class='full-view'>";
                     echo "<p>".$cat['description']."</p>";
                    if($cat['visibility']==0) { echo " <span class='visible '><i class=' fa fa-eye-slash '></i> hidden</span>";}
                    if($cat['allowComment']==0) { echo " <span class='comment '><i class='fa fa-close'></i> comment is disable</span>";}
                    if($cat['allowAds']==0) { echo "  <span class='ads '><i class='fa fa-close'></i> ADs is disable</span>";}
               
                //  start child categories
                $children=getDataWhere('categories','parent',$cat['id'],'name');
                if(!empty($children)){
                 ?>
                  <span class="center-block text-success show-child"><i class="fa fa-plus"></i> child categories</span>
                  <ul class='hidden'>
                   <?php foreach ($children as $child) {?>
                   <li>
                   <a title="EDIT" class='' href='categories.php?do=edit&cat_id=<?=$child["id"]?>' ><i class='fa fa-edit'></i>  </a>
                   <a title="DELETE" href='categories.php?do=delete&cat_id=<?=$child["id"]?>' class=' confirm'> <i class='fa fa-close'></i>  </a>
                    <span class="text-center text-info"><?=$child['name']?></span>
                   </li>
                 
                 
                 <?php
                   } 
                   echo '</ul>';
                }
                    echo "</div>";
                echo "</div>";
                echo "<hr>";
            }
            ?>
       
    </div>

</div>
       </div>
      

     <?php }

    elseif($do=='add'){?>

        <div class="container">
            <h1 class="text-center text-primary"> Add New Category</h1>
            <form action="?do=insert" method="post" class="form-horizontal">
                <input type="hidden" name="user_id">
               
                 <!-- start category name section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label"> Category Name</label>
                    <div class="col-sm-10 col-md-8">
                        <input type="text" class="form-control" name="name"
                            required="required">
                    </div>
                </div>
                 <!-- start descreption section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-10 col-md-8">
                        <input type="text" class="form-control" name="description"
                            >
                    </div>
                </div>
           <!-- start parent section -->
            
             <div class="form-group form-group-md">
                    <label for="" class="col-sm-2 control-label"> parent</label>
                    <div class="col-sm-10 col-md-8">
                        <select class="form-control" name="parent" id="">
                        <option value='0'>None</option>
                        <?php 
                      

                        $categories=getDataWhere('categories','parent',NULL,'name');
                        
                   foreach($categories as $Category)
                   {
                       echo "<option value='".$Category['id']."'>".$Category['name']."</option>";
                   }


                      ?>
                         
                        </select>
                    </div>
                </div>


                 <!-- start ordering section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label"> Order</label>
                    <div class="col-sm-10 col-md-8">
                        <input type="text" class="form-control" name="order" placeholder="Number to ordering ">
                    </div>
                </div>
                 <!-- start visibality section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label"> visibale</label>
                   
                    <div class="col-sm-10 col-md-8">
                        <input type="radio" value=1 id="vis-yes" name="visibale" checked>
                        <label for="vis-yes">Yes</label>
                    </div> 
                    <div class="col-sm-10 col-md-8">
                         <input type="radio" value="0" name="visibale"  id="vis-no">
                        <label for="vis-no">  No  </label>
                    </div>
                </div>

                <!-- start allow comment section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label"> Allow Commenting</label>
                    <div class="col-sm-10 col-md-8">
                        <input type="radio" value=1 id="com-yes" name="AllowComment" checked>
                        <label for="com-yes">Yes</label>
                    </div>
                    <div class="col-sm-10 col-md-8">
                         <input type="radio" value="0" name="AllowComment"  id="com-no">
                        <label for="com-no">  No  </label>
                    </div>
                  
                </div>
                <!-- end allow commenting  -->

                <!-- start allow Ads section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label"> Allow ADs</label>
                    
                    <div class="col-sm-10 col-md-8">
                        <input type="radio" value=1 id="ad-yes" name="allowAd" checked>
                        <label for="ad-yes">Yes</label>
                    </div>
                    <div class="col-sm-10 col-md-8">
                       
                         <input type="radio" value="0" name="allowAd"  id="ad-no">
                        <label for="ad-no">  No  </label>
                    </div>
                </div>
                <!-- end allow commenting  -->
              
                <div class="form-group form-group-lg">
        
                    <div class="col-sm-2 col-sm-offset-2">
                        <input type="submit" class="btn btn-primary btn-block btn-lg"
                            value="Add Category">
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
              $order         = $_POST['order'];
              $comment       = $_POST['AllowComment'];
              $ads           = $_POST['allowAd'];
              $visibale      = $_POST['visibale'];
              $parent        = $_POST['parent'];
              if ($parent==0) {
                  $parent=NULL;
              }
            
      
              $formEditErorr=array();
      
      
            
              if( chechItem('name','categories',$name))
              {
                  $formEditErorr[]='this category name is exist try anther one ';   
              }
            
              if(empty($name))
              {
                  $formEditErorr[]='Name Can\'t be empty';
              }
            
              if(strlen($name)<4 && !empty($name))
              {
                  $formEditErorr[]=' Name Can\'t be less than 4 char';
              }
              
      
              if(sizeof($formEditErorr)>0){
                  foreach($formEditErorr as $error)
                  {
                      echo '<div class="alert alert-danger">'. $error."</div>";
                  }
      
                  redirect('','back',4);
      
      
              }
              else{
                  $stmt=$con->prepare("INSERT INTO categories( name,parent,description,ordering,visibility,allowComment,allowAds) 
                  VALUES (:Zname,:Zparent,:Zdesc,:Zorder,:Zvis,:Zcom,:Zads)");
                  $stmt->execute(array(
                      'Zname'=> $name ,
                      'Zparent'=>$parent,
                      'Zdesc'=>$desc,
      
                      'Zorder'=>$order,
                      'Zvis'=>$visibale,
                     'Zcom'=>$comment, 
                      'Zads'=>$ads,
                      
      
      
                  ));  
                  
                  $msg='<div class="alert alert-success"> New Category inserted successfuly</div>';
      
                  redirect($msg,'back',4);
              }
      
      
      
          }
      
      }
    elseif($do=='edit'){
    $cat_id=isset($_GET['cat_id'])&& is_numeric($_GET['cat_id'])?intval($_GET['cat_id']):0;
    
    $stmt=$con->prepare("   SELECT * FROM categories WHERE id=? LIMIT 1");
    $stmt->execute(array($cat_id));
    $cat=$stmt->fetch();
    $count=$stmt->rowCount();

    if($count>0)
        {?>
         <div class="container">
            <h1 class="text-center text-primary"> Edit Category</h1>
            <form action="?do=saveedit" method="post" class="form-horizontal">
                <input type="hidden" name="cat_id" value=<?=$cat_id?>>
               
                 <!-- start category name section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label"> Category Name</label>
                    <div class="col-sm-10 col-md-8">
                        <input type="text" class="form-control" name="name" value='<?=$cat["name"]?>' required="required">
                    </div>
                </div>
                <!-- start parent section -->
            
             <div class="form-group form-group-md">
                    <label for="" class="col-sm-2 control-label"> parent</label>
                    <div class="col-sm-10 col-md-8">
                        <select class="form-control" name="parent" id="">
                        <option value="0">None</option>
                        <?php 
                      

                        $categories=getDataWhere('categories','parent','0','name');
                        
                        foreach($categories as $Category)
                        {
                            echo "<option value='".$Category['id']."'";
                            if($Category['id']==$cat['parent'])
                            {
                                echo 'selected';
                            }
     
                            echo ">".$Category['name']."</option>"; 
                        }
     
     
                           ?>

                      ?>
                         
                        </select>
                    </div>
                </div>

                 <!-- start descreption section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-10 col-md-8">
                        <input type="text" class="form-control"value='<?=$cat["description"]?>' name="description">
                            
                    </div>
                </div>
                 <!-- start ordering section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label"> Order</label>
                    <div class="col-sm-10 col-md-8">
                        <input type="text" class="form-control" value='<?=$cat["ordering"]?>' name="order" placeholder="Number to ordering ">
                    </div>
                </div>
                 <!-- start visibality section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label"> visibale</label>
                    <div class="col-sm-10 col-md-8">
                       
                         <input type="radio" value="0" name="visibale"  id="vis-no" <?php if($cat["visibility"]==0){echo 'checked';}?> >
                        <label for="vis-no">  No  </label>
                    </div>
                    <div class="col-sm-10 col-md-8">
                        <input type="radio" value=1 id="vis-yes" <?php if($cat["visibility"]==1){echo 'checked';}?> name="visibale" >
                        <label for="vis-yes">Yes</label>
                    </div>
                </div>

                <!-- start allow comment section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label"> Allow Commenting</label>
                    <div class="col-sm-10 col-md-8">
                       
                         <input type="radio" value="0" <?php if($cat["allowComment"]==0){echo 'checked';}?> name="AllowComment"  id="com-no">
                        <label for="com-no">  No  </label>
                    </div>
                    <div class="col-sm-10 col-md-8">
                        <input type="radio" value=1 id="com-yes"<?php if($cat["allowComment"]==1){echo 'checked';}?>  name="AllowComment" >
                        <label for="com-yes">Yes</label>
                    </div>
                </div>
                <!-- end allow commenting  -->

                <!-- start allow Ads section -->
                <div class="form-group form-group-lg">
                    <label for="" class="col-sm-2 control-label"> Allow ADs</label>
                    <div class="col-sm-10 col-md-8">
                       
                         <input type="radio" value="0" <?php if($cat["allowAds"]==0){echo 'checked';}?> name="allowAd"  id="ad-no">
                        <label for="ad-no">  No  </label>
                    </div>
                    <div class="col-sm-10 col-md-8">
                        <input type="radio" value=1 id="ad-yes" <?php if($cat["allowAds"]==1){echo 'checked';}?> name="allowAd" >
                        <label for="ad-yes">Yes</label>
                    </div>
                </div>
                <!-- end allow commenting  -->
              
                <div class="form-group form-group-lg">
        
                    <div class="col-sm-2 col-sm-offset-2">
                        <input type="submit" class="btn btn-primary btn-block btn-lg"
                            value="Update Category">
                    </div>
                </div>
        
        
        
            </form>
        
        
        
        </div>
        
        
        <?php 
            
            
        }
    }
    elseif($do=='saveedit'){
        if($_SERVER['REQUEST_METHOD']=='POST')
        {
    
            $cat_id        = $_POST['cat_id'];
            $name          = $_POST['name'];
            $desc          = $_POST['description'];
            $order         = $_POST['order'];
            $comment       = $_POST['AllowComment'];
            $ads           = $_POST['allowAd'];
            $visibale      = $_POST['visibale'];
            $parent        = $_POST['parent'];
            if ($parent==0) {
                $parent=NULL;
            }
          
    
            $formEditErorr=array();
    
    
          
            if( chechItem('name','categories',$name,'id',$cat_id))
            {
                $formEditErorr[]='this category name is exist try anther one ';   
            }
          
            if(empty($name))
            {
                $formEditErorr[]='Name Cant be empty';
            }
          
            if(strlen($name)<4 && !empty($name))
            {
                $formEditErorr[]=' Name Cant be less than 4 char';
            }
            
    
            if(sizeof($formEditErorr)>0){
                foreach($formEditErorr as $error)
                {
                    echo '<div class="alert alert-danger">'. $error."</div>";
                }
    
                redirect('','back',4);
    
    
            }
            else{
              

                $stmt=$con->prepare("UPDATE categories SET name=?,parent=?,description=?,ordering=?,visibility=?,allowComment=?,allowAds=? WHERE id=?");
                 
                $stmt->execute(array($name ,$parent,$desc,$order,$visibale,$comment, $ads,$cat_id));  
                $msg='<div class="alert alert-success"> Category Updeted successfuly</div>';
        
        redirect($msg,'back',4);
                  }
                

            }
    
    
    
        }
    
   


    
        elseif($do=='delete')
        {
           $cat_id=isset($_GET['cat_id'])&& is_numeric($_GET['cat_id'])?intval($_GET['cat_id']):0;
           $stmt=$con->prepare("   SELECT * FROM categories WHERE id=? LIMIT 1");
           $stmt->execute(array($cat_id));
           $row=$stmt->fetch();
           $count=$stmt->rowCount();
           if($count>0){
               $stmt=$con->prepare("DELETE FROM categories WHERE id=:zid");
               $stmt->bindParam('zid',$cat_id);
               $stmt->execute();
               
               echo "<div class='alert alert-success'> ".$row['name']." deleted successfuly</div>";
               redirect('','back',3);
       
           }
           else
           {
               
               redirect('there is error','back',3);
           }
        }

 elseif($do=='activate')
 {
    
 }







        include $tmp."footer.php" ;