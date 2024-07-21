create database companyDB;
use companyDB;

-- Table 1
CREATE TABLE LGCUSTOMER (
    Cust_Code INT PRIMARY KEY,
    Cust_Frame VARCHAR(255),
    Cust_Lname VARCHAR(255),
    Cust_Street VARCHAR(255),
    Cust_City VARCHAR(255),
    Cust_State VARCHAR(255),
    Cust_ZIP VARCHAR(10),
    Cust_Balance DECIMAL(10, 2)
);

-- Table 2
CREATE TABLE LGINVOICE (
    Inv_Num INT PRIMARY KEY,
    Cust_Code INT,
    Inv_Date DATE,
    Inv_Total DECIMAL(10, 2),
    Employee_ID INT,
    FOREIGN KEY (Cust_Code) REFERENCES LGCUSTOMER(Cust_Code),
    FOREIGN KEY (Employee_ID) REFERENCES LGEMPLOYEE(Emp_Num)
);

-- Table 3
CREATE TABLE LGEMPLOYEE (
    Emp_Num INT PRIMARY KEY,
    Emp_Fname VARCHAR(255),
    Emp_Lname VARCHAR(255),
    Emp_Phone VARCHAR(15),
    Emp_Hiredate DATE,
    Emp_Title VARCHAR(255),
    Emp_Comm DECIMAL(10, 2),
    Dept_Num INT
);

-- Table 4
CREATE TABLE LGDEPARTMENT (
    Dept_Num INT PRIMARY KEY,
    Dept_Name VARCHAR(255),
    Dept_Mail_Box VARCHAR(255),
    Dept_Phone VARCHAR(15),
    Emp_Num INT
);
ALTER TABLE LGEMPLOYEE
ADD CONSTRAINT FK_Employee_Department
FOREIGN KEY (Dept_Num) REFERENCES LGDEPARTMENT(Dept_Num);

ALTER TABLE LGDEPARTMENT
ADD CONSTRAINT FK_Department_Employee
FOREIGN KEY (Emp_Num) REFERENCES LGEMPLOYEE(Emp_Num);

-- Table 5
CREATE TABLE LGBRAND (
    BrandID INT PRIMARY KEY,
    Brand_Name VARCHAR(255),
    Brand_Type VARCHAR(255)
);

-- Table 6
CREATE TABLE LGPRODUCT (
    Prod_SKU varchar(255) PRIMARY KEY,
    Prod_Descript VARCHAR(255),
    Proc_Type VARCHAR(255),
    Proc_Bine VARCHAR(255),
    Proc_Category VARCHAR(255),
    Prod_Price DECIMAL(10, 2),
    Prod_QOM INT,
    Prod_Min INT,
    Brand_ID INT,
    FOREIGN KEY (Brand_ID) REFERENCES LGBRAND(BrandID)
);
drop table LGPRODUCT;

-- Table 7
CREATE TABLE LGLINE (
    Inv_Num INT,
    Line_Num INT,
    Prod_SKU varchar(255),
    Line_Qty INT,
    Line_Price DECIMAL(10, 2),
    PRIMARY KEY (Inv_Num, Line_Num),
    FOREIGN KEY (Inv_Num) REFERENCES LGINVOICE(Inv_Num),
    FOREIGN KEY (Prod_SKU) REFERENCES LGPRODUCT(Prod_SKU)
);
drop table LGLINE;

-- Table 8
CREATE TABLE LGVENDOR (
    Vend_ID INT PRIMARY KEY,
    Vend_Name VARCHAR(255),
    Vend_Street VARCHAR(255),
    Vend_City VARCHAR(255),
    Vend_State VARCHAR(255),
    Vend_ZIP VARCHAR(10)
);

-- Table 9
CREATE TABLE LGSUPPLIES (
    Vend_ID INT,
    Prod_SKU varchar(255),
    PRIMARY KEY (Vend_ID, Prod_SKU),
    FOREIGN KEY (Vend_ID) REFERENCES LGVENDOR(Vend_ID),
    FOREIGN KEY (Prod_SKU) REFERENCES LGPRODUCT(Prod_SKU)
);
-- Table 6: LGPRODUCT
ALTER TABLE LGPRODUCT MODIFY COLUMN Prod_SKU VARCHAR(255);

-- Table 7: LGLINE
ALTER TABLE LGLINE MODIFY COLUMN Prod_SKU VARCHAR(255);

