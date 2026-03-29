package com.Employee.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Employee.model.Employee;
import com.Employee.model.EmployeeDao;

@WebServlet("/addCandidate")
public class AddCandidate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddCandidate() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String role = request.getParameter("role");
		String dept = request.getParameter("department");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		Employee em = new Employee(name, role, dept, email, phone); 
		EmployeeDao dao = new EmployeeDao();
		
		int i = dao.addCandidate(em);
		
		if (i != 0) {
			response.sendRedirect("candidate.jsp");
		} else {
			request.setAttribute("msg", "Data is not Stored..");
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
		}
	}

}
