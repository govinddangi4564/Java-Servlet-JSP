package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.Products;

public class ProductDao {

	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/infoviaan";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "Govind";

	public static Connection getConnection() {
		Connection con = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return con;
	}

	public int addProducts(Products p) {
		int i = 0;

		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement(
						"insert into products(title, category, brand, description, rating, price, photo) values(?,?,?,?,?,?,?)");) {

			pst.setString(1, p.getTitle());
			pst.setString(2, p.getCategory());
			pst.setString(3, p.getBrand());
			pst.setString(4, p.getDescription());
			pst.setInt(5, p.getRating());
			pst.setDouble(6, p.getPrice());
			pst.setString(7, p.getImage());

			i = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}

	public List<Products> getAll() {
		List<Products> list = new LinkedList<>();
		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement("select * from products");) {

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				int proId = rs.getInt("id");
				String title = rs.getString("title");
				String cat = rs.getString("category");
				String brand = rs.getString("brand");
				String desc = rs.getString("description");
				int rat = rs.getInt("rating");
				double price = rs.getDouble("price");
				String image = rs.getString("photo");

				list.add(new Products(proId, title, cat, brand, desc, rat, price, image));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public Products getProduct(int id) {
		Products pr = null;
		try (Connection con = getConnection();
				PreparedStatement pst = con.prepareStatement("select * from products where id = ?");) {
			pst.setInt(1, id);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				int proId = rs.getInt("id");
				String title = rs.getString("title");
				String cat = rs.getString("category");
				String brand = rs.getString("brand");
				String desc = rs.getString("description");
				int rat = rs.getInt("rating");
				double price = rs.getDouble("price");
				String image = rs.getString("photo");

				pr = new Products(proId, title, cat, brand, desc, rat, price, image);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pr;
	}

}