-- Table 10
CREATE TABLE LGSALARY_HISTORY (
    Emp_Num INT,
    Sal_From DATE,
    Sal_End DATE,
    Sal_Amount DECIMAL(10, 2),
    PRIMARY KEY (Emp_Num, Sal_From),
    FOREIGN KEY (Emp_Num) REFERENCES LGEMPLOYEE(Emp_Num)
);

INSERT INTO LGBRAND (BrandID, Brand_Name, Brand_Type)
VALUES
    (23, 'FORESTERS BEST', 'PREMIUM'),
    (33, 'BINDER PRIME', 'CONTRACTOR'),
    (25, 'STUTTENFURST', 'PREMIUM'),
    (35, 'LE MODE', 'CONTRACTOR'),
    (27, 'HOME COMFORT', 'PREMIUM'),
    (28, 'OLDE TYME QUALITY', 'CONTRACTOR'),
    (29, 'BUSTERS', 'VALUE'),
    (30, 'LONG HAUL', 'CONTRACTOR'),
    (31, 'VALU-MATTE', 'VALUE'),
    (24, 'REGAL HOME', 'VALUE'),
    (26, 'HOMESTEADER FINEST', 'PREMIUM'),
    (32, 'YOUR HOME HELPER', 'VALUE'),
    (34, 'PRIME OF LIFE', 'VALUE');
    Select * from LGBRAND;
INSERT INTO LGBRAND (BrandID, Brand_Name, Brand_Type)
VALUES
	(23, 'FORESTERS BEST', 'VALUE'),
    (33, 'BINDER PRIME', 'PREMIUM'),
    (25, 'STUTTENFURST', 'CONTRACTOR'),
    (35, 'LE MODE', 'PREMIUM'),
    (27, 'HOME COMFORT', 'CONTRACTOR'),
    (28, 'OLDE TYME QUALITY', 'CONTRACTOR'),
    (29, 'BUSTERS', 'VALUE'),
    (30, 'LONG HAUL', 'CONTRACTOR'),
    (31, 'VALU-MATTE', 'VALUE'),
    (24, 'REGAL HOME', 'VALUE'),
    (26, 'HOMESTEADER FINEST', 'PREMIUM'),
    (32, 'YOUR HOME HELPER', 'VALUE'),
    (34, 'PRIME OF LIFE', 'VALUE');

select * from LGBRAND;
SET SQL_SAFE_UPDATES = 0;
delete from LGBRAND;


INSERT INTO LGDEPARTMENT (Dept_Num, Dept_Name, Dept_Mail_Box, Dept_Phone, Emp_Num)
VALUES
    (200, 'SALES', '475', '555-2824', 83509),
    (300, 'PURCHASING', '222', '555-4873', 83746),
    (250, 'CUSTOMER SERVICE', '100', '555-5555', 84001),
    (500, 'DISTRIBUTION', '348', '555-3624', 84052),
    (400, 'WAREHOUSE', '789', '555-1003', 83759),
    (600, 'ACCOUNTING', '957', '555-2333', 84583),
    (550, 'TRUCKING', '842', '555-0057', 83683),
    (280, 'MARKETING', '848', '555-8500', 84042);
    Select * from LGDEPARTMENT;
INSERT INTO LGDEPARTMENT (Dept_Num, Dept_Name, Dept_Mail_Box, Dept_Phone)
VALUES
    (200, 'SALES', '475', '555-2824'),
    (300, 'PURCHASING', '222', '555-4873'),
    (250, 'CUSTOMER SERVICE', '100', '555-5555'),
    (500, 'DISTRIBUTION', '348', '555-3624'),
    (400, 'WAREHOUSE', '789', '555-1003'),
    (600, 'ACCOUNTING', '957', '555-2333'),
    (550, 'TRUCKING', '842', '555-0057'),
    (280, 'MARKETING', '848', '555-8500');
    select * from LGDEPARTMENT;
    UPDATE LGDEPARTMENT
SET Emp_Num = (
    SELECT Emp_Num
    FROM LGEMPLOYEE
    WHERE LGEMPLOYEE.Dept_Num = LGDEPARTMENT.Dept_Num
    LIMIT 1
);

