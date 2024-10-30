
CREATE DATABASE WahnStore;

USE WahnStore;

CREATE TABLE Genders (
    gender_id INT PRIMARY KEY IDENTITY(1,1),
    gender_name NVARCHAR(100) NOT NULL
);

INSERT INTO Genders (gender_name) VALUES ('Nam');
INSERT INTO Genders (gender_name) VALUES (N'N?');

SELECT * FROM Genders;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    customer_fullname NVARCHAR(50) NOT NULL,
    customer_email NVARCHAR(50) NOT NULL,
    customer_phone NVARCHAR(50) NOT NULL, 
    customer_username NVARCHAR(50) NOT NULL,
    customer_password NVARCHAR(256) NOT NULL,
    customer_address NVARCHAR(256) NOT NULL,
    gender_id INT,
    customer_avatar NVARCHAR(255),
    customer_createddate DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Customers_Genders FOREIGN KEY (gender_id) REFERENCES Genders(gender_id)
);

-- Thêm m?t khách hàng m?i vào b?ng Customers
INSERT INTO Customers (customer_fullname, customer_email, customer_phone, customer_username, customer_password, customer_address, gender_id, customer_avatar)
VALUES (N'Tr?nh Minh Hoàng', 'viethoangxtpro08@gmail.com', '0399911384', 'mhoang0000', '123456', N'Hà N?i', 1, 'avatar1.jpg');


DELETE FROM Customers WHERE customer_id = 4;

UPDATE Customers
SET 

    customer_avatar = N'linh.jfif' -- Thay ??i tên file avatar n?u c?n
WHERE
    customer_id = 5;

SELECT * FROM Customers;

CREATE TABLE Admins (
    admin_id INT PRIMARY KEY IDENTITY(1,1),
    admin_fullname NVARCHAR(50) NOT NULL,
    admin_email NVARCHAR(50) NOT NULL,
    admin_phone NVARCHAR(50) NOT NULL, 
    admin_username NVARCHAR(50) NOT NULL,
    admin_password NVARCHAR(256) NOT NULL,
    admin_address NVARCHAR(256) NOT NULL,
    admin_avatar NVARCHAR(255),
    admin_createddate DATETIME DEFAULT GETDATE(),
    gender_id INT,
    CONSTRAINT FK_Admins_Genders FOREIGN KEY (gender_id) REFERENCES Genders(gender_id)
);
INSERT INTO Admins (
    admin_fullname, 
    admin_email, 
    admin_phone, 
    admin_username, 
    admin_password, 
    admin_address, 
    admin_avatar, 
    gender_id
)
VALUES (
    'Nguyen Van A', 
    'nguyenvana@example.com', 
    '0123456789', 
    'mhoang0000', 
    '123456', 
    '123 Example St, Hanoi', 
    'avatar_image.png', 
    1
);

SELECT * FROM Admins;
CREATE TABLE Brands (
    brand_id INT PRIMARY KEY IDENTITY(1,1),
    brand_name NVARCHAR(100) NOT NULL,
    brand_des NVARCHAR(MAX)
);


INSERT INTO Brands (brand_name, brand_des) VALUES
    (N'Rolex', N'The Rolex Watch Company was founded in 1905 by Hans Wilsdorf and Alfred Davis.'),
    (N'Omega', N'Omega SA is a Swiss luxury watchmaker based in Biel/Bienne, Switzerland.'),
    (N'Tissot', N'Tissot is a Swiss luxury watchmaker. The company was founded in Le Locle, Switzerland by Charles-Félicien Tissot and his son Charles-Émile Tissot in 1853.');

SELECT * FROM Brands;
CREATE TABLE Products(
    product_id INT PRIMARY KEY IDENTITY(1,1),
    product_name NVARCHAR(100) NOT NULL,
    product_des NVARCHAR(MAX),
    product_price DECIMAL(18, 2) NOT NULL,
    product_quantity INT NOT NULL,
    product_origin NVARCHAR(100),  --Xu?t x?:Nh?t B?n
    product_diameter DECIMAL(5, 2),  --???ng kính m?t s?
    product_thickness DECIMAL(5, 2), --B? dày m?t s?
    product_warrantyperiod NVARCHAR(100), --Th?i gian b?o hành
    product_image  NVARCHAR(255),
    gender_id INT,
    product_glass NVARCHAR(52), --Lo?i kính c?a máy
    brand_id INT,
    product_color NVARCHAR(52), --Màu m?t s?
    product_strap NVARCHAR(52), --Ch?t li?u dây                          
    product_createddate DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Products_Gender FOREIGN KEY (gender_id) REFERENCES Genders(gender_id),
    CONSTRAINT FK_Products_Brand FOREIGN KEY (brand_id) REFERENCES Brands(brand_id)
);

