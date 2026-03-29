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

@WebServlet("/register")
public class RegisterEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterEmployee() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String department = request.getParameter("department");
		int age = Integer.parseInt(request.getParameter("age"));
		double salary = Double.parseDouble(request.getParameter("salary"));

		Employee em = new Employee(name, age, email, salary, department);
		EmployeeDao dao = new EmployeeDao();
		int i = dao.save(em);

		if (i != 0) {
			response.sendRedirect("read");
		} else {
			request.setAttribute("msg", "Data is not Stored..");
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
		}
	}

}
