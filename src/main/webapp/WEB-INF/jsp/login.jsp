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
        <form class="mt-5" action="/login" method="post">
            <input type="hidden" name="${_csrf.parameterName}"
                            value="${_csrf.token}" />
                            
            <div class="card" style="width: 20rem; margin: auto;">
                <div class="card-body text-center">
                    <h1 class="mb-4">Sign in</h1>
                    <div class="form-group mt-2">
                        <label for="email" class="visually-hidden">email</label>
                        <input type="email" name="email" class="form-control" placeholder="Email" required autofocus>
                    </div>
                    <div class="form-group mt-2">
                        <label for="password" class="visually-hidden">password</label>
                        <input type="password" name="password" class="form-control" placeholder="Password">
                    </div>
                    <div class="form-group mt-3 mb-4">
                        <label>
                            <input type="checkbox" id="remember-me"> Remember me
                        </lael>
                    </div>
                    <div class="form-group d-grid gap-2">
                        <button type="submit" class="btn btn-lg btn-primary"> Sign in</button>
                        <a href="/forgot-password" class="text-primary">Forgot your password?</a>
                    </div>
                </div>
            </div>
        </form>

        <br>
        <br>
        <br>
        <br>
        <br>




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
</body>
</html>