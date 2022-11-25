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
	
	$sql = "SELECT user_id, surname, given_name, status, balance FROM users WHERE user_id = '" . $_SESSION["user_id"] . "'";
		
	$credentials = mysqli_query($link, $sql);
		
	if (mysqli_num_rows($credentials) > 0)
	{
			
		while($row = mysqli_fetch_array($credentials))
		{
			
			$_SESSION["balance_float"] = $row["balance"];
				
			if ($row["balance"] < 0)
			{
					
				$_SESSION["user_balance"] = "-₱" . number_format(($row["balance"] * -1), 2, '.', ',');
					
			}
			elseif ($row["balance"] == 0)
			{
					
				$_SESSION["user_balance"] = "₱0.00";
					
			}
			elseif ($row["balance"] > 0)
			{
					
				$_SESSION["user_balance"] = "₱" . number_format($row["balance"], 2, '.', ',');
					
			}
			
		}
		
	}
	
	$book_code = $_GET["book_code"];
		
	$sql = "SELECT * FROM library_items WHERE book_code = '$book_code'";
	
	$item = mysqli_query($link, $sql);
	
	while($row = mysqli_fetch_array($item))
	{
	
		if ($row["price"] <= $_SESSION["balance_float"])
		{
		
			$sql = "UPDATE library_items SET availability = '0' WHERE book_code = '$book_code'";
			mysqli_query($link, $sql);
			
			$transaction_user_id = $_SESSION["user_id"];
			$transaction_amount = $row["price"] * -1;
			$transaction_book_code = $row["book_code"];
			$transaction_new_balance = $_SESSION["balance_float"] + $transaction_amount;
			
			$sql = "INSERT INTO transactions (user_id, amount, description, issued_by) VALUES ('$transaction_user_id', '$transaction_amount', 'Purchase of $book_code' , 'automated')";
			mysqli_query($link, $sql);
			
			$sql = "UPDATE users SET balance = '$transaction_new_balance' WHERE user_id = '$transaction_user_id'";
			mysqli_query($link, $sql);
			
			$sql = "INSERT INTO library_transactions (user_id, book_code) VALUES ('$transaction_user_id', '$transaction_book_code')";
			mysqli_query($link, $sql);
		
		}
	
	}
	
	header("location: purchases.php");
	exit;
		
?>