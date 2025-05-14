-- Create Student Organization Table

CREATE TABLE StudentOrganization_T
             (StudentOrganizationID         NUMERIC(11,0)     NOT NULL,
			  OrganizationName        VARCHAR(25)     NOT NULL,
			  OrganizationDesc        VARCHAR(30),   
CONSTRAINT StudentOrganization_PK PRIMARY KEY (StudentOrganizationID));

--Create Student Organization Student Table 

CREATE TABLE StudentOrganizationStudent_T
             (StudentOrganizationID         NUMERIC(11,0)     NOT NULL,    
			  StudentID          NUMERIC(11,0)    NOT NULL,	
CONSTRAINT StudentOrganizationStudent_PK PRIMARY KEY (StudentOrganizationID,StudentID),
CONSTRAINT StudentOrganizationStudent_FK1 FOREIGN KEY (StudentOrganizationID) REFERENCES StudentOrganization_T(StudentOrganizationID),
CONSTRAINT StudentOrganizationStudent_FK2 FOREIGN KEY (StudentID) REFERENCES Student_T(StudentID));

--Create Student Table

CREATE TABLE Student_T
             (StudentID             NUMERIC(11,0)    NOT NULL,
			  StudentName          VARCHAR(20),
			  StudentDateofBirth           DATE,
			  Gender               CHAR(1),
			  StudentStreetAddress         VARCHAR(30),
			  StudentCity        VARCHAR(25),
			  StudentState        CHAR(2),
			  StudentPostalCode        CHAR(5),
CONSTRAINT Student_PK PRIMARY KEY (StudentID));



--Create Textbook Table

CREATE TABLE Textbook_T
             (ISBNNumber           NUMERIC(20,0)    NOT NULL,
              TextbookTitle       VARCHAR(25),
              TextbookAuthor  VARCHAR(25),
              TextbookSubject       VARCHAR(20),
              TextbookDateofPublication   DATE,	
			  StudentID       NUMERIC(11,0),
CONSTRAINT Textbook_PK PRIMARY KEY (ISBNNumber),
CONSTRAINT Textbook_FK1 FOREIGN KEY (StudentID) REFERENCES Student_T(StudentID));


--Create Course Table

CREATE TABLE Course_T
	         (CourseID             NUMERIC(11,0)   NOT NULL,
              CourseTitle           VARCHAR(20),
              CourseDesc     VARCHAR(30),
			  TEmployeeID     NUMERIC(11,0),
CONSTRAINT Course_PK PRIMARY KEY (CourseID),
CONSTRAINT Course_FK1 FOREIGN KEY (TEmployeeID) REFERENCES Teacher_T(TEmployeeID));


--Create StudentCourse Table

CREATE TABLE StudentCourse_T
             (StudentID           NUMERIC(11,0)    NOT NULL,
              CourseID       NUMERIC(11,0)     NOT NULL,
              EnrollmentDate  DATE,      
CONSTRAINT StudentCourse_PK PRIMARY KEY (StudentID, CourseID),
CONSTRAINT StudentCourse_FK1 FOREIGN KEY (StudentID) REFERENCES Student_T(StudentID),
CONSTRAINT StudentCourse_FK2 FOREIGN KEY (CourseID) REFERENCES Course_T(CourseID));


--Create Supply Table 

CREATE TABLE Supply_T
             (StudentID        NUMERIC(11,0)     NOT NULL,
			  TEmployeeID        NUMERIC(11,0)     NOT NULL,
	          CourseID     NUMERIC(11,0),
			  SupplyDesc     VARCHAR(30),
			  SupplyCategory     VARCHAR(30),
CONSTRAINT Supply_PK PRIMARY KEY (StudentID, TEmployeeID, CourseID),
CONSTRAINT Supply_FK1 FOREIGN KEY (StudentID) REFERENCES Student_T(StudentID),
CONSTRAINT Supply_FK2 FOREIGN KEY (TEmployeeID) REFERENCES Teacher_T(TEmployeeID),
CONSTRAINT Supply_FK3 FOREIGN KEY (CourseID) REFERENCES Course_T(CourseID));


