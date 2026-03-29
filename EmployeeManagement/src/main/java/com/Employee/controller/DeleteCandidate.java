package com.Employee.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Employee.model.Employee;
import com.Employee.model.EmployeeDao;

@WebServlet("/deleteCandidate")
public class DeleteCandidate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteCandidate() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		EmployeeDao dao = new EmployeeDao();

		int i = dao.deleteCandidate(id);

		if (i != 0) {
			response.sendRedirect("getCandidate");
		} else {
			request.setAttribute("msg", "Candidate is not Deleted.");
			RequestDispatcher rd = request.getRequestDispatcher("getCandidate");
			rd.forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
