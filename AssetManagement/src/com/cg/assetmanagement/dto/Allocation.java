package com.cg.assetmanagement.dto;

import java.time.LocalDate;

import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * Description: AllocationDetails DTO
 * 
 * @author pshandi1
 *
 */
@Entity
@Table(name = "asset_allocation")
public class Allocation {

	@Id
	@SequenceGenerator(name = "alloSeq", sequenceName = "allocationSeq")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "alloSeq")
	private Integer allocationId;
	@OneToOne
	@JoinColumn(name = "requestId")
	private Request request;
	@OneToOne
	@JoinColumn(name = "assetId")
	private Asset asset;
	@Convert(converter = LocalDateConverter.class)
	private LocalDate allocationDate;
	@OneToOne
	@JoinColumn(name = "empNo")
	private Employee employee;
	@OneToOne
	@JoinColumn(name = "userId")
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getAllocationId() {
		return allocationId;
	}

	public void setAllocationId(Integer allocationId) {
		this.allocationId = allocationId;
	}

	public Request getRequest() {
		return request;
	}

	public void setRequest(Request request) {
		this.request = request;
	}

	public Asset getAsset() {
		return asset;
	}

	public void setAsset(Asset asset) {
		this.asset = asset;
	}

	public LocalDate getAllocationDate() {
		return allocationDate;
	}

	public void setAllocationDate(LocalDate allocationDate) {
		this.allocationDate = allocationDate;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
}
