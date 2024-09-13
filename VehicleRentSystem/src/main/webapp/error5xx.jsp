<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Server Error</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .container { max-width: 600px; margin: 0 auto; text-align: center; }
        h1 { color: #d9534f; }
        p { font-size: 18px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Something went wrong on our end.</h1>
        <p>Error Code: <%= request.getAttribute("javax.servlet.error.status_code") %></p>
        <p>We are currently experiencing some issues. Please try again later.</p>
        <p><a href="<%= request.getContextPath() %>/login.jsp">Return to Home</a></p>
    </div>
</body>
</html>
