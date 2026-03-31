package com.Employee.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.Employee.model.Employee;
import com.Employee.model.EmployeeDao;

@MultipartConfig
@WebServlet("/addCandidate")
public class AddCandidate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddCandidate() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String role = request.getParameter("role");
		String dept = request.getParameter("department");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		Part pt = request.getPart("profile");
		
		String path = "D:\\All Codes\\Java Servlet-JSP\\EmployeeManagement\\src\\main\\webapp\\Files\\";
		String fileName = pt.getSubmittedFileName();
		
		pt.write(path + File.separator + fileName);
		
		Employee em = new Employee(name, role, dept, email, phone, fileName); 
		EmployeeDao dao = new EmployeeDao();
		
		int i = dao.addCandidate(em);
		
		if (i != 0) {
			response.sendRedirect("getCandidate");
		} else {
			request.setAttribute("msg", "Data is not Stored..");
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
		}
	}

}
