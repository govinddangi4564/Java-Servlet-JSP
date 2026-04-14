package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Products;

import java.io.File;
import java.io.IOException;

import dao.ProductDao;

@WebServlet("/addProduct")
@MultipartConfig
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddProduct() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String brand = request.getParameter("brand");
		String category = request.getParameter("category");
		String description = request.getParameter("description");

		String ratingStr = request.getParameter("rating");
		String priceStr = request.getParameter("price");

		int rating = 0;
		double price = 0;

		if (ratingStr != null && !ratingStr.isEmpty()) {
			rating = Integer.parseInt(ratingStr);
		}

		if (priceStr != null && !priceStr.isEmpty()) {
			price = Double.parseDouble(priceStr);
		}

		Part pt = request.getPart("img");

		String path = "D:\\All Codes\\Java Servlet-JSP\\E-commerce-Management\\src\\main\\webapp\\files\\";

		String image = title + "_" + pt.getSubmittedFileName();

		pt.write(path + File.separator + image);

		Products pr = new Products(title, category, brand, description, rating, price, image);

		ProductDao dao = new ProductDao();
		int i = dao.addProducts(pr);

		if (i != 0) {
			response.sendRedirect("show");
		} else {
			response.setContentType("text/html");
			response.getWriter().println("<h3 style='color:red;'>Something went wrong</h3>");
		}

	}

}
