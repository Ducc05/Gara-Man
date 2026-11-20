CREATE DATABASE IF NOT EXISTS garaman CHARACTER
SET
  utf8mb4 COLLATE utf8mb4_unicode_ci;

USE garaman;

CREATE USER IF NOT EXISTS 'garaman_demo_app'@'localhost' IDENTIFIED BY 'garaman_demo_pw';
CREATE USER IF NOT EXISTS 'garaman_demo_app'@'127.0.0.1' IDENTIFIED BY 'garaman_demo_pw';
CREATE USER IF NOT EXISTS 'garaman_demo_app'@'::1' IDENTIFIED BY 'garaman_demo_pw';
GRANT SELECT, INSERT, UPDATE, DELETE ON garaman.* TO 'garaman_demo_app'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON garaman.* TO 'garaman_demo_app'@'127.0.0.1';
GRANT SELECT, INSERT, UPDATE, DELETE ON garaman.* TO 'garaman_demo_app'@'::1';

CREATE USER IF NOT EXISTS 'garaman_demo_app'@'localhost' IDENTIFIED BY 'garaman_demo_pw';
CREATE USER IF NOT EXISTS 'garaman_demo_app'@'127.0.0.1' IDENTIFIED BY 'garaman_demo_pw';
GRANT SELECT, INSERT, UPDATE, DELETE ON garaman.* TO 'garaman_demo_app'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON garaman.* TO 'garaman_demo_app'@'127.0.0.1';

CREATE TABLE tblAddress3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  street VARCHAR(255),
  ward VARCHAR(100),
  district VARCHAR(100),
  city VARCHAR(100)
);

CREATE TABLE tblFullName3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  firstName VARCHAR(100) NOT NULL,
  middleName VARCHAR(100),
  lastName VARCHAR(100) NOT NULL
);

CREATE TABLE tblGarage3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(20),
  description VARCHAR(255),
  addressId INT,
  CONSTRAINT fk_garage_address FOREIGN KEY (addressId) REFERENCES tblAddress3 (id)
);

CREATE TABLE tblEmployee3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  phone VARCHAR(10),
  role ENUM (
    'MANAGER',
    'SALES_STAFF',
    'WAREHOUSE_STAFF',
    'TECHNICIAN'
  ) NOT NULL,
  note VARCHAR(255),
  garageId INT,
  fullNameId INT,
  addressId INT,
  FOREIGN KEY (garageId) REFERENCES tblGarage3 (id),
  FOREIGN KEY (fullNameId) REFERENCES tblFullName3 (id),
  FOREIGN KEY (addressId) REFERENCES tblAddress3 (id)
);

CREATE TABLE tblCustomer3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(100),
  fullNameId INT,
  addressId INT,
  FOREIGN KEY (fullNameId) REFERENCES tblFullName3 (id),
  FOREIGN KEY (addressId) REFERENCES tblAddress3 (id)
);

CREATE TABLE tblScheduleConfig3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  dayOfWeek INT NOT NULL,
  garageId INT NOT NULL,
  UNIQUE KEY uq_schedule_day_garage (dayOfWeek, garageId),
  FOREIGN KEY (garageId) REFERENCES tblGarage3 (id)
);

CREATE TABLE tblShift3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  startTime TIME NOT NULL,
  endTime TIME NOT NULL,
  description VARCHAR(255),
  scheduleConfigId INT NOT NULL,
  FOREIGN KEY (scheduleConfigId) REFERENCES tblScheduleConfig3 (id)
);

CREATE TABLE tblAppointment3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  appointmentDate DATETIME NOT NULL,
  problemDescription VARCHAR(255),
  customerName VARCHAR(255) NOT NULL,
  customerPhone VARCHAR(20) NOT NULL,
  customerEmail VARCHAR(100),
  customerAddress VARCHAR(255),
  licensePlate VARCHAR(20) NOT NULL,
  carBrand VARCHAR(100) NOT NULL,
  carModel VARCHAR(100) NOT NULL,
  manufactureYear INT NOT NULL,
  status ENUM ('Chờ xác nhận', 'Đã xác nhận', 'Đã hủy') NOT NULL,
  shiftId INT NOT NULL,
  FOREIGN KEY (shiftId) REFERENCES tblShift3 (id)
);

CREATE TABLE tblCar3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  licensePlate VARCHAR(20) NOT NULL UNIQUE,
  brand VARCHAR(100),
  model VARCHAR(100),
  manufactureYear INT
);

CREATE TABLE tblCustomerCar3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  isOwner TINYINT (1) NOT NULL DEFAULT 1,
  customerId INT NOT NULL,
  carId INT NOT NULL,
  FOREIGN KEY (customerId) REFERENCES tblCustomer3 (id),
  FOREIGN KEY (carId) REFERENCES tblCar3 (id)
);

