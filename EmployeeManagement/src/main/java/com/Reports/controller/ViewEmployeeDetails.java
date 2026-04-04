package com.Reports.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Employee.model.Employee;
import com.Employee.model.ReportsDao;

@WebServlet("/viewEmployeeDetails")
public class ViewEmployeeDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewEmployeeDetails() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		ReportsDao dao = new ReportsDao();
		Employee em = dao.viewCandidateDetails(id);
		
		request.setAttribute("viewEmployee", em);
		RequestDispatcher rd = request.getRequestDispatcher("viewEmployeeDetails.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
