<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    response.setHeader("X-Frame-Options", "SAMEORIGIN");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<title>Vehicle Reservation System</title>
	
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/croppie.js"></script>
    <link rel="stylesheet" href="assets/css/croppie.css" />

    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="assets/js/sweetalert.min.js"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
	<style type="text/css">
        .my-error-class {
            color:red;
        }
        .my-valid-class {
            color:green;
        }
    </style>
</head>
<body>
  
	<% 
    request.getSession(false);  // Use false to avoid creating a new session
    Integer privilege = (Integer) session.getAttribute("privilege");

    if (privilege == null || privilege != 1) {  // 1 = admin role, 0 = user role
        response.sendRedirect("notAuthError.jsp");  // Redirect unauthorized users
        return;
    }
%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
    	<div class="container">
	        <a class="navbar-brand" href="admin.jsp">Vehicle Reservation System</a>
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	
	        <div class="collapse navbar-collapse" id="navbarSupportedContent">
	            <ul class="navbar-nav ml-auto">
	                <% if(session.getAttribute("userEmail")==null){ %>
	                <li class="nav-item">
	                    <a class="nav-link" href="login.jsp">Login</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="register.jsp">Register</a>
	                </li>
	                <%}else{ %>
	                <li class="nav-item">
	                    <a class="nav-link" href="logoutServlet">Logout</a>
	                </li>
	                <%} %>
	            </ul>
	
	        </div>
        </div>
	</nav>
    <div class="container">
		
<br>
<p></p>
		<main class="login-form">
	        <div class="row justify-content-center">
	            <div class="col-md-8">
	                <div class="card">
	                    <div class="card-header">Vehicles</div>
	                    <div class="card-body">
	                    <%
							if(request.getAttribute("errors_success")!=null){
								if(request.getAttribute("errors_success").equals(1)){
									%>	<div class="alert alert-success">
										  Successful!
										</div>	<%
								}else{
									%>	<div class="alert alert-danger">
										  Unsuccessful!
										</div>	<%
								}
							}
						%>
	                        <form action="addVehicle" method="post" id="sample_form" enctype="multipart/form-data"  >
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Type</label>
	                                <div class="col-md-6">
	                                    <select name="type" class="form-control" required>
	                                		<option value="">Select</option>
											<option>SUV</option>
											<option>Bus</option>
											<option>Van</option>
											<option>Car</option>
											<option>Tractor</option>
	                                	</select>
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Brand</label>
	                                <div class="col-md-6">
	                                    <select name="brand" class="form-control" required>
	                                    	<option value="">Select</option>
											<option>Toyota</option>
											<option>Honda</option>
											<option>Ford</option>
											<option>Mazda</option>
											<option>Tesla</option>
											<option>BMW</option>
	                                	</select>
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Model</label>
	                                <div class="col-md-6">
	                                    <select name="model" class="form-control" required>
	                                    	<option value="">Select</option>
											<option>KDH</option>
											<option>Vezel</option>
											<option>Corolla</option>
	                                	</select>
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Registration No</label>
	                                <div class="col-md-6">
	                                    <input type="text" id="RegistrationNo" class="form-control" name="RegistrationNo" required pattern="^[a-zA-Z0-9-]+$" title="Only letters, numbers, and '-' are allowed">
	                                </div>
	                            </div>
	                            
		                        <div class="form-group row">
		                            <label class="col-md-4 col-form-label text-md-right" >Image</label>
		                            <div class="col-md-6">
		                                <input type="file" name="image" id="image" class="form-control" required/>
		                                <input type="hidden" id="imagePath" name="photo">
		                            </div>
		                        </div>
	                            
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Seats</label>
	                                <div class="col-md-6">
	                                    <input type="number" id="seats" class="form-control" name="seats" required>
	                                </div>
	                            </div>
	                            
	                            <div class="col-md-6 offset-md-4">
	                                <button type="submit" class="btn btn-primary">
	                                    Add
	                                </button>
	                            </div>
	                    	</form>
	                    </div>
	                </div>
	            </div>
	        </div>
		</main>
	</div>

</body>
</html>

<script>
$(document).ready(function(){

    // Function to validate RegistrationNo
    $('#sample_form').on('submit', function(e) {
        var registrationNo = $('#RegistrationNo').val();
        var regex = /^[a-zA-Z0-9-]+$/;

        if (!regex.test(registrationNo)) {
            swal({
                title: "Error",
                text: "Registration Number can only contain letters, numbers, and '-'!",
                icon: "warning",
                dangerMode: true,
            });
            e.preventDefault();  // Prevent the form from submitting
        }
    });

    $('#image').on('change', function(){
        var form_data = new FormData($('#sample_form')[0]);
    	$.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
        	url:"imageUploadServlet",
            data: form_data,
            processData: false,
            contentType: false,
            success:function(data)
            {
                $('#imagePath').val(data);
            }
        });
    });

});
</script>