--Create Teacher Table

CREATE TABLE Teacher_T
             (TEmployeeID         NUMERIC(11,0)     NOT NULL,
			  StudentOrganizationID         NUMERIC(11,0),
CONSTRAINT Teacher_PK PRIMARY KEY (TEMployeeID),
CONSTRAINT Teacher_FK1 FOREIGN KEY (StudentOrganizationID) REFERENCES StudentOrganization_T(StudentOrganizationID),
CONSTRAINT Teacher_FK2 FOREIGN KEY (TEmployeeID) REFERENCES Employee_T(EmployeeID));


--Create Skill Table 

CREATE TABLE Skill_T
             (TEmployeeID         NUMERIC(11,0)     NOT NULL,
			 Skill       VARCHAR(25)     NOT NULL,
CONSTRAINT Skill_PK PRIMARY KEY (Skill, TEmployeeID),
CONSTRAINT Skill_FK FOREIGN KEY (TEmployeeID) REFERENCES Teacher_T(TEmployeeID));



--Create Employee Table 

CREATE TABLE Employee_T
             (EmployeeID         NUMERIC(11,0)     NOT NULL,
			  EmployeeName        VARCHAR(25)     NOT NULL,
	          EmployeeDateofHire     DATE,
			  EmployeeType     VARCHAR(15),
			  ManagerID      NUMERIC(11,0),
CONSTRAINT Employee_PK PRIMARY KEY (EmployeeID),
CONSTRAINT Employee_FK1 FOREIGN KEY (ManagerID) REFERENCES Employee_T(EmployeeID));


--Create Office Staff Table 

CREATE TABLE OfficeStaff_T
             (OEmployeeID         NUMERIC(11,0)     NOT NULL,
			  Duty        VARCHAR(25)     NOT NULL,
CONSTRAINT OfficeStaff_PK PRIMARY KEY (OEmployeeID),
CONSTRAINT OfficeStaff_FK FOREIGN KEY (OEmployeeID) REFERENCES Employee_T(EmployeeID));


--Create Parent Table 

CREATE TABLE Parent_T
             (ParentID        NUMERIC(11,0)     NOT NULL,
	          ParentName     VARCHAR(30),
			  ParentOccupation     VARCHAR(30),
CONSTRAINT Parent_PK PRIMARY KEY (ParentID));

--Create Parent Student Table 

CREATE TABLE ParentStudent_T
             (ParentID        NUMERIC(11,0)     NOT NULL,
			  StudentID        NUMERIC(11,0)     NOT NULL,
CONSTRAINT ParentStudent_PK PRIMARY KEY (ParentID, StudentID),
CONSTRAINT ParentStudent_FK1 FOREIGN KEY (ParentID) REFERENCES Parent_T(ParentID),
CONSTRAINT ParentStudent_FK2 FOREIGN KEY (StudentID) REFERENCES Student_T(StudentID));

--Create Bill Table 

CREATE TABLE Bill_T
             (BillID       NUMERIC(11,0)     NOT NULL,
			  ParentID        NUMERIC(11,0)     NOT NULL,
	          BillDate     DATE,
			  BilAmount     NUMERIC(5,0),
CONSTRAINT Bill_PK PRIMARY KEY (BillID),
CONSTRAINT Bill_FK1 FOREIGN KEY (ParentID) REFERENCES Parent_T(ParentID));



--Create Principal Table 

CREATE TABLE Principal_T
             (PEmployeeID        NUMERIC(11,0)     NOT NULL,
CONSTRAINT Principal_PK PRIMARY KEY (PEmployeeID),
CONSTRAINT Principal_FK FOREIGN KEY (PEmployeeID) REFERENCES Employee_T(EmployeeID));


