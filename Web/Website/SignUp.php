<?php 
session_start();

	include("connection.php");
	include("functions.php");


	if($_SERVER['REQUEST_METHOD'] == "POST")
	{
		//something was posted
		$firstname = $_POST['firstname'];
		$lastname = $_POST['lastname'];
		$contact = $_POST['contact'];
		$email =  $_POST['email'];
		$username = $_POST['username'];
		$password = $_POST['password'];
		

		if(!empty($username) && !empty($password) && !is_numeric($username))
		{

	
			$query = "INSERT into Customer (Customer_FirstName, Customer_LastName, Customer_ContactNumber, Customer_Email, Customer_Username,Customer_Password) 
			VALUES ('$firstname','$lastname','$contact','$email','$username','$password')";

			mysqli_query($con, $query);

			header("Location: login.php");
			die;
		}else
		{
			echo "Please enter some valid information!";
		}
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Core CSS -->
    <link rel="stylesheet" href="signup.css">
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;500&display=swap" rel="stylesheet"> 
    <title>SignIn</title>
</head>
<body>
    <div class="mainParent">
        <div id="signupInputForms">
            <div class="HeaderContainer">
                <h1 id="Header">SIGN UP</h1>
            </div>
            <form action="signup.php" method="POST">
                <label for="name">FIRST NAME</label>
                    <input type="text" name="firstname" required id="in">
                <label for="name">LAST NAME</label>
                    <input type="text" name="lastname" required id="in">
                <label for="name">USER NAME</label>
                    <input type="text" name="username" required id="in">
                <label for="email">EMAIL</label>
                    <input type="email" name="email"  required id="in">
                <label for="password">PASSWORD</label>
                    <input type="password" name="password"  required id="in">
                <!-- <label for="confirmPassword">CONFIRM</label>
                    <input type="password" name="confirmPassword" required id="in"> -->
                <label for="contact">CONTACTS</label>
                    <input type="text" name="contact"  required id="in">
                <input type="submit" name="submit" value="SIGN UP" id="accepts" id="in">
                <p id="click">Already a member? Click here <a href="login.php">Sign in</a></p><br>
            </form>
        </div>
    </div>
</body>
</html>