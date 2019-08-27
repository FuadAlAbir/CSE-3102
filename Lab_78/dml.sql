/* 3 */
SELECT Student.stud_no, stud_name, book_name, author FROM Student, Book, Iss_rec, Membership WHERE Membership.stud_no = Student.stud_no AND Membership.mem_no = Iss_rec.mem_no AND Book.book_no = Iss_rec.book_no AND iss_date = '2013-01-01';

/* 4 */
SELECT Student.stud_no, stud_name FROM Student, Membership, Book, Iss_rec WHERE Membership.stud_no = Student.stud_no AND Membership.mem_no = Iss_rec.mem_no AND Book.book_no = Iss_rec.book_no AND author = 'Andrew S. Tanenbaum';

/* 5 */
SELECT Student.stud_no, stud_name, COUNT(*) AS books_borrowed FROM Student, Membership, Book, Iss_rec WHERE Membership.stud_no = Student.stud_no AND Membership.mem_no = Iss_rec.mem_no AND Book.book_no = Iss_rec.book_no GROUP BY stud_no;

/* 6 */
SELECT Student.stud_no, stud_name, COUNT(*) AS books_borrowed FROM Student, Membership, Book, Iss_rec WHERE Membership.stud_no = Student.stud_no AND Membership.mem_no = Iss_rec.mem_no AND Book.book_no = Iss_rec.book_no GROUP BY stud_no HAVING COUNT(*) = 3;

/* 7 */
SELECT Book.book_no, book_name, author FROM Student, Membership, Book, Iss_rec WHERE Student.stud_no = 'C033002' AND Student.stud_no = Membership.stud_no AND Membership.mem_no = Iss_rec.mem_no AND Book.book_no = Iss_rec.book_no;

/* 8 */
SELECT Student.stud_no, stud_name, book_name, author FROM Student, Book, Iss_rec, Membership WHERE Membership.stud_no = Student.stud_no AND Membership.mem_no = Iss_rec.mem_no AND Book.book_no = Iss_rec.book_no AND iss_date = CURDATE();
