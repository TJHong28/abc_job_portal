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
                    <button type="button" class="btn btn-outline-dark me-2" style="border: none;">
                        @<c:out value="${pageContext.request.remoteUser}" />
                    </button>
                    <form action="/logout" method="post">
                        <input type="hidden" name="${_csrf.parameterName}"
                                    value="${_csrf.token}" />
                            <button type="submit" class="btn btn-danger">Logout</button>
                    </form>
                </div>
            </div>
        </div>
    </nav>

    <!--main-->
    <main>
        <div class="grid-container">
            <table class="table card-body text-center">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Username</th>
                    <th scope="col">Email</th>
                    <th scope="col">Password</th>
                  </tr>
                </thead>
                <tbody>
                  <c:if test="${not empty users}">
                  <c:forEach var="user" items="${users}">
                  <tr>
                    <th scope="row">${user.id}</th>
                    <td>${user.username}</td>
                    <td>${user.email}</td>
                    <td>${user.password}</td>
                  </tr>
                  </c:forEach>
                  </c:if>
                </tbody>
              </table>
            </div>
            </section>
        

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