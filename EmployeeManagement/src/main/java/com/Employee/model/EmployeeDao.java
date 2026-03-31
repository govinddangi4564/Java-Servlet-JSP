package com.Employee.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class EmployeeDao {
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

	public int addCandidate(Employee em) {
		int i = 0;

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement(
						"insert into employeemanagement (name, role, department, email, phone, profile, hire_date) values(?,?,?,?,?,?,CURRENT_DATE)");) {
			pst.setString(1, em.getName());
			pst.setString(2, em.getRole());
			pst.setString(3, em.getDepartment());
			pst.setString(4, em.getEmail());
			pst.setString(5, em.getPhone());
			pst.setString(6, em.getProfile());

			i = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;
	}

	public List<Employee> allCandidate() {
		List<Employee> list = new LinkedList<Employee>();

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement("select * from employeemanagement limit 8 offset 0");) {

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String role = rs.getString("role");
				String dept = rs.getString("department");
				Date dt = rs.getDate("hire_date");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String status = rs.getString("status");
				String profile = rs.getString("profile");

				list.add(new Employee(id, name, role, dept, email, phone, dt, status, profile));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Employee> allCandidate(int offSet) {
		List<Employee> list = new LinkedList<Employee>();

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement(
						"select * from employeemanagement limit 8 offset ?");) {

			pst.setInt(1, offSet);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String role = rs.getString("role");
				String dept = rs.getString("department");
				Date dt = rs.getDate("hire_date");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String status = rs.getString("status");
				String profile = rs.getString("profile");

				list.add(new Employee(id, name, role, dept, email, phone, dt, status, profile));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public Employee getCandidate(int id) {
		Employee em = null;

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement(
						"select id, role, department, email, phone, status from employeemanagement where id = ?");) {
			pst.setInt(1, id);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				int empid = rs.getInt("id");
				String role = rs.getString("role");
				String dept = rs.getString("department");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String status = rs.getString("status");

				em = new Employee(empid, role, dept, email, phone, status);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return em;
	}

	public int editCandidate(Employee em) {
		int i = 0;

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement(
						"update employeemanagement set role=?, department=?, email=?, phone=?, status=? where id=?");) {
			pst.setString(1, em.getRole());
			pst.setString(2, em.getDepartment());
			pst.setString(3, em.getEmail());
			pst.setString(4, em.getPhone());
			pst.setString(5, em.getStatus());
			pst.setInt(6, em.getId());

			i = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;

	}

	public int deleteCandidate(int id) {
		int i = 0;

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement("delete from employeemanagement where id = ?");) {

			pst.setInt(1, id);

			i = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;
	}

	public List<Employee> filterCandidate(String sts) {
		List<Employee> list = new LinkedList<Employee>();

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement(
						"select * from employeemanagement where status = ? limit 8 offset 0");) {
			pst.setString(1, sts);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String role = rs.getString("role");
				String dept = rs.getString("department");
				Date dt = rs.getDate("hire_date");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String status = rs.getString("status");
				String profile = rs.getString("profile");

				list.add(new Employee(id, name, role, dept, email, phone, dt, status, profile));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public int getTotalEmployee() {
		int i = 0;
		try (Connection co = getConnection();
				PreparedStatement pst = co.prepareStatement("select count(id) as total from employeemanagement");) {

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				i = rs.getInt("total");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	public List<Employee> sortCandidate(String sort, String order) {
		List<Employee> list = new LinkedList<Employee>();

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement(
						"select id, name, role, department, hire_date, email, phone, status, profile from employeemanagement order by "
								+ sort + " " + order + " limit 8 offset 0;");) {

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String role = rs.getString("role");
				String dept = rs.getString("department");
				Date dt = rs.getDate("hire_date");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String status = rs.getString("status");
				String profile = rs.getString("profile");

				list.add(new Employee(id, name, role, dept, email, phone, dt, status,profile));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Employee> searchCandidate(String key) {
		List<Employee> list = new LinkedList<Employee>();

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement(
						"select * from employeemanagement where name like ? OR role like ? OR department like ?");) {

			pst.setString(1, "%" + key + "%");
			pst.setString(2, "%" + key + "%");
			pst.setString(3, "%" + key + "%");

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String role = rs.getString("role");
				String dept = rs.getString("department");
				Date dt = rs.getDate("hire_date");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String status = rs.getString("status");
				String profile = rs.getString("profile");

				list.add(new Employee(id, name, role, dept, email, phone, dt, status, profile));
			}

		} catch (

		SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
}
