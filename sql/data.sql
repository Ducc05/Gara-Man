USE garaman;

-- Demo account: admin / demo123!@# (employee role MANAGER).
-- Revenue reporting fixtures: 27 paid invoices in October 2026 and 3 in November 2026.
INSERT INTO
  tblAddress3 (id, street, ward, district, city)
VALUES
  (
    1,
    '100 Nguyễn Trãi',
    'Văn Quán',
    'Hà Đông',
    'Hà Nội'
  );

INSERT INTO
  tblGarage3 (id, name, phone, description, addressId)
VALUES
  (
    1,
    'GARA MAN',
    '02439990000',
    'Gara bảo dưỡng và sửa chữa ô tô',
    1
  );

INSERT INTO
  tblFullName3 (id, firstName, middleName, lastName)
VALUES
  (1, 'Quản', 'Lý', 'Gara Man'),
  (14, 'Nguyễn', 'Thu', 'Ngân'),
  (15, 'Trần', 'Văn', 'Thành');

INSERT INTO
  tblEmployee3 (
    id,
    username,
    password,
    phone,
    role,
    note,
    garageId,
    fullNameId,
    addressId
  )
VALUES
  (
    1,
    'admin',
    'demo123!@#',
    '0900000000',
    'MANAGER',
    'Tài khoản demo thống kê',
    1,
    1,
    1
  ),
  (2, 'cashier.demo', 'demo-cashier-disabled', '0900000002', 'SALES_STAFF', 'Nhân viên thu ngân demo', 1, 14, 1),
  (3, 'technician.demo', 'demo-technician-disabled', '0900000003', 'TECHNICIAN', 'Nhân viên sửa chữa demo', 1, 15, 1);

INSERT INTO
  tblScheduleConfig3 (id, dayOfWeek, garageId)
VALUES
  (1, 1, 1),
  (2, 2, 1),
  (3, 3, 1),
  (4, 4, 1),
  (5, 5, 1),
  (6, 6, 1);

INSERT INTO
  tblShift3 (
    id,
    name,
    startTime,
    endTime,
    description,
    scheduleConfigId
  )
VALUES
  (
    1,
    'Ca sáng',
    '08:00:00',
    '12:00:00',
    'Tiếp nhận xe buổi sáng',
    1
  ),
  (
    2,
    'Ca chiều',
    '13:30:00',
    '17:30:00',
    'Tiếp nhận xe buổi chiều',
    1
  ),
  (
    3,
    'Ca sáng',
    '08:00:00',
    '12:00:00',
    'Tiếp nhận xe buổi sáng',
    2
  ),
  (
    4,
    'Ca chiều',
    '13:30:00',
    '17:30:00',
    'Tiếp nhận xe buổi chiều',
    2
  ),
  (
    5,
    'Ca sáng',
    '08:00:00',
    '12:00:00',
    'Tiếp nhận xe buổi sáng',
    3
  ),
  (
    6,
    'Ca chiều',
    '13:30:00',
    '17:30:00',
    'Tiếp nhận xe buổi chiều',
    3
  ),
  (
    7,
    'Ca sáng',
    '08:00:00',
    '12:00:00',
    'Tiếp nhận xe buổi sáng',
    4
  ),
  (
    8,
    'Ca chiều',
    '13:30:00',
    '17:30:00',
    'Tiếp nhận xe buổi chiều',
    4
  ),
  (
    9,
    'Ca sáng',
    '08:00:00',
    '12:00:00',
    'Tiếp nhận xe buổi sáng',
    5
  ),
  (
    10,
    'Ca chiều',
    '13:30:00',
    '17:30:00',
    'Tiếp nhận xe buổi chiều',
    5
  ),
  (
    11,
    'Ca sáng',
    '08:00:00',
    '12:00:00',
    'Tiếp nhận xe buổi sáng',
    6
  ),
  (
    12,
    'Ca chiều',
    '13:30:00',
    '17:30:00',
    'Tiếp nhận xe buổi chiều',
    6
  );

INSERT INTO
  tblService3 (
    id,
    serviceCode,
    name,
    unit,
    unitPrice,
    description
  )
VALUES
  (
    1,
    'DV001',
    'Bảo dưỡng định kỳ',
    'lần',
    1500000,
    'Bảo dưỡng tổng quát theo mốc km'
  ),
  (
    2,
    'DV002',
    'Thay dầu động cơ',
    'lần',
    450000,
    'Thay dầu và kiểm tra cơ bản'
  ),
  (
    3,
    'DV003',
    'Kiểm tra hệ thống phanh',
    'lần',
    650000,
    'Kiểm tra và căn chỉnh phanh'
  ),
  (
    4,
    'DV004',
    'Vệ sinh kim phun',
    'lần',
    900000,
    'Vệ sinh hệ thống nhiên liệu'
  ),
  (
    5,
    'DV005',
    'Cân bằng động bánh xe',
    'bánh',
    180000,
    'Cân bằng động bánh xe'
  ),
  (
    6,
    'DV006',
    'Thay má phanh',
    'lần',
    550000,
    'Tháo lắp và kiểm tra má phanh'
  ),
  (
    7,
    'DV007',
    'Kiểm tra điều hòa',
    'lần',
    350000,
    'Kiểm tra gas và lọc gió điều hòa'
  ),
  (
    8,
    'DV008',
    'Đánh bóng thân xe',
    'lần',
    1200000,
    'Đánh bóng và phủ bảo vệ sơn'
  );

