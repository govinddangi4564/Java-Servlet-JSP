package com.Employee.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class ReportsDao {
	private static final String URL = "jdbc:mysql://localhost:3306/infoviaan";
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "Govind";

	public Connection getConnection() {
		Connection con = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return con;
	}

	public List<Employee> viewEmployeeReport() {
		List<Employee> list = new LinkedList<Employee>();

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select name, role, email, status from employeemanagement");

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				String role = rs.getString("role");
				String email = rs.getString("email");
				String status = rs.getString("status");

				list.add(new Employee(name, role, email, status));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Jobs> viewJobsReport() {
		List<Jobs> list = new LinkedList<Jobs>();

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement("select title, role, deadline, status from jobs");

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				String title = rs.getString("title");
				String role = rs.getString("role");
				Date deadline = rs.getDate("deadline");
				String status = rs.getString("status");

				list.add(new Jobs(title, role, deadline, status));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
