<?php
/

	// Create connection
	$mysqli = new mysqli("localhost", "root", "", "CupOjoe");

	
if($mysqli === false){
    die("ERROR: Could not connect. " . $mysqli->connect_error);
}

	
	$success_msg='';$title_err="";
	
	
	$id=$_GET['id'];
	$name ; $logo ; $description ; $categoryID;
	
	$sql = "SELECT  * FROM item where id =".$id;
	$result = $mysqli >query($sql);
	if ($result->num_rows > 0) {
		while($row = $result->fetch_assoc()) {
			$Name=$row['Name'];
			$logoo=$row['logoo'];
			$description=$row['description'];
			$categoryID=$row['categoryID'];
		}
	} 

	$image=$logoo;
	
	//******** code for update
	if($_SERVER["REQUEST_METHOD"] == "POST") {
		
	    if($_FILES["image"]["name"] != ""){  
			
		   //  Validate upload file
			$target_dir = "../uploads/";
			$target_file = $target_dir . basename($_FILES["image"]["Name"]);
			$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

			// set image name
			$image=time().".".$imageFileType;
			$filepath = "../uploads/" . $image;
			move_uploaded_file($_FILES["image"]["tmp_name"], $filepath);
			
			//**** delete old image
			 $old_image=$logoo;
			 $filepath = "../uploads/".$old_image;
			 //echo ($filepath);
			 if (file_exists($filepath)) {
				unlink($filepath);
			 }
		}
        // sql statment
		 $name =$_POST['name'];
		 $description =$_POST['description'];
		 $categoryID =$_POST['category'];

		
         $sql = "update item set name='$name',
							     logo='$image',
								 description='$description',
								 categoryID='$categoryID' where id=".$id;
				
			//echo $sql; exit;
         if ($conn->query($sql) === TRUE) {
             $success_msg = "<span style='color: green;'>Record Updated successfully</span>";
         } else {
             $error_msg = "<span style='color: red;'>Something went wrong. Please try again later.</span>";
         }

         //$conn->close();
    }

 ?>