INSERT INTO
  tblSparePart3 (
    id,
    partCode,
    name,
    unit,
    sellingPrice,
    stockQuantity,
    description
  )
VALUES
  (
    1,
    'PT001',
    'Lọc dầu động cơ',
    'cái',
    250000,
    80,
    'Lọc dầu thay thế'
  ),
  (
    2,
    'PT002',
    'Dầu động cơ 5W-30',
    'lít',
    180000,
    120,
    'Dầu động cơ tổng hợp'
  ),
  (
    3,
    'PT003',
    'Má phanh trước',
    'bộ',
    1250000,
    24,
    'Má phanh trước'
  ),
  (
    4,
    'PT004',
    'Lọc gió động cơ',
    'cái',
    320000,
    45,
    'Lọc gió động cơ'
  ),
  (
    5,
    'PT005',
    'Bugi đánh lửa',
    'cái',
    210000,
    60,
    'Bugi tiêu chuẩn'
  ),
  (
    6,
    'PT006',
    'Lọc gió điều hòa',
    'cái',
    280000,
    38,
    'Lọc gió cabin'
  ),
  (
    7,
    'PT007',
    'Nước làm mát',
    'lít',
    95000,
    100,
    'Nước làm mát động cơ'
  ),
  (
    8,
    'PT008',
    'Ắc quy 12V',
    'cái',
    1850000,
    16,
    'Ắc quy bảo hành 12 tháng'
  ),
  (
    9,
    'PT009',
    'Dây curoa tổng',
    'cái',
    620000,
    22,
    'Dây curoa truyền động'
  ),
  (
    10,
    'PT010',
    'Bóng đèn pha',
    'cái',
    390000,
    30,
    'Bóng đèn pha halogen'
  );

INSERT INTO
  tblSupplier3 (id, supplierCode, name, phone, email)
VALUES
  (
    1,
    'NCC001',
    'Phụ tùng Ô tô Hà Nội',
    '02435550101',
    'sales@phutung-hn.example'
  ),
  (
    2,
    'NCC002',
    'Thiết bị và Dầu nhớt Việt',
    '02835550202',
    'contact@daunhot-viet.example'
  ),
  (
    3,
    'NCC003',
    'Phụ tùng Minh Phát',
    '02363550303',
    'info@minhphat.example'
  );

INSERT INTO
  tblSupplierSparePart3 (id, importPrice, note, supplierId, sparePartId)
VALUES
  (1, 180000.0, 'Giá nhập mẫu', 1, 1),
  (2, 129600.0, 'Giá nhập mẫu', 2, 2),
  (3, 900000.0, 'Giá nhập mẫu', 3, 3),
  (4, 230400.0, 'Giá nhập mẫu', 1, 4),
  (5, 151200.0, 'Giá nhập mẫu', 2, 5),
  (6, 201600.0, 'Giá nhập mẫu', 3, 6),
  (7, 68400.0, 'Giá nhập mẫu', 1, 7),
  (8, 1332000.0, 'Giá nhập mẫu', 2, 8),
  (9, 446400.0, 'Giá nhập mẫu', 3, 9),
  (10, 280800.0, 'Giá nhập mẫu', 1, 10);

INSERT INTO
  tblAddress3 (id, street, ward, district, city)
VALUES
  (
    2,
    'Số 10 phố Gara',
    'Phường Trung Tâm',
    'Hà Đông',
    'Hà Nội'
  ),
  (
    3,
    'Số 11 phố Gara',
    'Phường Trung Tâm',
    'Hà Đông',
    'Hà Nội'
  ),
  (
    4,
    'Số 12 phố Gara',
    'Phường Trung Tâm',
    'Hà Đông',
    'Hà Nội'
  ),
  (
    5,
    'Số 13 phố Gara',
    'Phường Trung Tâm',
    'Hà Đông',
    'Hà Nội'
  ),
  (
    6,
    'Số 14 phố Gara',
    'Phường Trung Tâm',
    'Hà Đông',
    'Hà Nội'
  ),
  (
    7,
    'Số 15 phố Gara',
    'Phường Trung Tâm',
    'Hà Đông',
    'Hà Nội'
  ),
  (
    8,
    'Số 16 phố Gara',
    'Phường Trung Tâm',
    'Hà Đông',
    'Hà Nội'
  ),
  (
    9,
    'Số 17 phố Gara',
    'Phường Trung Tâm',
    'Hà Đông',
    'Hà Nội'
  ),
  (
    10,
    'Số 18 phố Gara',
    'Phường Trung Tâm',
    'Hà Đông',
    'Hà Nội'
  ),
  (
    11,
    'Số 19 phố Gara',
    'Phường Trung Tâm',
    'Hà Đông',
    'Hà Nội'
  ),
  (
    12,
    'Số 20 phố Gara',
    'Phường Trung Tâm',
    'Hà Đông',
    'Hà Nội'
  ),
  (
    13,
    'Số 21 phố Gara',
    'Phường Trung Tâm',
    'Hà Đông',
    'Hà Nội'
  );

