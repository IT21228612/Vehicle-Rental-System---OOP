<%-- <%@page import="service.*"%>
<%@page import="model.*"%> --%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Vehicle Reservation System</title>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<style type="text/css">
  	
  		body { 
		  background: url(./assets/images/bg.jpg) no-repeat center center fixed; 
		  -webkit-background-size: cover;
		  -moz-background-size: cover;
		  -o-background-size: cover;
		  background-size: cover;
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

	<nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <a href="#" class="navbar-brand">Vehicle Reservation System</a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ml-auto">
                <a href="logoutServlet" class="nav-item nav-link">Logout</a>
            </div>
        </div>
    </nav>

	<div class="container">
    <br/><br/>
        <div class="justify-content-center">
            <h1>User Account</h1>
            <hr/>
            <div class="col-12">
            
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
						
            	<a href="addReservation.jsp" class="btn btn-primary btn-lg btn-block">Add Reservation</a>
            	<a href="viewReservation.jsp" class="btn btn-primary btn-lg btn-block">All Reservation</a>
            	<a href="getUser" class="btn btn-primary btn-lg btn-block">Edit Profile</a>
            </div>
        </div>
    </div>

<br><br>
<footer class="page-footer font-small bg-dark text-light">

  <div class="bg-primary">
    <div class="container">

      <!-- Grid row-->
      <div class="row py-4 d-flex align-items-center">

        <!-- Grid column -->
        <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
          <h6 class="mb-0">Get connected with us on social networks!</h6>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-6 col-lg-7 text-center text-md-right">

          <!-- Facebook -->
          <a class="fb-ic">
            <i class="fab fa-facebook-f white-text mr-4"> </i>
          </a>
          <!-- Twitter -->
          <a class="tw-ic">
            <i class="fab fa-twitter white-text mr-4"> </i>
          </a>
          <!-- Google +-->
          <a class="gplus-ic">
            <i class="fab fa-google-plus-g white-text mr-4"> </i>
          </a>
          <!--Linkedin -->
          <a class="li-ic">
            <i class="fab fa-linkedin-in white-text mr-4"> </i>
          </a>
          <!--Instagram-->
          <a class="ins-ic">
            <i class="fab fa-instagram white-text"> </i>
          </a>

        </div>
        <!-- Grid column -->

      </div>
      <!-- Grid row-->

    </div>
  </div>

  <!-- Footer Links -->
  <div class="container text-center text-md-left mt-5">

    <!-- Grid row -->
    <div class="row mt-3">

      <!-- Grid column -->
      <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">

        <!-- Content -->
        <h6 class="text-uppercase font-weight-bold">Company name</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>Here you can use rows and columns to organize your footer content. Lorem ipsum dolor sit amet,
          consectetur
          adipisicing elit.</p>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">

        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">Products</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>
          <a href="#!">MDBootstrap</a>
        </p>
        <p>
          <a href="#!">MDWordPress</a>
        </p>
        <p>
          <a href="#!">BrandFlow</a>
        </p>
        <p>
          <a href="#!">Bootstrap Angular</a>
        </p>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">

        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">Useful links</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>
          <a href="#!">Your Account</a>
        </p>
        <p>
          <a href="#!">Become an Affiliate</a>
        </p>
        <p>
          <a href="#!">Shipping Rates</a>
        </p>
        <p>
          <a href="#!">Help</a>
        </p>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">

        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">Contact</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>
          <i class="fas fa-home mr-3"></i> New York, NY 10012, US</p>
        <p>
          <i class="fas fa-envelope mr-3"></i> info@example.com</p>
        <p>
          <i class="fas fa-phone mr-3"></i> + 01 234 567 88</p>
        <p>
          <i class="fas fa-print mr-3"></i> + 01 234 567 89</p>

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2020 Copyright:
    <a href="https://mdbootstrap.com/"> MDBootstrap.com</a>
  </div>
  <!-- Copyright -->

</footer>

<div style="display : none">
	<form action="deleteFeedback" method="POST" id="deleteFormData">
		<input type="hidden" name="deleteid" id="deleteid">
	</form>
</div>

</body>
</html>
<script>

	window.onload = function(){
	    var x=${sessionScope.errors_success };
	    if("1"==x){
	        swal("Success!", "Add Successful!", "success");
	        <% session.setAttribute("errors_success", null); %>
	    }else if("2"==x){
	        swal({
	            title: "Error",
	            text: "Add Unsuccessful!",
	            icon: "warning",
	            dangerMode: true,
	        });
	        <% session.setAttribute("errors_success", null); %>
	    }else if("3"==x){
	        swal("Success!", "Delete Successful!", "success");
	        <% session.setAttribute("errors_success", null); %>
	    }else if("4"==x){
	        swal({
	            title: "Error",
	            text: "Delete Unsuccessful!",
	            icon: "warning",
	            dangerMode: true,
	        });
	        <% session.setAttribute("errors_success", null); %>
	    }else if("5"==x){
	        swal("Success!", "Edit Successful!", "success");
	        <% session.setAttribute("errors_success", null); %>
	    }else if("6"==x){
	        swal({
	            title: "Error",
	            text: "Edit Unsuccessful!",
	            icon: "warning",
	            dangerMode: true,
	        });
	        <% session.setAttribute("errors_success", null); %>
	    }
	}
		
</script>
<script src="assets/js/sweetalert.min.js"></script>

<script>
	
	function editData(id,feedback) {
	
		document.getElementById("user_feedback").value = feedback;
		document.getElementById("feedbackId").value = id;
		document.getElementById("btnSub").innerHTML = "EDIT";
	
	}
	
	function clearz(){
		document.getElementById("feedbackId").value = "0";
		document.getElementById("btnSub").innerHTML = "Submit";
		document.getElementById("user_feedback").value = "";
	}
	
	function deleteData(id) {
	
	    swal({
	        title: "Are You Sure?",
	        text: "If You Want Delete This!",
	        icon: "warning",
	        buttons: true,
	        dangerMode: true,
	    })
	        .then((willDelete) => {
	            if (willDelete) {
	            	$('#deleteid').val(id);
	            	document.getElementById("deleteFormData").submit();
	            }
	        });
	
	}
</script>
<% if(session.getAttribute("userEmail")==null){ %>
<script>
window.location.href = "<%= request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath() %>/login.jsp";
</script>
<% } %>