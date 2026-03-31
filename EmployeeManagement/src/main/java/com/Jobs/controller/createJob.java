package com.Jobs.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

import com.Employee.model.Jobs;
import com.Employee.model.JobsDao;

@WebServlet("/createJob")
public class createJob extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public createJob() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String title = request.getParameter("jobTitle");
		String role = request.getParameter("role");
		String location = request.getParameter("location");
		String mode = request.getParameter("workMode");
		String type = request.getParameter("jobType");
		int minExp = Integer.parseInt(request.getParameter("minExperience"));
		String jd = request.getParameter("jobDescription");

		String deadlineStr = request.getParameter("deadline");
		Date dt = Date.valueOf(deadlineStr);

		int vac = Integer.parseInt(request.getParameter("vacancies"));
		String createdBy = request.getParameter("createdBy");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		JobsDao dao = new JobsDao();
		Jobs j = new Jobs(title, role, location, mode, type, minExp, vac, jd, dt, createdBy, email, phone);

		int i = dao.createJob(j);

		if (i != 0) {
			response.sendRedirect("viewJobs");
		} else {
			request.setAttribute("msg", "Job not created..");
			RequestDispatcher rd = request.getRequestDispatcher("createJob.jsp");
			rd.forward(request, response);
		}

	}

}