INSERT INTO LGCUSTOMER (CUST_CODE, CUST_FRAME, CUST_LNAME, CUST_STREET, CUST_CITY, CUST_STATE, CUST_ZIP, CUST_BALANCE)
VALUES
    (143, 'TOMMY', 'EGAN', '316 SCORPIO CIRCLE', 'Egypt', 'OH', '43713', 271.8),
    (444, 'KORY', 'KHAN', '807 F STREET', 'Valpo', 'IN', '46383', 627.46),
    (445, 'WILMA', 'CRAIG', '451 COMMERCE STREET', 'West Point', 'NY', '10997', 0),
    (446, 'FRANCISCO', 'CALLAHAN', '918 EAST 38TH AVENUE', 'Gaithersburg', 'MD', '20886', 40.08),
    (447, 'LUPITA', 'SINGLETON', '1917 SAINT LAZARIA CIRCLE', 'Flushing', 'NY', '11371', 0),
    (448, 'ABDUL', 'BRAND', '1917 WINNERS CIRCLE', 'South Lincoln', 'MA', '01773', 133.84),
    (430, 'ROSAURA', 'SCHNEIDER', '1889 WEST LAKE DRIVE', 'Raleigh', 'NC', '27676', 708.08),
    (431, 'IRENA', 'BUCKLEY', '1917 EAST 47TH COURT', 'Virginia Beach', 'VA', '23462', 430.17),
    (449, 'DUSTIN', 'FARRIS', '1270 WHIMBREL DRIVE', 'Adamsville', 'RI', '02801', 356.59),
    (450, 'EMILIO', 'DALTON', '1714 PROVIDENCE DRIVE', 'Frankford', 'DE', '19945', 187.92),
    (451, 'ARTIE', 'WEIR', '840 SCENIC VIEW DRIVE', 'Lakewood', 'NY', '14750', 2941.5),
    (452, 'DIRK', 'GRAY', '1662 STEWART DRIVE', 'Uncklaen', 'NY', '13052', 90.14),
    (453, 'JONI', 'WHITT', '1736 VAIL DRIVE', 'Pantigo', 'NY', '11937', 0),
    (454, 'LAUREEN', 'MCNAMARA', '1600 SHEBANOF AVENUE', 'Orlando', 'FL', '32857', 712.47),
    (455, 'ARLINE', 'HARTMAN', '527 EAST 155TH AVENUE', 'Winston Salem', 'NC', '27104', 0),
    (456, 'RAFAEL', 'WALKER', '651 PERENOSA BAY DRIVE', 'Thatcher', 'OH', '43113', 0),
    (457, 'SHAUNA', 'WERNER', '784 PEPPERTREE LOOP', 'Vicksburg', 'IN', '47441', 0),
    (458, 'ELOISA', 'VALLE', '182 BRANDON STREET', 'Abel', 'AL', '36258', 547.53),
    (459, 'EDWIN', 'RAMEY', '174 TRAPLINE CIRCLE', 'Grahamtown', 'MD', '21532', 295.98),
    (460, 'SOFIA', 'FORD', '843 LORETTA STREET', 'Litchfield', 'CT', '06759', 0),
    (461, 'FERN', 'POWERS', '1619 NEW SEWARD HIGHWAY', 'Pgh', 'PA', '15235', 179.4),
    (462, 'CORRINA', 'LUGO', '114 GALENA CIRCLE', 'Tams', 'WV', '25921', 0),
    (463, 'SADIE', 'CASSIDY', '1617 BENZ CIRCLE', 'Hawthorne', 'NY', '10532', 0),
    (464, 'PATSY', 'HARRISON', '1171 COPPER MOUNTAIN CIRCLE', 'Lakeville', 'MA', '02347', 1982.4),
    (465, 'MARGOT', 'ANDRADE', '1173 ECHO STREET', 'Pinebluff', 'NC', '28373', 1830.04),
    (466, 'BRITNEY', 'BOWERS', '1562 ELLEN AVENUE', 'Pacolet', 'SC', '29372', 0),
    (467, 'PHOEBE', 'MINER', '830 DISCOVERY HEIGHTS CIRCLE', 'Olivia', 'NC', '28368', 0),
    (468, 'LOTTIE', 'FIGUEROA', '341 SOUTHWIND CIRCLE', 'Spring Hope', 'NC', '27882', 1359.91);
select * from LGCUSTOMER;

