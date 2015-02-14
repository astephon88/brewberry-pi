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
$result = mysql_query("SELECT value FROM temps WHERE type='current';");
if (!$result) {    
	die("Query to show fields from table failed");
}
echo mysql_fetch_array($result,MYSQL_NUM)[0];
  

mysql_free_result($result);
?>
