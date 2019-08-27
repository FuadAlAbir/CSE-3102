SHOW DATABASES;
SHOW TABLES;
DESCRIBE <t_name>


CREATE DATABASE test_lab7;
USE test_lab7;


CREATE TABLE Student (stud_no VARCHAR(7) NOT NULL, stud_name VARCHAR(30) NOT NULL, PRIMARY KEY(stud_no));

CREATE TABLE Membership(mem_no VARCHAR(7) NOT NULL, stud_no VARCHAR(7) NOT NULL, PRIMARY KEY (mem_no), CONSTRAINT FK_membershipStudent FOREIGN KEY (stud_no) REFERENCES Student(stud_no));

CREATE TABLE Book(book_no VARCHAR(7) NOT NULL, book_name VARCHAR(50) NOT NULL, author VARCHAR(30) NOT NULL, PRIMARY KEY (book_no));

CREATE TABLE Iss_rec(iss_no INT NOT NULL, iss_date DATE NOT NULL, mem_no VARCHAR(7) NOT NULL, book_no VARCHAR(7) NOT NULL, PRIMARY KEY (iss_no), CONSTRAINT FK_issrecMembership FOREIGN KEY (mem_no) REFERENCES Membership(mem_no), CONSTRAINT FK_issrecBook FOREIGN KEY (book_no) REFERENCES Book(book_no));

ALTER TABLE Student MODIFY COLUMN stud_no CHAR(7); 
/* cant execute before constraint dropping */
/* DROP CONSTRAINT */
ALTER TABLE Membership DROP FOREIGN KEY FK_membershipStudent;
/* add constraint again by altering */
ALTER TABLE Membership ADD CONSTRAINT FK_membershipStudent FOREIGN KEY (stud_no) REFERENCES Student(stud_no);

ALTER TABLE Iss_rec DROP FOREIGN KEY FK_issrecMembership;
ALTER TABLE Iss_rec DROP FOREIGN KEY FK_issrecBook;

ALTER TABLE Membership MODIFY COLUMN mem_no CHAR(7); 
ALTER TABLE Book MODIFY COLUMN book_no CHAR(7); 

ALTER TABLE Iss_rec ADD CONSTRAINT FK_issrecMembership FOREIGN KEY (mem_no) REFERENCES Membership(mem_no);
ALTER TABLE Iss_rec ADD CONSTRAINT FK_issrecBook FOREIGN KEY (book_no) REFERENCES Book(book_no);

/* check all constraints */
SELECT * FROM information_schema.table_constraints where constraint_schema = 'test_lab7';

/* INPUT Tuples */
INSERT INTO Student VALUES ('C033002', 'Sakib Rashid'), ('C043005', 'Nafis Shiekh'), ('C035001', 'Dabirul Islam'), ('C011010','Labid Karim'), ('C051010','Mintu Ghosh');

INSERT INTO Membership VALUES ('M000001', 'C033002'), ('M000002', 'C043005'), ('M000003', 'C035001'), ('M000004', 'C011010'), ('M000005', 'C051010');

INSERT INTO Book VALUES ('1301001', 'Programming with C', 'Byron Gottfried'), ('1301002', 'Teach yourself C', 'Herbert Schildt'), ('1301003', 'Computer Networks', 'Andrew S. Tanenbaum'), ('1301004', 'Introduction to Algorithms', 'Thomas H. Cormen'), ('1301005', 'Discrete mathematics and its applications', 'Kenneth H. Rosen');

INSERT INTO Iss_rec VALUES ('13001', '2013-01-01', 'M000001', '1301002'), ('13002', '2013-01-01', 'M000002', '1301001'), ('13003', '2013-01-01', 'M000004', '1301003'), ('13004', '2013-01-02', 'M000003', '1301004'), ('13005', '2013-01-03', 'M000001', '1301005'), ('13006', '2013-01-03', 'M000002', '1302002');


/* TRIGGER - BOOK LIMIT 3 */
DELIMITER $$
CREATE TRIGGER SET_book_limit BEFORE INSERT ON Iss_rec FOR EACH ROW BEGIN IF (SELECT COUNT(*) FROM Iss_rec WHERE mem_no = New.mem_no) >= 3 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'BOOK LIMIT EXCEDED - ISSUE NOT RECORDED: Highest # of books can be issued against a member is 3.';
END IF; END;
$$
DELIMITER ;

DROP TRIGGER <trigger_name>;

INSERT INTO Iss_rec VALUES ('13007', '2013-01-04', 'M000002', '1302002'); 

INSERT INTO Book VALUES ('1301006', 'Database System Concepts', 'Avi Silberschatz et al'); 
INSERT INTO Book VALUES ('1303006', 'Database System Concepts', 'Avi Silberschatz et al'); 


/* TRIGGER - iss_date: NOW() */
CREATE TRIGGER SET_current_date BEFORE INSERT ON Iss_rec FOR EACH ROW SET New.iss_date = IFNULL(NEW.iss_date, CURDATE());


/* TRIGGER - stud_id: 'C%' */
DELIMITER $$
CREATE TRIGGER SET_studID_C BEFORE INSERT ON Student FOR EACH ROW BEGIN IF LEFT(New.stud_no, 1) NOT LIKE 'C%' THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID FORMAT - stud_id must starts with "C"';
END IF; END;
$$
DELIMITER ;


SELECT * FROM Student WHERE LEFT (stud_no, 3) LIKE 'C03%';


/* TRIGGER LIST */
SHOW TRIGGERS;
SELECT trigger_schema, trigger_name, action_statement FROM information_schema.triggers;

/* TRIGGER - cant issue issuedBook */
DELIMITER $$
CREATE TRIGGER SET_cant_issue_issuedBook BEFORE INSERT ON Iss_rec FOR EACH ROW BEGIN IF (SELECT COUNT(*) FROM Iss_rec WHERE book_no = New.book_no) = 1 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'UNAVAILABLE BOOK - This book is already issued, currently not available';
END IF; END;
$$
DELIMITER ;