INSERT INTO LGEMPLOYEE (Emp_Num, Emp_Fname, Emp_Lname, Emp_Phone, Emp_Hiredate, Emp_Title, Emp_Comm, Dept_Num)
VALUES
    (83537, 'CLEO', 'ENGLISH', '925-7977', '1997-01-20', 'SENIOR ASSOCIATE', 0.05, 200),
    (83820, 'TOM', 'HOBSON', '441-8469', '2001-12-05', 'ASSOCIATE DIRECTOR', 0.05, 200),
    (84191, 'ROXANA', 'HOLBROOK', '441-5267', '2005-11-21', 'ASSOCIATE', 0.04, 200),
    (84106, 'FELICE', 'SAMUEL', '441-6953', '2005-04-15', 'ASSOCIATE', 0.04, 200),
    (84334, 'UNNIE', 'GOLDMAN', '441-3691', '2006-11-26', 'ASSOCIATE', 0.04, 200),
    (84306, 'ROWENA', 'MEDINA', '441-3971', '2006-10-14', 'ASSOCIATE', 0.04, 200),
    (84276, 'ROSALIND', 'VILLARREAL', '376-3125', '2006-06-03', 'ASSOCIATE', 0.04, 200),
    (84219, 'THURMAN', 'WILKINSON', '376-4963', '2006-01-11', 'ASSOCIATE', 0.04, 200),
    (84163, 'GWEN', 'EASLEY', '925-6965', '2005-09-29', 'ASSOCIATE', 0.04, 200),
    (84134, 'ROSAUE', 'GARLAND', '441-6742', '2005-06-12', 'ASSOCIATE', 0.04, 200),
    (83878, 'PAT', 'MARIN', '441-5594', '2002-12-14', 'ASSOCIATE', 0.04, 200),
    (84049, 'LANE', 'BRANDON', '441-8043', '2004-10-14', 'SALES MANAGER', 0.04, 200),
    (84021, 'JAROD', 'DICKINSON', '925-9313', '2004-08-10', 'ASSOCIATE', 0.04, 200),
    (83993, 'SANG', 'CORTES', '441-6683', '2004-06-04', 'ASSOCIATE', 0.04, 200),
    (84243, 'DANICA', 'CASTLE', '411-5637', '2006-01-17', 'ASSOCIATE', 0.04, 200),
    (83964, 'HAILEY', 'SWEENEY', '925-6055', '2004-01-14', 'ASSOCIATE', 0.04, 200),
    (84078, 'DIEGO', 'ERWIN', '376-9364', '2005-02-14', 'ASSOCIATE', 0.04, 200),
    (83936, 'BRADFORD', 'BRAY', '441-9836', '2003-11-01', 'SALES MANAGER', 0.04, 200),
    (83906, 'DELLA', 'SIMONS', '441-1613', '2003-03-08', 'ASSOCIATE', 0.04, 200),
    (83850, 'RUSTY', 'MILES', '441-7137', '2002-09-16', 'ASSOCIATE', 0.04, 200),
    (84420, 'DOUG', 'CAUDILL', '441-3335', '2007-06-08', 'ASSOCIATE', 0.03, 200),
    (84364, 'LESLIE', 'VARNER', '441-6387', '2007-03-25', 'ASSOCIATE', 0.03, 200),
    (84392, 'ALEJANDRA', 'WHALEY', '441-7792', '2007-05-02', 'ASSOCIATE', 0.03, 200),
    (83732, 'SAMMY', 'DIGGS', '525-2101', '2002-08-11', 'SENIOR ASSOCIATE', 0.04, 300),
    (84502, 'SAL', 'FITZPATRICK', '519-3447', '1982-01-29', 'LOAD SPECIALIST', 0.04, 550),
    (84046, 'FRANCESCO', 'ELLIOT', '269-4561', '2008-09-22', 'SPECIALIST', 0.03, 250),
    (84329, 'MARGOT', 'HATFIELD', '598-2327', '1938-07-24', 'ASSOCIATE', 0.03, 280),
    (84554, 'MICKEY', 'CRAFT', '396-7158', '2016-04-16', 'ASSOCIATE', 0.03, 280);

