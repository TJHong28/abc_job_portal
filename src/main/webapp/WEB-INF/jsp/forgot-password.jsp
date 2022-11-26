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
        <form class="mt-5" action="/forgot-password" method="post">
            <input type="hidden" name="${_csrf.parameterName}"
                                value="${_csrf.token}" />
            
                <div class="card" style="width: 20rem; margin: auto;">
                    <div class="card-body text-center">
                        <h4 class="mb-4">Forgot Password</h4>
                        <p>Please enter your registered email.<p>
                        <div class="form-group mt-2 mb-4">
                            <label for="email" class="visually-hidden">email</label>
                            <input type="email" name="email" id="email" class="form-control" placeholder="Email" required autofocus>
                        </div>
                        
                        <div class="form-group d-grid gap-2">
                            <button type="submit" class="btn btn-primary w-100"> Send</button>
                            
                            <c:if test="${error_success != null}">
                            <div class="alert alert-success" role="alert">
                                  ${error_success}
                            </div>
                            </c:if>
                            <c:if test="${error_warning != null}">
                            <div class="alert alert-warning" role="alert">
                                  ${error_warning}
                            </div>
                            </c:if>
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



    <!--script-->
    <script src="assets/js/bootstrap.min.js"></script>
</body>
</html>