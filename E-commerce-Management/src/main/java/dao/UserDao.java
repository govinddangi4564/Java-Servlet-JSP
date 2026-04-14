package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Users;

public class UserDao {

	public int saveUser(Users us) {
		int i = 0;
		try (Connection con = ProductDao.getConnection();
				PreparedStatement pst = con.prepareStatement(
						"insert into users(name, username, password, roles, email) values (?, ?, ?, ?, ?)");) {

			pst.setString(1, us.getName());
			pst.setString(2, us.getUsername());
			pst.setString(3, us.getPassword());
			pst.setString(4, us.getRole());
			pst.setString(5, us.getEmail());

			i = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;
	}

	public Users getUserByUsername(String username) {
		Users us = null;
		try (Connection con = ProductDao.getConnection();
				PreparedStatement pst = con.prepareStatement("select * from users where username = ?");) {
			pst.setString(1, username);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				us = new Users(rs.getInt("id"), rs.getString("name"), rs.getString("username"), rs.getString("email"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return us;
	}

	public String getPassword(String username) {
		String dbpass = null;
		try (Connection con = ProductDao.getConnection();
				PreparedStatement pst = con.prepareStatement("select password from users where username=?");) {

			pst.setString(1, username);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				dbpass = rs.getString("password");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return dbpass;
	}

	public int updatePassword(String email, String hashed) {
		int i = 0;
		try (Connection con = ProductDao.getConnection();
				PreparedStatement pst = con.prepareStatement("update users set password = ? where email = ?");) {

			pst.setString(1, hashed);
			pst.setString(2, email);

			i = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;
	}

	public int updatePassword(String email, String hashed, String otp) {
		int i = 0;
		try (Connection con = ProductDao.getConnection();
				PreparedStatement pst = con.prepareStatement("update users set password =? where email=? and otp=?");) {

			pst.setString(1, hashed);
			pst.setString(2, email);
			pst.setString(3, otp);

			i = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;
	}

	public int storeOtp(String email, String otp) {
		int i = 0;
		try (Connection con = ProductDao.getConnection();
				PreparedStatement pst = con.prepareStatement("update users set otp = ? where email = ?");) {

			pst.setString(1, otp);
			pst.setString(2, email);

			i = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;
	}

}
