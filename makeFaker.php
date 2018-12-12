<?php
 
    $pageTitle='faker';
    include"init.php" ;




    $faker = Faker\Factory::create();

  
    for ($i=0; $i < 50; $i++) {
      echo $faker->name, "<img src='".$faker->unique()->image('layout/images/food', '600', '600', 'food')."'> <br>";
 
    }
 
 
      function fackeruser($num)
 { 
    global $con ,$faker;
    for ($i=0; $i < 20; $i++) {
      
     

	$stmt=$con->prepare("INSERT INTO users( userName,fullName,email,password,date,regstatus) 
            VALUES (:Zname,:Zfull,:Zemail,:Zpass,now(),1)");
			$stmt->execute(array(
				'Zname'=> $faker->unique()->userName,
				'Zfull'=> $faker->name,
                
				'Zemail'=>$faker->unique()->freeEmail,
				'Zpass'=>sha1( '1234')


            ));  


 }
 }


 function fackeritems($num)
 { 
    global $con ,$faker;

    $stm=$con->prepare("SELECT user_id from users  ");
$stm->execute();
$user=$stm->fetchAll();
echo array_rand($user)."--";

    $stm2=$con->prepare("SELECT id from categories  ");
$stm2->execute();
$categories=$stm2->fetchAll();

echo $categories[array_rand($categories)][0];
     for ($i=0; $i < $num; $i++) {
      
     

    $stmt=$con->prepare("INSERT INTO items( name,description,price,countryMade,status,addDate,user_id,cat_id) 
    VALUES (:Zname,:Zdesc,:Zprice,:Zcountry,:Zstatus,now(),:Zuser,:Zcat)");
    $stmt->execute(array(
        'Zname'=> $faker->word ,
        
        'Zdesc'=>$faker->paragraph,
        'Zprice'=>$faker->numberBetween(1,100000),
        'Zcountry'=>$faker->country,
       'Zstatus'=>$faker->numberBetween(1,4),
       'Zuser'=>$user[array_rand($user)][0],
       'Zcat'=>$categories[array_rand($categories)][0]


    ));  


 }
 }
 function fackercomments($num)
 { 
    global $con ,$faker;

    $stm=$con->prepare("SELECT user_id from users  ");
$stm->execute();
$user=$stm->fetchAll();


    $stm2=$con->prepare("SELECT id from items  ");
$stm2->execute();
$items=$stm2->fetchAll();


     for ($i=0; $i < $num; $i++) {
      
     

        $stm=$con->prepare("INSERT INTO comments(body,item_id,user_id,status,date)
        VALUES(?,?,?,0,now())") ;
$stm->execute(array(
    $faker->paragraph,
    $items[array_rand($items)][0],
    $user[array_rand($user)][0]

                
));


 }
 }

 function fackerbuy($num)
 { 
    global $con ,$faker;

    $stm=$con->prepare("SELECT user_id from users  ");
$stm->execute();
$user=$stm->fetchAll();


    $stm2=$con->prepare("SELECT id from items  ");
$stm2->execute();
$items=$stm2->fetchAll();


     for ($i=0; $i < $num; $i++) {
      
     

        $stmt=$con->prepare("INSERT INTO purchases( item_id,user_id) VALUES (:Zitem,:Zuser)");
        $stmt->execute(array(
           'Zitem'=>$item_id,
           'Zuser'=>$sessionUserId 	
  
  
        ));   


 }
 }

        include $tmp."footer.php" ;
        ?>