--Create Student Textbook Table 

CREATE TABLE StudentTextbook_T
             (StudentID        NUMERIC(11,0)     NOT NULL,
			  ISBNNumber        NUMERIC(20,0)     NOT NULL,
	          CheckinDate     DATE,
			  CheckoutDate      DATE,
CONSTRAINT StudentTextbook_PK PRIMARY KEY (StudentID, ISBNNumber),
CONSTRAINT StudentTextbook_FK1 FOREIGN KEY (StudentID) REFERENCES Student_T(StudentID),
CONSTRAINT StudentTextbook_FK2 FOREIGN KEY (ISBNNumber) REFERENCES Textbook_T(ISBNNumber));


-------------------------------------------------------------------------------------------



-- Insert into Student Organization Table (all values inserted)

INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11111, 'Club Basketball', 'Students Play Basketball');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11112, 'Chess', 'Lunchtime Club');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11113, 'DECA', 'Student Business Org');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11114, 'FBLA', 'Future Business Students');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11115, 'Badminton', 'Students Play Badminton');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11116, 'HOSA', 'Medical Organization');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11117, 'Interact', 'Community Service');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11118, 'Unicef', 'Charity');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11119, 'Club Soccer', 'Students Play Soccer');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11120, 'Checkers', 'Lunchtime Club');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11121, 'Engineering Club', 'Lunchtime Club');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11122, 'Spanish Club', 'Lunchtime Club');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11123, 'Club Football', 'Students Play Football');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11124, 'Art Club', 'Art and Crafts');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11125, 'Dog Club', 'Look at dog pics');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11126, 'Club Ping Pong', 'Students Play Ping Pong');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11127, 'Rap Club', 'Students discuss rap music');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11128, 'Chinese Yo-yo', 'Students practice yo-yo');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11129, 'German Club', 'Lunchtime Club');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11130, 'Nests for Nets', 'Charity');
INSERT INTO StudentOrganization_T  (StudentOrganizationID, OrganizationName, OrganizationDesc)
VALUES  (11131, 'Cooking Club', 'Students cook');

-- Insert into Student Organization Student Table (all values inserted)

INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11111, 110);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11112, 110);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11112, 111);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11112, 112);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11113, 112);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11114, 113);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11115, 114);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11116, 115);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11117, 116);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11117, 117);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11118, 117);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11119, 119);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11120, 120);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11120, 121);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11121, 121);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11122, 122);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11123, 123);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11123, 124);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11124, 125);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11125, 126);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11125, 127);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11126, 127);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11127, 128);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11128, 129);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11129, 129);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11130, 129);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11130, 120);
INSERT INTO StudentOrganizationStudent_T  (StudentOrganizationID, StudentID)
VALUES  (11131, 120);


--Insert into Student Table (all values inserted)

INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (110,'Alex Smith', '21/Oct/03', 'M', '25 Point Pkwy','San Ramon','CA', 94588);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (111,'Robbie Shepard', '05/Nov/03', 'M', '27 Hacienda Dr.','Pleasanton','CA', 94568);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (112,'Alexis McKinsey', '07/May/02', 'F', '46 Bolliger Canyon','Dublin','CA', 94560);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (113,'Patrick Shim', '18/Dec/04', 'M', '78 Gibraltar Dr.','Dublin','CA', 94588);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (114,'Julia Lee', '13/Sep/03', 'F', '3899 Lane Ct.','Dublin','CA', 94588);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (115,'Sophia Poierer', '09/Jun/03', 'F', '739 Port Lane','Dublin','CA', 94568);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (116,'Krish Patel', '21/Feb/04', 'M', '67 Hopyard','Pleasanton','CA', 94545);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (117,'Sal Uzman', '19/Jul/032', 'M', '89 Main Street','Dublin','CA', 94568);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (118,'Juan Garza', '21/Apr/03', 'M', '34 Fire Circle','Pleasanton','CA', 94588);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (119,'Carmen Lopez', '29/Mar/02', 'F', '56 Corona Ct.','Dublin','CA', 94560);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (120,'Ariana Grande', '25/May/02', 'F', '46 Udemy Way','Dublin','CA', 94588);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (121,'Winnie Hwin', '25/Jul/03', 'M', '5133 Genovesio Dr.','San Ramon','CA', 94588);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (122,'Praveen Ravisankar', '26/Aug/03', 'F', '23 W. Park Ave.','Pleasanton','CA', 94500);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (123,'David Long', '20/Aug/03', 'M', '3409 Stoneridge Dr.','Pleasanton','CA', 94588);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (124,'Hoor Harden', '01/Dec/03', 'F', '90 Denker Way','San Ramon','CA', 94590);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (125,'Mark Cuban', '14/Nov/03', 'M', '5721 Belleza Ct','Dublin','CA', 94588);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (126,'Grace Kim', '17/May/03', 'F', '9229 Sara Ann Ct.','Pleasanton','CA', 94534);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (127,'Aayush Kukadia', '21/Apr/03', 'M', '89 Supple Way','Dublin','CA', 94588);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (128,'Abhi Nitharwal', '24/Mar/03', 'M', '90 Beach Street','Pleasanton','CA', 94556);
INSERT INTO Student_T  (StudentID, StudentName, StudentDateofBirth, Gender, StudentStreetAddress, StudentCity, StudentState, StudentPostalCode)
VALUES  (129,'Rebecca Dave', '18/May/02', 'F', '224 Bollinger Canyon Rd.','San Ramon','CA', 94567);


--Insert into Textbook Table (all values added)

INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1111, 'Intro to Calculus', 'Robert Hanes', 'Math', '01/Dec/99', 110);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1112, 'World History', 'Ian Dior', 'History', '19/May/01', 110);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1113, 'Biology', 'Pam Mitra', 'Science', '23/Jun/04', 111);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1114, 'Chemistry Principles', 'Chris Jones', 'Science', '30/Dec/98', 112);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1115, 'Intro to Calculus', 'Robert Hanes', 'Math', '01/Dec/99', 113);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1116, 'World History', 'Ian Dior', 'History', '19/May/01', 114);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1117, 'Biology', 'Pam Mitra', 'Science', '23/Jun/04', 115);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1118, 'Chemistry Principles', 'Chris Jones', 'Science', '30/Dec/98', 116);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1119, 'Intro to Calculus', 'Robert Hanes', 'Math', '01/Dec/99', 117);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1120, 'World History', 'Ian Dior', 'History', '19/May/01', 118);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1121, 'Biology', 'Pam Mitra', 'Science', '23/Jun/04', 119);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1122, 'Chemistry Principles', 'Chris Jones', 'Science', '30/Dec/98', 120);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1123, 'Intro to Calculus', 'Robert Hanes', 'Math', '01/Dec/99', 121);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1124, 'World History', 'Ian Dior', 'History', '19/May/01', 122);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1125, 'Biology', 'Pam Mitra', 'Science', '23/Jun/04', 123);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1126, 'Chemistry Principles', 'Chris Jones', 'Science', '30/Dec/98', 124);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1127, 'Intro to Calculus', 'Robert Hanes', 'Math', '01/Dec/99', 125);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1128, 'World History', 'Ian Dior', 'History', '19/May/01', 126);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1129, 'Biology', 'Pam Mitra', 'Science', '23/Jun/04', 127);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1130, 'Chemistry Principles', 'Chris Jones', 'Science', '30/Dec/98', 128);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1131, 'Chemistry Principles', 'Chris Jones', 'Science', '30/Dec/98', 129);
INSERT INTO Textbook_T  (ISBNNumber, TextbookTitle, TextbookAuthor, TextbookSubject, TextbookDateofPublication, StudentID)
VALUES  (1132, 'Biology', 'Pam Mitra', 'Science', '23/Jun/04', 129);


