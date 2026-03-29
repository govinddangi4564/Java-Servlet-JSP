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

@WebServlet("/delete")
public class DeleteEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteEmployee() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		EmployeeDao dao = new EmployeeDao();
		int i = dao.delete(id);

		if (i != 0) {
			response.sendRedirect("read");
		} else {
			request.setAttribute("msg", "Data is not Deleted.");
			RequestDispatcher rd = request.getRequestDispatcher("read");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
