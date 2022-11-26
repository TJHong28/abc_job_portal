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
                      <li class="nav-item">
                        <a class="nav-link" href="/jobs">Jobs</a>
                      </li>
                </ul>
                    <section>
                        <div class="container mt-3">
                                <c:url var="search_url" value="/dashboard" />
                                <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                                <form:form role="search" action="${search_url}" method="post">
                                    <div class="input-group">
                                            <input class="form-control" name="keyword" type="search" placeholder="Search" aria-label="Search">
                                            <button class="btn btn-success me-2" type="submit">Search</button>
                                    </div>
                                </form:form>
                        </div>
                    </section>
                    <a class="btn btn-secondary my-2 my-sm-0" href="/profile?id=${person.id}">@<c:out value="${pageContext.request.remoteUser}" /></a>
                      <form action="/logout" method="post">
                          <input type="hidden" name="${_csrf.parameterName}"
                                      value="${_csrf.token}" />
                              <button type="submit" class="btn btn-danger">Logout</button>
                        </form> 
                    </div>
                  </nav>
                </ul>
    </nav>

    <!--main-->
    <main>
      <table class="table card-body text-center">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Username</th>
            <th scope="col">Email</th>
            <th scope="col">First Name</th>
            <th scope="col">Last Name</th>
            <th scope="col">Company</th>
            <th scope="col">City</th>
            <th scope="col">Country</th>
          </tr>
        </thead>
        <tbody>
          <c:if test="${not empty users}">
          <c:forEach var="user" items="${users}">
          <tr>
            <th scope="row">${user.id}</th>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.firstname}</td>
            <td>${user.lastname}</td>
            <td>${user.company}</td>
            <td>${user.city}</td>
            <td>${user.country}</td>
          </tr>
          </c:forEach>
          </c:if>
        </tbody>
      </table>
        


        
    </main>

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