-- Chèn d? li?u cho s?n ph?m m?i vào b?ng "Products"
INSERT INTO Products  (product_name, product_des, product_price, product_quantity, product_origin, product_diameter, product_thickness, product_warrantyperiod, product_image, gender_id, product_glass, brand_id, product_color, product_strap)
VALUES
    (N'Tissot Le Locle Powermatic', 
	N'Tissot Le Locle Powermatic 80 39.3mm T006.407.16.033.00 – M?u ??ng h? c? c? ?i?n sang tr?ng c?a Tissot',
	17500000, 25, N'Th?y S?', 39.3, 9.8, N'2 n?m', N'tissot1.jpg', 1, N'Sapphire',
	3, N'Tr?ng', N'Dây da chính hãng');

INSERT INTO Products  (product_name, product_des, product_price, product_quantity, product_origin, product_diameter, product_thickness, product_warrantyperiod, product_image, gender_id, product_glass, brand_id, product_color, product_strap)
VALUES
    (N'Rolex Submariner Date', 
	N'??ng h? Rolex Submariner Date hi?n ?ã có s?n trên gian hàng c?a Sneaker Daily. C? h?i hi?m có ?? s? h?u món ?? cao c?p này dành cho các quý ông.',
	680000000, 5, N'Th?y S?', 39.3, 9.8, N'2 n?m', N'rolex1.jpg', 1, N'Sapphire',
	3, N'Xanh d??ng', N'Thép không g? 316L');

	INSERT INTO Products  (product_name, product_des, product_price, product_quantity, product_origin, product_diameter, product_thickness, product_warrantyperiod, product_image, gender_id, product_glass, brand_id, product_color, product_strap)
VALUES
    (N'Tissot Lovely Square', 
	N'Tissot nữ 20mm Lovely Square T058.109.33.456.00 phiên bản sang trọng 12 viên kim cương tương ứng với 12 múi giờ đính trên nền mặt số vuông siêu mỏng.',
	12080000, 5, N'Thụy Sĩ', 20, 7, N'2 năm', N'tissot2.png', 2, N'Sapphire',
	3, N'Vàng hồng', N'Thép không gỉ');


	UPDATE Products 
SET product_price = 6800000
WHERE product_name = N'Rolex Submariner Date';

SELECT * FROM Products;


CREATE TABLE Carts (
     INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT NOT NULL,
    CreatedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE CartItem (
    cartitem_id INT PRIMARY KEY IDENTITY(1,1),
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    cart_quantity INT NOT NULL,
    cart_price DECIMAL(18, 2) NOT NULL,  -- Storing the price at the time of adding to cart
    FOREIGN KEY (cart_id) REFERENCES Carts(cart_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);


CREATE TABLE Shipment (
    shipment_id INT PRIMARY KEY IDENTITY(1,1),
    shipment_address NVARCHAR(100),
	shipment_city NVARCHAR(100),
	shipment_country NVARCHAR(100),
    shipment_date DATETIME DEFAULT GETDATE(),
	customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT GETDATE(),
    order_totalamount DECIMAL(18, 2) NOT NULL,
    order_status NVARCHAR(50) NOT NULL,
	shipment_id INT NOT NULL,
    FOREIGN KEY (shipment_id) REFERENCES Shipment(shipment_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderItem (
    orderitem_id INT PRIMARY KEY IDENTITY(1,1),
    order_price DECIMAL(18, 2) NOT NULL,
	quantity DECIMAL(18, 2) NOT NULL,
	product_id INT NOT NULL,
	order_id INT NOT NULL,
	 FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);


SELECT * FROM Orders;


