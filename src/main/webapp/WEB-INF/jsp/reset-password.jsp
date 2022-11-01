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
        <form class="mt-5" action="/reset-password" method="post">
            <input type="hidden" name="${_csrf.parameterName}"
                                value="${_csrf.token}" />
            
                <div class="card" style="width: 20rem; margin: auto;">
                    <div class="card-body text-center">
                        <h4 class="mb-4">Reset Password</h4>
                        <p modelattribute="email">Your email (${email}) is verified. Please enter your new password.<p>
                        <input type="hidden" name="email" value="${email}">
                        <div class="form-group mt-2 mb-2">
                            <label for="password" class="visually-hidden">Password</label>
                            <input type="password" name="password" id="password" class="form-control" placeholder="Password" required autofocus>
                        </div>
                        <div class="form-group mb-4">
                            <label for="cpassword" class="visually-hidden">confirmed password</label>
                            <input type="password" name="cpassword" id="cpassword" class="form-control" placeholder="Confirm Password" required autofocus>
                        </div>
                        
                        <div class="form-group d-grid gap-2">
                            <button type="submit" class="btn btn-primary w-100"> Send</button>
                            
                            <c:if test="${error_warning != null}">
                            <div class="alert alert-warning" role="alert">
                                  ${error_warning}
                            </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </form>

        <br>
        <br>
        <br>
        <br>
        <br>

        <!--footer-->
        <div class="footer"><h6> © 2022 All rights reserved by ABC Job Portal</h6></div>


    </main>



    <!--script-->
    <script src="assets/js/bootstrap.min.js"></script>
</body>
</html>