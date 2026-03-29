package com.Employee.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.Employee.model.Employee;
import com.Employee.model.EmployeeDao;

@WebServlet("/update")
public class UpdateEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateEmployee() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		EmployeeDao dao = new EmployeeDao();
		Employee em = dao.getEmployee(id);
		request.setAttribute("emp", em);
		RequestDispatcher rd = request.getRequestDispatcher("update.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String department = request.getParameter("department");
		int age = Integer.parseInt(request.getParameter("age"));
		double salary = Double.parseDouble(request.getParameter("salary"));
		
		Employee em = new Employee(id, name, age, email, salary, department);
		EmployeeDao dao = new EmployeeDao();
		int i = dao.updateEmployee(em);
		
		if(i != 0) {
			response.sendRedirect("read");
		}else {
			System.out.println("Something went wrong.");
		}
	}

}
