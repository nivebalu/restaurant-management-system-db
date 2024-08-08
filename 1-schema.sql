create table `USER`(
	`User_Id` int NOT NULL AUTO_INCREMENT,
	`Fname` varchar(50) NOT NULL,
	`Lname` varchar(50) NOT NULL,
	`Password` varchar(50) NOT NULL,
	PRIMARY KEY (`User_Id`)
);

create table `RESTAURANT`(
	`Name` varchar(100) NOT NULL,
	`Location` varchar(100) NOT NULL,
	`Contact` varchar(100) NOT NULL,
	`Opening_Closing_Time` varchar(100) NOT NULL,
	`Details` varchar(500) default NULL,
	PRIMARY KEY (`Name`)
);

create table `OWNER`(
	`Fname` varchar(15) NOT NULL,
	`Lname` varchar(15) NOT NULL,
	`Contact` varchar(100) NOT NULL,
	`Rest_Name` varchar(100) NOT NULL,
	PRIMARY KEY (`Fname`,`Lname`,`Contact`),
	FOREIGN KEY (`Rest_Name`) REFERENCES `RESTAURANT`(`Name`)
	ON UPDATE CASCADE
);

create table `BILL`(
	`Order_Id` int NOT NULL AUTO_INCREMENT,
	`Customer_Fname` varchar (20) NOT NULL,
	`Customer_Lname` varchar (20) NOT NULL,
	`Customer_id` int NOT NULL,
	`Total_Amount` double NOT NULL,	
	PRIMARY KEY (`Order_Id`)
) ;

create table `MENU_BILL`(
	`Order_Id` int NOT NULL,
	`Name` varchar(100) NOT NULL,
	`Quantity` varchar(20) NOT NULL,
	`Price` varchar(20) NOT NULL,
	FOREIGN KEY(`Order_Id`) REFERENCES `BILL`(`Order_Id`)
) ;

create table `CUSTOMER`(
	`Customer_Id` int NOT NULL AUTO_INCREMENT,
	`Fname` varchar(15) NOT NULL,
	`Lname` varchar(15) NOT NULL,
	`Contact` varchar(20) DEFAULT NULL,
	`Email_Id` varchar(50) DEFAULT NULL,	
	PRIMARY KEY (`Customer_Id`)
);

create table `MANAGER`(
	`Manager_Id` int NOT NULL AUTO_INCREMENT,
	`Fname` varchar(15) NOT NULL,
	`Lname` varchar(15) NOT NULL,
	`Contact` varchar(20) NOT NULL,
	`Address` varchar(30) DEFAULT NULL,
	`Salary` varchar(30) DEFAULT NULL,
	`Sex` char(1) DEFAULT NULL,
	`Bdate` date DEFAULT NULL,
	`Join_Date` date NOT NULL,
	PRIMARY KEY (`Manager_Id`)
);

create table `WAITER`(
	`Waiter_Id` int NOT NULL AUTO_INCREMENT,
	`Fname` varchar(15) NOT NULL,
	`Lname` varchar(15) NOT NULL,
	`Contact` varchar(20) NOT NULL,
	`Address` varchar(30) DEFAULT NULL,
	`Salary` varchar(30) DEFAULT NULL,
	`Sex` char(1) DEFAULT NULL,
	`Bdate` date DEFAULT NULL,
	`Join_Date` date NOT NULL,
	PRIMARY KEY (`Waiter_Id`)
);

create table `CASHIER`(
	`Cashier_Id` int NOT NULL AUTO_INCREMENT,
	`Fname` varchar(15) NOT NULL,
	`Lname` varchar(15) NOT NULL,
	`Contact` varchar(20) NOT NULL,
	`Address` varchar(30) DEFAULT NULL,
	`Salary` varchar(30) DEFAULT NULL,
	`Sex` char(1) DEFAULT NULL,
	`Bdate` date DEFAULT NULL,
	`Join_Date` date NOT NULL,
	PRIMARY KEY (`Cashier_Id`)
);

