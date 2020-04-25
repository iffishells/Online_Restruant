CREATE table Customer(

    customerid int(11) not Null PRIMARY key ,
    fname VARCHAR(30) Not NULL,
    lname VARCHAR(30) not NULL,
    Contactname  VARCHAR(30) NOT Null,
    PersonalID int(11) ,
    constraint Fk_personalinfo_customer foreign key (PersonalID) 
    References Personalinfo(PersonalID),


    biling_id int(11),
    constraint fk_customer_biilinginfo foreign key (biling_id)
    References BillingInfo(BillingID)
);

CREATE TABLE BillingInfo (

    BillingID int(11) Not NULL PRIMARY key,  
    BillingAddress Text NOT Null,
    CreditCardID VARCHAR(30) Not NULL,
    BillDate DATE NOT Null,
    CreditCardExpdate date NOT NULL,
    CreditCardPin VARCHAR(30) NOT NULL,
    CreditCardNo VARCHAR(30) NOT Null


);
CREATE table Shippers(

    ShipperID int(11)  NOT Null PRIMARY key,
    CompanyName text NOT NULL,
    Phone VARCHAR(30)
)
CREATE TABLE Orders(

    OrderID int(11) not NULL PRIMARY key,
    CutomerID int(11) NOT Null,
    ShipperID int(11) Not NULL,
    ShippedDate date not Null,
    RequiredData text not Null ,
    Orderdate date not NULL,
    OrderNumber int(11) not NULL,
    Shipvia text  NOT NULL ,
    billing_info int(11),
    
    constraint fk_order_billinginfo foreign key (billing_info)
    References BillingInfo(BillingID),

    
    constraint fk_order_shippers foreign key (ShipperID)
    References Shippers(ShipperID),

    constraint fk_order_order_detail foreign key(OrderID)
    References OrderDetails(OrderId)
);
CREATE TABLE OrderDetails(

    OrderId int(11) NOT NULL PRIMARY key,
    ProductID int (11) Not NULL, 
    Total int(11) NOT NULL,
    UnitPrice int(11) NOT NULL,
    PaymetMethod text NOT NULL,
    -- Billstatus -- yet no idea about this 
    Quantity int(11) NOT NULL,
    Diccount int (11) NOT Null,
    OrderNumber int(11) NOT NULL

);



CREATE table Supplier( 
        SupplierID int(11) not Null PRIMARY key,
        ContactFName VARCHAR(30) NOT NULL,
        ContactLName VARCHAR(30) NOT NULL,
        CompanyName VARCHAR(50)  not NULL,
        ContactTitle VARCHAR(40) NOT Null,
		PersonalID int ,
		constraint fk_supplier_personalinfo foreign key (PersonalID) 
		References Personalinfo(PersonalID)
);

CREATE table Personalinfo(

    PersonalID int(11)  not null PRIMARY key ,
    Phone VARCHAR(30) NOT NULL,
    Email VARCHAR(30) NOT NULL,
    City VARCHAR(30) Not NULL,
    Country VARCHAR(30) NOT Null,
    PostalCode VARCHAR(12) Not Null
);

CREATE TABLE Product(
    ProductID int(11) Not NULL PRIMARY key,
    ProductName VARCHAR(30) Not Null,
    SupplierID int(11) NOT NULL,
    ReorderLevel VARCHAR(30) NOT Null,
    Discount VARCHAR(30) Not Null,
    UnitsOnOrder VARCHAR(30) Not Null,
    UnitWeight VARCHAR(30) Not Null,
    UnitPrice VARCHAR(30) NOt Null,
    ProductDescription VARCHAR(80) Not NULL,
    QuantityPerUnit VARCHAR(30) NOT NULL,
    Adds Text Not Null, 
    LocalAddresss Text Not Null,

    constraint fk_product_supplier foreign key (SupplierID)
    References Supplier(SupplierID),

    CategoryID int(11) ,

    constraint fk_product_catagory foreign key (CategoryID)
    References Category(CategoryID),

    AdminID int(11),
    constraint fk_products_add foreign key (AdminID)
    References Admin(AdminID)
);

CREATE TABLE Category(

    CategoryID int(11) not NULL PRIMARY key,
    CategoryName VARCHAR(30) not NULL,
    Descriptionn Text NOT NULL 

    );

CREATE TABLE Admin (

    AdminID int(11) not Null PRIMARY key,
    AdminFname VARCHAR(30) NOT NULL ,
    AdminLname VARCHAR(30) NOT Null,
    AdminPassword VARCHAR(30) NOT NULL
);




