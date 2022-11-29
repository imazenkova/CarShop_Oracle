ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

----
DROP USER kurs;

---------------------- schema (tables' owner)
CREATE USER KURS
IDENTIFIED BY 1111 
DEFAULT TABLESPACE Users 
QUOTA UNLIMITED ON Users;

GRANT CONNECT TO kurs;
GRANT CREATE TABLE TO kurs;
GRANT CREATE SEQUENCE TO kurs;
GRANT CREATE VIEW TO kurs;
GRANT CREATE INDEXTYPE TO kurs;
GRANT CREATE PROFILE TO kurs;
GRANT CREATE PROCEDURE TO kurs;
GRANT CREATE TRIGGER TO kurs;
GRANT CREATE SESSION TO kurs;
GRANT CREATE ROLE TO kurs;
GRANT CREATE JOB TO kurs;
GRANT CREATE ANY DIRECTORY TO kurs;

grant execute on UTL_FILE to kurs;

GRANT READ, WRITE, EXECUTE ON DIR TO KURS;

GRANT EXECUTE ON sys.dbms_crypto TO kurs;

COMMIT;

select * from USER_SYS_PRIVS;
select * from session_privs;




---------------------TABLES


CREATE sequence CARS_ID_SEQ;

CREATE TABLE Cars (
	Id INT DEFAULT CARS_ID_SEQ.NEXTVAL NOT NULL,
	supplier_id INT NOT NULL,
	model_id INT NOT NULL,
	equipment_id INT NOT NULL,
	brand NVARCHAR2(50) NOT NULL,
	color NVARCHAR2(50) NOT NULL,
	cost DECIMAL(10) NOT NULL,
	sale_availability NUMBER(1) NOT NULL,
	constraint CAR_PK PRIMARY KEY (Id));
    
    
     
    CREATE sequence EQUIPMENT_ID_SEQ;
    
    CREATE TABLE Equipment (
	Id INT DEFAULT EQUIPMENT_ID_SEQ.NEXTVAL NOT NULL,
	transmission NVARCHAR2(60) NOT NULL,
	salon NVARCHAR2(60) NOT NULL,
	stereo_system NVARCHAR2(60) NOT NULL,
	constraint EQUIPMENT_PK PRIMARY KEY (Id));
    
    
    
    CREATE sequence SUPPLIER_ID_SEQ;
    
    CREATE TABLE Supplier (
	Id INT DEFAULT SUPPLIER_ID_SEQ.NEXTVAL NOT NULL,
	company_name NVARCHAR2(200) NOT NULL,
	adress NVARCHAR2(200) NOT NULL,
	phone_number NVARCHAR2(50) NOT NULL,
	constraint SUPPLIER_PK PRIMARY KEY (Id));
    
    
    
    CREATE sequence MODEL_ID_SEQ;
    
    CREATE TABLE Model (
	Id INT DEFAULT MODEL_ID_SEQ.NEXTVAL NOT NULL,
	engine_type NVARCHAR2(50) NOT NULL,
	seats_number INT NOT NULL,
	weight NUMBER(6) NOT NULL,
	trunk_volume INT NOT NULL,
	constraint MODEL_PK PRIMARY KEY (Id));
    
    
    
    CREATE sequence ORDERS_ORDERS_ID_SEQ;
    
    CREATE TABLE Orders (
	id INT DEFAULT ORDERS_ORDERS_ID_SEQ.NEXTVAL NOT NULL,
	client_id INT NOT NULL,
	car_id INT UNIQUE NOT NULL,
	constraint ORDER_PK PRIMARY KEY (ID));
    
    
    
    
    CREATE sequence CLIENTS_ID_SEQ;
    
    CREATE TABLE Clients (
	Id INT DEFAULT CLIENTS_ID_SEQ.NEXTVAL NOT NULL,
	name NVARCHAR2(50) NOT NULL,
	surname NVARCHAR2(50) NOT NULL,
	patronymic NVARCHAR2(50) NOT NULL,
	adress NVARCHAR2(100) NOT NULL,
	age INT NOT NULL,
	phone_number NVARCHAR2(100) UNIQUE NOT NULL,
	constraint CLIENT_PK PRIMARY KEY (id));
    
    CREATE TABLE Admin (
    
	id INT NOT NULL,
	name NVARCHAR2(50) NOT NULL,
	surname NVARCHAR2(50) NOT NULL,
	patronymic NVARCHAR2(50) NOT NULL,
	phone_number NVARCHAR2(50) UNIQUE NOT NULL,
    password_value NVARCHAR2(50) NOT NULL,
	constraint ADMIN_PK PRIMARY KEY (ID));
    
   
    CREATE TABLE Accounts (
    
	client_id INT NOT NULL,
	login NVARCHAR2(100) UNIQUE NOT NULL,
	password_value NVARCHAR2(100) NOT NULL);

  
ALTER TABLE Cars ADD CONSTRAINT Cars_fk1 FOREIGN KEY (supplier_id) REFERENCES Supplier(Id);
ALTER TABLE Cars ADD CONSTRAINT Cars_fk2 FOREIGN KEY (model_id) REFERENCES Model(Id);
ALTER TABLE Cars ADD CONSTRAINT Cars_fk3 FOREIGN KEY (equipment_id) REFERENCES Equipment(Id);



ALTER TABLE Orders ADD CONSTRAINT Orders_fk2 FOREIGN KEY (client_id) REFERENCES Clients(id);
ALTER TABLE Orders ADD CONSTRAINT Orders_fk3 FOREIGN KEY (car_id) REFERENCES Cars(Id);

ALTER TABLE Accounts ADD CONSTRAINT Accounts_fk FOREIGN KEY (client_id) REFERENCES Clients(id);
 

drop TABLE Orders;
DROP TABLE Accounts;
drop sequence ORDERS_ORDERS_NUMBER_SEQ;
drop TABLE Clients;
drop sequence CLIENTS_ID_SEQ;
drop TABLE ADMIN;

drop table Cars;
drop sequence CARS_ID_SEQ;
drop TABLE Supplier;
drop sequence SUPPLIER_ID_SEQ;
DROP TABLE Model;
DROP sequence MODEL_ID_SEQ;
DROP TABLE Equipment;
DROP sequence EQUIPMENT_ID_SEQ;