select * from LGEMPLOYEE;
INSERT INTO LGINVOICE (INV_NUM, INV_DATE, CUST_CODE, INV_TOTAL, EMPLOYEE_ID)
VALUES
    (960, '2015-04-30', 143, 29.28, 83537),
    (961, '2015-04-30', 444, 40.77, 84329),
    (963, '2015-04-30', 445, 305.46, 83820),
    (964, '2015-04-30', 446, 85.98, 84191),
    (965, '2015-05-01', 447, 236.93, 84078),
    (966, '2015-05-01', 448, 155.96, 84502),
    (967, '2015-05-01', 430, 53.55, 84306),
    (969, '2015-05-01', 431, 35.97, 84334),
    (970, '2015-05-01', 449, 29.78, 84392),
    (971, '2015-05-01', 450, 270.88, 84364),
    (972, '2015-05-01', 451, 356.22, 83964),
    (973, '2015-05-02', 452, 183.29, 83993),
    (975, '2015-05-02', 453, 115.94, 84049),
    (976, '2015-05-02', 454, 60.17, 84134),
    (977, '2015-05-02', 455, 245.38, 83732),
    (978, '2015-05-02', 456, 97.82, 84021),
    (979, '2015-05-02', 457, 164.25, 83936),
    (981, '2015-05-02', 458, 286.46, 84046),
    (982, '2015-05-02', 459, 61.95, 83878),
    (983, '2015-05-03', 460, 293.34, 83850),
    (984, '2015-05-03', 461, 252.57, 84163),
    (986, '2015-05-03', 462, 221.85, 84219),
    (987, '2015-05-03', 463, 305.83, 84276),
    (988, '2015-05-03', 464, 161.07, 84106),
    (989, '2015-05-03', 465, 141.89, 84420),
    (990, '2015-05-03', 466, 127.73, 84554),
    (992, '2015-05-04', 467, 293.83, 84243),
    (993, '2015-05-04', 468, 472.35, 83906);
select * from LGINVOICE;

INSERT INTO LGPRODUCT (Prod_SKU, Prod_Descript, Proc_Type, Proc_Bine, Proc_Category, Prod_Price, Prod_QOM, Prod_Min, Brand_ID)
VALUES
    ('2366', 'Varnish, Interior, Polyurethane, Oil Modified, Gloss', 'Interior', 'Solvent', 'Top Coat', 6.59, 3, 25, 30),
    ('8841', 'Varnish, Interior, Polyurethane, Oil Modified, Satin', 'Interior', 'Solvent', 'Top Coat', 6.59, 30, 35, 25),
    ('7231', 'Stain, Interior, for Concrete Floors', 'Interior', 'Solvent', 'Top Coat', 23.99, 50, 10, 30),
    ('8726', 'Floor Paint, Alkyd, Low Gloss', 'Exterior', 'Solvent', 'Top Coat', 21.99, 107, 15, 29),
    ('8543', 'Floor Paint, Alkyd, Low Gloss', 'Interior', 'Solvent', 'Top Coat', 21.99, 10, 5, 31),
    ('3754', 'Floor Paint, Latex, Low Gloss', 'Exterior', 'Water', 'Top Coat', 21.99, 70, 10, 33),
    ('1504', 'Floor Paint, Latex, Low Gloss Interior Water', 'Interior', 'Water', 'Top Coat', 21.99, 63, 25, 33),
    ('2200', 'Primer Sealer, Low Permeability, latex, Interior', 'Interior', 'Water', 'Primer', 7.59, 66, 5, 31),
    ('6491', 'Fire Retardant Coating, Interior, Clear (ULC Approved)', 'Interior', 'Solvent', 'Top Coat', 32.99, 27, 25, 29),
    ('5541', 'Fire Retardant Coating Interior, Clear (WIC Approved)', 'Interior', 'Water', 'Top Coat', 32.99, 31, 15, 35),
    ('5508', 'Fire Retardant Coating, Alkyd, Interior, Flat (ULC Approved)', 'Interior', 'Solvent', 'Top Coat', 35.99, 56, 35, 29),
    ('1203', 'Fire Retardant Coating Latex, Interior, Flat (ULC Approved)', 'Interior', 'Water', 'Top Coat', 35.99, 49, 25, 35),
    ('5437', 'Fire Retardant Sealer, Alkyd, Interior (ULC Approved)', 'Interior', 'Solvent', 'Top Coat', 28.99, 26, 30, 35),
    ('9838', 'Fire Retardant Top-Coat, Clear, Alkyd, Interior (VW Approved)', 'Interior', 'Solvent', 'Top Coat', 29.99, 137, 25, 27),
    ('6257', 'Fire Retardant Top-Coat, Latex, Interior (ULC Approved)', 'Interior', 'Water', 'Top Coat', 29.99, 127, 30, 27),
    ('5516', 'Floor Paint, Latex, Gloss', 'Exterior', 'Water', 'Top Coat', 21.99, 82, 15, 27),
    ('7532', 'Floor Paint, Latex, Gloss Interior Water Top Coat', 'Exterior', 'Water', 'Top Coat', 21.99, 76, 40, 25),
    ('3503', 'Primer, Bonding, Solvent Based', 'Exterior', 'Solvent', 'Primer', 5.59, 87, 25, 33),
    ('3061', 'Primer, Bonding, Solvent Based', 'Interior', 'Solvent', 'Primer', 5.59, 100, 15, 33),
    ('5220', 'Acrylic Coating, High Build, for Pavement Marking', 'Exterior', 'Solvent', 'Top Coat', 36.99, 109, 10, 29),
    ('3716', 'Acrylic Coating, High Build, for Pavement Marking Interior Solvent', 'Exterior', 'Solvent', 'Top Coat', 36.99, 132, 10, 23),
    ('4241', 'Varnish, Polyurethane, Moisture Cured, Flat (MPI Gloss Level 1)', 'Exterior', 'Solvent', 'Top Coat', 13.59, 49, 40, 27),
    ('9393', 'Varnish, Polyurethane, Moisture Cured, Flat (MPI Gloss Level 1)', 'Interior', 'Solvent', 'Top Coat', 13.59, 51, 25, 30),
    ('5602', 'Polyurethane, Two-Component, Pigmented, Gloss (MPI Gloss Level 6)', 'Exterior', 'Solvent', 'Top Coat', 4.29, 13, 40, 30),
    ('2410', 'Polyurethane, Two-Component, Pigmented, Gloss (MPI Gloss Level 6)', 'Interior', 'Solvent', 'Top Coat', 4.29, 26, 20, 27),
    ('2932', 'Varnish, Interior, Flat', 'Interior', 'Solvent', 'Top Coat', 13.59, 61, 15, 35),
    ('1078', 'Varnish, Interior, Semi-Gloss', 'Interior', 'Solvent', 'Top Coat', 14.59, 94, 40, 23);
