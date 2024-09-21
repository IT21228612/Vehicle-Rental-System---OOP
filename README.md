# Vehicle Rental System - JAVA - OOP

## Technical Details
This Java web app is a simple CRUD web application with user login functionality, developed using **Eclipse IDE** and **OOP** concepts. It utilizes **servlets** to handle requests and responses on the backend server, while the frontend is built using **JSP** web pages. When a request is made from the frontend, it is directed to the relevant servlet in the backend. The servlets use service classes (Java files in the services package) to handle the requests, acting as a bridge between the database and the backend. Service files contain the database queries relevant to their operations.

## App Details
- **Admin Functionality**:
  - Add, view, edit, and delete vehicles and drivers.
  - View and delete all registered users.
  - Login, logout, and register.

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

## Screenshots
<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/24569d7b-ea34-451f-8e73-b3dff72ab0d3" alt="Screenshot (1031)" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/28d400f3-03e9-4d06-8716-a240d06271c2" alt="Screenshot (1032)" width="300"></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/3eee2fdb-0ee6-4f4f-9bc8-0442d1f46d83" alt="Screenshot (1033)" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/65da86f8-2e60-4e72-8d40-71bc5b8fb9fa" alt="Screenshot (1034)" width="300"></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/31448311-0ed5-48c0-b209-d1af14d4acfb" alt="Screenshot (1035)" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/22064790-5a13-41ec-9ded-a098e7a1ebd7" alt="Screenshot (1036)" width="300"></td>
  </tr>
   <tr>
    <td><img src="https://github.com/user-attachments/assets/35ce596c-0fde-4322-9475-8c5a449573d3" alt="Screenshot (1037)" width="300"></td>

  </tr>
   
  <tr>
    <td><img src="https://github.com/user-attachments/assets/07c44446-6d9e-45cd-9019-19b3f4f84359" alt="Screenshot (4)" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/b7ec0bb1-339e-42b2-b232-38f76ed19df8" alt="Screenshot (1038)" width="300"></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/719f5fb4-09ae-4964-a66c-55903a66f968" alt="Screenshot (1039)" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/658cd411-6fbd-41ee-b28a-d26da7124a8c" alt="Screenshot (1040)" width="300"></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/ecb0524f-c691-4eb6-bb57-bdd84320aac0" alt="Screenshot (1041)" width="300"></td>
    <td><img src="https://github.com/user-attachments/assets/e3ef6075-3f9b-4a50-945b-0d93c9dc5eeb" alt="Screenshot (1042)" width="300"></td>
  </tr>

</table>


