package controller;

import java.io.IOException;
import java.util.Properties;

import dao.UserDao;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/otp")
public class Otp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Otp() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	private String genrateOtp() {
		String s = "";
		for (int i = 1; i <= 4; i++) {
			s += (int) (Math.random() * 10);
		}
		return s;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String otp = genrateOtp();
		String ms = "Otp : " + otp;

		UserDao dao = new UserDao();
		int i = dao.storeOtp(email, otp);

		String from = "govinddangi5811@gmail.com";
		String appPass = "jrhcujbnbnkhzdlf";

		Properties props = new Properties();

		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.smtp.starttls.enable", "true");
		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.setProperty("mail.smtp.port", "587");

		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, appPass);
			}
		});

		try {
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(from));
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			msg.setSubject("sending mail");
			msg.setText(ms);

			Transport.send(msg);

			if (i != 0) {
				response.sendRedirect("updatePassword.jsp");
			}

		} catch (MessagingException e) {
			e.printStackTrace();
			response.getWriter().println("Error: " + e.getMessage());
		}

	}
}
