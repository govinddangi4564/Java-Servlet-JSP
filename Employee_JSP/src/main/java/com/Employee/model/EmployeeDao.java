package com.Employee.model;

import java.sql.Connection;
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

	public int save(Employee em) {
		int i = 0;

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement(
						"insert into employee(name, age, salary, email, department) values(?,?,?,?,?)");) {
			pst.setString(1, em.getName());
			pst.setInt(2, em.getAge());
			pst.setDouble(3, em.getSalary());
			pst.setString(4, em.getEmail());
			pst.setString(5, em.getDepartment());

			i = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;
	}

	public List<Employee> getAll() {
		List<Employee> list = new LinkedList<>();

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement("select * from employee");) {

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				double salary = rs.getDouble("salary");
				String email = rs.getString("email");
				String dep = rs.getString("department");

				list.add(new Employee(id, name, age, email, salary, dep));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public int delete(int id) {
		int i = 0;

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement("delete from employee where id = ?");) {

			pst.setInt(1, id);

			i = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;
	}

	public Employee getEmployee(int id) {
		Employee em = null;

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement("select * from employee where id = ?");) {
			pst.setInt(1, id);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String email = rs.getString("email");
				double salary = rs.getDouble("salary");
				String dept = rs.getString("department");

				em = new Employee(id, name, age, email, salary, dept);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return em;
	}

	public int updateEmployee(Employee em) {
		int i = 0;

		Connection con = getConnection();
		try (PreparedStatement pst = con
				.prepareStatement("update employee set name=?, age=?, email=?, salary=?,department=? where id=?");) {
			pst.setString(1, em.getName());
			pst.setInt(2, em.getAge());
			pst.setString(3, em.getEmail());
			pst.setDouble(4, em.getSalary());
			pst.setString(5, em.getDepartment());
			pst.setInt(6, em.getId());

			i = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	public List<Employee> search(String name) {
		List<Employee> list = new LinkedList<>();

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement("select * from employee where name = ?");) {
			pst.setString(1, name);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String empName = rs.getString("name");
				int age = rs.getInt("age");
				double salary = rs.getDouble("salary");
				String email = rs.getString("email");
				String dep = rs.getString("department");

				list.add(new Employee(id, empName, age, email, salary, dep));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