--Insert into Course Table (all values added)

INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111111, 'AP World History','Evolution of the World', 10 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111112, 'AP US History','Colonial to Present Day US', 10 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111113, 'Calculus','Calculus Fundamentals', 11 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111114, 'Music Thoery','Study of different music types', 12 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111115, 'Algebra','Evolution of the World', 11 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111116, 'Ochestra','Learn instruments', 12 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111117, 'English','Writing/Reading Concept', 13 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111118, 'AP English','Advanced English', 13 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111119, 'Spanish','Lang/culture of Mexico', 14 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111120, 'French','Lang/Culture of France', 14 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111121, 'Computer Science','Programming', 15 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111122, 'AP Comp Sci','Adv Programming', 15 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111123, 'Statisitcs','Statistical Analysis', 16 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111124, 'Pre-Calc','Inro to Calculus', 16 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111125, 'AP Calculus','Advanced Calculus', 17 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111126, 'AP Literature','Advanced Literature', 17 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111127, 'Physical Education','Be Active', 18 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111128, 'WeightLifting','Life Weights', 18 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111129, 'Social Studeies','Huamn Social Behavior', 19 );
INSERT INTO Course_T  (CourseID, CourseTitle, CourseDesc, TEmployeeID )
VALUES  (111130, 'Psychology','Human Interation ', 19 );



--Insert into Student Course Table (all values added)

INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (110, 111111,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (110, 111112,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (111, 111112,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (111, 111113,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (112, 111113,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (112, 111114,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (113, 111114,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (113, 111115,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (114, 111115,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (114, 111116,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (115, 111116,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (115, 111117,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (116, 111117,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (116, 111118,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (117, 111118,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (117, 111119,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (118, 111119,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (119, 111120,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (120, 111121,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (120, 111122,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (121, 111123,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (122, 111124,'03/Jan/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (122, 111124,'03/Sep/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (123, 111125,'03/Sep/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (124, 111125,'03/Sep/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (124, 111126,'03/Sep/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (125, 111126,'03/Sep/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (126, 111127,'03/Sep/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (127, 111126,'03/Sep/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID,EnrollmentDate )
VALUES  (128, 111127,'03/Sep/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (129, 111128,'03/Sep/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (129, 111129,'03/Sep/20');
INSERT INTO StudentCourse_T  (StudentID, CourseID, EnrollmentDate )
VALUES  (129, 111130,'03/Sep/20');


--Insert into Supply Table

INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (110, 10, 111111, 'Scissors', 'Arts');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (110, 10, 111112, 'Computer', 'Electronics');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (111, 10, 111112, 'Computer', 'Electronics');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (111, 11, 111113, 'Calculator', 'Electronics');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (112, 11, 111113, 'Triangle', 'Instrument');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (112, 12, 111114, 'Trumbone', 'Instrument');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (113, 12, 111114, 'Guitar', 'Instrument');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (113, 11, 111115, 'Drum', 'Instrument');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (114, 11, 111115, 'Trumbone', 'Instrument');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (114, 12, 111116, 'Guitar', 'Instrument');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (115, 12, 111116, 'Calculator', 'Electronics');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (115, 13, 111117, 'Pencil', 'Writing');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (116, 13, 111117, 'Guitar', 'Instrument');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (116, 13, 111118, 'Trumbone', 'Instrument');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (117, 13, 111118, 'Pencil', 'Writing');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (117, 14, 111119, 'BookMark', 'Reading');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (118, 14, 111119, 'Book Cover', 'Reading');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (119, 14, 111120, 'Pencil', 'Writing');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (120, 15, 111121, 'BookMark', 'Reading');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (120, 15, 111122, 'Book Cover', 'Reading');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (121, 16, 111123, 'Pencil', 'Writing');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (122, 16, 111124, 'Sombrero', 'Spanish');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (123, 17, 111125, 'Computer', 'Electronics');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (124, 17, 111125, 'Baguette', 'French');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (124, 17, 111126, 'Mouse', 'Electronics');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (125, 17, 111126, 'Computer', 'Electronics');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (126, 18, 111127, 'KeyBoard', 'Electronics');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (127, 17, 111126, 'Calculator', 'Electronics');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (128, 18, 111127, 'Computer', 'Electronics');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (129, 19, 111129, 'Pencil', 'Writing');
INSERT INTO Supply_T  (StudentID, TEmployeeID, CourseID, SupplyDesc, SupplyCategory)
VALUES  (129, 19, 111130, 'Computer', 'Electronics');

--Insert into Teacher Table (all values inserted)

INSERT INTO Teacher_T  (TEmployeeID, StudentOrganizationID)
VALUES  (10, 11111);
INSERT INTO Teacher_T  (TEmployeeID, StudentOrganizationID)
VALUES  (11, 11112);
INSERT INTO Teacher_T  (TEmployeeID, StudentOrganizationID)
VALUES  (12, 11113);
INSERT INTO Teacher_T  (TEmployeeID, StudentOrganizationID)
VALUES  (13, 11114);
INSERT INTO Teacher_T  (TEmployeeID, StudentOrganizationID)
VALUES  (14, 11115);
INSERT INTO Teacher_T  (TEmployeeID, StudentOrganizationID)
VALUES  (15, 11116);
INSERT INTO Teacher_T  (TEmployeeID, StudentOrganizationID)
VALUES  (16, 11117);
INSERT INTO Teacher_T  (TEmployeeID, StudentOrganizationID)
VALUES  (17, 11118);
INSERT INTO Teacher_T  (TEmployeeID, StudentOrganizationID)
VALUES  (18, 11119);
INSERT INTO Teacher_T  (TEmployeeID, StudentOrganizationID)
VALUES  (19, 11120);




--Insert into Skill Table (all values inserted)

INSERT INTO Skill_T  (Skill,TEmployeeID)
VALUES  ('History',10);
INSERT INTO Skill_T  (Skill,TEmployeeID)
VALUES  ('Special Needs',10);
INSERT INTO Skill_T  (Skill,TEmployeeID)
VALUES  ('Math',11);
INSERT INTO Skill_T  (Skill,TEmployeeID)
VALUES  ('Guitar',12);
INSERT INTO Skill_T  (Skill,TEmployeeID)
VALUES  ('Trumbone',12);
INSERT INTO Skill_T  (Skill,TEmployeeID)
VALUES  ('Triangle',12);
INSERT INTO Skill_T  (Skill,TEmployeeID)
VALUES  ('English',13);
INSERT INTO Skill_T  (Skill,TEmployeeID)
VALUES  ('Spanish',14);
INSERT INTO Skill_T  (Skill,TEmployeeID)
VALUES  ('French',14);
INSERT INTO Skill_T  (Skill,TEmployeeID)
VALUES  ('Programming',15);
INSERT INTO Skill_T  (Skill,TEmployeeID)
VALUES  ('Data Analysis',15);
INSERT INTO Skill_T  (Skill,TEmployeeID)
VALUES  ('Math',16);
INSERT INTO Skill_T  (Skill,TEmployeeID)
VALUES  ('Lit. Analysis',17);
INSERT INTO Skill_T  (Skill,TEmployeeID)
VALUES  ('Physical Trainer',18);
INSERT INTO Skill_T  (Skill,TEmployeeID)
VALUES  ('Psychology',19);
INSERT INTO Skill_T  (Skill,TEmployeeID)
VALUES  ('Human Behavior',19);


-- Insert into Employee Table (all values inserted)

INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (00, 'Hannah Ihsen', '30/Aug/11', 'P', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (01, 'Richard Grabowski', '01/Apr/12', 'P', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (02, 'Callie Jones', '24/Oct/12', 'P', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (03, 'Sarah Wong', '07/Feb/14', 'P', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (04, 'Jenniffer Simons', '09/Mar/16', 'P', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (05, 'Mary Enes', '31/May/19', 'P', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (06, 'Chris Konte', '12/Dec/15', 'P', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (07, 'Prakash Swartz', '11/Nov/14', 'P', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (08, 'Matthew Perez', '15/Jun/13', 'P', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType)
VALUES  (09, 'Dan Sullivan', '01/Sep/10', 'P');
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (10, 'Carly Jones', '01/Mar/16', 'T', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (11, 'Heather Fleming', '01/Jun/12', 'T', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (12, 'Robert Jones', '01/Jan/11', 'T', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (13, 'Tami Raaker', '01/Feb/11', 'T', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (14, 'Charlie Richie', '01/Oct/17', 'T', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (15, 'Rita Smih', '01/Sep/19', 'T', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (16, 'Aalaap Patel', '01/Sep/19', 'T', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (17, 'Noah Beck', '01/May/19', 'T', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (18, 'Micheal Mohr', '01/May/10', 'T', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (19, 'William Wang', '01/Sep/16', 'T', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (20, 'Megan Sam', '01/Dec/20', 'O', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (21, 'Billy Bob', '01/Nov/17', 'O', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (22, 'Veronica Lopez', '01/Jul/15', 'O', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (23, 'Sam Jackson', '01/Apr/12', 'O', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (24, 'Gary Lane', '01/Sep/09', 'O', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (25, 'Thomas Emmanuel III', '01/Sep/07', 'O', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (26, 'Xaver Wulf', '01/Sep/14', 'O', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (27, 'Juan Garcia', '01/Aug/18', 'O', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (28, 'Christine Kelly', '01/Apr/16', 'O', 09);
INSERT INTO Employee_T  (EmployeeID, EmployeeName, EmployeeDateofHire, EmployeeType, ManagerID)
VALUES  (29, 'Jessica Powers', '01/Aug/17', 'O', 09);



--Insert into OEmployee Table (all values added)

INSERT INTO OfficeStaff_T  (OEmployeeID, Duty)
VALUES  (20, 'Counseling');
INSERT INTO OfficeStaff_T  (OEmployeeID, Duty)
VALUES  (21, 'Administrator');
INSERT INTO OfficeStaff_T  (OEmployeeID, Duty)
VALUES  (22, 'Advisor');
INSERT INTO OfficeStaff_T  (OEmployeeID, Duty)
VALUES  (23, 'Counseling');
INSERT INTO OfficeStaff_T  (OEmployeeID, Duty)
VALUES  (24, 'Administrator');
INSERT INTO OfficeStaff_T  (OEmployeeID, Duty)
VALUES  (25, 'Advisor');
INSERT INTO OfficeStaff_T  (OEmployeeID, Duty)
VALUES  (26, 'Counseling');
INSERT INTO OfficeStaff_T  (OEmployeeID, Duty)
VALUES  (27, 'Administrator');
INSERT INTO OfficeStaff_T  (OEmployeeID, Duty)
VALUES  (28, 'Advisor');
INSERT INTO OfficeStaff_T  (OEmployeeID, Duty)
VALUES  (29, 'Counseling');



--Insert into Parent Table (all values inserted)

INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111110, 'Michael Scott', 'Paper Salesman');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111111, 'Diane Sawyers', 'Doctor');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111112,  'Grace Lee', 'Janitor');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111113, 'Alexander Tolari', 'Consultant');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111114, 'Mason Stern', 'Consultant');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111115, 'Ethan Russo', 'Pilot');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111116, 'Daniel Jack', 'Chef');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111117, 'Mateo Brown', 'Product Manager');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111118, 'Jack Monroe', 'IT Specialist');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111119, 'Levi Strauss', 'Engineer');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111120, 'Jeff Bezos', 'CEO');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111121, 'Leo Spade', 'Accountant');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111122, 'Stacy Johnson', 'Accountant');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111123, 'Alyssa Barbers', 'Farmer');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111124, 'Nolan Kurt', 'Snowman');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111125, 'Leonardo Long', 'Actor');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111126, 'Abby Mckeag', 'Chef');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111127, 'Ananya Kapadia', 'Business Analyst');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111128, 'Alina Das', 'CFO');
INSERT INTO Parent_T  (ParentID, ParentName, ParentOccupation)
VALUES  (11111129, 'Deb Band', 'Marine');

--Insert into Parent Student Table (all values inserted)

INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111110, 110);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111111, 111);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111112, 112);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111113, 113);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111114, 114);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111115, 115);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111116, 116);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111117, 117);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111118, 118);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111119, 119);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111120, 120);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111121, 121);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111122, 122);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111123, 123);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111124, 124);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111125, 125);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111126, 126);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111127, 127);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111128, 128);
INSERT INTO ParentStudent_T  (ParentID, StudentID)
VALUES  (11111129, 129);

--Insert into Bill Table (all values inserted)

INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111111, 11111110, '01/Jan/20', 0);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111112, 11111111, '01/Jan/20', 52000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111113, 11111112, '01/Jan/20', 10000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111114, 11111113, '01/Jan/20', 5000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111115, 11111114, '01/Jan/20', 26000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111116, 11111115, '01/Jan/20', 26000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111117, 11111116, '01/Jan/20', 52000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111118, 11111117, '01/Jan/20', 20000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111119, 11111118, '01/Jan/20', 35000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111120, 11111119, '01/Jan/20', 45000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111121, 11111120, '01/Jan/20', 9000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111122, 11111121, '01/Jan/20', 15000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111123, 11111122, '01/Jan/20', 26000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111124, 11111123, '01/Jan/20', 50000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111125, 11111124, '01/Jan/20', 4000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111126, 11111125, '01/Jan/20', 6000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111127, 11111126, '01/Jan/20', 52000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111128, 11111127, '01/Jan/20', 26000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111129, 11111128, '01/Jan/20', 26000);
INSERT INTO Bill_T  (BillID, ParentID, BillDate, BilAmount)
VALUES  (1111130, 11111129, '01/Jan/20', 26000);



--Insert into Principal Table (all values added)

INSERT INTO Principal_T  (PEmployeeID)
VALUES  (00);
INSERT INTO Principal_T  (PEmployeeID)
VALUES  (01);
INSERT INTO Principal_T  (PEmployeeID)
VALUES  (02);
INSERT INTO Principal_T  (PEmployeeID)
VALUES  (03);
INSERT INTO Principal_T  (PEmployeeID)
VALUES  (04);
INSERT INTO Principal_T  (PEmployeeID)
VALUES  (05);
INSERT INTO Principal_T  (PEmployeeID)
VALUES  (06);
INSERT INTO Principal_T  (PEmployeeID)
VALUES  (07);
INSERT INTO Principal_T  (PEmployeeID)
VALUES  (08);
INSERT INTO Principal_T  (PEmployeeID)
VALUES  (09);



-- Insert into Student Textbook Table (all values inserted)
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (110, 1111, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (110, 1112, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (111, 1113, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (112, 1114, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (113, 1115, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (114, 1116, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (115, 1117, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (116, 1118, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (117, 1119, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (118, 1120, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (119, 1121, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (120, 1122, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (121, 1123, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (122, 1124, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (123, 1125, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (124, 1126, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (125, 1127, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (126, 1128, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (127, 1129, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (128, 1130, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (129, 1131, '31/Dec/20', '01/Jan/20');
INSERT INTO StudentTextbook_T  (StudentID, ISBNNumber, CheckinDate, CheckoutDate)
VALUES  (129, 1132, '31/Dec/20', '01/Jan/20');













