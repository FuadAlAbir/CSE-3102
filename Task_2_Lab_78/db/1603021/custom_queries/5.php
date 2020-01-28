<!Doctype html>
<html>
  <head>
    <link href="../style/style.css" rel="stylesheet" type="text/css" />
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
    <div style="text-align: left; padding: 50px;">
    <?php
      $mysqli = new mysqli('localhost', 'fuad', '1603021', 'test_lab7');


      $stu_no = $mysqli->real_escape_string($_POST['stu_no']);
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
      $mysqli->query($query);
      $mysqli->close();
    ?>
    <button style="font-family: Courier New; font-weight: bold; margin-top: 13px;"><a style="text-decoration: none; color: black;" href='http://localhost/test_lab7/index.php'>Back to Main</a></button>
  </div>
  </body>
</html>