select * from LGPRODUCT;
INSERT INTO LGLINE (Inv_Num, Line_Num, Prod_SKU, Line_Qty, Line_Price)
VALUES
    (960, 6, 2366, 3, 3.29),
    (961, 1, 8841, 1, 35.49),
    (963, 2, 7231, 1, 8.99),
    (964, 3, 8726, 3, 6.59),
    (965, 4, 8543, 4, 14.99),
    (966, 5, 3754, 3, 15.79),
    (967, 1, 1504, 3, 29.99),
    (969, 2, 2200, 5, 17.99),
    (970, 3, 6491, 4, 48.59),
    (971, 1, 5541, 4, 12.29),
    (972, 2, 5508, 3, 23.99),
    (973, 3, 1203, 5, 16.99),
    (975, 1, 5437, 3, 11.99),
    (976, 2, 9838, 4, 29.99),
    (977, 1, 6257, 1, 5.59),
    (978, 2, 5516, 4, 14.99),
    (979, 3, 7532, 1, 12.99),
    (981, 4, 3503, 4, 14.59),
    (982, 5, 3061, 2, 21.99),
    (983, 6, 5220, 3, 29.99),
    (984, 1, 3716, 5, 11.99),
    (986, 1, 4241, 5, 9.29), 
    (987, 2, 9393, 4, 16.99),
    (988, 3, 5602, 1, 6.59),
    (989, 4, 2410, 5, 38.99),
    (990, 5, 2932, 1, 17.79),
    (992, 1, 1078, 2, 6.59);
    select * from LGLINE;
