package com.cg.assetmanagement.dto;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

/**
 * Description:UserMaster Dto
 * 
 * @author pshandi1
 *
 */
@Entity
@Table(name = "user_master")
public class User {
	@Id
	@Column(name = "userId")
	private String userId;
	@Column(name = "userName")
	private String userName;
	@Column(name = "userPassword")
	private String userPassword;
	@Column(name = "userType")
	private String userType;

	@OneToOne
	@JoinColumns(@JoinColumn(name = "empno"))
	Employee employee;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName
				+ ", userPassword=" + userPassword + ", userType=" + userType
				+ ", employee=" + employee + "]";
	}

}
