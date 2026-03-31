package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@MultipartConfig
@WebServlet("/upload")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UploadServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Part pt = request.getPart("img");
		String path = "D:\\All Codes\\Java Servlet-JSP\\ImageProcessing\\src\\main\\webapp\\Files\\";
		String fileName = pt.getSubmittedFileName();
		
		pt.write(path + File.separator + fileName);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infoviaan", "root", "Govind");
			PreparedStatement pst = con.prepareStatement("insert into imageData(name) values (?)");
			pst.setString(1, fileName);
			
			int i = pst.executeUpdate();
			
			if(i != 0) {
				response.sendRedirect("show.jsp");
			}else {
				response.getWriter().println("Something went wrong.");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
	}

}
