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
			PreparedStatement pst = con.prepareStatement("select id, name, role, email, status from employeemanagement");

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String role = rs.getString("role");
				String email = rs.getString("email");
				String status = rs.getString("status");

				list.add(new Employee(id, name, role, email, status));

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
			PreparedStatement pst = con.prepareStatement("select job_id, title, role, deadline, status from jobs");

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("job_id");
				String title = rs.getString("title");
				String role = rs.getString("role");
				Date deadline = rs.getDate("deadline");
				String status = rs.getString("status");

				list.add(new Jobs(id, title, role, deadline, status));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Employee viewCandidateDetails(int id) {
		Employee em = null;

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement(
						"select * from employeemanagement where id = ?");) {
			pst.setInt(1, id);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				int empid = rs.getInt("id");
				String name = rs.getString("name");
				String role = rs.getString("role");
				String dept = rs.getString("department");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				Date hd = rs.getDate("hire_date");
				String status = rs.getString("status");
				String profile = rs.getString("profile");

				em = new Employee(empid, name, role, dept, email, phone, hd, status, profile);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return em;
	}
	
	public Jobs viewJobDetails(int id) {
		Jobs jb = null;

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement(
						"select * from jobs where job_id = ?");) {
			pst.setInt(1, id);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				int jobId = rs.getInt("job_id");
				String title = rs.getString("title");
				String role = rs.getString("role");
				String loc = rs.getString("location");
				String mode = rs.getString("work_mode");
				String type = rs.getString("job_type");
				int minExp = rs.getInt("experience_min");
				String desc = rs.getString("description");
				Date deadline = rs.getDate("deadline");
				String status = rs.getString("status");
				String cyBy = rs.getString("created_by");
				String email = rs.getString("contact_email");
				String phone = rs.getString("contact_phone");
				int vac = rs.getInt("total_vacancies");
				
				jb = new Jobs(jobId, title, role, loc, mode, type, minExp, vac, desc, deadline, status, cyBy, email, phone);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return jb;
	}
}
