<%@page import="vehicle.service.*"%>
<%@page import="vehicle.classes.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
    		if(privilege != 0){
    			 response.sendRedirect("notAuthError.jsp");  // Redirect unauthorized users
    		        return;
    		}
    }
%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
    	<div class="container">
	        <a class="navbar-brand" href="user.jsp">Vehicle Reservation System</a>
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
		<%
		Reservation reservation = (Reservation) request.getAttribute("reservation");
		%>
<br>
<p></p>
		<main class="login-form">
	        <div class="row justify-content-center">
	            <div class="col-md-8">
	                <div class="card">
	                    <div class="card-header">Reservation</div>
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
	                        <form action="editReservation" method="post" >
	                        	<input type="hidden" name="id" value="<%=reservation.getId() %>" >
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Driver</label>
	                                <div class="col-md-6">
	                                    <select name="driverId" class="form-control" required>
	                                		<option value="">Select</option>
											<%
	                		driverService b = new driverService();
							ArrayList<Driver> arrayList = b.getDrivers();
							
							for (Driver bk : arrayList) {
								if(bk.getId()==reservation.getDriverId()){
									%>
						<option value="<%=bk.getId() %>"><%=bk.getName() %></option>
									<%
								}else{
								
						%>
						<option value="<%=bk.getId() %>" selected><%=bk.getName() %></option>
						<%
								}
							}
						%>
	                                	</select>
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Vehicle</label>
	                                <div class="col-md-6">
	                                    <select name="vehicleId" class="form-control" required>
	                                		<option value="">Select</option>
	                                    <%
	                		vehicleService v = new vehicleService();
							ArrayList<Vehicle> arrayList1 = v.getVehicles();
							
							for (Vehicle vk : arrayList1) {
								
								if(vk.getId()==reservation.getVehicleId()){
									%>
									<option value="<%=vk.getId() %>" data-img_src="<%=vk.getPhoto() %>" selected><%=vk.getBrand() %> - <%=vk.getModel() %></option>
									<%
								}else{
								
						%>
						<option value="<%=vk.getId() %>" data-img_src="<%=vk.getPhoto() %>"><%=vk.getBrand() %> - <%=vk.getModel() %></option>
						<%
								}
							}
						%>
	                                	</select>
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Date</label>
	                                <div class="col-md-6">
	                                    <input type="date" id="date" class="form-control" name="date" value="<%=reservation.getDate() %>" required>
	                                </div>
	                            </div>
	                            
	                            <div class="col-md-6 offset-md-4">
	                                <button type="submit" class="btn btn-primary">
	                                    Edit
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
            })
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
    
</script>