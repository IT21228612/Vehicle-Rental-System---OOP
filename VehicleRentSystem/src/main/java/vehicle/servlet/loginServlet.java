package vehicle.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vehicle.service.loginService;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        
		//login page post input
		
		response.setContentType("text/html");
		
		loginService login = new loginService();
		int id =login.login(request.getParameter("email"),request.getParameter("password"));
		
		if(login.getSuccess() == 0) {
		    request.setAttribute("errors_success", 0);
		    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
		    dispatcher.forward(request, response);
		} else if(login.getSuccess() == 1) { // Regular User Login
		    request.setAttribute("errors_success", 1);
		   
		    // Invalidate the current session if it exists
	        HttpSession oldSession = request.getSession(false);
	        if (oldSession != null) {
	            oldSession.invalidate();
	        }
	        // Create a new session
	        HttpSession session = request.getSession(true);
	        
		    session.setAttribute("userEmail", request.getParameter("email"));
		    session.setAttribute("userId", id);
		    session.setAttribute("privilege", login.getSuccess() - 1); // privilege = 0 (User)
		    session.setMaxInactiveInterval(1800); // Timeout after 30 minutes of inactivity
		    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
		    dispatcher.forward(request, response);
		} else if(login.getSuccess() == 2) { // Admin Login
		    request.setAttribute("errors_success", 1);
		    
		    // Invalidate the current session if it exists
	        HttpSession oldSession = request.getSession(false);
	        if (oldSession != null) {
	            oldSession.invalidate();
	        }
	        // Create a new session
	        HttpSession session = request.getSession(true);
		    
		    session.setAttribute("userEmail", request.getParameter("email"));
		    session.setAttribute("userId", id);
		    session.setAttribute("privilege", login.getSuccess() - 1); // privilege = 1 (Admin)
		    session.setMaxInactiveInterval(1800); // Timeout after 30 minutes of inactivity
		    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin.jsp");
		    dispatcher.forward(request, response);
		}

		
	}

}
