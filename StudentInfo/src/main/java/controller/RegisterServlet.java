package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;
import model.StudentDao;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public RegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("nm");
		int age = Integer.parseInt(request.getParameter("age"));
		int rollno = Integer.parseInt(request.getParameter("rollNo"));
		
		Student st = new Student(name, age, rollno);
		StudentDao dao = new StudentDao();
		int i = dao.save(st);
		
		if(i != 0) {
			System.out.println("Record succesfully inserted");
			
			request.setAttribute("key", name);
			RequestDispatcher rd = request.getRequestDispatcher("read");
			rd.forward(request, response);
			
		}else {
			System.out.println("Something went wrong.");
		}
	}

}
