package com.Employee.controller;

import java.io.IOException;
import java.util.List;

import com.Employee.model.Employee;
import com.Employee.model.EmployeeDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/getEmployee")
public class GetEmployeeByOffset extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetEmployeeByOffset() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int offset = Integer.parseInt(request.getParameter("offset"));
		EmployeeDao dao = new EmployeeDao();
		List<Employee> list = dao.allCandidate(offset);
		request.setAttribute("Emp", list);
		request.getRequestDispatcher("candidate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
