# Vehicle Rental System - JAVA - OOP

## Technical Details
This Java web app is a simple CRUD web application with user login functionality, developed using **Eclipse IDE** and **OOP** concepts. It utilizes **servlets** to handle requests and responses on the backend server, while the frontend is built using **JSP** web pages. When a request is made from the frontend, it is directed to the relevant servlet in the backend. The servlets use service classes (Java files in the services package) to handle the requests, acting as a bridge between the database and the backend. Service files contain the database queries relevant to their operations.

## App Details
- **Admin Functionality**:
  - Add, view, edit, and delete vehicles and drivers.
  - View and delete all registered users.

- **User Functionality**:
  - Add, view, edit, and delete vehicle reservations (users must also select a driver when reserving a vehicle).
  - Edit their profile.
  - Login, logout, and register.

## How to Start the App
1. Download the project.
2. Start **XAMPP**.
3. Start **Apache** and **MySQL** in XAMPP.
4. Open **Eclipse IDE for Enterprise Java and Web Developers**.
5. Open the project inside Eclipse.
6. Right-click on the project in Eclipse and select **"Run As >> Run on Server >> Apache Tomcat 9 Server."**
7. Go to the **phpMyAdmin** interface and create the database as **"vehicle_rent"** (the SQL file for creating the DB is in the SQL folder inside the project).
8. Register as a user.
9. To make an admin, go to the phpMyAdmin interface, access the database, and change the user's privilege to **"1."** When the user logs in, they will be directed to the admin dashboard instead of the user dashboard.
