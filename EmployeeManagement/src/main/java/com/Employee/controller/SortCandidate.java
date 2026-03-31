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

@WebServlet("/sortCandidate")
public class SortCandidate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SortCandidate() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String sort = request.getParameter("sort");
		String order = request.getParameter("order");

		if (sort == null)
			sort = "name";
		if (order == null)
			order = "asc";

		if (!sort.equals("name") && !sort.equals("created_at") && !sort.equals("hire_date")) {
			sort = "name";
		}

		if (!order.equalsIgnoreCase("asc") && !order.equalsIgnoreCase("desc")) {
			order = "asc";
		}

		EmployeeDao dao = new EmployeeDao();

		List<Employee> list = dao.sortCandidate(sort, order);

		request.setAttribute("Emp", list);
		RequestDispatcher rd = request.getRequestDispatcher("candidate.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
