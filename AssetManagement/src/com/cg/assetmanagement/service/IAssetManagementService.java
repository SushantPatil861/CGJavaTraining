package com.cg.assetmanagement.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cg.assetmanagement.dto.Allocation;
import com.cg.assetmanagement.dto.Asset;
import com.cg.assetmanagement.dto.Employee;
import com.cg.assetmanagement.dto.Request;
import com.cg.assetmanagement.dto.User;
import com.cg.assetmanagement.exception.AssetException;

@Service
public interface IAssetManagementService {
	// Add Asset
	public Integer addAsset(Asset asset);

	// Update Asset
	public void updateAsset(Asset asset) throws AssetException;

	// Delete Asset
	public void delAssetById(Integer assetId) throws AssetException;

	// View Allocated
	public List<Allocation> viewAllocated();

	// View Unallocated
	public List<Asset> viewUnallocated();

	// Raise request
	public Integer raiseRequest(Request request) throws AssetException;

	// Validate User
	public User validateUser(User user) throws AssetException;

	// Get Request By Id
	public Request getRequestById(Integer requestId);

	// Get All Assets
	public List<Asset> getAllAssets();

	// Get Asset By Id
	public Asset getAssetById(Integer assetId) throws AssetException;

	// Get Employees By MgrCode
	public List<Employee> getEmployeeUnderManager(int mgrCode);

	// Accept request
	public Integer acceptRequest(Request request);

	// Deny Request
	public void denyRequest(Request request);

	// View Request Status
	public List<Request> viewStatus(int managerId);

	// View Requests
	public List<Request> viewRequests();

	// Get Employee
	public Employee getEmployeeById(int employeeId);

	// Get Admin
	public Employee getAdminById(String userId);
}
