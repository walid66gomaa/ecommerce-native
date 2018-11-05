<?php


function getData($table,$orderBy,$order='ASC')
{
global $con;
$stm=$con->prepare("SELECT * from $table ORDER BY $orderBy $order  ");
$stm->execute();
$rows=$stm->fetchAll();
return $rows;

}
function getDataWhere($table,$where,$value,$orderBy,$order='DESC')
{
global $con;
$stm=$con->prepare("SELECT * 
                    from $table 
                    WHERE $where=$value 
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
    else{
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

    echo $errorMessa;
    echo "<div class='alert alert-warning'> you will redirect to ".$link." after .".$second." Seconds</div>";
    header("refresh:$second;url=".$url);
}

/*
return if this value exist or not in table 

*/

function chechItem($select,$table,$value,$id=null,$idValue=null)
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



