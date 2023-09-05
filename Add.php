

<?php

$mysqli = new mysqli("localhost", "root", "", "CupOjoe");


 // Check connection
 
 
 
if($mysqli === false){
    die("ERROR: Could not connect. " . $mysqli->connect_error);
}


$sql = "INSERT INTO Item (Name,description,categoryID,ID,Logoo,overall_rating) VALUES ('".$_POST['name']."','".$_POST['description']."',NULL,NULL,'".$_POST['logo']."',NULL)";




if($mysqli->query($sql) === true){
    echo "Records inserted successfully.";
} else{
    echo "ERROR: Could not able to execute $sql. " . $mysqli->error;
}
 
// Close connection
$mysqli->close();

?>

