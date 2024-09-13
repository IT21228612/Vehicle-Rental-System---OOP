package vehicle.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vehicle.classes.*;
import vehicle.service.*;
/**
 * Servlet implementation class addDriver
 */
@WebServlet("/addDriver")
@MultipartConfig
public class addDriver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addDriver() {
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
		response.setContentType("text/html");

		Driver driver =  new Driver();

		driver.setName(request.getParameter("name"));
		driver.setAddress(request.getParameter("address"));
		driver.setAge(Integer.parseInt(request.getParameter("age")));
		driver.setNic(request.getParameter("nic"));
		driver.setPhoto(request.getParameter("photo"));
		driver.setYears(Integer.parseInt(request.getParameter("years")));
		
		driverService s = new driverService();
		int res=s.addDriver(driver);
		
		if(res==0) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/addDriver.jsp");
			request.setAttribute("errors_success", 0);
			dispatcher.forward(request, response);
		}else if(res==1) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/addDriver.jsp");
			request.setAttribute("errors_success", 1);
			dispatcher.forward(request, response);
		}
	}

}
