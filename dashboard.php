<?php
// Database connection
$host = 'mysql-evvilly.alwaysdata.net';
$db = 'evvilly_feelback_db';
$user = 'evvilly';
$pass = 'MMUn$Doz48m8';

$conn = new PDO("mysql:host=$host;dbname=$db", $user, $pass);

// Total responses
$total_responses = $conn->query("
    SELECT COUNT(*) 
    FROM questions_has_questionnaires
")->fetchColumn()/3;

if($total_responses==null || 0){
    $avg_delivery_rating = "No Data";
    $avg_parcel_condition_rating = "No Data";
    $avg_courier_behavior_rating = "No Data";
}
else{
// Average delivery rating (assuming question_id = 1 is for delivery time)
$avg_delivery_rating = round($conn->query("
    SELECT AVG(answer) 
    FROM questions_has_questionnaires
    WHERE questions_id = 1
")->fetchColumn(),2);

// Average parcel condition rating (assuming question_id = 2 is for parcel condition)
$avg_parcel_condition_rating = round($conn->query("
    SELECT AVG(answer) 
    FROM questions_has_questionnaires
    WHERE questions_id = 2
")->fetchColumn(),2);

// Average courier behavior rating (assuming question_id = 3 is for courier behavior)
$avg_courier_behavior_rating = round($conn->query("
    SELECT AVG(answer) 
    FROM questions_has_questionnaires
    WHERE questions_id = 3
")->fetchColumn(),2);
}

// Include the dashboard HTML (pass PHP variables to show in the dashboard)
include('dashboard.html');
?>
