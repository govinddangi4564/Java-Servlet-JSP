package com.Reports.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.Employee.model.Jobs;
import com.Employee.model.ReportsDao;

@WebServlet("/jobReports")
public class JobReports extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public JobReports() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ReportsDao dao = new ReportsDao();

		List<Jobs> list = dao.viewJobsReport();

		request.setAttribute("jobReport", list);
		RequestDispatcher rd = request.getRequestDispatcher("jobReports.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
