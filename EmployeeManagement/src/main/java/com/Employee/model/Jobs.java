package com.Employee.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Jobs {
	private int id;
	private String title;
	private String role;
	private String location;
	private String workMode;
	private String jobType;
	private int minExperience;
	private int totalVacancies;
	private String jobDescription;
	private Date deadline;
	private String status;
	private String createdBy;
	private String email;
	private String phone;
	private Date createDate;

	public Jobs(String title, String role, String location, String workMode, String jobType, int minExperience,
			int totalVacancies, String jobDescription, Date deadline, String createdBy, String email, String phone) {
		super();
		this.title = title;
		this.role = role;
		this.location = location;
		this.workMode = workMode;
		this.jobType = jobType;
		this.minExperience = minExperience;
		this.totalVacancies = totalVacancies;
		this.jobDescription = jobDescription;
		this.deadline = deadline;
		this.createdBy = createdBy;
		this.email = email;
		this.phone = phone;
	}

	public Jobs(String title, String role, String location, String workMode, String jobType, int minExperience,
			int totalVacancies, String jobDescription, Date deadline, String status, String createdBy, String email,
			String phone) {
		super();
		this.title = title;
		this.role = role;
		this.location = location;
		this.workMode = workMode;
		this.jobType = jobType;
		this.minExperience = minExperience;
		this.totalVacancies = totalVacancies;
		this.jobDescription = jobDescription;
		this.deadline = deadline;
		this.status = status;
		this.createdBy = createdBy;
		this.email = email;
		this.phone = phone;
	}

	public Jobs(int id, String title, String role, String location, String workMode, String jobType, int minExperience,
			int totalVacancies, String jobDescription, Date deadline, String status, String createdBy, String email,
			String phone) {
		super();
		this.id = id;
		this.title = title;
		this.role = role;
		this.location = location;
		this.workMode = workMode;
		this.jobType = jobType;
		this.minExperience = minExperience;
		this.totalVacancies = totalVacancies;
		this.jobDescription = jobDescription;
		this.deadline = deadline;
		this.status = status;
		this.createdBy = createdBy;
		this.email = email;
		this.phone = phone;
	}

	public Jobs(int id, String title, String role, Date deadline, String status) {
		super();
		this.id = id;
		this.title = title;
		this.role = role;
		this.deadline = deadline;
		this.status = status;
	}

}
