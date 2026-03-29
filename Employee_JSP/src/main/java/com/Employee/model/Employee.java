package com.Employee.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Employee {

	private int id;
	private String name;
	private int age;
	private String email;
	private double salary;
	private String department;

	public Employee(String name, int age, String email, double salary, String department) {
		super();
		this.name = name;
		this.age = age;
		this.email = email;
		this.salary = salary;
		this.department = department;
	}

}
