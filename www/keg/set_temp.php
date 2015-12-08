<?php 
$db_host = 'localhost';
$db_user = 'root';
$db_pwd = 'beermenu';
$database = 'beer';

$new_set_temp = $_GET['new_set_temp'];

if (!mysql_connect($db_host, $db_user, $db_pwd))    
	die("Can't connect to database");
if (!mysql_select_db($database))    
	die("Can't select database");

$query_format = "UPDATE temps SET value=%s WHERE Type='setting';";
$query = sprintf($query_format,$new_set_temp);


$result = mysql_query($query);
if (!$result) {
	die("Query to show fields from table failed");
}
mysql_free_result($result);

?>
