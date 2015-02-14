<?php 
$db_host = 'localhost';
$db_user = 'root';
$db_pwd = 'beermenu';
$database = 'beer';
$table = 'Beer';
if (!mysql_connect($db_host, $db_user, $db_pwd))    
	die("Can't connect to database");
if (!mysql_select_db($database))    
	die("Can't select database");

// sending query
$result = mysql_query("SELECT * FROM Beer ORDER BY Tap;");
if (!$result) {    
	die("Query to show fields from table failed");
}



$num_rows = mysql_num_rows($result);
echo "{";

for ($i=1; $i <= $num_rows; $i++)
  
{
  $row = mysql_fetch_array($result);
  echo "\"tap" . $row['Tap'] . "\":{";
  echo "\"name\":\"" . $row['name'] . "\",";
  echo "\"brewery\":\"" . $row['brewery'] . "\",";
  echo "\"style\":\"" . $row['style'] . "\",";
  echo "\"abv\":\"" . $row['abv'] . "\",";
  echo "\"ibu\":" . $row['ibu'] . ",";
  echo "\"srm\":" . $row['srm'] . ",";
  echo "\"volume\":" . $row['volume'] . "}";
  if($i != $num_rows){
    echo ",";
  }
}

echo "}";
  

mysql_free_result($result);
?>
