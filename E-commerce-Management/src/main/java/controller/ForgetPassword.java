package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import dao.UserDao;

@WebServlet("/")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ForgetPassword() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String hashed = BCrypt.hashpw(password, BCrypt.gensalt());

		UserDao dao = new UserDao();

		int i = dao.updatePassword(email, hashed);

		if (i != 0) {
			response.sendRedirect("login");
		} else {
			response.setContentType("text/html");
			response.getWriter().println("<h3 style='color:red;'>Something went wrong</h3>");

		}
	}

}
