package com.Jobs.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

import com.Employee.model.Employee;
import com.Employee.model.EmployeeDao;
import com.Employee.model.Jobs;
import com.Employee.model.JobsDao;

@WebServlet("/editJob")
public class EditJob extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditJob() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		JobsDao dao = new JobsDao();
		Jobs j = dao.getJob(id);

		request.setAttribute("getJob", j);
		RequestDispatcher rd = request.getRequestDispatcher("editJob.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("jobTitle");
		String role = request.getParameter("role");
		String loc = request.getParameter("location");
		String mode = request.getParameter("workMode");
		String type = request.getParameter("jobType");
		int minEx = Integer.parseInt(request.getParameter("minExperience"));
		int vac = Integer.parseInt(request.getParameter("vacancies"));
		String jd = request.getParameter("jobDescription");

		String deadlineStr = request.getParameter("deadline");
		Date dt = Date.valueOf(deadlineStr);

		String crBy = request.getParameter("createdBy");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String status = request.getParameter("status");

		if(status != null){
		    status = status.trim();
		}
		
		Jobs j = new Jobs(id, title, role, loc, mode, type, minEx, vac, jd, dt, status, crBy, email, phone);
		
		JobsDao dao = new JobsDao();
		
		int i = dao.updateJob(j);
		
		if (i != 0) {
			response.sendRedirect("viewJobs");
		} else {
			request.setAttribute("msg", "Data is not Update.");
			RequestDispatcher rd = request.getRequestDispatcher("editJob.jsp");
			rd.forward(request, response);
		}
	}

}
