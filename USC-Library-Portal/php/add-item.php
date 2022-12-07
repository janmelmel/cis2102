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

		$item_book_code = $_POST["item_book_code"];
		$item_title = htmlentities($_POST["item_title"], ENT_QUOTES, 'UTF-8');
		$item_authors = htmlentities($_POST["item_authors"], ENT_QUOTES, 'UTF-8');
		$item_date_published = $_POST["item_date_published"];
		$item_description = htmlentities($_POST["item_description"], ENT_QUOTES, 'UTF-8');
		$item_price = $_POST["item_price"];
		
		$sql = "SELECT book_code FROM library_items where book_code = '$item_book_code'";
		
		$check = mysqli_query($link, $sql);
		
		if (mysqli_num_rows($check) == 0)
		{

			$sql = "INSERT INTO `library_items` (`book_code`, `title`, `authors`, `year_published`, `description`, `price`, `availability`) VALUES ('$item_book_code', '$item_title', '$item_authors', '$item_date_published', '$item_description', '$item_price', '1')";
		
			mysqli_query($link, $sql);
			
		}
		
		$file_name = $_FILES['item_image']['name'];
		$file_tmp =$_FILES['item_image']['tmp_name'];
		$file_extension = pathinfo($file_name, PATHINFO_EXTENSION);
		
		$file_name = "$item_book_code." . "$file_extension";
		
		move_uploaded_file($file_tmp,"assets/img/".$file_name);
		
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
        <div class="container-fluid"><a class="navbar-brand ms-auto" href="dashboard-admin.php" style="font-weight: bold;">USC Library Portal (<span>admin</span>)</a><button data-bs-toggle="collapse" class="navbar-toggler ms-auto" data-bs-target="#navcol-2"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
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
                    <h1 style="color: #f3f3f2;font-weight: bold;">Add Item</h1>
                    <p class="w-lg-50" style="color: #f3f3f2;">Please ensure that all information provided is true and correct.</p>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col">
                    <div class="card mb-5" style="background: #f3f3f2;">
                        <div class="card-body d-flex flex-column align-items-center">
                            <div class="bs-icon-xl bs-icon-circle bs-icon-primary bs-icon my-4" style="background: #10ae4d;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 -32 576 576" width="1em" height="1em" fill="currentColor">
                                    <!--! Font Awesome Free 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License) Copyright 2022 Fonticons, Inc. -->
                                    <path d="M144.3 32.04C106.9 31.29 63.7 41.44 18.6 61.29c-11.42 5.026-18.6 16.67-18.6 29.15l0 357.6c0 11.55 11.99 19.55 22.45 14.65c126.3-59.14 219.8 11 223.8 14.01C249.1 478.9 252.5 480 256 480c12.4 0 16-11.38 16-15.98V80.04c0-5.203-2.531-10.08-6.781-13.08C263.3 65.58 216.7 33.35 144.3 32.04zM557.4 61.29c-45.11-19.79-88.48-29.61-125.7-29.26c-72.44 1.312-118.1 33.55-120.9 34.92C306.5 69.96 304 74.83 304 80.04v383.1C304 468.4 307.5 480 320 480c3.484 0 6.938-1.125 9.781-3.328c3.925-3.018 97.44-73.16 223.8-14c10.46 4.896 22.45-3.105 22.45-14.65l.0001-357.6C575.1 77.97 568.8 66.31 557.4 61.29z"></path>
                                </svg></div>
                            <form class="text-center" method="post" style="min-width: 80%;max-width: 90%;" enctype="multipart/form-data">
                                <div class="mb-3"><input class="form-control form-control-lg" type="text" name="item_book_code" placeholder="Book Code" style="text-align: center;" autocomplete="off" autofocus="" required=""></div>
                                <div class="mb-3"><input class="form-control form-control-lg" type="text" name="item_title" placeholder="Title" style="text-align: center;" autocomplete="off" autofocus="" required=""></div>
                                <div class="mb-3"><input class="form-control form-control-lg" type="text" name="item_authors" placeholder="Author/s or Publisher" style="text-align: center;" autocomplete="off" required=""></div>
                                <div class="mb-3"><input class="form-control form-control-lg" type="number" name="item_date_published" required="" placeholder="Date Published" style="text-align: center;"></div>
                                <div class="mb-3"><textarea class="form-control form-control-lg" name="item_description" placeholder="Description" rows="10" autocomplete="off" required=""></textarea></div>
								<div class="mb-3"><input class="form-control form-control-lg" type="number" name="item_price" required placeholder="Price (₱)" style="text-align: center;" /></div>
								<div class="mb-3"><input class="form-control form-control-lg" type="file" required accept="image/*" name="item_image" /></div>
                                <div class="mb-3"><button class="btn btn-primary btn-lg d-block w-100" type="submit" style="background: #10ae4d;border-style: none;">Add Item</button></div>
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