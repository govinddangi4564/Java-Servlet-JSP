package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class StudentDao {
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

	public int save(Student st) {
		int i = 0;

		try (Connection con = getConnection();
				PreparedStatement pst = con
						.prepareStatement("insert into studentinfo (name, age, roll) values (?,?,?)");) {
			pst.setString(1, st.getName());
			pst.setInt(2, st.getAge());
			pst.setInt(3, st.getRollNo());

			i = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;
	}

	public List<Student> read() {
		List<Student> list = new LinkedList<Student>();

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement("select * from studentinfo");) {
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				int roll = rs.getInt("roll");

				list.add(new Student(id, name, age, roll));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

}
