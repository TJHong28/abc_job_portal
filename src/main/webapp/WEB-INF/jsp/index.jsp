<!DOCTYPE HTML>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>ABC Job Portal</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="assets/css/bootstrap.css" />


</head>

<body>
    <!--Nav-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">ABC Job Portal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarColor02">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="/">
                            Home
                            <span class="visually-hidden">(current)</span>
                        </a>
                    </li>
                </ul>
                <div class="col-12-medium">
                    <a class="btn btn-secondary" href="/login">Login</a>
                    <a class="btn btn-success" href="/signup">Sign Up</a>
                </div>
            </div>
        </div>
    </nav>

    <!--main-->
    <main>
        <div class="grid-container">
            <div class="header"><h1>Welcome To ABC Job Portal</h1></div>
            <div class="main">
                <img src="images/LETS-GET-STARTED-arrows.png" class="center">
                <div class="button-middle">
                    <a class="btn btn-lg btn-primary" href="/signup">Let's Get Started</a>
                </div>
            </div>

            <br>
            <br>
            <br>

            <!--footer-->
            <div class="footer"><h6> © 2022 All rights reserved by ABC Job Portal</h6></div>
        </div>
    </main>



    <!--script-->
    <script src="assets/js/bootstrap.min.js"></script>
</body>
</html>