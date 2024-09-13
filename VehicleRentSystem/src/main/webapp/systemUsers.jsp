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
	            <div class="col-md-10">
	                <div class="card">
	                    <div class="card-header">System Users</div>
	                    <div class="p-1" id="usersDiv">
	                    	<table class="table">
			                    <thead>
					                <tr>
					                    <th class="tableTh">User ID</th>
					                    <th class="tableTh">Name</th>
					                    <th class="tableTh">NIC</th>
					                    <th class="tableTh">Email</th>
					                    <th class="tableTh">Address</th>
					                    <th class="tableTh">Photo</th>
					                    <th class="tableTh">Remove User</th>
					                </tr>
				                </thead>
			                <tbody>
	                	<%
			    			userService users = new userService();
							ArrayList<User> arrayList = users.getUsers();
							
							for (User user : arrayList) {
								
								
						%><tr>
							<td class="tableTh"><%=user.getId() %></td>
							<td class="tableTh"><%=user.getName() %></td>
							<td class="tableTh"><%=user.getNic() %></td>
							<td class="tableTh"><%=user.getEmail() %></td>
							<td class="tableTh"><%=user.getAddress() %></td>
							<td><img src="<%=user.getPhoto() %>" width='70' class='img-thumbnail' /></td>
							<td class="tableTh"><p id="<%=user.getId() %>" style="cursor: pointer" onclick="clickDelete(this);">X</p></td>
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
    	<form action="deleteUser" method="post" id="settingsForm">
			<input name="deleteId" id="userId" required>
		</form>
    </div>

</body>
</html>
<script>
	
	function clickDelete(id){
		
		var r = confirm("If you want remove this user ?");
		
		if (r == true) {
		  
			var user = id.id;
		

			document.getElementById("userId").value = user;
			
			document.getElementById("settingsForm").submit();
			
		}
		
	}

</script>
<script>

	window.onload = function(){
	    var x=${sessionScope.errors_success };
	    if("1"==x){
	        swal("Success!", "Change Successful!", "success");
	        <% session.setAttribute("errors_success", null); %>
	    }else if("2"==x){
	    	swal("Success!", "Delete Successful!", "success");
	        <% session.setAttribute("errors_success", null); %>
	    }else if("3"==x){
	        swal({
	            title: "Error",
	            text: "Registration Unsuccessful!",
	            icon: "warning",
	            dangerMode: true,
	        });
	        <% session.setAttribute("errors_success", null); %>
	    }
	}
	

</script>


