package com.Jobs.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import com.Employee.model.Jobs;
import com.Employee.model.JobsDao;

@WebServlet("/viewJobs")
public class ViewJobs extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ViewJobs() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		JobsDao dao = new JobsDao();

		List<Jobs> list = dao.viewAllJobs();

		for (Jobs j : list) {

			LocalDate deadline = j.getDeadline().toLocalDate();
			LocalDate today = LocalDate.now();

			String status;

			if (deadline.isBefore(today)) {
				status = "Closed";
			} else if (deadline.isEqual(today)) {
				status = "On Hold";
			} else {
				status = "Open";
			}

			dao.checkStatus(j.getId(), status);
		}

		request.setAttribute("jobs", list);
		RequestDispatcher rd = request.getRequestDispatcher("viewJobs.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
