package com.Employee.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Employee {
	private int id;
	private String name;
	private String role;
	private String department;
	private String email;
	private String phone;
	private Date hire_date;
	private String status;
	private Date created_at;
	private String profile;

	public Employee(String name, String role, String department, String email, String phone, String profile) {
		super();
		this.name = name;
		this.role = role;
		this.department = department;
		this.email = email;
		this.phone = phone;
		this.profile = profile;
	}

	public Employee(String name, String role, String department, String email, String phone, Date hire_date) {
		super();
		this.name = name;
		this.role = role;
		this.department = department;
		this.email = email;
		this.phone = phone;
		this.hire_date = hire_date;
	}

	public Employee(int id, String name, String role, String department, String email, String phone, Date hire_date) {
		super();
		this.id = id;
		this.name = name;
		this.role = role;
		this.department = department;
		this.email = email;
		this.phone = phone;
		this.hire_date = hire_date;
	}

	public Employee(int id, String name, String role, String department, String email, String phone, Date hire_date,
			String status, String profile) {
		super();
		this.id = id;
		this.name = name;
		this.role = role;
		this.department = department;
		this.email = email;
		this.phone = phone;
		this.hire_date = hire_date;
		this.status = status;
		this.profile = profile;
	}

	public Employee(int id, String role, String department, String email, String phone, String status) {
		super();
		this.id = id;
		this.role = role;
		this.department = department;
		this.email = email;
		this.phone = phone;
		this.status = status;
	}

	public Employee(String name, String role, String email, String status) {
		super();
		this.name = name;
		this.role = role;
		this.email = email;
		this.status = status;
	}
	
	

}
