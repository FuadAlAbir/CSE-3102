<!Doctype html>
<html>
  <head>
    <script type="text/javascript">location.href = 'http://localhost/test_lab7/index.php#div_iss_rec_table';</script>
  </head>

  <body>

    <?php
      $username = "fuad";
      $password = "1603021";
      $database = "test_lab7";

      $mysqli = new mysqli("localhost", $username, $password, $database);

      $iss_no = $mysqli->real_escape_string($_POST['iss_no']);
      $query = "DELETE FROM Iss_rec WHERE iss_no = $iss_no";

      $mysqli->query($query);
      $mysqli->close();
      ?>

  </body>
</html>
