<?php






function getData($table,$orderBy,$order='ASC',$limit=null)
{
global $con;

$limit = ($limit!=null) ? ' LIMIT '.$limit :'' ;

$stm=$con->prepare("SELECT * from $table ORDER BY $orderBy $order $limit ");
$stm->execute();
$rows=$stm->fetchAll();
return $rows;

}
function getDataWhere($table,$where,$value,$orderBy,$order='DESC')
{
global $con;
if ($value==NULL)
{
    $where= $where .' IS NULL'; 
}
else 
{
    $where =$where .' = '.$value;
}
$stm=$con->prepare("SELECT * 
                    from $table 
                    WHERE $where
                    ORDER BY $orderBy $order  ");
$stm->execute();
$rows=$stm->fetchAll();
return $rows;

}

function getuser($user_id)
{
    global $con;
    $stmt=$con->prepare(" SELECT *FROM users  WHERE user_id=?");
    $stmt->execute(array($user_id));
    $row=$stmt->fetch();
    return $row;

}


function getItems($where ,$value,$approve=null)
{
global $con;
$quiry='';
if ($approve !=null) {
    $quiry='AND approve = '.$approve;
}
$stm=$con->prepare("    SELECT items.* ,users.userName ,categories.name as catName
                        FROM items
                        INNER JOIN users on items.user_id=users.user_id
                        INNER JOIN categories on items.cat_id=categories.id
                        WHERE $where=? $quiry 
                        ORDER BY id DESC  ");
$stm->execute(array($value));
$rows=$stm->fetchAll();
return $rows;

}

function getcomments($item_id)
{
global $con;
$stmt=$con->prepare("   SELECT comments.* ,users.userName ,users.avatar
                        FROM comments
                        INNER JOIN users on comments.user_id=users.user_id
                        WHERE item_id=?
                        ORDER BY id DESC  ");

$stmt->execute(array($item_id));
$rows=$stmt->fetchAll();
return $rows;
}



function getUserPurchases($user_id)
{
global $con;
$stmt=$con->prepare(" SELECT items.*,categories.name AS catName,users.userName 
FROM items 
INNER JOIN users ON users.user_id=items.user_id
INNER JOIN categories ON categories.id=items.cat_id
INNER JOIN purchases ON purchases.item_id=items.id
WHERE purchases.user_id=? 
ORDER BY purchases.id DESC");

$stmt->execute(array($user_id));
$rows=$stmt->fetchAll();
return $rows;
}



 function getTitle()
{
    global $pageTitle;
    if(isset($pageTitle))
    {
        return $pageTitle.'|Ecomerce' ;

    }
    else
    {
        return  "Ecomerce|";
    }
    
}
function redirect($errorMessa="there Is Errror",$url=null,$second=3)
{  
    $link="";
    if($url==null||$url==strtolower('home')||$url=='index.php')
    {
        $url='index.php';
        $link="Home Page";
    }
    else if($url=="back"){
        if(isset($_SERVER['HTTP_REFERER']) && $_SERVER['HTTP_REFERER']!=''){
            $url=$_SERVER['HTTP_REFERER'];
            $link="previous Page"; 
        }
        else
        {
            $url='index.php';  
            $link="Home Page"; 
        }

        
    }
    else{
            $link="next Page";
        }

    echo $errorMessa;
    echo "<div class='alert alert-warning'> you will redirect to ".$link." after .".$second." Seconds</div>";
    header("refresh:$second;url=".$url);
}




function rrmdir($dir) {
    if (is_dir($dir)) {
      $objects = scandir($dir);
      foreach ($objects as $object) {
        if ($object != "." && $object != "..") {
          if (filetype($dir."/".$object) == "dir"){
             rrmdir($dir."/".$object);
          }else{ 
             unlink($dir."/".$object);
          }
        }
      }
      reset($objects);
      rmdir($dir);
   }
 }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





/*
return if this value exist or not in table 

*/

function chechExist($select,$table,$value,$id=null,$idValue=null)
{  
   $quiry=' ';
    if($id !=null)
    {
      $quiry='AND '.$id.' != '.$idValue ;
    }
global $con;
$stm=$con->prepare("SELECT $select from $table WHERE $select=? $quiry LIMIT 1");
$stm->execute(array($value));
$count=$stm->rowCount();

return $count;

}




function countColumn($item,$table,$value=null)
{
global $con;

$quiry='';
if($value !==null)
{
$quiry="WHERE ".$item.' = '.$value;
}
$stm2=$con->prepare("SELECT COUNT($item) FROM $table $quiry"); 
  $stm2->execute();
return $stm2->fetchColumn();

}