INSERT INTO
  tblFullName3 (id, firstName, middleName, lastName)
VALUES
  (2, 'Nguyễn', 'Văn', 'An'),
  (3, 'Trần', 'Minh', 'Bình'),
  (4, 'Lê', 'Hoàng', 'Cường'),
  (5, 'Phạm', 'Thu', 'Dung'),
  (6, 'Hoàng', 'Đức', 'Em'),
  (7, 'Vũ', 'Quang', 'Phong'),
  (8, 'Đặng', 'Thị', 'Hạnh'),
  (9, 'Bùi', 'Anh', 'Khoa'),
  (10, 'Đỗ', 'Gia', 'Linh'),
  (11, 'Ngô', 'Tuấn', 'Long'),
  (12, 'Dương', 'Ngọc', 'Mai'),
  (13, 'Phan', 'Hữu', 'Nam');

INSERT INTO
  tblCustomer3 (id, phone, email, fullNameId, addressId)
VALUES
  (1, '0900000001', 'customer1@example.com', 2, 2),
  (2, '0900000002', 'customer2@example.com', 3, 3),
  (3, '0900000003', 'customer3@example.com', 4, 4),
  (4, '0900000004', 'customer4@example.com', 5, 5),
  (5, '0900000005', 'customer5@example.com', 6, 6),
  (6, '0900000006', 'customer6@example.com', 7, 7),
  (7, '0900000007', 'customer7@example.com', 8, 8),
  (8, '0900000008', 'customer8@example.com', 9, 9),
  (9, '0900000009', 'customer9@example.com', 10, 10),
  (
    10,
    '0900000010',
    'customer10@example.com',
    11,
    11
  ),
  (
    11,
    '0900000011',
    'customer11@example.com',
    12,
    12
  ),
  (
    12,
    '0900000012',
    'customer12@example.com',
    13,
    13
  );

INSERT INTO
  tblCar3 (id, licensePlate, brand, model, manufactureYear)
VALUES
  (1, '30A-12000', 'Toyota', 'Camry', 2018),
  (2, '30A-12001', 'Honda', 'CR-V', 2019),
  (3, '30A-12002', 'Hyundai', 'Accent', 2020),
  (4, '30A-12003', 'Mazda', 'CX-5', 2021),
  (5, '30A-12004', 'Ford', 'Ranger', 2022),
  (6, '30A-12005', 'Kia', 'Seltos', 2023),
  (7, '30A-12006', 'Mitsubishi', 'Xpander', 2024),
  (8, '30A-12007', 'VinFast', 'VF 8', 2018),
  (9, '30A-12008', 'Toyota', 'Camry', 2019),
  (10, '30A-12009', 'Honda', 'CR-V', 2020),
  (11, '30A-12010', 'Hyundai', 'Accent', 2021),
  (12, '30A-12011', 'Mazda', 'CX-5', 2022);

INSERT INTO
  tblCustomerCar3 (id, isOwner, customerId, carId)
VALUES
  (1, 1, 1, 1),
  (2, 1, 2, 2),
  (3, 1, 3, 3),
  (4, 1, 4, 4),
  (5, 1, 5, 5),
  (6, 1, 6, 6),
  (7, 1, 7, 7),
  (8, 1, 8, 8),
  (9, 1, 9, 9),
  (10, 1, 10, 10),
  (11, 1, 11, 11),
  (12, 1, 12, 12);

INSERT INTO
  tblAppointment3 (
    id,
    appointmentDate,
    problemDescription,
    customerName,
    customerPhone,
    customerEmail,
    customerAddress,
    licensePlate,
    carBrand,
    carModel,
    manufactureYear,
    status,
    shiftId
  )
