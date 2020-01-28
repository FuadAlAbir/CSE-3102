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


      $count = $mysqli->real_escape_string($_POST['count']);
      $query = mysqli_query($con,"SELECT Student.stud_no, stud_name, COUNT(*) AS books_borrowed FROM Student, Membership, Book, Iss_rec WHERE Membership.stud_no = Student.stud_no AND Membership.mem_no = Iss_rec.mem_no AND Book.book_no = Iss_rec.book_no GROUP BY stud_no HAVING COUNT(*) = " . $count);
      echo '<b>stud_no: stud_name: books_borrowed</b><br />';
      while($row = mysqli_fetch_array($query))
      {
        $_row[] = $row;

        $stud_no = $row['stud_no'];
        $stud_name = $row['stud_name'];
        $books_borrowed = $row['books_borrowed'];
        echo $stud_no . ": " . $stud_name . ": " . $books_borrowed . '<br />';
      }

      if($count > 3)
        echo "One can issue atmost 3 books at a time. <br />";
      else if(!$_row)
        echo "None issued " . $count . " books. <br />";

      $mysqli->query($query);
      $mysqli->close();
    ?>
    <button style="font-family: Courier New; font-weight: bold; margin-top: 13px;"><a style="text-decoration: none; color: black;" href='http://localhost/test_lab7/index.php'>Back to Main</a></button>
  </div>
  </body>
</html>
