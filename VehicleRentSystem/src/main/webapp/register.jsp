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
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
    	<div class="container">
	        <a class="navbar-brand" href="profileServlet">Vehicle Reservation System</a>
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
	                    <div class="card-header">Register</div>
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
	                        <form  action="addUser" method="post" id="sample_form" enctype="multipart/form-data" onsubmit="return checkDetails();">
	                            <div class="form-group row">
	                                <label for="name" class="col-md-4 col-form-label text-md-right">Name</label>
	                                <div class="col-md-6">
	                                    <input type="text" id="name" class="form-control" name="name" required> <!-- Validated for overcome XLT Injection -->
	                                </div>
	                            </div>
	
	                            <div class="form-group row">
	                                <label for="address" class="col-md-4 col-form-label text-md-right">Address</label>
	                                <div class="col-md-6">
	                                    <input type="text" id="address" class="form-control" name="address" required> <!-- Validated for overcome XLT Injection -->
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="email" class="col-md-4 col-form-label text-md-right">Email</label>
	                                <div class="col-md-6">
	                                    <input type="email" id="email" class="form-control" name="email" required> <!-- Validated for overcome XLT Injection -->
	                                </div>
	                            </div>
			                          
	                            <div class="form-group row">
	                                <label for="nic" class="col-md-4 col-form-label text-md-right">NIC</label>
	                                <div class="col-md-6">
	                                    <input type="text" id="nic" class="form-control" name="nic" required> <!-- Validated for overcome XLT Injection -->
	                                </div>
	                            </div>
	                              
		                        <div class="form-group row">
		                            <label class="col-md-4 col-form-label text-md-right">Image</label>
		                            <div class="col-md-6">
		                                <input type="file" name="image" id="image" class="form-control" required/>
		                                <input type="hidden" id="imagePath" name="photo">
		                            </div>
		                        </div>
		                        
	                            <div class="form-group row">
	                                <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
	                                <div class="col-md-6">
	                                    <input type="password" id="password" class="form-control" name="password" required> 
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="cpassword" class="col-md-4 col-form-label text-md-right">Confirm Password</label>
	                                <div class="col-md-6">
	                                    <input type="password" id="cpassword" class="form-control" name="cpassword" required>
	                                </div>
	                            </div>
	
	                            <div class="col-md-6 offset-md-4">
	                                <button type="submit" class="btn btn-primary">
	                                    Register
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

function checkUpload(){
	if($('#imagePath').val()==""){
		swal({
            title: "Error",
            text: "Please Upload Image!",
            icon: "warning",
            dangerMode: true,
        });
		return false;
	}else{
		return true;
	}
}

function checkDetails() {
    var name = document.getElementById("name").value;
    var address = document.getElementById("address").value;
    var email = document.getElementById("email").value;
    var nic = document.getElementById("nic").value;
    var pass1 = document.getElementById("password").value;
    var pass2 = document.getElementById("cpassword").value;

    var nameRegex = /^[a-zA-Z\s]*$/;
    var addressRegex = /^[a-zA-Z0-9\s,.'-]*$/;
    var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    var nicRegex = /^(\d{9}[Vv]|\d{12})$/;
    var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;

    if (!nameRegex.test(name)) {
        swal({
            title: "Error",
            text: "Name should not contain special characters!", //Name validated for get rid of XLT Injection
            icon: "warning",
            dangerMode: true,
        });
        return false;
    }

    if (!addressRegex.test(address)) {
        swal({
            title: "Error",
            text: "Address should not contain special characters!", //Address validated for get rid of XLT Injection
            icon: "warning",
            dangerMode: true,
        });
        return false;
    }

    if (!emailRegex.test(email)) {
        swal({
            title: "Error",
            text: "Please enter a valid email!", //Email validated for get rid of XLT Injection
            icon: "warning",
            dangerMode: true,
        });
        return false;
    }

    if (!nicRegex.test(nic)) {
        swal({
            title: "Error",
            text: "NIC should be in the format '123456789V' or '123456789012'!", //NIC validated for get rid of XLT Injection
            icon: "warning",
            dangerMode: true,
        });
        return false;
    }

    if (!passwordRegex.test(pass1)) {
        swal({
            title: "Error",
            text: "Password should be at least 8 characters long, with at least one uppercase, one lowercase letter, and one number!",
            icon: "warning",
            dangerMode: true,
        });
        return false;
    }

    if (pass1 !== pass2) {
        swal({
            title: "Error",
            text: "Passwords do not match!",
            icon: "warning",
            dangerMode: true,
        });
        return false;
    }

    return checkUpload();
}
</script>