VALUES
  (
    1,
    '2026-10-01 08:00:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Kiểm tra hệ thống phanh',
    'Nguyễn Văn An',
    '0900000001',
    'customer1@example.com',
    'Số 10 phố Gara, Hà Đông, Hà Nội',
    '30A-12000',
    'Toyota',
    'Camry',
    2018,
    'Đã xác nhận',
    7
  ),
  (
    2,
    '2026-10-02 13:30:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Thay má phanh',
    'Trần Minh Bình',
    '0900000002',
    'customer2@example.com',
    'Số 11 phố Gara, Hà Đông, Hà Nội',
    '30A-12001',
    'Honda',
    'CR-V',
    2019,
    'Đã xác nhận',
    10
  ),
  (
    3,
    '2026-10-03 08:00:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Bảo dưỡng định kỳ',
    'Lê Hoàng Cường',
    '0900000003',
    'customer3@example.com',
    'Số 12 phố Gara, Hà Đông, Hà Nội',
    '30A-12002',
    'Hyundai',
    'Accent',
    2020,
    'Đã xác nhận',
    11
  ),
  (
    4,
    '2026-10-05 13:30:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Vệ sinh kim phun',
    'Phạm Thu Dung',
    '0900000004',
    'customer4@example.com',
    'Số 13 phố Gara, Hà Đông, Hà Nội',
    '30A-12003',
    'Mazda',
    'CX-5',
    2021,
    'Đã xác nhận',
    2
  ),
  (
    5,
    '2026-10-06 08:00:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Kiểm tra điều hòa',
    'Hoàng Đức Em',
    '0900000005',
    'customer5@example.com',
    'Số 14 phố Gara, Hà Đông, Hà Nội',
    '30A-12004',
    'Ford',
    'Ranger',
    2022,
    'Đã xác nhận',
    3
  ),
  (
    6,
    '2026-10-07 13:30:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Thay dầu động cơ',
    'Vũ Quang Phong',
    '0900000006',
    'customer6@example.com',
    'Số 15 phố Gara, Hà Đông, Hà Nội',
    '30A-12005',
    'Kia',
    'Seltos',
    2023,
    'Đã xác nhận',
    6
  ),
  (
    7,
    '2026-10-08 08:00:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Cân bằng động bánh xe',
    'Đặng Thị Hạnh',
    '0900000007',
    'customer7@example.com',
    'Số 16 phố Gara, Hà Đông, Hà Nội',
    '30A-12006',
    'Mitsubishi',
    'Xpander',
    2024,
    'Đã xác nhận',
    7
  ),
  (
    8,
    '2026-10-09 13:30:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Đánh bóng thân xe',
    'Bùi Anh Khoa',
    '0900000008',
    'customer8@example.com',
    'Số 17 phố Gara, Hà Đông, Hà Nội',
    '30A-12007',
    'VinFast',
    'VF 8',
    2018,
    'Đã xác nhận',
    10
  ),
  (
    9,
    '2026-10-10 08:00:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Kiểm tra hệ thống phanh',
    'Đỗ Gia Linh',
    '0900000009',
    'customer9@example.com',
    'Số 18 phố Gara, Hà Đông, Hà Nội',
    '30A-12008',
    'Toyota',
    'Camry',
    2019,
    'Đã xác nhận',
    11
  ),
  (
    10,
    '2026-10-12 13:30:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Thay má phanh',
    'Ngô Tuấn Long',
    '0900000010',
    'customer10@example.com',
    'Số 19 phố Gara, Hà Đông, Hà Nội',
    '30A-12009',
    'Honda',
    'CR-V',
    2020,
    'Đã xác nhận',
    2
  ),
  (
    11,
    '2026-10-13 08:00:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Bảo dưỡng định kỳ',
    'Dương Ngọc Mai',
    '0900000011',
    'customer11@example.com',
    'Số 20 phố Gara, Hà Đông, Hà Nội',
    '30A-12010',
    'Hyundai',
    'Accent',
    2021,
    'Đã xác nhận',
    3
  ),
  (
    12,
    '2026-10-14 13:30:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Vệ sinh kim phun',
    'Phan Hữu Nam',
    '0900000012',
    'customer12@example.com',
    'Số 21 phố Gara, Hà Đông, Hà Nội',
    '30A-12011',
    'Mazda',
    'CX-5',
    2022,
    'Đã xác nhận',
    6
  ),
  (
    13,
    '2026-10-15 08:00:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Kiểm tra điều hòa',
    'Nguyễn Văn An',
    '0900000001',
    'customer1@example.com',
    'Số 10 phố Gara, Hà Đông, Hà Nội',
    '30A-12000',
    'Toyota',
    'Camry',
    2018,
    'Đã xác nhận',
    7
  ),
  (
    14,
    '2026-10-16 13:30:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Thay dầu động cơ',
    'Trần Minh Bình',
    '0900000002',
    'customer2@example.com',
    'Số 11 phố Gara, Hà Đông, Hà Nội',
    '30A-12001',
    'Honda',
    'CR-V',
    2019,
    'Đã xác nhận',
    10
  ),
  (
    15,
    '2026-10-17 08:00:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Cân bằng động bánh xe',
    'Lê Hoàng Cường',
    '0900000003',
    'customer3@example.com',
    'Số 12 phố Gara, Hà Đông, Hà Nội',
    '30A-12002',
    'Hyundai',
    'Accent',
    2020,
    'Đã xác nhận',
    11
  ),
  (
    16,
    '2026-10-19 13:30:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Đánh bóng thân xe',
    'Phạm Thu Dung',
    '0900000004',
    'customer4@example.com',
    'Số 13 phố Gara, Hà Đông, Hà Nội',
    '30A-12003',
    'Mazda',
    'CX-5',
    2021,
    'Đã xác nhận',
    2
  ),
  (
    17,
    '2026-10-20 08:00:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Kiểm tra hệ thống phanh',
    'Hoàng Đức Em',
    '0900000005',
    'customer5@example.com',
    'Số 14 phố Gara, Hà Đông, Hà Nội',
    '30A-12004',
    'Ford',
    'Ranger',
    2022,
    'Đã xác nhận',
    3
  ),
  (
    18,
    '2026-10-21 13:30:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Thay má phanh',
    'Vũ Quang Phong',
    '0900000006',
    'customer6@example.com',
    'Số 15 phố Gara, Hà Đông, Hà Nội',
    '30A-12005',
    'Kia',
    'Seltos',
    2023,
    'Đã xác nhận',
    6
  ),
  (
    19,
    '2026-10-22 08:00:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Bảo dưỡng định kỳ',
    'Đặng Thị Hạnh',
    '0900000007',
    'customer7@example.com',
    'Số 16 phố Gara, Hà Đông, Hà Nội',
    '30A-12006',
    'Mitsubishi',
    'Xpander',
    2024,
    'Đã xác nhận',
    7
  ),
  (
    20,
    '2026-10-23 13:30:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Vệ sinh kim phun',
    'Bùi Anh Khoa',
    '0900000008',
    'customer8@example.com',
    'Số 17 phố Gara, Hà Đông, Hà Nội',
    '30A-12007',
    'VinFast',
    'VF 8',
    2018,
    'Đã xác nhận',
    10
  ),
  (
    21,
    '2026-10-24 08:00:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Kiểm tra điều hòa',
    'Đỗ Gia Linh',
    '0900000009',
    'customer9@example.com',
    'Số 18 phố Gara, Hà Đông, Hà Nội',
    '30A-12008',
    'Toyota',
    'Camry',
    2019,
    'Đã xác nhận',
    11
  ),
  (
    22,
    '2026-10-26 13:30:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Thay dầu động cơ',
    'Ngô Tuấn Long',
    '0900000010',
    'customer10@example.com',
    'Số 19 phố Gara, Hà Đông, Hà Nội',
    '30A-12009',
    'Honda',
    'CR-V',
    2020,
    'Đã xác nhận',
    2
  ),
  (
    23,
    '2026-10-27 08:00:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Cân bằng động bánh xe',
    'Dương Ngọc Mai',
    '0900000011',
    'customer11@example.com',
    'Số 20 phố Gara, Hà Đông, Hà Nội',
    '30A-12010',
    'Hyundai',
    'Accent',
    2021,
    'Đã xác nhận',
    3
  ),
  (
    24,
    '2026-10-28 13:30:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Đánh bóng thân xe',
    'Phan Hữu Nam',
    '0900000012',
    'customer12@example.com',
    'Số 21 phố Gara, Hà Đông, Hà Nội',
    '30A-12011',
    'Mazda',
    'CX-5',
    2022,
    'Đã xác nhận',
    6
  ),
  (
    25,
    '2026-10-29 08:00:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Kiểm tra hệ thống phanh',
    'Nguyễn Văn An',
    '0900000001',
    'customer1@example.com',
    'Số 10 phố Gara, Hà Đông, Hà Nội',
    '30A-12000',
    'Toyota',
    'Camry',
    2018,
    'Đã xác nhận',
    7
  ),
  (
    26,
    '2026-10-30 13:30:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Thay má phanh',
    'Trần Minh Bình',
    '0900000002',
    'customer2@example.com',
    'Số 11 phố Gara, Hà Đông, Hà Nội',
    '30A-12001',
    'Honda',
    'CR-V',
    2019,
    'Đã xác nhận',
    10
  ),
  (
    27,
    '2026-10-31 08:00:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Bảo dưỡng định kỳ',
    'Lê Hoàng Cường',
    '0900000003',
    'customer3@example.com',
    'Số 12 phố Gara, Hà Đông, Hà Nội',
    '30A-12002',
    'Hyundai',
    'Accent',
    2020,
    'Đã xác nhận',
    11
  ),
  (
    28,
    '2026-11-03 13:30:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Vệ sinh kim phun',
    'Phạm Thu Dung',
    '0900000004',
    'customer4@example.com',
    'Số 13 phố Gara, Hà Đông, Hà Nội',
    '30A-12003',
    'Mazda',
    'CX-5',
    2021,
    'Đã xác nhận',
    4
  ),
  (
    29,
    '2026-11-10 08:00:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Kiểm tra điều hòa',
    'Hoàng Đức Em',
    '0900000005',
    'customer5@example.com',
    'Số 14 phố Gara, Hà Đông, Hà Nội',
    '30A-12004',
    'Ford',
    'Ranger',
    2022,
    'Đã xác nhận',
    3
  ),
  (
    30,
    '2026-11-17 13:30:00',
    'Khách yêu cầu kiểm tra xe và thực hiện Thay dầu động cơ',
    'Vũ Quang Phong',
    '0900000006',
    'customer6@example.com',
    'Số 15 phố Gara, Hà Đông, Hà Nội',
    '30A-12005',
    'Kia',
    'Seltos',
    2023,
    'Đã xác nhận',
    4
  );

