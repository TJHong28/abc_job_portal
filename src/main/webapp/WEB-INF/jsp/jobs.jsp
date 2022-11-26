<!doctype html>
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
                    <a class="btn btn-secondary my-2 my-sm-0" >@<c:out value="${pageContext.request.remoteUser}" /></a>
                      <form action="/logout" method="post">
                          <input type="hidden" name="${_csrf.parameterName}"
                                      value="${_csrf.token}" />
                              <button type="submit" class="btn btn-danger">Logout</button>
                        </form> 
                    </div>
                  </nav>
                </ul>
    </nav> 
        
        <!-- Alert error message handling -->
    	<c:if test="${error_string_warning != null}">
		<div class="alert alert-warning alert-dismissible fade show text-center fixed-top" role="alert">
  			${error_string_warning }
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		</c:if>
		<c:if test="${error_string_success != null}">
		<div class="alert alert-success alert-dismissible fade show text-center fixed-top" role="alert">
  			${error_string_success }
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		</c:if>
        
        <section>
        	<div class="container mt-3 text-center">
        		<a href="/new-post" class="btn btn-warning">
        			<i class="fa-solid fa-briefcase"></i>
        			Post a new job!
        		</a>
        		<a href="/manage-post" class="btn btn-secondary">Manage your posts</a>
        	</div>
        </section>
        
        
        <section>
			<div class="container mt-3">
				<c:url var="search_url" value="/jobs" />
				<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
				<form:form role="search" action="${search_url}" method="post">
					<div class="input-group">
							<input class="form-control" name="keyword" type="search" placeholder="Search" aria-label="Search">
							<button class="btn btn-success me-2" type="submit">Search</button>
					</div>
				</form:form>
		</div>
            <div class="container py-4 mb-5">

                <h2>(<span modelattribute="count">${count}</span>) jobs available</h2>
        
                <div class="row" style="margin-top: 20px;">
                
                <c:if test="${empty jobs}">
                	<div class="container">
                		<p>No jobs opportunities found.</p>
                	</div>
                </c:if>
                
                <c:if test="${not empty jobs}">
                <c:forEach var="job" items="${jobs}" varStatus="row">
                	<div class="col-lg-4">
                		<div class="card">
                			<div class="card-body text-center">
                				<h4 class="card-title">${job.position}
                					<a href=""><i class="fa-solid fa-circle-check" title="verified"></i></a>
                				</h4>
                					
                				<div class="row">
                          			<p class="card-text">*Salary (MYR): ${job.salary}</p>
                				</div>

                				<p><i class="fa-sharp fa-solid fa-building"></i> ${job.company}<br> 
                					${job.city} ${job.country}
                				</p>
                						
                				<form class="text-center">
                          			<a href="#" class="btn btn-outline-primary">Apply</a>
                          			<a href="#" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#modal${row.index}">Details</a>
                        		</form>
                			</div>
							
                			
							<!-- Modal -->
							<div class="modal fade" id="modal${row.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  								<div class="modal-dialog modal-dialog-centered">
    								<div class="modal-content">
      									<div class="modal-header">
        									<h1 class="modal-title fs-5" id="exampleModalLabel">${job.position}, at ${job.company}</h1>
        									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      									</div>
      									<div class="modal-body">
      									<textarea row="100" class="form-control" style="height: 300px; display: block;">${job.content }</textarea>
      									</div>
      									<div class="modal-footer">
      									</div>
    								</div>
  								</div>
							</div>
							<!-- endof Modal -->
							
							<div class="card-footer text-center text-muted">
								<small>Last updated: <time class="timeago" datetime=${job.updatedOn}></time></small>
							</div>
                				
                		</div>
                	</div>
                </c:forEach>
                </c:if>

                </div>
              </div>
        </section>
		
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
		

		<script>
			setTimeout(function() {
        		bootstrap.Alert.getOrCreateInstance(document.querySelector(".alert")).close();
    		}, 3000)
		</script>
        <script src="https://kit.fontawesome.com/e19fcdf015.js" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-timeago/1.6.7/jquery.timeago.min.js" type="text/javascript"></script>
     	<script>
     		jQuery(document).ready(function() {
     		  jQuery("time.timeago").timeago();
     		});
     	</script>
    </body>
</html>