CREATE TABLE tblService3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  serviceCode VARCHAR(50) NOT NULL UNIQUE,
  name VARCHAR(255) NOT NULL,
  unit VARCHAR(50) NOT NULL,
  unitPrice DECIMAL(18, 2) NOT NULL,
  description VARCHAR(255)
);

CREATE TABLE tblAppointmentService3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  appointmentId INT NOT NULL,
  serviceId INT NOT NULL,
  UNIQUE KEY uq_appointment_service (appointmentId, serviceId),
  FOREIGN KEY (appointmentId) REFERENCES tblAppointment3 (id),
  FOREIGN KEY (serviceId) REFERENCES tblService3 (id)
);

CREATE TABLE tblReceptionNote3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  receptionTime DATETIME NOT NULL,
  carCondition VARCHAR(255) NOT NULL,
  initialRequest VARCHAR(255),
  proposedDetails VARCHAR(255) NOT NULL,
  technicianId INT NOT NULL,
  customerCarId INT NOT NULL,
  tblAppointment3id INT,
  FOREIGN KEY (technicianId) REFERENCES tblEmployee3 (id),
  FOREIGN KEY (customerCarId) REFERENCES tblCustomerCar3 (id),
  FOREIGN KEY (tblAppointment3id) REFERENCES tblAppointment3 (id),
  UNIQUE KEY uq_reception_appointment (tblAppointment3id)
);

CREATE TABLE tblRepairOrder3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  createdDate DATE NOT NULL,
  status VARCHAR(50) NOT NULL,
  technicianId INT NOT NULL,
  tblReceptionNote3id INT NOT NULL UNIQUE,
  FOREIGN KEY (technicianId) REFERENCES tblEmployee3 (id),
  FOREIGN KEY (tblReceptionNote3id) REFERENCES tblReceptionNote3 (id)
);

CREATE TABLE tblInvoice3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  invoiceCode VARCHAR(50) NOT NULL UNIQUE,
  createdAt DATETIME NOT NULL,
  paidAt DATETIME NOT NULL,
  totalAmount DECIMAL(18, 2) NOT NULL,
  repairOrderId INT NOT NULL UNIQUE,
  cashierId INT NOT NULL,
  FOREIGN KEY (repairOrderId) REFERENCES tblRepairOrder3 (id),
  FOREIGN KEY (cashierId) REFERENCES tblEmployee3 (id)
);

CREATE TABLE tblSparePart3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  partCode VARCHAR(50) NOT NULL UNIQUE,
  name VARCHAR(255) NOT NULL,
  unit VARCHAR(50) NOT NULL,
  sellingPrice DECIMAL(18, 2) NOT NULL,
  stockQuantity INT NOT NULL DEFAULT 0,
  description VARCHAR(255)
);

CREATE TABLE tblUsedService3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  quantity INT NOT NULL,
  unitPrice DECIMAL(18, 2) NOT NULL,
  totalPrice DECIMAL(18, 2) NOT NULL,
  repairOrderId INT NOT NULL,
  serviceId INT NOT NULL,
  FOREIGN KEY (repairOrderId) REFERENCES tblRepairOrder3 (id),
  FOREIGN KEY (serviceId) REFERENCES tblService3 (id)
);

CREATE TABLE tblUsedSparePart3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  quantity INT NOT NULL,
  unitPrice DECIMAL(18, 2) NOT NULL,
  totalPrice DECIMAL(18, 2) NOT NULL,
  repairOrderId INT NOT NULL,
  sparePartId INT NOT NULL,
  FOREIGN KEY (repairOrderId) REFERENCES tblRepairOrder3 (id),
  FOREIGN KEY (sparePartId) REFERENCES tblSparePart3 (id)
);

CREATE TABLE tblSupplier3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  supplierCode VARCHAR(50) NOT NULL UNIQUE,
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(20),
  email VARCHAR(100)
);

CREATE TABLE tblSupplierSparePart3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  importPrice DECIMAL(18, 2) NOT NULL,
  note VARCHAR(255),
  supplierId INT NOT NULL,
  sparePartId INT NOT NULL,
  FOREIGN KEY (supplierId) REFERENCES tblSupplier3 (id),
  FOREIGN KEY (sparePartId) REFERENCES tblSparePart3 (id)
);

CREATE TABLE tblGoodsReceipt3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  importDate DATE NOT NULL,
  totalAmount DECIMAL(18, 2) NOT NULL,
  note VARCHAR(255),
  supplierId INT NOT NULL,
  FOREIGN KEY (supplierId) REFERENCES tblSupplier3 (id)
);

CREATE TABLE tblGoodsReceiptDetail3 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  quantity INT NOT NULL,
  importPrice DECIMAL(18, 2) NOT NULL,
  subTotal DECIMAL(18, 2) NOT NULL,
  goodsReceiptId INT NOT NULL,
  sparePartId INT NOT NULL,
  FOREIGN KEY (goodsReceiptId) REFERENCES tblGoodsReceipt3 (id),
  FOREIGN KEY (sparePartId) REFERENCES tblSparePart3 (id)
);