INSERT INTO LGSALARY_HISTORY (EMP_NUM, SAL_FROM, SAL_END, SAL_AMOUNT)
VALUES
    (83537, '1996-09-30', '1997-09-30', 21250),
    (83820, '2016-03-04', '2017-03-04', 44560),
    (84191, '2015-03-04', '2016-03-03', 42440),
    (84106, '2014-03-05', '2015-03-04', 40420),
    (84334, '2013-03-06', '2014-03-04', 39240),
    (84306, '2012-03-05', '2013-03-05', 38100),
    (84276, '2016-05-14', '2017-05-14', 41670),
    (84219, '2015-05-14', '2016-05-13', 39690),
    (84329, '2014-05-15', '2015-05-14', 37800),
    (84163, '2013-05-16', '2014-05-14', 34360),
    (84046, '2012-05-15', '2013-05-15', 33360),
    (84134, '2011-05-15', '2012-05-14', 31770),
    (83878, '2010-05-16', '2011-05-15', 30260),
    (84554, '2009-05-17', '2010-05-15', 29380),
    (84049, '2008-05-16', '2009-05-16', 26710),
    (84021, '2007-05-16', '2008-05-15', 24280),
    (83993, '2006-05-17', '2007-05-16', 23120),
    (84243, '2005-05-18', '2006-05-16', 22450),
    (83964, '2004-05-17', '2005-05-17', 21800),
    (84078, '2003-05-17', '2004-05-16', 20190),
    (83936, '2002-05-18', '2003-05-17', 19600),
    (83906, '2001-05-19', '2002-05-17', 18670),
    (83850, '2000-05-18', '2001-05-18', 17780),
    (84420, '1999-05-18', '2000-05-17', 17260),
    (84364, '1998-05-19', '1999-05-18', 16760),
    (84392, '1997-05-20', '1998-05-18', 16270),
    (83732, '1996-05-19', '1997-05-19', 15800),
    (84502, '1995-05-19', '1996-05-18', 15340);
Select * from LGSALARY_HISTORY;
INSERT INTO LGVENDOR (VEND_ID, VEND_NAME, VEND_STREET, VEND_CITY, VEND_STATE, VEND_ZIP)
VALUES
    (0, 'Mt Blanchard Solvents Supplies', '1625 BAY VIEW DRIVE', 'Mt Blanchard', 'OH', '45867'),
    (2, 'Warren Paints Consolidated', '377 LONGHORN STREET', 'Beebe Plain', 'VT', '05823'),
    (3, 'Leal Decor Workshop', '1105 OLSON CIRCLE', 'Lake Lynn', 'PA', '15439'),
    (4, 'Ripley Warehouse', '1278 STORMY PLACE', 'Ripley', 'TN', '38063'),
    (5, 'National Wholesale Consolidated', '1185 BIGLERVILLE CIRCLE', 'Sweek Hollow', 'VT', '05483'),
    (6, 'Pine Hill Chemical Warehouse', '1777 EASTWIND COURT', 'Pine Hill', 'PA', '17901'),
    (7, 'Kenny Paints Workshop', '1286 RICHARD EVELYN BYRD STREET', 'Grand Ledge', 'MI', '48837'),
    (8, 'Baltimore Paints Consolidated', '222 SEWARD 34TH RAMP', 'Baltimore', 'MD', '21222'),
    (9, 'Donahue Solubles of West Virginia', '382 FLORENCE CIRCLE', 'Huntington', 'WV', '25700'),
    (11, 'Super Solubles of Pennsylvania', '1839 DEMEURE PLACE', 'Brookfield', 'NH', '03872'),
    (12, 'International Decor Partners', '355 WILDWOOD DRIVE', 'South Miami', 'FL', '33143'),
    (13, 'Boykin Chemical Workshop', '200 AERO AVENUE', 'Arlington', 'VA', '22218'),
    (14, 'Watkins Wholesale Warehouse', '632 GLENN NB ON MULDOON RAMP', 'Westfield', 'MA', '01086'),
    (15, 'Unlimited Wholesale of Ohio', '454 WINDJAMMER CIRCLE', 'Rowsburg', 'OH', '44866'),
    (16, 'National Solubles Partners', '1618 CARIN PLACE', 'Newport', 'NC', '28570'),
    (17, 'Linden Consolidated', '1353 STEPHEN CIRCLE', 'Linden', 'MI', '48451'),
    (18, 'Ledbetter Chemical of Vermont', '1174 SPRUCEWOOD STREET', 'Brimstone Corner', 'VT', '05761'),
    (19, 'Plymouth Solubles Workshop', '1874 LAWLOR CIRCLE', 'S Plymouth', 'NY', '13844'),
    (20, 'Irvington Wholesale Workshop', '527 ELDERBERRY STREET', 'Irvington', 'KY', '40146'),
    (21, 'Internation Solvents of Virginia', '1492 AUSTIN AVENUE', 'Cross Jct', 'VA', '22625'),
    (22, 'Rivera Decor Partners', '1404 SEWARD NB ON TUDOR RAMP', 'Orchard Lake', 'MI', '48324');