INSERT INTO
  tblAppointmentService3 (appointmentId, serviceId)
VALUES
  (1, 3),
  (2, 6),
  (3, 1),
  (4, 4),
  (5, 7),
  (6, 2),
  (7, 5),
  (8, 8),
  (9, 3),
  (10, 6),
  (11, 1),
  (12, 4),
  (13, 7),
  (14, 2),
  (15, 5),
  (16, 8),
  (17, 3),
  (18, 6),
  (19, 1),
  (20, 4),
  (21, 7),
  (22, 2),
  (23, 5),
  (24, 8),
  (25, 3),
  (26, 6),
  (27, 1),
  (28, 4),
  (29, 7),
  (30, 2);

INSERT INTO
  tblReceptionNote3 (
    id,
    receptionTime,
    carCondition,
    initialRequest,
    proposedDetails,
    technicianId,
    customerCarId,
    tblAppointment3id
  )
VALUES
  (
    1,
    '2026-10-01 08:30:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Kiểm tra hệ thống phanh',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    1,
    1
  ),
  (
    2,
    '2026-10-02 14:00:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Thay má phanh',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    2,
    2
  ),
  (
    3,
    '2026-10-03 08:30:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Bảo dưỡng định kỳ',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    3,
    3
  ),
  (
    4,
    '2026-10-05 14:00:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Vệ sinh kim phun',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    4,
    4
  ),
  (
    5,
    '2026-10-06 08:30:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Kiểm tra điều hòa',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    5,
    5
  ),
  (
    6,
    '2026-10-07 14:00:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Thay dầu động cơ',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    6,
    6
  ),
  (
    7,
    '2026-10-08 08:30:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Cân bằng động bánh xe',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    7,
    7
  ),
  (
    8,
    '2026-10-09 14:00:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Đánh bóng thân xe',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    8,
    8
  ),
  (
    9,
    '2026-10-10 08:30:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Kiểm tra hệ thống phanh',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    9,
    9
  ),
  (
    10,
    '2026-10-12 14:00:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Thay má phanh',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    10,
    10
  ),
  (
    11,
    '2026-10-13 08:30:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Bảo dưỡng định kỳ',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    11,
    11
  ),
  (
    12,
    '2026-10-14 14:00:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Vệ sinh kim phun',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    12,
    12
  ),
  (
    13,
    '2026-10-15 08:30:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Kiểm tra điều hòa',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    1,
    13
  ),
  (
    14,
    '2026-10-16 14:00:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Thay dầu động cơ',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    2,
    14
  ),
  (
    15,
    '2026-10-17 08:30:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Cân bằng động bánh xe',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    3,
    15
  ),
  (
    16,
    '2026-10-19 14:00:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Đánh bóng thân xe',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    4,
    16
  ),
  (
    17,
    '2026-10-20 08:30:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Kiểm tra hệ thống phanh',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    5,
    17
  ),
  (
    18,
    '2026-10-21 14:00:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Thay má phanh',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    6,
    18
  ),
  (
    19,
    '2026-10-22 08:30:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Bảo dưỡng định kỳ',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    7,
    19
  ),
  (
    20,
    '2026-10-23 14:00:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Vệ sinh kim phun',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    8,
    20
  ),
  (
    21,
    '2026-10-24 08:30:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Kiểm tra điều hòa',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    9,
    21
  ),
  (
    22,
    '2026-10-26 14:00:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Thay dầu động cơ',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    10,
    22
  ),
  (
    23,
    '2026-10-27 08:30:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Cân bằng động bánh xe',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    11,
    23
  ),
  (
    24,
    '2026-10-28 14:00:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Đánh bóng thân xe',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    12,
    24
  ),
  (
    25,
    '2026-10-29 08:30:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Kiểm tra hệ thống phanh',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    1,
    25
  ),
  (
    26,
    '2026-10-30 14:00:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Thay má phanh',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    2,
    26
  ),
  (
    27,
    '2026-10-31 08:30:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Bảo dưỡng định kỳ',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    3,
    27
  ),
  (
    28,
    '2026-11-03 14:00:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Vệ sinh kim phun',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    4,
    28
  ),
  (
    29,
    '2026-11-10 08:30:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Kiểm tra điều hòa',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    5,
    29
  ),
  (
    30,
    '2026-11-17 14:00:00',
    'Xe vào xưởng trong tình trạng sử dụng được',
    'Kiểm tra và Thay dầu động cơ',
    'Đã kiểm tra, thực hiện hạng mục đã thống nhất',
    3,
    6,
    30
  );

