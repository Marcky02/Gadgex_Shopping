<?php

$db_name = 'mysql:host=localhost;dbname=codex';
$user_name = 'root';
$user_password = '';
//$db_name: Specifies the database connection details. It includes the database type (mysql), host (localhost), and the name of the database (shop_db).
//$user_name: Specifies the username used to connect to the MySQL database (root in this case).
//$user_password: Specifies the password used to connect to the MySQL database (an empty string in this case, indicating no password).

$conn = new PDO($db_name, $user_name, $user_password);
/*new PDO(): This creates a new PDO object, which is a PHP extension that provides a uniform method of access to multiple databases.
The three parameters passed to PDO() are:
$db_name: The connection string, which includes the database type, host, and name.
$user_name: The username for the database connection.
$user_password: The password for the database connection.*/

?>

<!--The PDO class is a part of PHP's database access layer that provides a uniform method of access to multiple databases. It is a secure and flexible way to interact with databases.
In this code, a new PDO object is created, representing a connection to the MySQL database specified in the connection details.
If the connection is successful, the $conn variable will hold the PDO connection object, allowing you to perform various database operations using PDO methods.-->