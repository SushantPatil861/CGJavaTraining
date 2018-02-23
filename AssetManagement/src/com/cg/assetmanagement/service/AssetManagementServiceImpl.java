package com.cg.assetmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cg.assetmanagement.dao.IAssetManagementDAO;
import com.cg.assetmanagement.dto.Allocation;
import com.cg.assetmanagement.dto.Asset;
import com.cg.assetmanagement.dto.Employee;
import com.cg.assetmanagement.dto.Request;
import com.cg.assetmanagement.dto.User;
import com.cg.assetmanagement.exception.AssetException;

@Service("service")
@Transactional
public class AssetManagementServiceImpl implements IAssetManagementService {

	@Autowired
	IAssetManagementDAO dao;

	@Override
	public Integer addAsset(Asset asset) {
		return dao.addAsset(asset);
	}

	@Override
	public void updateAsset(Asset asset) throws AssetException {
		dao.updateAsset(asset);
	}

	@Override
	public void delAssetById(Integer assetId) throws AssetException {
		List<Request> requests = dao.viewRequests();
		List<Allocation> allocations = dao.viewAllocated();
		int counter1 = 0;
		int counter2 = 0;
		for (Request r : requests) {
			if (r.getAsset().getAssetId().equals(assetId)) {
				if (r.getStatus().equals("Pending")
						|| r.getStatus().equals("Allocated")) {
					counter1++;
				}
			}
		}
		for (Allocation a : allocations) {
			if (a.getAsset().getAssetId().equals(assetId)) {
				counter2++;
			}
		}
		if (counter1 == 0 && counter2 == 0) {
			dao.delAssetById(assetId);
		} else {
			throw new AssetException("Unable to delete. Asset is Allocated");
		}
	}

	@Override
	public List<Allocation> viewAllocated() {
		return dao.viewAllocated();
	}

	@Override
	public List<Asset> viewUnallocated() {
		return dao.viewUnallocated();
	}

	@Override
	public Integer raiseRequest(Request request) throws AssetException {
		return dao.raiseRequest(request);
	}

	@Override
	public User validateUser(User user) throws AssetException {
		User newUser = dao.validateUser(user);
		System.out.println(newUser);
		if (newUser.getUserPassword().equals(user.getUserPassword())) {
			return newUser;
		} else {
			return new User();
		}
	}

	@Override
	public Request getRequestById(Integer requestId) {
		return dao.getRequestById(requestId);
	}

	@Override
	public List<Asset> getAllAssets() {
		return dao.getAllAssets();
	}

	@Override
	public Asset getAssetById(Integer assetId) throws AssetException {
		return dao.getAssetById(assetId);
	}

	@Override
	public List<Employee> getEmployeeUnderManager(int mgrCode) {
		return dao.getEmployeeUnderManager(mgrCode);
	}

	@Override
	public Integer acceptRequest(Request request) {
		return dao.acceptRequest(request);
	}

	@Override
	public void denyRequest(Request request) {
		dao.denyRequest(request);
	}

	@Override
	public List<Request> viewStatus(int managerId) {
		return dao.viewStatus(managerId);
	}

	@Override
	public List<Request> viewRequests() {
		return dao.viewRequests();
	}

	@Override
	public Employee getEmployeeById(int employeeId) {
		return dao.getEmployeeById(employeeId);
	}

	@Override
	public Employee getAdminById(String userId) {
		return dao.getAdminById(userId);
	}

}
