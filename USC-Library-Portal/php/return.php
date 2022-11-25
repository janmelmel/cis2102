<?php

	session_start();

	if ($_SESSION["loggedin"] !== true)
	{
	
		header("location: login.php");
		exit;
	
	}
	
	if ($_SESSION["user_status"] !== "admin")
	{
	
		header("location: dashboard.php");
		exit;
	
	}
	
	if ($_SERVER["REQUEST_METHOD"] == "POST")
	{
	
		require_once "config.php";
		
		$return_code = $_POST["return_code"];
		$return_notes = $_POST["return_notes"];
	
		$sql = 'UPDATE library_items SET availability = 1 WHERE book_code = "' . $return_code . '"';
		mysqli_query($link, $sql);
		
		$sql = 'UPDATE library_transactions SET return_notes = "' . $return_notes . '", timestamp_returned = CURRENT_TIMESTAMP, status = 3 WHERE book_code = "' . $return_code . '" && status = 2 ORDER BY timestamp_created DESC LIMIT 1'; 
		mysqli_query($link, $sql);
		
		$sql = 'SELECT user_id, timestamp_created, timestamp_returned, book_code FROM library_transactions WHERE book_code = "' . $return_code . '" ORDER BY timestamp_returned DESC LIMIT 1';
		$transaction_details = mysqli_query($link, $sql);
		
		while($row = mysqli_fetch_array($transaction_details))
		{
		
			$description = "Borrowing Fees for " . $return_code;
			
			$start_date = strtotime($row["timestamp_created"]);
			$end_date = strtotime($row["timestamp_returned"]);
			
			$difference_in_days = ceil(abs($end_date - $start_date) / 86400);
			
			$amount = $difference_in_days * -10;
		
			$sql = 'INSERT INTO transactions (user_id, amount, description, issued_by) VALUES ("' . $row["user_id"] . '", ' . $amount . ', "' . $description . '", "' . $_SESSION["user_id"] . '")';
			mysqli_query($link, $sql);
			
			$sql = 'UPDATE users SET balance = balance + ' . $amount . ' WHERE user_id = ' . $row["user_id"];
			mysqli_query($link, $sql);
		
		}
	
	}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>USC Library Portal</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/Banner-Heading-Image-images.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.11.1/baguetteBox.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Basic-icons.css">
    <link rel="stylesheet" href="assets/css/scroll-bar.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body style="background: #f3f3f2;">
    <nav class="navbar navbar-light navbar-expand-md">
        <div class="container-fluid"><a class="navbar-brand ms-auto" href="dashboard.php" style="font-weight: bold;">USC Library Portal (<span>admin</span>)</a><button data-bs-toggle="collapse" class="navbar-toggler ms-auto" data-bs-target="#navcol-2"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-2">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item" style="text-align: center;"><a class="nav-link" href="add-item.php">Add Item</a></li>
                    <li class="nav-item" style="text-align: center;"><a class="nav-link" href="top-up.php">Top Up</a></li>
                    <li class="nav-item" style="text-align: center;"><a class="nav-link" href="claim.php">Claim</a></li>
                    <li class="nav-item" style="text-align: center;"><a class="nav-link" href="return.php">Return</a></li>
                </ul>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="logout.php" style="text-align: center;">Log Out</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="position-relative py-4 py-xl-5" style="background: #164428;">
        <div class="container">
            <div class="row mb-5">
                <div class="col-md-8 col-xl-6 text-center mx-auto">
                    <h1 style="color: #f3f3f2;font-weight: bold;">Return</h1>
                    <p style="color: #f3f3f2;">Please ensure that all information provided is true and correct.</p>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-md-6 col-xl-4">
                    <div class="card mb-5" style="background: #f3f3f2;">
                        <div class="card-body d-flex flex-column align-items-center">
                            <div class="bs-icon-xl bs-icon-circle bs-icon-primary bs-icon my-4" style="background: rgb(16,174,77);"><svg xmlns="http://www.w3.org/2000/svg" viewBox="-64 0 512 512" width="1em" height="1em" fill="currentColor">
                                    <!--! Font Awesome Free 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. -->
                                    <path d="M176 32C244.4 32 303.7 71.01 332.8 128H352C369.7 128 384 142.3 384 160C384 177.7 369.7 192 352 192H351.3C351.8 197.3 352 202.6 352 208C352 213.4 351.8 218.7 351.3 224H352C369.7 224 384 238.3 384 256C384 273.7 369.7 288 352 288H332.8C303.7 344.1 244.4 384 176 384H96V448C96 465.7 81.67 480 64 480C46.33 480 32 465.7 32 448V288C14.33 288 0 273.7 0 256C0 238.3 14.33 224 32 224V192C14.33 192 0 177.7 0 160C0 142.3 14.33 128 32 128V64C32 46.33 46.33 32 64 32H176zM254.4 128C234.2 108.2 206.5 96 176 96H96V128H254.4zM96 192V224H286.9C287.6 218.8 288 213.4 288 208C288 202.6 287.6 197.2 286.9 192H96zM254.4 288H96V320H176C206.5 320 234.2 307.8 254.4 288z"></path>
                                </svg></div>
                            <form class="text-center" method="post">
                                <div class="mb-3"><input class="form-control form-control-lg" type="text" name="return_code" required="" placeholder="Book Code" style="text-align: center;" autofocus=""></div>
                                <div class="mb-3"><textarea class="form-control form-control-lg" placeholder="Notes" name="return_notes" autocomplete="off"></textarea></div>
                                <div class="mb-3"><button class="btn btn-primary btn-lg d-block w-100" type="submit" style="background: #10ae4d;border-style: none;">Return</button></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer>
        <div class="container py-4 py-lg-5">
            <div class="row justify-content-center">
                <div class="col-sm-4 col-md-3 text-center text-lg-start d-flex flex-column item">
                    <h3 class="fs-6" style="font-weight: bold;">University of San Carlos</h3>
                    <ul class="list-unstyled">
                        <li><a class="link-secondary" href="https://www.usc.edu.ph/about-usc" style="text-decoration: none;">About USC</a></li>
                        <li><a class="link-secondary" href="https://www.usc.edu.ph/academics" style="text-decoration: none;">Academics</a></li>
                        <li><a class="link-secondary" href="https://www.usc.edu.ph/admission" style="text-decoration: none;">Admission</a></li>
                        <li><a class="link-secondary" href="https://www.usc.edu.ph/research" style="text-decoration: none;">Research</a></li>
                        <li><a class="link-secondary" href="https://www.usc.edu.ph/extension" style="text-decoration: none;">Extension</a></li>
                        <li><a class="link-secondary" href="https://www.usc.edu.ph/give-to-usc" style="text-decoration: none;">Give to USC</a></li>
                    </ul>
                </div>
                <div class="col-sm-4 col-md-3 text-center text-lg-start d-flex flex-column item">
                    <h3 class="fs-6" style="font-weight: bold;">USC Library Portal</h3>
                    <ul class="list-unstyled">
                        <li><a class="link-secondary" href="#" style="text-decoration: none;">For Students</a></li>
                        <li><a class="link-secondary" href="#" style="text-decoration: none;">For Instructors</a></li>
                        <li><a class="link-secondary" href="#" style="text-decoration: none;">For Administrators</a></li>
                    </ul>
                </div>
                <div class="col-sm-4 col-md-3 text-center text-lg-start d-flex flex-column item">
                    <h3 class="fs-6" style="font-weight: bold;">Affiliate Sites</h3>
                    <ul class="list-unstyled">
                        <li><a class="link-secondary" href="https://www.usc.edu.ph/" style="text-decoration: none;">University Website</a></li>
                        <li><a class="link-secondary" href="https://ismis.usc.edu.ph/Account/Login?ReturnUrl=%2F" style="text-decoration: none;">ISMIS 2.0</a></li>
                        <li><a class="link-secondary" href="https://www.facebook.com/usccebu" style="text-decoration: none;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="-32 0 512 512" width="1em" height="1em" fill="currentColor">
                                    <!--! Font Awesome Free 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. -->
                                    <path d="M400 32H48A48 48 0 0 0 0 80v352a48 48 0 0 0 48 48h137.25V327.69h-63V256h63v-54.64c0-62.15 37-96.48 93.67-96.48 27.14 0 55.52 4.84 55.52 4.84v61h-31.27c-30.81 0-40.42 19.12-40.42 38.73V256h68.78l-11 71.69h-57.78V480H400a48 48 0 0 0 48-48V80a48 48 0 0 0-48-48z"></path>
                                </svg>&nbsp;Facebook</a></li>
                        <li><a class="link-secondary" href="https://www.instagram.com/uscphilippines/" style="text-decoration: none;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="-32 0 512 512" width="1em" height="1em" fill="currentColor">
                                    <!--! Font Awesome Free 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. -->
                                    <path d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"></path>
                                </svg>&nbsp;Instagram</a></li>
                        <li><a class="link-secondary" href="https://twitter.com/uscphilippines" style="text-decoration: none;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="1em" height="1em" fill="currentColor">
                                    <!--! Font Awesome Free 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. -->
                                    <path d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z"></path>
                                </svg>&nbsp;Twitter</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 text-center text-lg-start d-flex flex-column align-items-center order-first align-items-lg-start order-lg-last item social">
                    <div class="fw-bold d-flex align-items-center mb-2"><span style="font-weight: bold;color: rgb(33, 37, 41);">University of San Carlos - Library Portal</span></div>
                    <p class="text-muted copyright">SCIENTIA, VIRTUS et DEVOTIO</p>
                </div>
            </div>
            <hr>
            <div class="d-flex justify-content-between align-items-center pt-3">
                <p class="text-muted m-auto mb-0">Copyright © 2022. Made by mikaelvincent.<br></p>
            </div>
        </div>
    </footer>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.11.1/baguetteBox.min.js"></script>
    <script src="assets/js/Lightbox-Gallery.js"></script>
</body>

</html>