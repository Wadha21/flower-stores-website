

<?php

$mysqli = new mysqli("localhost", "root", "", "CupOjoe");


 // Check connection
 
 
 
if($mysqli === false){
    die("ERROR: Could not connect. " . $mysqli->connect_error);
}


$sql = " DELETE FROM Item (Name,description,categoryID,ID,Logoo,overall_rating) VALUES ('".$_POST['name']."','".$_POST['description']."',NULL,NULL,'".$_POST['logo']."',NULL)";





// Close connection
$mysqli->close();

?>

