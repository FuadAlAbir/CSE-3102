<!Doctype html>
<html>
  <head>
    <script type="text/javascript">location.href = 'http://localhost/test_lab7/index.php#div_mem_table';</script>
  </head>

  <body>

    <?php
      $username = "fuad";
      $password = "1603021";
      $database = "test_lab7";

      $mysqli = new mysqli("localhost", $username, $password, $database);

      $mem_no = $mysqli->real_escape_string($_POST['mem_no']);
      $query = "DELETE FROM Membership WHERE mem_no = '$mem_no'";

      $mysqli->query($query);
      $mysqli->close();
      ?>

  </body>
</html>
