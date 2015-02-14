<?php 
$db_host = 'localhost';
$db_user = 'root';
$db_pwd = 'beermenu';
$database = 'beer';
if (!mysql_connect($db_host, $db_user, $db_pwd))    
	die("Can't connect to database");
if (!mysql_select_db($database))    
	die("Can't select database");

// sending query
$result = mysql_query("SELECT * FROM temps;");
if (!$result) {    
	die("Query to show fields from table failed");
}

while($row = mysql_fetch_assoc($result)){
	$json[]=$row;
}
echo json_encode($json,JSON_NUMERIC_CHECK);
  

mysql_free_result($result);
?>