create table `COOK`(
	`Cook_Id` int NOT NULL AUTO_INCREMENT,
	`Fname` varchar(15) NOT NULL,
	`Lname` varchar(15) NOT NULL,
	`Contact` varchar(20) NOT NULL,
	`Address` varchar(30) DEFAULT NULL,
	`Salary` varchar(30) DEFAULT NULL,
	`Sex` char(1) DEFAULT NULL,
	`Bdate` date DEFAULT NULL,
	`Join_Date` date NOT NULL,
	`Specialization` varchar(50) DEFAULT NULL,
	PRIMARY KEY (`Cook_Id`)
);

create table `HOME_DELIVERY`(
	`Delivery_Id` int NOT NULL AUTO_INCREMENT,
	`Address` varchar(50) NOT NULL,
	`Contact` varchar(20) NOT NULL,
	`Cust_Id` int NOT NULL,
	`Order_Id` int NOT NULL,
	PRIMARY KEY(`Delivery_Id`),
	FOREIGN KEY (`Cust_Id`) REFERENCES `CUSTOMER`(`Customer_Id`),
	FOREIGN KEY (`Order_Id`) REFERENCES `BILL`(`Order_Id`)
);

create table `DELIVERY_BOY`(
	`Delivery_Boy_Id` int NOT NULL AUTO_INCREMENT,
	`Fname` varchar(15) NOT NULL,
	`Lname` varchar(15) NOT NULL,
	`Contact` varchar(20) NOT NULL,
	`Address` varchar(30) DEFAULT NULL,
	`Salary` varchar(30) DEFAULT NULL,
	`Sex` char(1) DEFAULT NULL,
	`Bdate` date DEFAULT NULL,
	`Join_Date` date NOT NULL,
	PRIMARY KEY (`Delivery_Boy_Id`)
);

create table `DELIVERY_BOY_2`(
	`Boy_Id` int NOT NULL,
	`Delivery_Id` int NOT NULL,
	FOREIGN KEY (`Boy_Id`) REFERENCES `DELIVERY_BOY`(`Delivery_Boy_Id`),
	FOREIGN KEY (`Delivery_Id`) REFERENCES `HOME_DELIVERY`(`Delivery_Id`)
);

create table `MENU`(
	`Menu_Id` int NOT NULL AUTO_INCREMENT,
	`Name` varchar(100) NOT NULL,
	`Price` varchar(20) NOT NULL,	
	`Type` varchar(20) DEFAULT NULL,
	`Category` varchar(30) NOT NULL,
	PRIMARY KEY(`Menu_Id`,`Name`)
);

create table `SALE_DETAIL`(
	`Date` date NOT NULL,
	`Daily` int NOT NULL,
	`Weekly` int DEFAULT NULL,
	`Monthly` int DEFAULT NULL,
	`Rname` varchar(30) DEFAULT NULL
);

create table `SUPPLIER`(
	`Fname` varchar(15) NOT NULL,
	`Lname` varchar(15) NOT NULL,
	`Address` varchar(30) NOT NULL,
	`Contact` varchar(20) NOT NULL,
	`Details` varchar(500) DEFAULT NULL,
	PRIMARY KEY (`Fname`,`Lname`,`Address`)
) ;

create table `TABLES`(
	`Table_Number` varchar(9) NOT NULL,
	`Details` varchar(200) DEFAULT NULL,
	PRIMARY KEY (`Table_Number`)
);

create table `BOOKING`(
	`Booking_Id` int NOT NULL AUTO_INCREMENT,
	`Table_Num` varchar(30) NOT NULL,
	`Date` varchar(30) NOT NULL,
	`Time` varchar(30) NOT NULL,
	`Cust_Id` int NOT NULL,
	PRIMARY KEY (`Booking_Id`),
	FOREIGN KEY (`Cust_Id`) REFERENCES `CUSTOMER`(`Customer_Id`),
	FOREIGN KEY (`Table_Num`) REFERENCES `TABLES`(`Table_Number`)
);

create table `INGREDIENT`(
	`Ingredient_Id` int NOT NULL AUTO_INCREMENT,
	`Name` varchar(30) NOT NULL,
	`Quantity` varchar(15) NOT NULL,
	`Description` varchar(100) DEFAULT NULL,
	`Supp_Name` varchar(50) NOT NULL,
	PRIMARY KEY (`Ingredient_Id`,`Name`)
);
