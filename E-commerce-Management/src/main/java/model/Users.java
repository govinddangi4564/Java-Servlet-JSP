package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Users {

	private int id;
	private String name;
	private String username;
	private String password;
	private String email;
	private String role;

	public Users(String name, String username, String password, String email, String role) {
		super();
		this.name = name;
		this.username = username;
		this.password = password;
		this.email = email;
		this.role = role;
	}

	public Users(int id, String name, String username, String email) {
		super();
		this.id = id;
		this.name = name;
		this.username = username;
		this.email = email;
	}

}
