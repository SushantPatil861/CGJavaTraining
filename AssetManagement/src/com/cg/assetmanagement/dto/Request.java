package com.cg.assetmanagement.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name = "asset_request")
public class Request {

	@Id
	@SequenceGenerator(name = "reqSeq", sequenceName = "req_seq")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "reqSeq")
	private Integer requestId;
	@OneToOne
	@JoinColumn(name = "assetId")
	private Asset asset;
	@OneToOne
	@JoinColumn(name = "empNo")
	private Employee employee;
	@OneToOne
	@JoinColumn(name = "mgrCode")
	private Employee manager;
	private String requirement;
	private String status;
	@OneToOne
	@JoinColumn(name = "userId")
	private User user;

	public Integer getRequestId() {
		return requestId;
	}

	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}

	public Asset getAsset() {
		return asset;
	}

	public void setAsset(Asset asset) {
		this.asset = asset;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Employee getManager() {
		return manager;
	}

	public void setManager(Employee manager) {
		this.manager = manager;
	}

	public String getRequirement() {
		return requirement;
	}

	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Request [requestId=" + requestId + ", asset=" + asset
				+ ", employee=" + employee + ", manager=" + manager
				+ ", requirement=" + requirement + ", status=" + status
				+ ", user=" + user + "]";
	}

}
