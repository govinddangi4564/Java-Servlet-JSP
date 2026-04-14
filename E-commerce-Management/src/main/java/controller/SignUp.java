package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import dao.UserDao;

@WebServlet("/signup")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDao dao = new UserDao();

	public SignUp() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		String email = request.getParameter("email");
		String hashp = BCrypt.hashpw(password, BCrypt.gensalt());

		Users user = new Users(name, username, hashp, email, role);

		int i = dao.saveUser(user);

		if (i != 0) {
			response.sendRedirect("login");
		} else {
			System.out.println("Something went wrong !!");
		}

	}

}
