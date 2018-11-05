<?php
session_start();

if(! isset($_SESSION['userName']))
{
header('location:index.php');
   exit();

}
  $pageTitle='DashBord';
  include "init.php";
  
  ?>




  <div class="container home-stats text-center">
     <h1><i class="fa fa-dashboard" aria-hidden="true"></i> DashBoard</h1>  
     <div class="row">
       <div class="col-md-3">
          <div class="stat st-members">total Members 
          <span><a href="member.php"><?=countColumn('user_id','users')?></a></span>
          </div>
          
       </div>
       <div class="col-md-3">
          <div class="stat st-pending ">pending Members
          <span><a href="member.php?do=manage&pending=0"><?=countColumn('regStatus','users','0')?></a></span>
          </div>
         
       </div>
       <div class="col-md-3">
          <div class="stat st-items">Total Items
          <span><a href="items.php?do=manage"><?=countColumn('id','items')?></a></span>
          </div>
          
       </div>
       <div class="col-md-3">
          <div class="stat st-comments">Total Comments
           <span>3456</span>
          </div>
         
       </div>
     </div>
  </div>

  <div class="container lates">
    <div class="row">
      <div class="col-md-5">
          <div class="panel panel-default">
            <div class="panel-heading">
<i class="fa fa-user" aria-hidden="true"></i> Latest 5 Register Users
            </div>
            <div class="panel-body">
            <ul class="list-unstyled list-group">
              <?php 
             $latestUsers = getLatest('users','user_id',5);
             foreach( $latestUsers as $user)
             {
             
               echo "<li class='list-group-item list-group-item-heading '>". $user['userName'].
                " <a title='edit Member' class='btn btn-success pull-right' href='member.php?do=edit&user_id=".$user['user_id'].
                "'><i class='fa fa-edit'></i></a>";

                if($user['regStatus']==0){
                  echo '<a title="activate" href="member.php?do=activate&user_id='. $user['user_id'] .'" class="btn btn-info pull-right"><i class=" fa fa-lightbulb-o "> </i>  
                  </a>'; 
                }

                echo "</li>";
             }
              ?>
             </ul> 
            </div>

          </div>
      </div> 
      <div class="col-md-5">
          <div class="panel panel-default">
            <div class="panel-heading">
<i class="fa fa-tag" aria-hidden="true"></i> Latest Item Added
            </div>
            <div class="panel-body">
            <ul class="list-unstyled list-group">
              <?php 
             $latestItems = getLatest('items','id',5);
             foreach( $latestItems as $item)
             {
             
               echo "<li class='list-group-item list-group-item-heading '>". $item['name'].
                " <a title='edit item' class='btn btn-success pull-right' href='items.php?do=edit&item_id=".$item['id'].
                "'><i class='fa fa-edit'></i></a>";

                if($item['approve']==0){
                  echo '<a title="approve" href="items.php?do=approve&item_id='. $item['id'] .'" class="btn btn-info pull-right"><i class=" fa fa-lightbulb-o "> </i>  
                  </a>'; 
                }

                echo "</li>";
             }
              ?>
             </ul> 
            </div>

          </div>
      </div> 

    </div>
  </div>





  <?php
   include $tmp."footer.php"; 