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
            <% 
                request.getSession(false);  
                Integer privilege = (Integer) session.getAttribute("privilege");

                if (privilege == null || privilege != 1) {  
                    response.sendRedirect("notAuthError.jsp");  
                    return;
                }
            %>
            <%
                String csrfToken = java.util.UUID.randomUUID().toString();
                session.setAttribute("csrfToken", csrfToken);
            %>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <% if(session.getAttribute("userEmail") == null) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Register</a>
                    </li>
                    <% } else { %>
                    <li class="nav-item">
                        <a class="nav-link" href="logoutServlet">Logout</a>
                    </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <br>
        <main class="login-form">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">Drivers</div>
                        <div class="card-body">
                        <%
                            if(request.getAttribute("errors_success") != null) {
                                if(request.getAttribute("errors_success").equals(1)) {
                        %>
                            <div class="alert alert-success">Successful!</div>
                        <%
                                } else {
                        %>
                            <div class="alert alert-danger">Unsuccessful!</div>
                        <%
                                }
                            }
                        %>
                            <form action="addDriver" method="post" id="sample_form" enctype="multipart/form-data">
                                <input type="hidden" name="csrfToken" value="<%= csrfToken %>">
                                
                                <div class="form-group row">
                                    <label for="name" class="col-md-4 col-form-label text-md-right">Name</label>
                                    <div class="col-md-6">
                                        <input type="text" id="name" class="form-control" name="name" required pattern="[a-zA-Z\s]+" title="Name should only contain letters and spaces">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="age" class="col-md-4 col-form-label text-md-right">Age</label>
                                    <div class="col-md-6">
                                        <input type="number" id="age" class="form-control" name="age" required>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="nic" class="col-md-4 col-form-label text-md-right">NIC</label>
                                    <div class="col-md-6">
                                        <input type="text" id="nic" class="form-control" name="nic" required
            								pattern="[0-9]{9}V" 
            								title="NIC must be 9 digits followed by a capital V">
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="address" class="col-md-4 col-form-label text-md-right">Address</label>
                                    <div class="col-md-6">
                                        <input type="text" id="address" class="form-control" name="address" required
                                        	pattern="[a-zA-Z0-9,./\s]*"
                                        	title="Special characters allowed: / , .">
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
                                    <label for="years" class="col-md-4 col-form-label text-md-right">Years Of Experience</label>
                                    <div class="col-md-6">
                                        <input type="number" id="years" class="form-control" name="years" required>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-primary">Add</button>
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
            url: "imageUploadServlet",
            data: form_data,
            processData: false,
            contentType: false,
            success: function(data) {
                $('#imagePath').val(data);
            }
        });
    });

    $('#sample_form').validate({
        rules: {
            name: {
                required: true,
                pattern: /^[a-zA-Z\s]+$/  // Only letters and spaces
            },
            nic: {
                required: true,
                pattern: /^([0-9]{9}[vV]|[0-9]{12})$/  // NIC validation: old and new format
            },
            address: {
                required: true,
                pattern: /^[^<>?/;:]+$/  // Exclude <, >, ?, /, ;, :
            },
            image: {
                required: true
            }
        },
        messages: {
            name: {
                required: "Please enter the name",
                pattern: "Name should only contain letters and spaces"
            },
            nic: {
                required: "Please enter the NIC",
                pattern: "NIC should be in the format 'XXXXXXXXXV' or 'XXXXXXXXXXXX'"
            },
            address: {
                required: "Please enter the address",
                pattern: "Address cannot contain special characters like <, >, ?, /, ;, :"
            },
            image: {
                required: "Please upload an image"
            }
        },
        errorClass: "my-error-class",
        validClass: "my-valid-class",
        submitHandler: function(form) {
            return checkUpload();
        }
    });
});

function checkUpload() {
    if ($('#imagePath').val() == "") {
        swal({
            title: "Error",
            text: "Please Upload Image!",
            icon: "warning",
            dangerMode: true,
        });
        return false;
    } else {
        return true;
    }
}
</script>
