--department_master Table
DROP TABLE department_master CASCADE CONSTRAINTS;
CREATE TABLE department_master(deptId NUMBER(3) PRIMARY KEY,
                               dept_name VARCHAR2(25));

	INSERT INTO department_master VALUES(10,'Asset');
	INSERT INTO department_master VALUES(20,'HR');
	INSERT INTO department_master VALUES(30,'Finance');
	INSERT INTO department_master VALUES(40,'IT');




--Employee Table
DROP TABLE Employee CASCADE CONSTRAINTS;
CREATE TABLE Employee(empno NUMBER(6) PRIMARY KEY,
                      empName VARCHAR2(25),
                      designation VARCHAR2(50),
                      mgrCode NUMBER(6),
                      hiredate DATE,
                      salary NUMBER(9,2),
                      department VARCHAR2(20));


	INSERT INTO Employee VALUES(100001,'Jack','Asset Admin',100006,TO_DATE('20-FEB-2013', 'DD-MON-YYYY'),35000,'Asset');
	INSERT INTO Employee VALUES(100002,'John','Asset Admin',100006,TO_DATE('20-FEB-2012', 'DD-MON-YYYY'),45000,'Asset');
	INSERT INTO Employee VALUES(100003,'Tim','Asset Admin',100006,TO_DATE('20-FEB-2011', 'DD-MON-YYYY'),38000,'Asset');
	INSERT INTO Employee VALUES(100004,'Steve','Manager',100005,TO_DATE('10-FEB-2013', 'DD-MON-YYYY'),55000,'Finance');
	INSERT INTO Employee VALUES(100005,'Bill','Manager',100007,TO_DATE('10-FEB-2010', 'DD-MON-YYYY'),65000,'HR');
	INSERT INTO Employee VALUES(100006,'Alan','Manager',100007,TO_DATE('10-FEB-2009', 'DD-MON-YYYY'),75000,'HR');
	INSERT INTO Employee VALUES(100008,'Alex','SE',100006,TO_DATE('10-FEB-2009', 'DD-MON-YYYY'),75000,'IT');
	INSERT INTO Employee VALUES(100009,'Smith','Clerk',100006,TO_DATE('10-FEB-2009', 'DD-MON-YYYY'),75000,'IT');
	INSERT INTO Employee VALUES(100010,'Anderson','Accountant',100006,TO_DATE('10-FEB-2009', 'DD-MON-YYYY'),75000,'Finance');
	INSERT INTO Employee VALUES(100007,'Mike','CEO',NULL,TO_DATE('20-FEB-2013', 'DD-MON-YYYY'),35000,'IT');
	




--User_master Table
DROP TABLE user_master CASCADE CONSTRAINTS;
CREATE TABLE user_master(userId VARCHAR2(6) PRIMARY KEY,
                         userName VARCHAR2(15),
                         userPassword VARCHAR2(50),
                         userType VARCHAR2(10),
                         empNo NUMBER(6));
						 
						 

	INSERT INTO user_master VALUES('A10001','Jack','adm12345','ADM',100001);
	INSERT INTO user_master VALUES('A10002','John','adm98765','ADM',100002);
	INSERT INTO user_master VALUES('A10003','Tim','adm11223','ADM',100003);
	INSERT INTO user_master VALUES('M10001','Steve','mgr11223','MGR',100004);
	INSERT INTO user_master VALUES('M10002','Bill','mgr11223','MGR',100005);
	INSERT INTO user_master VALUES('M10003','Alan','mgr11223','MGR',100006);
	



--Asset_master Table
DROP TABLE asset_master CASCADE CONSTRAINTS;
CREATE TABLE asset_master(assetId NUMBER(10) PRIMARY KEY,
						  assetName VARCHAR2(20),
						  purchaseDate DATE,
						  unitPrice NUMBER(11,2),
						  assetType VARCHAR2(20),
						  category VARCHAR2(20),
						  assetDes VARCHAR2(100),
						  quantity NUMBER(6));
INSERT INTO asset_master VALUES(100001,'LAN Cables',TO_DATE('20-FEB-2016', 'DD-MON-YYYY'),5000,'IT','LAN and Networking','5m LAN CABLES',50);
INSERT INTO asset_master VALUES(100002,'VGA Cables',TO_DATE('22-JAN-2016', 'DD-MON-YYYY'),10000,'IT','LAN and Networking','10m VGA CABLES',40);
INSERT INTO asset_master VALUES(100003,'DELL Laptop',TO_DATE('21-APR-2016', 'DD-MON-YYYY'),13500,'IT','Laptops','Dell Latop, Intel i5 4GB RAM, 500GB HDD ',30);
INSERT INTO asset_master VALUES(100004,'Lenovo Laptop',TO_DATE('01-APR-2016', 'DD-MON-YYYY'),12000,'IT','Laptops','Lenovo Latop, Intel i5 4GB RAM, 500GB HDD ',25);
INSERT INTO asset_master VALUES(100005,'Acer Laptop',TO_DATE('12-MAY-2016', 'DD-MON-YYYY'),95000,'IT','Laptops','Acer Latop, Intel i5 4GB RAM, 500GB HDD ',15);
INSERT INTO asset_master VALUES(100006,'Lenovo Desktop',TO_DATE('02-MAY-2016', 'DD-MON-YYYY'),18000,'IT','Desktop','Lenovo  Thinkcenre Desktop, Intel i5 4GB RAM, 500GB HDD ',60);
INSERT INTO asset_master VALUES(100007,'DELL Monitor',TO_DATE('12-JUL-2016', 'DD-MON-YYYY'),70000,'IT','Monitor','DELL 17" Monitor',100);
INSERT INTO asset_master VALUES(100008,'Projector',TO_DATE('20-JAN-2016', 'DD-MON-YYYY'),50000,'IT','Projector','Panasonic Projector',20);


--Asset_allocation Table
DROP TABLE asset_allocation CASCADE CONSTRAINTS;
CREATE TABLE asset_allocation(allocationId NUMBER(10) PRIMARY KEY,
			                  requestId NUMBER(10),
                              assetId NUMBER(10),
                              allocationDate DATE,
                              empno NUMBER(6),
                              userId VARCHAR2(6));
			--INSERT INTO asset_allocation VALUES(12001,10001,100003,TO_DATE('20-JAN-2016', 'DD-MON-YYYY'),100010,'A10001');
							  
				


--Asset_Request Table
DROP TABLE asset_request CASCADE CONSTRAINTS;
CREATE TABLE asset_request(requestId NUMBER(10) PRIMARY KEY,
			   			   assetId NUMBER(10) REFERENCES asset_master(assetId) ON DELETE CASCADE,
                           empNo NUMBER(6),
                          mgrCode NUMBER(6),
                           requirement VARCHAR2(100),
                           status VARCHAR2(20),
                           userId VARCHAR2(6));
	--INSERT INTO asset_request VALUES(10001,100002,100009,100006,'For Project','Pending','');					   
	--INSERT INTO asset_request VALUES(10002,100003,100010,100006,'For Project','Allocated','A10001');					   

DROP SEQUENCE asset_id_seq;
CREATE SEQUENCE asset_id_seq start with 200001;

DROP SEQUENCE req_seq;
CREATE SEQUENCE req_seq START WITH 100;

DROP SEQUENCE allocationSeq;
CREATE SEQUENCE allocationSeq start with 100001;
commit;