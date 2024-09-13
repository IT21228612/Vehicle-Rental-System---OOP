package vehicle.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vehicle.classes.*;
import vehicle.service.*;
/**
 * Servlet implementation class addVehicle
 */
@WebServlet("/addVehicle")
@MultipartConfig
public class addVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addVehicle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false); // Use false to not create a new session if it doesn't exist
		
		if (session == null || session.getAttribute("userEmail") == null) {
            // User is not authenticated
            response.sendRedirect("login.jsp");
            return;
        }

        // Check user authorization (e.g., role or privilege)
        Integer privilege = (Integer) session.getAttribute("privilege");
        if (privilege == null || privilege != 1) {
            // User does not have the required privilege
            response.sendError(HttpServletResponse.SC_FORBIDDEN); // 403 Forbidden
            return;
        }
		response.setContentType("text/html");

		Vehicle vehicle =  new Vehicle();

		vehicle.setType(request.getParameter("type"));
		vehicle.setBrand(request.getParameter("brand"));
		vehicle.setModel(request.getParameter("model"));
		vehicle.setPhoto(request.getParameter("photo"));
		vehicle.setRegistrationNo(request.getParameter("RegistrationNo"));
		vehicle.setSeats(Integer.parseInt(request.getParameter("seats")));
		
		vehicleService s = new vehicleService();
		int res=s.addVehicle(vehicle);
		
		if(res==0) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/addVehicle.jsp");
			request.setAttribute("errors_success", 0);
			dispatcher.forward(request, response);
		}else if(res==1) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/addVehicle.jsp");
			request.setAttribute("errors_success", 1);
			dispatcher.forward(request, response);
		}
	}

}
