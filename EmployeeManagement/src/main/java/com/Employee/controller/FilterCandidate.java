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

@WebServlet("/filterCandidate")
public class FilterCandidate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FilterCandidate() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String status = request.getParameter("status");

		EmployeeDao dao = new EmployeeDao();
		List<Employee> list = dao.filterCandidate(status);

		request.setAttribute("Emp", list);
		RequestDispatcher rd = request.getRequestDispatcher("candidate.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
