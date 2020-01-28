<!Doctype html>
<html>
  <head>
    <title>Connecting with database - CSE 3102 - Lab 9</title>
    <link href="style/style.css" rel="stylesheet" type="text/css" />
  </head>

  <body>
    <div id="header">
      <h3>Library Management System</h3>
      <h3>CSE 3102</h3>
      <h3>Lab 9</h3>
    </div>
    <hr>

    <?php
      $con = mysqli_connect('localhost', 'fuad', '1603021', 'test_lab7');

      if($con) echo "<p style='text-align: center; font-family: Courier New'>".'Successfully connected with the database'."</p>";
      else die('Connection Error.');
    ?>
    <div style="text-align: center;">
    <p style="padding-top: 10px;"><b>Select Table:</b></p>
    <!--style="border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 4px 2px; cursor: pointer; background-color: #555555;"-->
    <button style="font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#div_student_table'>Student</a></button>
    <button style="font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#div_mem_table'>Membership</a></button>
    <button style="font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#div_book_table'>Book</a></button>
    <button style="font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#div_iss_rec_table'>Issue Recorded</a></button>
    <br>
    <br>

    <p style="padding-top: 10px;"><b>Insert into Table:</b></p>
    <button style="font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#insert_student'>Student</a></button>
    <button style="font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#insert_membership'>Membership</a></button>
    <button style="font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#insert_book'>Book</a></button>
    <button style="font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#insert_iss_rec'>Issue Recorded</a></button>
    <br>
    <br>

    <p style="padding-top: 10px;"><b>Delete entry from Table:</b></p>
    <button style="font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#delete_student'>Student</a></button>
    <button style="font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#delete_membership'>Membership</a></button>
    <button style="font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#delete_book'>Book</a></button>
    <button style="font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#delete_iss_rec'>Issue Recorded</a></button>
    <br>
    <br>
    <p style="padding-top: 10px;"><b>Special queries asked in LAB:</b></p>
    <a style="text-decoration: none; color: black;" href='#sq_1'>1. List all the student and Book name, Author issued on a specific date.</a> <a style="text-decoration: none; color: black;" href='#cq_1'><b>[Custom Query]</b></a> <br />
    <a style="text-decoration: none; color: black;" href='#sq_2'>2. List the details of students who borrowed book whose author is Tanenbum.</a> <a style="text-decoration: none; color: black;" href='#cq_2'><b>[Custom Query]</b></a> <br />
    <a style="text-decoration: none; color: black;" href='#sq_3'>3. Give a count of how many books have  been borrowed by each student.</a> <br />
    <a style="text-decoration: none; color: black;" href='#sq_4'>4. List the students who reached the borrowed limit 3.</a> <a style="text-decoration: none; color: black;" href='#cq_4'><b>[Custom Query]</b></a> <br />
    <a style="text-decoration: none; color: black;" href='#sq_5'>5. Give a list of books taken by student with stud_no C033002.</a> <a style="text-decoration: none; color: black;" href='#cq_5'><b>[Custom Query]</b></a> <br />
    <a style="text-decoration: none; color: black;" href='#sq_6'>6. List the book details which are issued as of today.</a> <br />
  </div>
    <br>
    <br>

    <div id='div_student_table' style="margin-top: 500px;  padding: 50px; text-align: center;">
      <?php
        $query = mysqli_query($con,"SELECT * FROM Student ORDER BY stud_no ASC");
        echo '<h3>Table: Student</h3>';
        echo '<b>stud_no: stud_name</b><br />';
        while($row = mysqli_fetch_array($query))
        {
          $stud_no = $row['stud_no'];
          $stud_name = $row['stud_name'];
          echo $stud_no . ": " . $stud_name . '<br />';
        }
      ?>
    </div>
    <div style="text-align: center;">
    <button style="font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
    </div>
    <br />
    <br />
    <div id='div_mem_table' style="margin-top: 500px; padding: 50px; text-align: center;">
      <?php
        $query = mysqli_query($con,"SELECT * FROM Membership ORDER BY mem_no ASC");
        echo '<h3>Table: Membership</h3>';
        echo '<b>mem_no: stud_no</b> <br />';
        while($row = mysqli_fetch_array($query))
        {
          $mem_no = $row['mem_no'];
          $stud_no = $row['stud_no'];
          echo $mem_no . ': ' . $stud_no . '<br />';
        }
      ?>
    </div>
    <div style="text-align: center;">
    <button style="font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
    </div>
    <br />
    <br />
    <div id='div_book_table' style="margin-top: 500px;  padding: 50px; text-align: center;">
      <?php
        $query = mysqli_query($con,"SELECT * FROM Book ORDER BY book_no ASC");
        echo '<h3>Table: Book</h3>';
        echo '<b>book_no: book_name: author</b> <br />';
        while($row = mysqli_fetch_array($query))
        {
          $book_no = $row['book_no'];
          $book_name = $row['book_name'];
          $author = $row['author'];
          if (strlen($book_no)) echo $book_no . ': ' . $book_name . ': ' . $author .'<br />';
        }
      ?>
    </div>
    <div style="text-align: center;">
    <button style="font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
    </div>
    <br />
    <br />
    <div id='div_iss_rec_table' style="margin-top: 500px;  padding: 50px; text-align: center;">
      <?php
        $query = mysqli_query($con,"SELECT * FROM Iss_rec ORDER BY iss_date DESC");
        echo '<h3>Table: Iss_rec</h3>';
        echo '<b>iss_no: iss_date: mem_no: book_no</b> <br />';
        while($row = mysqli_fetch_array($query))
        {
          $iss_no = $row['iss_no'];
          $iss_date = $row['iss_date'];
          $mem_no = $row['mem_no'];
          $book_no = $row['book_no'];
          echo $iss_no . ': ' . $iss_date . ': ' . $mem_no . ': ' . $book_no . '<br />';
        }
      ?>
    </div>
    <div style="text-align: center;">
    <button style="font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
    </div>

    <br />
    <br />
    <div id="insert_student" style="margin-top: 500px;  padding: 50px; text-align: center;">
      <form action="./insert/_student.php" method="post">
          <b>Insert into Table: Student</b> <br />
          <div style="padding-top: 5px">stud_no: &nbsp; <input type="text" name = "stud_no" /> <br />
          <div style="padding-top: 5px">stud_name:&nbsp;<input type="text" name = "stud_name" /> <br />
          <div style="padding-top: 13px">
            <button style="font-family: Courier New; font-weight: bold; margin-right: 88px"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
            <input type="submit" />
          </div>
      </form>
    </div>
    <br />
    <br />
    <div id='insert_membership' style="margin-top: 500px;  padding: 50px; text-align: center;">
      <form action="./insert/_membership.php" method="post">
          <b>Insert into Table: Membership</b> <br />
          <div style="padding-top: 5px">mem_no: &nbsp;<input type="text" name = "mem_no" /> <br />
          <div style="padding-top: 5px">stud_no: <input type="text" name = "stud_no" /> <br />
          <div style="padding-top: 13px">
            <button style="font-family: Courier New; font-weight: bold; margin-right: 72px"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
            <input type="submit" />
          </div>
      </form>
    </div>
    <br />
    <br />
    <div id='insert_book' style="margin-top: 500px;  padding: 50px; text-align: center;">
      <form action="./insert/_book.php" method="post">
          <b>Insert into Table: Book</b> <br />
          <div style="padding-top: 5px">book_no: &nbsp; <input type="text" name = "book_no" /> <br />
          <div style="padding-top: 5px">book_name: <input type="text" name = "book_name" /> <br />
          <div style="padding-top: 5px">author:  &nbsp; &nbsp;<input type="text" name = "author" /> <br />
          <div style="padding-top: 13px">
            <button style="font-family: Courier New; font-weight: bold; margin-right: 88px"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
            <input type="submit" />
          </div>
      </form>
    </div>
    <br />
    <br />
    <div id='insert_iss_rec' style="margin-top: 500px; margin-bottom: 420px; padding: 50px; text-align: center;">
      <form action="./insert/_iss_rec.php" method="post">
          <b>Insert into Table: Iss_rec</b> <br />
          <?php
            $month = date('m');
            $day = date('d');
            $year = date('Y');

            $today = $year . '-' . $month . '-' . $day;
          ?>
          <div style="padding-top: 5px">iss_no: &nbsp; <input type="text" name = "iss_no" /> <br />
          <div style="padding-top: 5px">iss_date:&nbsp;<input type="text" value="<?php echo $today; ?>" name = "iss_date" /> <br />
          <div style="padding-top: 5px">mem_no: &nbsp; <input type="text" name = "mem_no" /> <br />
          <div style="padding-top: 5px">book_no: &nbsp;<input type="text" name = "book_no" /> <br />
          <div style="padding-top: 13px">
            <button style="font-family: Courier New; font-weight: bold; margin-right: 80px"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
            <input type="submit" />
          </div>
      </form>
    </div>
    <br />
    <br />
    <div id="delete_student" style="margin-top: 500px;  padding: 50px; text-align: center;">
      <form action="./delete/_student.php" method="post">
          <b>Delete entry from Table: Student</b> <br />
          <div style="padding-top: 5px"> stud_no: &nbsp; <input type="text" name = "stud_no" /> <br />
          <div style="padding-top: 13px">
            <button style="font-family: Courier New; font-weight: bold; margin-right: 88px"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
            <input type="submit" />
          </div>
      </form>
    </div>
    <br />
    <br />
    <div id='delete_membership' style="margin-top: 500px;  padding: 50px; text-align: center;">
      <form action="./delete/_membership.php" method="post">
          <b>Delete entry from Table: Membership</b> <br />
          <div style="padding-top: 5px"> mem_no: &nbsp;<input type="text" name = "mem_no" /> <br />
          <div style="padding-top: 13px">
            <button style="font-family: Courier New; font-weight: bold; margin-right: 72px"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
            <input type="submit" />
          </div>
      </form>
    </div>
    <br />
    <br />
    <div id='delete_book' style="margin-top: 500px;  padding: 50px; text-align: center;">
      <form action="./delete/_book.php" method="post">
          <b>Delete entry from Table: Book</b> <br />
          <div style="padding-top: 5px"> book_no: &nbsp; <input type="text" name = "book_no" /> <br />
          <div style="padding-top: 13px">
            <button style="font-family: Courier New; font-weight: bold; margin-right: 88px"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
            <input type="submit" />
          </div>
      </form>
    </div>
    <br />
    <br />
    <div id='delete_iss_rec' style="margin-top: 500px; padding: 50px; text-align: center;">
      <form action="./delete/_iss_rec.php" method="post">
          <b>Delete entry from Table: Iss_rec</b> <br />
          <div style="padding-top: 5px"> iss_no: &nbsp; <input type="text" name = "iss_no" /> <br />
          <div style="padding-top: 13px">
            <button style="font-family: Courier New; font-weight: bold; margin-right: 80px"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
            <input type="submit" />
          </div>
      </form>
    </div>

    <!--iss_date-->
    <div id='sq_1' style="margin-top: 600px; padding: 50px;">
      <?php
        $query = mysqli_query($con,"SELECT Student.stud_no, stud_name, book_name, author, iss_date FROM Student, Book, Iss_rec, Membership WHERE Membership.stud_no = Student.stud_no AND Membership.mem_no = Iss_rec.mem_no AND Book.book_no = Iss_rec.book_no AND iss_date = '2013-01-01'");
        echo '<b>stud_no: stud_name: book_name: iss_date</b><br />';
        while($row = mysqli_fetch_array($query))
        {
          $stud_no = $row['stud_no'];
          $stud_name = $row['stud_name'];
          $book_name = $row['book_name'];
          $author = $row['author'];
          $iss_date = $row['iss_date'];
          echo $stud_no . ": " . $stud_name . ": " . $book_name . ": " . $iss_date .'<br />';
        }
      ?>
      <button style="margin-top: 5px; margin-bottom: 600px; font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
    </div>
    <!--author-->
    <div id='sq_2' style="margin-top: 600px; padding: 50px;">
    <?php
      $query = mysqli_query($con,"SELECT Student.stud_no, stud_name, book_name, author FROM Student, Membership, Book, Iss_rec WHERE Membership.stud_no = Student.stud_no AND Membership.mem_no = Iss_rec.mem_no AND Book.book_no = Iss_rec.book_no AND author = 'Andrew S. Tanenbaum'");
      echo '<b>stud_no: stud_name: book_name: author</b><br />';
      while($row = mysqli_fetch_array($query))
      {
        $stud_no = $row['stud_no'];
        $stud_name = $row['stud_name'];
        $book_name = $row['book_name'];
        $author = $row['author'];
        echo $stud_no . ": " . $stud_name . ": " . $book_name . ": " . $author .'<br />';
      }
    ?>
    <button style="margin-top: 5px; margin-bottom: 600px; font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
  </div>
    <div id="sq_3" style="margin-top: 600px; padding: 50px;">
    <?php
      $query = mysqli_query($con,"SELECT Student.stud_no, stud_name, COUNT(*) AS books_borrowed FROM Student, Membership, Book, Iss_rec WHERE Membership.stud_no = Student.stud_no AND Membership.mem_no = Iss_rec.mem_no AND Book.book_no = Iss_rec.book_no GROUP BY stud_no");
      echo '<b>stud_no: stud_name: books_borrowed</b><br />';
      while($row = mysqli_fetch_array($query))
      {
        $stud_no = $row['stud_no'];
        $stud_name = $row['stud_name'];
        $books_borrowed = $row['books_borrowed'];
        echo $stud_no . ": " . $stud_name . ": " . $books_borrowed .'<br />';
      }
    ?>
    <button style="margin-top: 5px; margin-bottom: 13px; font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
  </div>
    <!--count-->
    <div id='sq_4' style="margin-top: 600px; padding: 50px;">
      <?php
        $query = mysqli_query($con,"SELECT Student.stud_no, stud_name, COUNT(*) AS books_borrowed FROM Student, Membership, Book, Iss_rec WHERE Membership.stud_no = Student.stud_no AND Membership.mem_no = Iss_rec.mem_no AND Book.book_no = Iss_rec.book_no GROUP BY stud_no HAVING COUNT(*) = 3");
        echo '<b>stud_no: stud_name: books_borrowed</b><br />';
        while($row = mysqli_fetch_array($query))
        {
          $stud_no = $row['stud_no'];
          $stud_name = $row['stud_name'];
          $books_borrowed = $row['books_borrowed'];
          echo $stud_no . ": " . $stud_name . ": " . $books_borrowed . '<br />';
        }
      ?>
      <button style="margin-top: 5px; margin-bottom: 600px; font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
    </div>
    <!--stud_no-->
    <div id='sq_5' style="margin-top: 600px; padding: 50px;">
    <?php
      $stu_no = 'C033002';
      $query = mysqli_query($con,"SELECT Book.book_no, Student.stud_name, Student.stud_no, book_name, author FROM Student, Membership, Book, Iss_rec WHERE Student.stud_no = Membership.stud_no AND Membership.mem_no = Iss_rec.mem_no AND Book.book_no = Iss_rec.book_no AND Student.stud_no = '" . $stu_no . "'");
      echo '<b>book_no: stud_no: stud_name: book_name: author</b><br />';
      while($row = mysqli_fetch_array($query))
      {
        $stud_no = $row['stud_no'];
        $book_no = $row['book_no'];
        $stud_name = $row['stud_name'];
        $book_name = $row['book_name'];
        $author = $row['author'];
        echo $book_no . ": " . $stud_no . ": " . $stud_name . ": " . $book_name . ": " . $author .'<br />';
      }
    ?>
    <button style="margin-top: 5px; margin-bottom: 600px; font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
    </div>
    <!--cur_date - not needed-->
    <div id="sq_6" style="margin-top: 600px; padding: 50px;">
    <?php
      $query = mysqli_query($con,"SELECT Student.stud_no, stud_name, book_name, iss_date FROM Student, Book, Iss_rec, Membership WHERE Membership.stud_no = Student.stud_no AND Membership.mem_no = Iss_rec.mem_no AND Book.book_no = Iss_rec.book_no AND iss_date = CURDATE()");
      echo '<b>stud_no: stud_name: book_name: iss_date</b><br />';
      while($row = mysqli_fetch_array($query))
      {
        $_row[] = $row;
        $stud_no = $row['stud_no'];
        $stud_name = $row['stud_name'];
        $book_name = $row['book_name'];
        $iss_date = $row['iss_date'];
        echo $stud_no . ": " . $stud_name . ": " . $book_name . ": " . $iss_date .'<br />';
      }
      if(!$_row)
        echo "No issue recorded today. <br />";

    ?>
    <button style="margin-top: 5px; margin-bottom: 600px; font-family: Courier New; font-weight: bold;"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
  </div>

  <div id = 'cq_1' style="margin-top: 600px; padding: 50px">
    <form action="./custom_queries/1.php" method="post">
      issue date: &nbsp; <input type="text" name = "issue_date" /> <br />
      <button style="margin-top: 5px; margin-bottom: 13px; font-family: Courier New; font-weight: bold; margin-right: 118px"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
      <input type="submit" />
    </form>
  </div>

  <div id = 'cq_2' style="margin-top: 600px; padding: 50px">
    <form action="./custom_queries/2.php" method="post">
      author: &nbsp; <input type="text" name = "author" /> <br />
      <button style="margin-top: 5px; margin-bottom: 13px; font-family: Courier New; font-weight: bold; margin-right: 80px"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
      <input type="submit" />
    </form>
  </div>

  <div id = 'cq_4' style="margin-top: 600px; padding: 50px">
    <form action="./custom_queries/4.php" method="post">
      count: &nbsp; <input type="text" name = "count" /> <br />
      <button style="margin-top: 5px; margin-bottom: 13px; font-family: Courier New; font-weight: bold; margin-right: 70px"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
      <input type="submit" />
    </form>
  </div>

  <div id = 'cq_5' style="margin-top: 600px; padding: 50px">
    <form action="./custom_queries/5.php" method="post">
      student no.: &nbsp; <input type="text" name = "stu_no" /> <br />
      <button style="margin-top: 5px; margin-bottom: 13px; font-family: Courier New; font-weight: bold; margin-right: 128px"><a style="text-decoration: none; color: black;" href='#header'>Back to Top</a></button>
      <input type="submit" />
    </form>
  </div>

    <hr>
    <p>Made with &hearts; by Fuad Al Abir # 1603021</p>

    <?php
      mysqli_close($con);
    ?>
  </body>
</html>
