package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;
import model.StudentDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.apache.catalina.connector.Response;

@WebServlet("/read")
public class ReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReadServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StudentDao dao = new StudentDao();
		List<Student> list = dao.read();

		PrintWriter out = response.getWriter();

		for (Student s : list) {
			out.println(s.getId() + "\t" + s.getName() + "\t" + s.getAge() + "\t" + s.getRollNo());
		}

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String n = (String)req.getAttribute("key");
		
		StudentDao dao = new StudentDao();
		List<Student> list = dao.read();
		
		PrintWriter out = resp.getWriter();
		
		out.println("<h1> Welcome : " + n + "</h1>");

		for (Student s : list) {
			out.println(s.getId() + "\t" + s.getName() + "\t" + s.getAge() + "\t" + s.getRollNo() + "</br>");
		}
	}

}
