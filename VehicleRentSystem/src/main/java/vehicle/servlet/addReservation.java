package vehicle.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vehicle.classes.*;
import vehicle.service.*;
/**
 * Servlet implementation class addReservation
 */
@WebServlet("/addReservation")
public class addReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addReservation() {
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
        	if(privilege != 0){
        		 // User does not have the required privilege
                response.sendError(HttpServletResponse.SC_FORBIDDEN); // 403 Forbidden
                return;
        		
        	}
           
        }
        
     // Retrieve the CSRF token from the form and session
        String tokenFromRequest = request.getParameter("csrfToken");
        String tokenFromSession = (String) session.getAttribute("csrfToken");

        // Check if the CSRF token is valid
        if (tokenFromRequest == null || !tokenFromRequest.equals(tokenFromSession)) {
            // If tokens don't match, block the request
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Invalid CSRF Token");
            return;
        }
		
		response.setContentType("text/html");
		Reservation reservation =  new Reservation();

		reservation.setDriverId(Integer.parseInt(request.getParameter("driverId")));
		reservation.setUserId(Integer.parseInt(request.getSession(false).getAttribute("userId").toString()));
		reservation.setVehicleId(Integer.parseInt(request.getParameter("vehicleId")));
		reservation.setDate(request.getParameter("date"));
		
		reservationService s = new reservationService();
		int res=s.addReservation(reservation);
		
		if(res==0) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/addReservation.jsp");
			request.setAttribute("errors_success", 0);
			dispatcher.forward(request, response);
		}else if(res==1) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/addReservation.jsp");
			request.setAttribute("errors_success", 1);
			dispatcher.forward(request, response);
		}
	}

}
