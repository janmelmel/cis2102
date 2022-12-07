<?php

	if (empty($_GET["book_code"]))
	{
		
		header("location: dashboard.php");
		exit;
		
	}
	
	session_start();
	
	if ($_SESSION["loggedin"] !== true)
	{
	
		header("location: login.php");
		exit;
	
	}
	
	require_once "config.php";
	
	$book_code = $_GET["book_code"];
		
	$sql = "SELECT * FROM library_items WHERE book_code = '$book_code'";
	$item = mysqli_query($link, $sql);
	
	while($row = mysqli_fetch_array($item))
	{
		
		$sql = "UPDATE library_items SET availability = '0' WHERE book_code = '$book_code'";
		mysqli_query($link, $sql);
			
		$transaction_user_id = $_SESSION["user_id"];
		$transaction_book_code = $row["book_code"];
			
		$sql = "INSERT INTO library_transactions (user_id, book_code, is_borrow) VALUES ('$transaction_user_id', '$transaction_book_code', 1)";
		mysqli_query($link, $sql);
	
	}
	
	header("location: purchases.php");
	exit;
		
?>