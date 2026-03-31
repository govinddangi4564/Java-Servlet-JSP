package com.Jobs.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.Employee.model.Jobs;
import com.Employee.model.JobsDao;

@WebServlet("/filterJobs")
public class FilterJobs extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FilterJobs() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String status = request.getParameter("status");

		JobsDao dao = new JobsDao();

		List<Jobs> list = dao.filterJobs(status);

		request.setAttribute("jobs", list);

		RequestDispatcher rd = request.getRequestDispatcher("viewJobs.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
