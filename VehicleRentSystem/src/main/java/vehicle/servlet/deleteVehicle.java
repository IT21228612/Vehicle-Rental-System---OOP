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
 * Servlet implementation class deleteVehicle
 */
@WebServlet("/deleteVehicle")
public class deleteVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteVehicle() {
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

		vehicleService service = new vehicleService();
		int res=service.deleteVehicle(Integer.parseInt(request.getParameter("deleteId")));
		
		if(res==1) {
			request.setAttribute("errors_success", 1);
		}else {
			request.setAttribute("errors_success", 0);
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/viewVehicle.jsp");
		dispatcher.forward(request, response);
		
	}

}
