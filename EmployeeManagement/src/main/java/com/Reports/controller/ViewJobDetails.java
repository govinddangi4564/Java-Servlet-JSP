package com.Reports.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Employee.model.Employee;
import com.Employee.model.Jobs;
import com.Employee.model.ReportsDao;

@WebServlet("/viewJobDetails")
public class ViewJobDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewJobDetails() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		ReportsDao dao = new ReportsDao();
		Jobs jb = dao.viewJobDetails(id);
		
		request.setAttribute("viewJob", jb);
		RequestDispatcher rd = request.getRequestDispatcher("viewJobDetails.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
