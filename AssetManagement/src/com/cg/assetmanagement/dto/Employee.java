package com.cg.assetmanagement.dto;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Description:Employee DTO
 * 
 * @author pshandi1
 *
 */
@Entity
@Table(name = "Employee")
public class Employee {

	@Id
	@Column(name = "empno")
	private int empNo;
	@Column(name = "empName")
	private String empName;
	@Column(name = "designation")
	private String designation;
	@Column(name = "mgrCode")
	private int mgrCode;
	@Convert(converter=LocalDateConverter.class)
	@Column(name = "hireDate")
	private LocalDate hireDate;
	@Column(name = "salary")
	private double salary;
	@Column(name = "department")
	private String department;

	public String getDepartment() {
		return department;
	}

	public void setDepartmentName(String department) {
		this.department = department;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public int getEmpNo() {
		return empNo;
	}

	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public LocalDate getHireDate() {
		return hireDate;
	}

	public void setHireDate(LocalDate hireDate) {
		this.hireDate = hireDate;
	}

	public int getMgrCode() {
		return mgrCode;
	}

	public void setMgrCode(int mgrCode) {
		this.mgrCode = mgrCode;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	@Override
	public String toString() {
		return "Employee [empNo=" + empNo + ", empName=" + empName
				+ ", designation=" + designation + ", hireDate=" + hireDate
				+ ", mgrCode=" + mgrCode + ", salary=" + salary
				+ ", departmentName=" + department + "]";
	}

}
