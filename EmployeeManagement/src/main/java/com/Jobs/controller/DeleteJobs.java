package com.Jobs.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Employee.model.Jobs;
import com.Employee.model.JobsDao;

@WebServlet("/deleteJobs")
public class DeleteJobs extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteJobs() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		JobsDao dao = new JobsDao();
		int i = dao.deleteJob(id);

		if (i != 0) {
			response.sendRedirect("viewJobs");
		} else {
			request.setAttribute("msg", "Candidate is not Deleted.");
			RequestDispatcher rd = request.getRequestDispatcher("viewJobs.jsp");
			rd.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
