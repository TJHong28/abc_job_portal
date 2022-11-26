<!doctype html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
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
	<script>
		setTimeout(function() {
        	bootstrap.Alert.getOrCreateInstance(document.querySelector(".alert")).close();
    	}, 3000)
	</script>
	</c:if>
	<c:if test="${error_string_success != null}">
	<div class="alert alert-success alert-dismissible fade show text-center fixed-top" role="alert">
  			${error_string_success }
  			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
	<script>
		setTimeout(function() {
        	bootstrap.Alert.getOrCreateInstance(document.querySelector(".alert")).close();
    	}, 3000)
	</script>
	</c:if>         

    <section class="container mb-5" style="margin-top: 30px;">
          
      <form:form action="/update-post?id=${job.id}" method="POST" modelattribute="job">
      	<div class="card px-5 py-5" style="max-width: 100vw !important;">
  			<div class="card-body">
  			
  			<div class="form-group mb-5">
  				<select class="form-select" name="status" aria-label="Default select example">
  					<c:if test="${job.status eq true }">
  						<option selected value="1">Available</option>
  						<option value="0">Closed</option>
  					</c:if>
  					<c:if test="${job.status eq false }">
  						<option selected value="0">Closed</option>
  					<option value="1">Available</option>
  					</c:if>
				</select>
  			</div>
  			
    		<h3 class="card-title text-center mb-5">Edit Job Posting {${job.id}}</h3>
    		<p class="card-text text-center text-muted">Update your job posting here and remember to click update.</p>
    		
    		<div class="form-group mb-3">
    			<label for="inputPosition">*Position:</label>
    			<input type="text" class="form-control" name="position" id="position" value="${job.position }" aria-describedby="positionHelp" required autofocus>
    			<small id="positionHelp" class="form-text text-muted">Describe job position.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputSalary">*Salary:</label>
    			<input type="text" class="form-control" name="salary" id="salary" value="${job.salary}" aria-describedby="salaryHelp" required>
    			<small id=""salaryHelp"" class="form-text text-muted">Describe actual or indicative salary (MYR) for the job position.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputContent">*Content:</label>
    			<textarea class="form-control" name="content" id="content" rows="10" 
    				aria-describedby="countryHelp" required>${job.content}</textarea>
    			<small id="countryHelp" class="form-text text-muted">Describe or explain the job roles, description, requirements, etc; here.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputCompany">*Company Name:</label>
    			<input type="text" class="form-control" name="company" id="company" value="${job.company}" aria-describedby="companyHelp" required>
    			<small id="companyHelp" class="form-text text-muted">Type the name of the company that offer the job.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputCity">*City:</label>
    			<input type="text" class="form-control" name="city" id="city" value="${job.city}" aria-describedby="cityHelp" required>
    			<small id="cityHelp" class="form-text text-muted">Type the name of city of the company's location.</small>
    		</div>
    		
    		<div class="form-group mb-3">
    			<label for="inputCountry">*Country:</label>
    			<input type="text" class="form-control" name="country" id="country" value="${job.country}" aria-describedby="countryHelp" required>
    			<small id="countryHelp" class="form-text text-muted">Type the name of country of the company's location.</small>
    		</div>
    		
    		<div class="form-check mt-5">
  				<input class="form-check-input" type="checkbox" value="" id="checkbox1">
  				<label class="form-check-label" for="flexCheckDefault">
    				<small class="form-text text-muted">I hereby declare that the information provided is true and correct. I also understand that any 
    				willful dishonesty may render immediate removal of this job post and lawful consideration by Demo Company.</small>
  				</label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value="" id="checkbox2">
  				<label class="form-check-label" for="flexCheckDefault">
    				<small class="form-text text-muted">I agree to the terms and conditions as set out by the user agreement and our terms of service.</small>
  				</label>
			</div>
    		
    		<div class="d-grid gap-2 mt-4">
  				<a href="/manage-post" class="btn btn-danger" >Cancel</a>
  				<button class="btn btn-success" type="submit" name="submit" id="updateBtn">Update</button>
			</div>
  			</div>
		</div>
      </form:form>
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

	<!--script-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://kit.fontawesome.com/e19fcdf015.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    
    <!-- js to check checkboxes -->
	<script>
    $('#updateBtn').prop("disabled", true);
    	
    $(".form-check-input").on("change", function() {
    	verifyCheckboxes("checkbox1", "checkbox2");
    });
    	
    function verifyCheckboxes(element1, element2) {
    	var submitBtn = document.getElementById("updateBtn");
    	var checkbox1 = document.getElementById("checkbox1");
    	var checkbox2 = document.getElementById("checkbox2");
    		
    	if(checkbox1.checked == true && checkbox2.checked == true) {
    		submitBtn.class = "submit";
    		submitBtn.removeAttribute("disabled");
    	} else {
    		submitBtn.class = "button:disabled";
    		submitBtn.setAttribute("disabled", "disabled");
    	}
    }
	</script>
  </body>
</html>