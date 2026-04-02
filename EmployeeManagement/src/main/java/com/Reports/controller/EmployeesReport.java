package com.Reports.controller;

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
import com.Employee.model.ReportsDao;

@WebServlet("/employeesReport")
public class EmployeesReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmployeesReport() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ReportsDao dao = new ReportsDao();
		
		List<Employee> list = dao.viewEmployeeReport();
		
		request.setAttribute("EmpReport", list);
		RequestDispatcher rd = request.getRequestDispatcher("employeeReports.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