INSERT INTO
  tblRepairOrder3 (
    id,
    createdDate,
    status,
    technicianId,
    tblReceptionNote3id
  )
VALUES
  (1, '2026-10-01', 'Hoàn thành', 3, 1),
  (2, '2026-10-02', 'Hoàn thành', 3, 2),
  (3, '2026-10-03', 'Hoàn thành', 3, 3),
  (4, '2026-10-05', 'Hoàn thành', 3, 4),
  (5, '2026-10-06', 'Hoàn thành', 3, 5),
  (6, '2026-10-07', 'Hoàn thành', 3, 6),
  (7, '2026-10-08', 'Hoàn thành', 3, 7),
  (8, '2026-10-09', 'Hoàn thành', 3, 8),
  (9, '2026-10-10', 'Hoàn thành', 3, 9),
  (10, '2026-10-12', 'Hoàn thành', 3, 10),
  (11, '2026-10-13', 'Hoàn thành', 3, 11),
  (12, '2026-10-14', 'Hoàn thành', 3, 12),
  (13, '2026-10-15', 'Hoàn thành', 3, 13),
  (14, '2026-10-16', 'Hoàn thành', 3, 14),
  (15, '2026-10-17', 'Hoàn thành', 3, 15),
  (16, '2026-10-19', 'Hoàn thành', 3, 16),
  (17, '2026-10-20', 'Hoàn thành', 3, 17),
  (18, '2026-10-21', 'Hoàn thành', 3, 18),
  (19, '2026-10-22', 'Hoàn thành', 3, 19),
  (20, '2026-10-23', 'Hoàn thành', 3, 20),
  (21, '2026-10-24', 'Hoàn thành', 3, 21),
  (22, '2026-10-26', 'Hoàn thành', 3, 22),
  (23, '2026-10-27', 'Hoàn thành', 3, 23),
  (24, '2026-10-28', 'Hoàn thành', 3, 24),
  (25, '2026-10-29', 'Hoàn thành', 3, 25),
  (26, '2026-10-30', 'Hoàn thành', 3, 26),
  (27, '2026-10-31', 'Hoàn thành', 3, 27),
  (28, '2026-11-03', 'Hoàn thành', 3, 28),
  (29, '2026-11-10', 'Hoàn thành', 3, 29),
  (30, '2026-11-17', 'Hoàn thành', 3, 30);

