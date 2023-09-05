<?php
$conn= new mysqli("localhost", "root", "", "CupOjoe");

if (!$conn) {

die("Connection failed: " . mysqli_connect_error());

}
if(isset($_GET['item_id'])){
$id=mysqli_real_escape_string($conn,$_GET['item_id']);

$n=$_POST['textarea-n'];
$d=$_POST['textarea-b'];
$l=$_POST['stars'];

$sql = "INSERT INTO Review (ID,item_id,name,body,rating) VALUES (NULL,'".$id."','".$_POST['textarea-n']."','".$_POST['textarea-b']."','".$_POST['stars']."')";
$r=mysqli_query($conn,$sql);
if ($r) {

header('location:Edit3.php');

} else {

echo "Error updating record: " . $sql . "<br>" .mysqli_error($conn); 
}
//}
}
?>
