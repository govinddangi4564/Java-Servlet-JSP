package com.Employee.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.Employee.model.Employee;
import com.Employee.model.EmployeeDao;

@WebServlet("/read")
public class ReadEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReadEmployee() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		EmployeeDao dao = new EmployeeDao();
		List<Employee> list = dao.getAll();
		request.setAttribute("Emp", list);
		RequestDispatcher rd = request.getRequestDispatcher("read.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