INSERT INTO
  tblUsedService3 (
    id,
    quantity,
    unitPrice,
    totalPrice,
    repairOrderId,
    serviceId
  )
VALUES
  (1, 2, 650000, 1300000, 1, 3),
  (2, 1, 550000, 550000, 2, 6),
  (3, 2, 1500000, 3000000, 3, 1),
  (4, 1, 900000, 900000, 4, 4),
  (5, 2, 350000, 700000, 5, 7),
  (6, 1, 450000, 450000, 6, 2),
  (7, 2, 180000, 360000, 7, 5),
  (8, 1, 1200000, 1200000, 8, 8),
  (9, 2, 650000, 1300000, 9, 3),
  (10, 1, 550000, 550000, 10, 6),
  (11, 2, 1500000, 3000000, 11, 1),
  (12, 1, 900000, 900000, 12, 4),
  (13, 2, 350000, 700000, 13, 7),
  (14, 1, 450000, 450000, 14, 2),
  (15, 2, 180000, 360000, 15, 5),
  (16, 1, 1200000, 1200000, 16, 8),
  (17, 2, 650000, 1300000, 17, 3),
  (18, 1, 550000, 550000, 18, 6),
  (19, 2, 1500000, 3000000, 19, 1),
  (20, 1, 900000, 900000, 20, 4),
  (21, 2, 350000, 700000, 21, 7),
  (22, 1, 450000, 450000, 22, 2),
  (23, 2, 180000, 360000, 23, 5),
  (24, 1, 1200000, 1200000, 24, 8),
  (25, 2, 650000, 1300000, 25, 3),
  (26, 1, 550000, 550000, 26, 6),
  (27, 2, 1500000, 3000000, 27, 1),
  (28, 1, 900000, 900000, 28, 4),
  (29, 2, 350000, 700000, 29, 7),
  (30, 1, 450000, 450000, 30, 2);

INSERT INTO
  tblUsedSparePart3 (
    id,
    quantity,
    unitPrice,
    totalPrice,
    repairOrderId,
    sparePartId
  )
VALUES
  (1, 2, 1250000, 2500000, 1, 3),
  (2, 3, 280000, 840000, 2, 6),
  (3, 1, 620000, 620000, 3, 9),
  (4, 2, 180000, 360000, 4, 2),
  (5, 3, 210000, 630000, 5, 5),
  (6, 1, 1850000, 1850000, 6, 8),
  (7, 2, 250000, 500000, 7, 1),
  (8, 3, 320000, 960000, 8, 4),
  (9, 1, 95000, 95000, 9, 7),
  (10, 2, 390000, 780000, 10, 10),
  (11, 3, 1250000, 3750000, 11, 3),
  (12, 1, 280000, 280000, 12, 6),
  (13, 2, 620000, 1240000, 13, 9),
  (14, 3, 180000, 540000, 14, 2),
  (15, 1, 210000, 210000, 15, 5),
  (16, 2, 1850000, 3700000, 16, 8),
  (17, 3, 250000, 750000, 17, 1),
  (18, 1, 320000, 320000, 18, 4),
  (19, 2, 95000, 190000, 19, 7),
  (20, 3, 390000, 1170000, 20, 10),
  (21, 1, 1250000, 1250000, 21, 3),
  (22, 2, 280000, 560000, 22, 6),
  (23, 3, 620000, 1860000, 23, 9),
  (24, 1, 180000, 180000, 24, 2),
  (25, 2, 210000, 420000, 25, 5),
  (26, 3, 1850000, 5550000, 26, 8),
  (27, 1, 250000, 250000, 27, 1),
  (28, 2, 320000, 640000, 28, 4),
  (29, 3, 95000, 285000, 29, 7),
  (30, 1, 390000, 390000, 30, 10);

INSERT INTO
  tblInvoice3 (
    id,
    invoiceCode,
    createdAt,
    paidAt,
    totalAmount,
    repairOrderId,
    cashierId
  )
