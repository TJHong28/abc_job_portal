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
                    <li class="nav-item">
                        <a class="nav-link" href="/dashboard">Dashboard</a>
                      </li>
                </ul>
                <form class="d-flex">
                    <a class="btn btn-secondary my-2 my-sm-0" href="/profile?id=${person.id}">@<c:out value="${pageContext.request.remoteUser}" /></a>
                      <form action="/logout" method="post">
                          <input type="hidden" name="${_csrf.parameterName}"
                                      value="${_csrf.token}" />
                              <button type="submit" class="btn btn-danger">Logout</button>
                        </form> 
                    </div>
                  </nav>
                </ul>
            </div>
                </div>
            </div>
        </div>
    </nav>

    <!--main-->
    <main>
        <div class="grid-container">
            <form class="form-group" action="/update-profile" method="post" modelAttribute="user">
                <input type="hidden" name="${_csrf.parameterName}"
                              value="${_csrf.token}" />
                              
                <div class="mb-3">
                  <label class="form-label">ID: </label>
                  <input class="form-control" name="id" value="${user.id}" aria-label="Store ID" readonly="true" />
                </div>
      
                <div class="mb-3">
                  <label class="form-label">*Username: </label>
                  <input type="text" class="form-control" name="username" id="username" value="${user.username}" aria-label="username" required />
                </div>
        
                <div class="mb-3">
                  <label class="form-label">*Email: </label>
                  <input type="email" class="form-control" name="email" id="email" value="${user.email}" aria-label="email" required />
                </div>
        
                <div class="mb-3">
                  <label class="form-label">*First Name: </label>
                  <input class="form-control" name="firstname" id="firstname" value="${user.firstname}" aria-label="first name" required />
                </div>
        
                <div class="mb-3">
                  <label class="form-label">*Last Name: </label>
                  <input class="form-control" name="lastname" id="lastname" value="${user.lastname}" aria-label="last name" required />
                </div>
        
                <div class="mb-3">
                  <label class="form-label">*Company: </label>
                  <input class="form-control" name="company" id="company" value="${user.company}" aria-label="company" required />
                </div>
      
                <div class="mb-3">
                  <label class="form-label">*City: </label>
                  <input class="form-control" name="city" id="city" value="${user.city}" aria-label="country" required />
                </div>
      
                <div class="mb-3">
                  <label class="form-label">*Country: </label>
                  <input class="form-control" name="country" id="country" value="${user.country}" aria-label="country" required />
                </div>
                
                <div class="mb-3">
                  <label class="form-label" for="customFile">Profile photo</label>
                  <input type="file" name="img" class="form-control" id="customFile" value="" />
                </div>
                
                <div class="py-5">
                  <a href="/dashboard" class="btn btn-danger">Cancel</a>
                  <button type="submit" class="btn btn-success">Update</button>
                </div>
              </form>
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