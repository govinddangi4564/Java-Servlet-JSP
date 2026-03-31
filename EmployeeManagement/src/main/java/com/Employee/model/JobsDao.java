package com.Employee.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class JobsDao {
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

	public int createJob(Jobs j) {
		int i = 0;

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement(
						"INSERT INTO jobs (title, role, location, work_mode, job_type, experience_min, description, deadline, created_by, contact_email, contact_phone, total_vacancies)VALUES(?,?,?,?,?,?,?,?,?,?,?,?) ");) {

			pst.setString(1, j.getTitle());
			pst.setString(2, j.getRole());
			pst.setString(3, j.getLocation());
			pst.setString(4, j.getWorkMode());
			pst.setString(5, j.getJobType());
			pst.setInt(6, j.getMinExperience());
			pst.setString(7, j.getJobDescription());
			pst.setDate(8, j.getDeadline());
			pst.setString(9, j.getCreatedBy());
			pst.setString(10, j.getEmail());
			pst.setString(11, j.getPhone());
			pst.setInt(12, j.getTotalVacancies());

			i = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;
	}

	public List<Jobs> viewAllJobs() {
		List<Jobs> list = new LinkedList<Jobs>();

		try {
			Connection con = getConnection();
			PreparedStatement pst = con.prepareStatement(
					"select job_id, title, role, location, work_mode, job_type, experience_min, description, deadline, status,created_by, contact_email, contact_phone,total_vacancies from jobs");
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("job_id");
				String title = rs.getString("title");
				String role = rs.getString("role");
				String loc = rs.getString("location");
				String mode = rs.getString("work_mode");
				String type = rs.getString("job_type");
				int exp = rs.getInt("experience_min");
				String desc = rs.getString("description");
				Date deadline = rs.getDate("deadline");
				String sts = rs.getString("status");
				String crBy = rs.getString("created_by");
				String email = rs.getString("contact_email");
				String phone = rs.getString("contact_phone");
				int totalVac = rs.getInt("total_vacancies");

				list.add(
						new Jobs(id, title, role, loc, mode, type, exp, totalVac, desc, deadline, sts, crBy, email, phone));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Jobs> filterJobs(String status) {
		List<Jobs> list = new LinkedList<Jobs>();

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement(
						"select title, role, location, work_mode, job_type, experience_min, description, deadline, status,created_by, contact_email, contact_phone,total_vacancies from jobs where status = ?");) {

			pst.setString(1, status);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				String title = rs.getString("title");
				String role = rs.getString("role");
				String loc = rs.getString("location");
				String mode = rs.getString("work_mode");
				String type = rs.getString("job_type");
				int exp = rs.getInt("experience_min");
				String desc = rs.getString("description");
				Date deadline = rs.getDate("deadline");
				String sts = rs.getString("status");
				String crBy = rs.getString("created_by");
				String email = rs.getString("contact_email");
				String phone = rs.getString("contact_phone");
				int totalVac = rs.getInt("total_vacancies");

				list.add(
						new Jobs(title, role, loc, mode, type, exp, totalVac, desc, deadline, sts, crBy, email, phone));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public int deleteJob(int id) {
		int i = 0;

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement("delete from jobs where job_id = ?");) {
			pst.setInt(1, id);

			i = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;

	}
}
