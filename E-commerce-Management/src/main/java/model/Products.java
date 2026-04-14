package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Products {
	private int id;
	private String title;
	private String category;
	private String brand;
	private String description;
	private int rating;
	private double price;
	private String image;

	public Products(String title, String category, String brand, String description, int rating, double price,
			String image) {
		super();
		this.title = title;
		this.category = category;
		this.brand = brand;
		this.description = description;
		this.rating = rating;
		this.price = price;
		this.image = image;
	}

}
