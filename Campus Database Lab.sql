create database CampusLab2
use CampusLab2

create table Campus
(CampusID varchar (5) primary key,
CampusName varchar(50) not null,
Street varchar(50),
City varchar(50),
State varchar(50),
Zip varchar (50),
Phone varchar(50),
CampusDiscount decimal (2,2));

create table Position
(PositionID varchar(5) primary key,
Position varchar(50),
YearlyMembershipFee decimal(7,2) );

Create table members
(MemberID varchar(5) primary key,
LastName varchar(20),
FirstName varchar(20),
CampusAddress varchar(20),
CampusPhone varchar(20),
CampusID varchar(5),
PositionID varchar(5),
ContractDuration numeric(3)

);
Create TABLE Prices
(
FoodItemTypeID varchar (5) primary key,
MealType varchar(15),
MealPrice decimal(7,2),

);
Create table foodItems
(
FoodItemID varchar(5) primary key,
FoodItemName varchar(20),
FoodItemTypeId varchar(5)

);
create table orders
(
orderId varchar(5) primary key,
MemberId varchar(5),
OrderDate varchar(25)

);
Create table OrderLine
(
OrderId varchar(5),
FoodItemsID int,
Quantity numeric (3),
primary key(OrderId, FoodItemsId)

);

ALTER TABLE members
ADD foreign key (CampusId) references Campus (CampusID);
ALTER TABLE members
ADD foreign key (PositionId) references Position (PositionId);


ALTER TABLE FoodItems
ADD foreign key (FoodItemTypeID) references Prices(FoodItemTypeID);

 ALTER TABLE Orders
 ADD foreign key (memberID) references Members (MemberID);

 ALTER TABLE OrderLine
 ADD foreign key (OrderId) references Orders (OrderID);
 ALTER TABLE OrderLine
 ADD foreign key (OrderId) references Orders (OrderID);


CREATE SEQUENCE Prices_FoodItemID_Seq
    start with 1
    INCREMENT BY 1
    MAXVALUE 100
    CYCLE 

	select *
	from Orders


 INSERT INTO Campus VALUES 
('1','IUPUI','425 University Blvd.','Indianapolis', 'IN','46202', '317-274-4591',.08),
('2','Indiana University','107 S. Indiana Ave.','Bloomington', 'IN','47405', '812-855-4848',.07),
('3','Purdue University','475 Stadium Mall Drive','West Lafayette', 'IN','47907', '765-494-1776',.06);
 
INSERT INTO Position values
('1','Lecturer', 1050.50),
('2','Associate Professor', 900.50),
('3','Assistant Professor', 875.50),
('4','Professor', 700.75),
('5','Full Professor', 500.50);
 
 INSERT INTO Members 
 VALUES
('1','Ellen','Monk','009 Purnell', '812-123-1234', '2', '5', 12),
('2','Joe','Brady','008 Statford Hall', '765-234-2345', '3', '2', 10),
('3','Dave','Davidson','007 Purnell', '812-345-3456', '2', '3', 10),
('4','Sebastian','Cole','210 Rutherford Hall', '765-234-2345', '3', '5', 10),
('5','Michael','Doo','66C Peobody', '812-548-8956', '2', '1', 10),
('6','Jerome','Clark','SL 220', '317-274-9766', '1', '1', 12),
('7','Bob','House','ET 329', '317-278-9098', '1', '4', 10),
('8','Bridget','Stanley','SI 234', '317-274-5678', '1', '1', 12),
('9','Bradley','Wilson','334 Statford Hall', '765-258-2567', '3', '2', 10);


insert into Prices(FoodItemTypeID, MealPrice, MealType)
values(next value for Prices_FoodItemID_Seq, 5.50,'Beer/Wine'),
(next value for Prices_FoodItemID_Seq, 2.75,'Dessert'),
(next value for Prices_FoodItemID_Seq, 15.50,'Dinner'),
(next value for Prices_FoodItemID_Seq, 2.50,'Soft Drink'),
(next value for Prices_FoodItemID_Seq, 7.25,'Lunch');

 INSERT INTO FoodItems VALUES
('10001','Lager', '1'),
('10002','Red Wine', '1'),
('10003','White Wine', '1'),
('10004','Coke', '4'),
('10005','Coffee', '4'),
('10006','Chicken a la King', '3'),
('10007','Rib Steak', '3'),
('10008','Fish and Chips', '3'),
('10009','Veggie Delight', '3'),
('10010','Chocolate Mousse', '2'),
('10011','Carrot Cake', '2'),
('10012','Fruit Cup', '2'),
('10013','Fish and Chips', '5'),
('10014','Angus Beef Burger', '5'),
('10015','Cobb Salad', '5');
 
 INSERT INTO Orders VALUES
('1', '9', 'March 5, 2005'),
('2', '8', 'March 5, 2005'),
('3', '7', 'March 5, 2005'),
('4', '6', 'March 7, 2005'),
('5', '5', 'March 7, 2005'),
('6', '4', 'March 10, 2005'),
('7', '3', 'March 11, 2005'),
('8', '2', 'March 12, 2005'),
('9', '1', 'March 13, 2005');
 
 INSERT INTO OrderLine VALUES
('1','10001',1),
('1','10006',1),
('1','10012',1),
('2','10004',2),
('2','10013',1),
('2','10014',1),
('3','10005',1),
('3','10011',1),
('4','10005',2),
('4','10004',2),
('4','10006',1),
('4','10007',1),
('4','10010',2),
('5','10003',1),
('6','10002',2),
('7','10005',2),
('8','10005',1),
('8','10011',1),
('9','10001',1);

 SELECT * FROM Campus

 select * from members

 select * from OrderLine

 select * from foodItems

 select * from Prices

 exec sp_columns OrderLine