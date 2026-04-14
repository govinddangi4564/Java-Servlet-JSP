package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import dao.UserDao;

@WebServlet("/updatePasswordUsingOtp")
public class UpdatePasswordUsingOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdatePasswordUsingOTP() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String otp = request.getParameter("otp");
		String hashed = BCrypt.hashpw(password, BCrypt.gensalt());

		UserDao dao = new UserDao();

		int i = dao.updatePassword(email, hashed, otp);

		if (i != 0) {
			response.sendRedirect("login");
		}
	}

}