VALUES
  (
    1,
    'HD202610001',
    '2026-10-01 11:30:00', '2026-10-01 11:50:00', 3800000, 1, 2),
  (
    2,
    'HD202610002',
    '2026-10-02 17:00:00', '2026-10-02 17:20:00', 1390000, 2, 2),
  (
    3,
    'HD202610003',
    '2026-10-03 11:30:00', '2026-10-03 11:50:00', 3620000, 3, 2),
  (
    4,
    'HD202610004',
    '2026-10-05 17:00:00', '2026-10-05 17:20:00', 1260000, 4, 2),
  (
    5,
    'HD202610005',
    '2026-10-06 11:30:00', '2026-10-06 11:50:00', 1330000, 5, 2),
  (
    6,
    'HD202610006',
    '2026-10-07 17:00:00', '2026-10-07 17:20:00', 2300000, 6, 2),
  (
    7,
    'HD202610007',
    '2026-10-08 11:30:00', '2026-10-08 11:50:00', 860000, 7, 2),
  (
    8,
    'HD202610008',
    '2026-10-09 17:00:00', '2026-10-09 17:20:00', 2160000, 8, 2),
  (
    9,
    'HD202610009',
    '2026-10-10 11:30:00', '2026-10-10 11:50:00', 1395000, 9, 2),
  (
    10,
    'HD202610010',
    '2026-10-12 17:00:00', '2026-10-12 17:20:00', 1330000, 10, 2),
  (
    11,
    'HD202610011',
    '2026-10-13 11:30:00', '2026-10-13 11:50:00', 6750000, 11, 2),
  (
    12,
    'HD202610012',
    '2026-10-14 17:00:00', '2026-10-14 17:20:00', 1180000, 12, 2),
  (
    13,
    'HD202610013',
    '2026-10-15 11:30:00', '2026-10-15 11:50:00', 1940000, 13, 2),
  (
    14,
    'HD202610014',
    '2026-10-16 17:00:00', '2026-10-16 17:20:00', 990000, 14, 2),
  (
    15,
    'HD202610015',
    '2026-10-17 11:30:00', '2026-10-17 11:50:00', 570000, 15, 2),
  (
    16,
    'HD202610016',
    '2026-10-19 17:00:00', '2026-10-19 17:20:00', 4900000, 16, 2),
  (
    17,
    'HD202610017',
    '2026-10-20 11:30:00', '2026-10-20 11:50:00', 2050000, 17, 2),
  (
    18,
    'HD202610018',
    '2026-10-21 17:00:00', '2026-10-21 17:20:00', 870000, 18, 2),
  (
    19,
    'HD202610019',
    '2026-10-22 11:30:00', '2026-10-22 11:50:00', 3190000, 19, 2),
  (
    20,
    'HD202610020',
    '2026-10-23 17:00:00', '2026-10-23 17:20:00', 2070000, 20, 2),
  (
    21,
    'HD202610021',
    '2026-10-24 11:30:00', '2026-10-24 11:50:00', 1950000, 21, 2),
  (
    22,
    'HD202610022',
    '2026-10-26 17:00:00', '2026-10-26 17:20:00', 1010000, 22, 2),
  (
    23,
    'HD202610023',
    '2026-10-27 11:30:00', '2026-10-27 11:50:00', 2220000, 23, 2),
  (
    24,
    'HD202610024',
    '2026-10-28 17:00:00', '2026-10-28 17:20:00', 1380000, 24, 2),
  (
    25,
    'HD202610025',
    '2026-10-29 11:30:00', '2026-10-29 11:50:00', 1720000, 25, 2),
  (
    26,
    'HD202610026',
    '2026-10-30 17:00:00', '2026-10-30 17:20:00', 6100000, 26, 2),
  (
    27,
    'HD202610027',
    '2026-10-31 11:30:00', '2026-10-31 11:50:00', 3250000, 27, 2),
  (
    28,
    'HD202611001',
    '2026-11-03 17:00:00', '2026-11-03 17:20:00', 1540000, 28, 2),
  (
    29,
    'HD202611002',
    '2026-11-10 11:30:00', '2026-11-10 11:50:00', 985000, 29, 2),
  (
    30,
    'HD202611003',
    '2026-11-17 17:00:00', '2026-11-17 17:20:00', 840000, 30, 2);

INSERT INTO
  tblGoodsReceipt3 (id, importDate, totalAmount, note, supplierId)
VALUES
  (
    1,
    '2026-10-02',
    8600000,
    'Phiếu nhập hàng tháng 10/2026',
    1
  ),
  (
    2,
    '2026-10-14',
    14250000,
    'Phiếu nhập hàng tháng 10/2026',
    2
  ),
  (
    3,
    '2026-10-27',
    18600000,
    'Phiếu nhập hàng tháng 10/2026',
    3
  );

INSERT INTO
  tblGoodsReceiptDetail3 (
    id,
    quantity,
    importPrice,
    subTotal,
    goodsReceiptId,
    sparePartId
  )
VALUES
  (1, 20, 180000, 3600000, 1, 1),
  (2, 40, 125000, 5000000, 1, 2),
  (3, 10, 900000, 9000000, 2, 3),
  (4, 25, 210000, 5250000, 2, 5),
  (5, 15, 200000, 3000000, 3, 6),
  (6, 12, 1300000, 15600000, 3, 8);
