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
		
<br>
<p></p>
		<main class="login-form">
	        <div class="row justify-content-center">
	            <div class="col-md-10">
	                <div class="card">
	                    <div class="card-header">All Reservation</div>
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
	                    <div class="p-1" id="usersDiv">
	                    	<table class="table">
			                    <thead>
					                <tr>
					                    <th class="tableTh">ID</th>
					                    <th class="tableTh">User ID</th>
					                    <th class="tableTh">User Name</th>
					                    <th class="tableTh">Vehicle ID</th>
					                    <th class="tableTh">Vehicle Image</th>
					                    <th class="tableTh">Driver ID</th>
					                    <th class="tableTh">Driver Name</th>
					                    <th class="tableTh">Date</th>
					                    <th class="tableTh">Edit</th>
					                    <th class="tableTh">Remove</th>
					                </tr>
				                </thead>
			                <tbody>
	                	<%
	                		reservationService b = new reservationService();
							ArrayList<Reservation> arrayList = b.getReservations();
							
							for (Reservation bk : arrayList) {
								
								
						%><tr>
							<td class="tableTh"><%=bk.getId() %></td>
							<td class="tableTh"><%=bk.getUserId() %></td>
							<td class="tableTh"><%=bk.getUser_name() %></td>
							<td class="tableTh"><%=bk.getVehicleId() %></td>
							<td><img src="<%=bk.getVehicle() %>" width='100' class='img-thumbnail' /></td>
							<td class="tableTh"><%=bk.getDriverId() %></td>
							<td class="tableTh"><%=bk.getDriver() %></td>
							<td class="tableTh"><%=bk.getDate() %></td>
							<td class="tableTh"><a href="getReservation?id=<%=bk.getId() %>" style="cursor: pointer" >X</a></td>
							<td class="tableTh"><p id="<%=bk.getId() %>" style="cursor: pointer" onclick="clickDelete(this);">X</p></td>
						  </tr>
						<%
							}
						%>
						</tbody>
	            </table>
	            </div>
	                </div>
	            </div>
	        </div>
		</main>
	</div>

	
	<div style="display: none;" >
    	<form action="deleteReservation" method="post" id="settingsForm">
			<input name="deleteId" id="deleteId" required>
		</form>
    </div>

</body>
</html>
<script>
	
	function clickDelete(id){
		
		var r = confirm("If you want remove data ?");
		
		if (r == true) {
		  
			var did = id.id;
		
			document.getElementById("deleteId").value = did;
			
			document.getElementById("settingsForm").submit();
			
		}
		
	}

</script>