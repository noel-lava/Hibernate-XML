-- Database: employee_management

-- DROP DATABASE employee_management;

-- CREATE DATABASE IF NOT EXISTS employee_management
--   WITH OWNER = postgres
--        ENCODING = 'UTF8'
--        TABLESPACE = pg_default
--        LC_COLLATE = 'en_PH.UTF-8'
--        LC_CTYPE = 'en_PH.UTF-8'
--        CONNECTION LIMIT = -1;

CREATE TABLE address (
	address_id SERIAL,
	street varchar(50) DEFAULT NULL,
	barangay varchar(50) DEFAULT NULL,
	municipality varchar(50) NOT NULL,
	zipcode int,
	PRIMARY KEY(address_id)
);

CREATE TABLE person (
	person_id SERIAL,
	last_name varchar(20) NOT NULL,
	first_name varchar(20) NOT NULL,
	mid_name varchar(20) DEFAULT NULL,
	suffix varchar(4) DEFAULT NULL,
	title varchar(3) DEFAULT NULL,
	birth_date DATE NOT NULL,
	gwa numeric(5,2) DEFAULT NULL,
	date_hired DATE DEFAULT NULL,
	employed boolean NOT NULL,
	address_id int NOT NULL,
	PRIMARY KEY (person_id),
	CONSTRAINT FK_person_address_id FOREIGN KEY (address_id)
	REFERENCES address (address_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE contact (
	contact_id SERIAL,
	person_id int NOT NULL,
	landline varchar(7) DEFAULT NULL,
	mobile_no varchar(12) NOT NULL,
	email varchar(50) NOT NULL,
	PRIMARY KEY(person_id, contact_id),
	CONSTRAINT FK_contact_person_id FOREIGN KEY(person_id)
	REFERENCES person (person_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE role (
	role_id SERIAL,
	role varchar(30) NOT NULL,
	PRIMARY KEY(role_id)
);

CREATE TABLE person_role (
	person_id int NOT NULL,
	role_id int NOT NULL,
	PRIMARY KEY(person_id, role_id),
	CONSTRAINT FK_role_person_id FOREIGN KEY(person_id)
	REFERENCES person (person_id),
	CONSTRAINT FK_role_role_id FOREIGN KEY(role_id)
	REFERENCES role (role_id) 
);