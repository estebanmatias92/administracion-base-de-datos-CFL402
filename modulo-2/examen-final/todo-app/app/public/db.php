<?php
session_start();

$conn = mysqli_connect(
  'db',
  'user',
  '1234',
  'todoapp'
) or die(mysqli_erro($mysqli));

?>
