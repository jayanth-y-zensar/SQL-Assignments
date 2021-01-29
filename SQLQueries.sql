use DemoDB

--Creation of Table with constraints

------1.1. Create a table Product

CREATE TABLE ProductDetail
(
	ProductId int not null primary key identity(1,1),
	Descriptions varchar(30) not null UNIQUE,
	Setqty int not null
	CHECK (Setqty=1 OR SetQty=5 OR SetQty=10)
	DEFAULT 1,
	Rate decimal(10,2)
	CHECK(Rate >=51 AND Rate <=5000)
)


----2. Insert 20 records in the product table

Insert into ProductDetail values('Banarasi',1,500.0),('Tant',5,1000.0),('Chanderi',10,5000.0),('Sambalpuri',1,2000.0),('Kasta',5,3000.0),
('Chiffon',10,700.0),('Georgette',1,4000.0),('Kosa',5,800.0),('Net',10,900.),('Bandhani',1,2500.0),('Kasavu',5,3500.0),('Patola',10,4500.0),
('Kaneevaram',1,2600.0),('Kalamkari',5,5000.0),('Paithani',10,3600.0),('Muga',1,2700.0),('Puttapaka',5,4500.0),('Pochampally',10,3500.0),
('Gadwal',1,3800.0),('Konrad',1,2800.0);


---3. Update all the rates with 10% rate hike

UPDATE ProductDetail SET Rate = Rate *1.1 FROM ProductDetail;

---4. Delete last record by providing the ProductID.

Delete from ProductDetail
where ProductId=20

---5. Alter the above table and add the following column.

Alter table ProductDetail add MarginCode char(1)
check(MarginCode='A' OR MarginCode='B' OR MarginCode=Null)

---6. Update few records to set MarginCode to A and some records MarginCode to B
update ProductDetail
set MarginCode = 'A'
where ProductId < 7

update ProductDetail
set MarginCode = 'B'
where ProductId > 10

----7. Update all the SetQty to 10 for all Items which have MarginCode A and whose original SetQty is 1.

update ProductDetail
set Setqty=10
where MarginCode='A' And Setqty=1