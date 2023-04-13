<?php

include '../connection.php';

$userEmail = $_POST['user_email'];
if(str_contains($userEmail,'@')){
$sqlQuery = "Select * from users_table where user_email = '$userEmail'";
$resultQuery = $connectNow -> query($sqlQuery);

if($resultQuery-> num_rows > 0){
    //num rows lenght ==1 ---email is already in someone else use ---error
    echo json_encode(array("emailFound"=>true));
}
else{
    //num rows lenght ==0---email is not already in someone else use 
    //user will allowed to signup suc
echo json_encode(array("emailFound"=>false));
}
}