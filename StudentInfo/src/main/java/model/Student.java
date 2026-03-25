package model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student {
	private int id;
	private String name;
	private int age;
	private int rollNo;

	public Student(String name, int age, int rollNo) {
		super();
		this.name = name;
		this.age = age;
		this.rollNo = rollNo;
	}

}
