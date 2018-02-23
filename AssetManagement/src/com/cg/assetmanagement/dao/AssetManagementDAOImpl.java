package com.cg.assetmanagement.dao;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;



import org.springframework.stereotype.Repository;

import com.cg.assetmanagement.dto.Allocation;
import com.cg.assetmanagement.dto.Asset;
import com.cg.assetmanagement.dto.Employee;
import com.cg.assetmanagement.dto.Request;
import com.cg.assetmanagement.dto.User;
import com.cg.assetmanagement.exception.AssetException;

@Repository("dao")
public class AssetManagementDAOImpl implements IAssetManagementDAO {

	@PersistenceContext
	EntityManager entityManager;

	/***********************************************************
	 * Method Name:addAsset(Asset asset) Return type:Integer Parameters:Object
	 * of type Asset Description:This method returns assetId
	 * 
	 * @author Shruti
	 ***********************************************************/
	@Override
	public Integer addAsset(Asset asset) {
		entityManager.persist(asset);
		entityManager.flush();
		return asset.getAssetId();
	}

	/***********************************************************
	 * Method Name:updateAsset(Asset asset, int assetId) Return type:String
	 * Parameters:Object of type Asset,assetId of type integer Description:This
	 * method returns boolean
	 * 
	 * @author pshandi1
	 ***********************************************************/
	@Override
	public void updateAsset(Asset asset) throws AssetException {
		try {
			entityManager.merge(asset);
			entityManager.flush();
		} catch (Exception e) {
			throw new AssetException("Unable to update");
		}
	}

	/***********************************************************
	 * Method Name: delAssetById(int assetId) Return type:Integer Parameters:
	 * asset type of Integer Description:This method returns assetId
	 * 
	 * @author geetika
	 ***********************************************************/
	@Override
	public void delAssetById(Integer assetId) throws AssetException {
		try {
			Asset asset = entityManager.find(Asset.class, assetId);
			entityManager.remove(asset);
			entityManager.flush();
		} catch (Exception e) {
			throw new AssetException("Unable to delete");
		}
	}

	/***********************************************************
	 * Method Name: viewAllocated Return type:List<AllocationDetails Parameters:
	 * void Description:This method returns list of assets which are allocatedd
	 * 
	 * @author pratik
	 ***********************************************************/
	@Override
	public List<Allocation> viewAllocated() {
		Query query = entityManager.createQuery("FROM Allocation");
		@SuppressWarnings("unchecked")
		List<Allocation> allocationList = query.getResultList();
		return allocationList;
	}

	/***********************************************************
	 * Method Name: viewUnallocated Return type:List<AllocationDetails
	 * Parameters: void Description:This method returns list of assets which are
	 * Unallocated
	 * 
	 * @author pratik
	 ***********************************************************/
	@Override
	public List<Asset> viewUnallocated() {
		Query query = entityManager
				.createQuery("FROM Asset asset WHERE asset.quantity>0");
		@SuppressWarnings("unchecked")
		List<Asset> unAllocatedList = query.getResultList();
		return unAllocatedList;
	}

	/***********************************************************
	 * Method Name: raiseRequest Return type: String Parameters: object of type
	 * AllocationDetails Description:This method returns request Id if current
	 * userName and password combination of user object exist in the database.
	 * 
	 * @author pshandi1
	 ***********************************************************/
	@Override
	public Integer raiseRequest(Request request) throws AssetException {
		try {
			System.out.println(request);
			entityManager.persist(request);
			entityManager.flush();
			return request.getRequestId();
		} catch (Exception e) {
			throw new AssetException("Could not Raise Request");
		}
	}

	/***********************************************************
	 * Method Name: Validate User Return type:object of type UserMaster
	 * Parameters: object of type UserMaster Description:This method returns
	 * user object if current userName and password of user object exist in the
	 * database.
	 * 
	 * @author Amar
	 * @throws AssetException 
	 ***********************************************************/
	@Override
	public User validateUser(User user) throws AssetException {
		System.out.println("User Id::"+user.getUserId());
		User newUser=null;
		try{
		TypedQuery<User> query = entityManager.createQuery(
				"FROM User WHERE userId=:id", User.class);
		query.setParameter("id", user.getUserId());
		newUser=query.getSingleResult();
		System.out.println(newUser);
		}catch(NoResultException e){
			throw new AssetException("Invalid User Name");
		}
		/*
		String userId=query.getSingleResult().getUserId();
		System.out.println(userId);*/
		return newUser;
	}

	/***********************************************************
	 * Method Name: getRequestById Return type: AllocationDetails Parameters:
	 * String Description:This method returns object of allocationDetails based
	 * on the requestid provided as argument
	 * 
	 * @author pratiksha
	 ***********************************************************/
	@Override
	public Request getRequestById(Integer requestId) {
		Request request = entityManager.find(Request.class, requestId);
		return request;
	}

