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

@WebServlet("/getJobs")
public class GetJobsByOffset extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetJobsByOffset() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int offset = Integer.parseInt(request.getParameter("offset"));
		
		JobsDao dao = new JobsDao();
		List<Jobs> list = dao.viewAllJobs(offset);
		
		request.setAttribute("jobs", list);
		RequestDispatcher rd = request.getRequestDispatcher("viewJobs.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
