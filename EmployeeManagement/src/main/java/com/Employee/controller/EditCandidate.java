package com.Employee.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.Employee.model.Employee;
import com.Employee.model.EmployeeDao;

@WebServlet("/editCandidate")
public class EditCandidate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditCandidate() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		EmployeeDao dao = new EmployeeDao();
		Employee em = dao.getCandidate(id);
		
		request.setAttribute("getEmp", em);
		
		RequestDispatcher rd = request.getRequestDispatcher("editCandidate.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		String role = request.getParameter("role");
		String dept = request.getParameter("department");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String status = request.getParameter("status");

		Employee em = new Employee(id, role, dept, email, phone, status);

		EmployeeDao dao = new EmployeeDao();

		int i = dao.editCandidate(em);

		if (i != 0) {
			response.sendRedirect("getCandidate");
		} else {
			request.setAttribute("msg", "Data is not Update.");
			RequestDispatcher rd = request.getRequestDispatcher("editCandidate.jsp");
			rd.forward(request, response);
		}
	}

}
