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
        
    <div class="d-flex align-items-center justify-content-center vh-100">
        <div class="text-center">
            <p class="fs-3">Thank you for register with us.</p>
            <p class="lead">Please login using our sign in page. You will be re-direct to sign page in <span id="count">5</span></p>
            <p><a href="/stores" class="btn btn-primary">Sign In</a></p>
        </div>
    </div>
    </main>

     <!--footer-->
     <footer class="py-5 bg-light text-muted">
        <div class="container">
          <div class="row">
          <div class="col-8 d-flex justify-content-start">
            <span>&copy; 2022 All rights reserved by ABC Job Portal
              </span>
          </div>
      
           
          </div>
        </div>
      </footer>


    <!--script-->
    <script src="assets/js/bootstrap.min.js"></script>
    <script>
    	let counter = +document.getElementById('count').innerText;
    	let count = counter - 1;
    	
    	setInterval(() => {
         document.getElementById('count').textContent = count;
    		count--;
    		if(count < 1) location.replace('http://localhost:8080/');
    	}, 1000);
    </script>
</body>
</html>