	/***********************************************************
	 * Method Name: getAllAssets Return type: List<Asset> Parameters: void
	 * Description:This method returns List of objects of Asset
	 * 
	 * @author pshandi1
	 ***********************************************************/
	@Override
	public List<Asset> getAllAssets() {
		Query query = entityManager.createQuery("FROM Asset asset");
		@SuppressWarnings("unchecked")
		List<Asset> assetList = query.getResultList();
		System.out.println(assetList);
		return assetList;
	}

	/***********************************************************
	 * Method Name: getAssetById Return type: object of type Asset Parameters:
	 * Integer Description:This method returns object of Asset based on argument
	 * passed as asset Id
	 * 
	 * @author pshandi1
	 ***********************************************************/
	@Override
	public Asset getAssetById(Integer assetId) throws AssetException {
		Asset asset = null;
		try {
			asset = entityManager.find(Asset.class, assetId);
		} catch (Exception e) {
			throw new AssetException("Could not find Asset");
		}
		return asset;
	}

	/***********************************************************
	 * Method Name: getEmployeeUnderManager Return type: List objects of type
	 * Employee Parameters: Integer Description:This method returns List of
	 * object of Employee based on argument passed as Manager Id
	 * 
	 * @author pratik
	 ***********************************************************/
	@Override
	public List<Employee> getEmployeeUnderManager(int mgrCode) {
		TypedQuery<Employee> query = entityManager.createQuery(
				"FROM Employee employee WHERE mgrCode=:mgr", Employee.class);
		query.setParameter("mgr", mgrCode);
		List<Employee> empList = query.getResultList();
		return empList;
	}

	/***********************************************************
	 * Method Name: acceptRequest Return type:Integer Parameters: object of
	 * AllocationDetails AllocationDetails Description:This method returns
	 * integer value as allocation id
	 * 
	 * @author Amar
	 ***********************************************************/
	@Override
	public Integer acceptRequest(Request request) {
		Allocation allocation = new Allocation();
		request.setStatus("Allocated");
		allocation.setUser(request.getUser());
		allocation.setAllocationDate(LocalDate.now());
		allocation.setAsset(request.getAsset());
		allocation.setEmployee(request.getEmployee());
		allocation.setRequest(request);
		entityManager.merge(request);
		entityManager.persist(allocation);
		entityManager.flush();
		return allocation.getAllocationId();
	}

	/***********************************************************
	 * Method Name: denyRequest Return type:void Parameters: object of
	 * AllocationDetails AllocationDetails Description:This method set status as
	 * deny.
	 * 
	 * @author Amar
	 ***********************************************************/
	@Override
	public void denyRequest(Request request) {
		request.setStatus("Denied");
		entityManager.merge(request);
		entityManager.flush();
	}

	/***********************************************************
	 * Method Name: viewStatus Return type:List of objects of Request
	 * Parameters: object of AllocationDetails AllocationDetails
	 * Description:This method set status as deny.
	 * 
	 * @author pratik
	 ***********************************************************/
	@Override
	public List<Request> viewStatus(int managerId) {
		Employee manager = entityManager.find(Employee.class, managerId);
		TypedQuery<Request> query = entityManager.createQuery(
				"FROM Request r WHERE r.manager=:mgr", Request.class);
		query.setParameter("mgr", manager);
		List<Request> reqList = query.getResultList();
		return reqList;
	}

	/***********************************************************
	 * Method Name: viewRequests Return type: List of objects of Request
	 * Parameters: object of AllocationDetails AllocationDetails
	 * Description:This method set status as deny.
	 * 
	 * @author Amar
	 ***********************************************************/
	@Override
	public List<Request> viewRequests() {
		Query query = entityManager.createQuery("FROM Request");
		@SuppressWarnings("unchecked")
		List<Request> reqList = query.getResultList();
		return reqList;
	}

	/***********************************************************
	 * Method Name: getEmployeeById Return type: object of type Employee
	 * Parameters: Integer Description:This method returns object of Employee
	 * based on argument passed as employee Id
	 * 
	 * @author pshandi1
	 ***********************************************************/
	@Override
	public Employee getEmployeeById(int employeeId) {
		Employee employee = entityManager.find(Employee.class, employeeId);
		return employee;
	}

	/***********************************************************
	 * Method Name: getAdminById Return type: object of type Employee
	 * Parameters: Integer Description:This method returns object of Employee
	 * based on argument passed as user Id
	 * 
	 * @author pshandi1
	 ***********************************************************/
	@Override
	public Employee getAdminById(String userId) {
		User user = entityManager.find(User.class, userId);
		Employee admin = entityManager.find(Employee.class, user.getEmployee()
				.getEmpNo());
		return admin;
	}

}