select * from LGVENDOR;
INSERT INTO LGSUPPLIES (PROD_SKU, VEND_ID)
VALUES
    ('2366', 0),
    ('8841', 2),
    ('7231', 3),
    ('8726', 4),
    ('8543', 5),
    ('3754', 6),
    ('1504', 7),
    ('2200', 8),
    ('6491', 9),
    ('5508', 11),
    ('1203', 12),
    ('5437', 13),
    ('9838', 14),
    ('6257', 15),
    ('5516', 16),
    ('7532', 17),
    ('3503', 18),
    ('3061', 19),
    ('5220', 20),
    ('3716', 21),
    ('4241', 22);
   select * from LGSUPPLIES;


-- Question 3 
SELECT Emp_Hiredate, Emp_Title, LGEMPLOYEE.Dept_Num
FROM LGEMPLOYEE
INNER JOIN LGDEPARTMENT ON LGEMPLOYEE.Dept_Num = LGDEPARTMENT.Dept_Num
WHERE Emp_Fname = 'TOM' AND Emp_Lname = 'HOBSON';

-- Question 4
SELECT *
FROM LGPRODUCT
WHERE Prod_Descript LIKE '%coating%';
-- Question 5
SELECT *
FROM LGDEPARTMENT
ORDER BY Dept_Name;
-- Question 6 
SELECT Emp_Fname AS First_Name, Emp_Lname AS Last_Name, CONCAT(Emp_Fname, '.', Emp_Lname, 
'@yourcompany.com') AS Email_Address
FROM LGEMPLOYEE
WHERE Emp_Hiredate BETWEEN '2005-01-01' AND '2006-12-31'
ORDER BY Emp_Lname, Emp_Fname;
-- Question 7 
SELECT Emp_Fname AS First_Name, Emp_Lname AS Last_Name, Emp_Phone AS Phone,
 Emp_Title AS Title, Dept_Num AS Department_Number
FROM LGEMPLOYEE
WHERE Dept_Num = 280 OR Emp_Title = 'ASSOCIATE'
ORDER BY Emp_Lname;
-- Question 8
SELECT B.Brand_Name, COUNT(P.Prod_SKU) AS Number_of_Products
FROM LGBRAND B
LEFT JOIN LGPRODUCT P ON B.BrandID = P.Brand_ID
GROUP BY B.Brand_Name
ORDER BY B.Brand_Name;
-- Question 9 
SELECT *
FROM LGPRODUCT
WHERE Prod_Price >= (
    SELECT AVG(Prod_Price)
    FROM LGPRODUCT
);
-- Question 10
SELECT Proc_Category, COUNT(*) AS Num_Products
FROM LGPRODUCT
WHERE Proc_Bine = 'Water'
GROUP BY Proc_Category
ORDER BY Proc_Category;

-- Question 11 
SELECT e.Emp_Num, e.Emp_Lname, e.Emp_Fname, COALESCE(SUM(i.Inv_Total), 0) AS Total_Invoice
FROM LGEMPLOYEE e
LEFT JOIN LGINVOICE i ON e.Emp_Num = i.Employee_ID
GROUP BY e.Emp_Num, e.Emp_Lname, e.Emp_Fname
ORDER BY e.Emp_Lname, e.Emp_Fname;
-- Question 12 
SELECT b.Brand_Name, AVG(p.Prod_Price) AS Avg_Product_Price
FROM LGPRODUCT p
INNER JOIN LGBRAND b ON p.Brand_ID = b.BrandID
GROUP BY b.Brand_Name
ORDER BY AVG(p.Prod_Price) DESC
LIMIT 1;
-- Question 13 
UPDATE LGEMPLOYEE
SET Dept_Num = 300
WHERE Emp_Num = 83537;

select * from LGEMPLOYEE;
-- Question 14 
ALTER TABLE LGEMPLOYEE
ADD EMP_HRS INT NOT NULL DEFAULT 10;
select EMP_HRS from LGEMPLOYEE;
-- Question 15 
UPDATE LGBRAND
SET Brand_Type = 'Premium'
WHERE BrandID = 23;
 
 select * from LGBRAND;
