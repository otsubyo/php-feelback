<?php
// Database connection
$host = 'mysql-evvilly.alwaysdata.net';
$db = 'evvilly_feelback_db';
$user = 'evvilly';
$pass = 'MMUn$Doz48m8';

$conn = new PDO("mysql:host=$host;dbname=$db", $user, $pass);

// Create a new order into orders (simulation)
$stmt = $conn->prepare("
    INSERT INTO orders (users_id) VALUES (1);
");
$stmt->execute();

$lastOrderId = $conn->lastInsertId();

// Insert feedback answers into questions_has_questionnaires
$stmt = $conn->prepare("
    INSERT INTO questions_has_questionnaires (questions_id, questionnaires_id, answer, users_id, orders_id)
    VALUES (:questions_id, :questionnaires_id, :answer, :users_id, :orders_id)
");

// Example data: assuming you have question IDs, a questionnaire ID, and user/order context
$questions_id = 1;  // Example for the first question (e.g., "Rate delivery time")
$questionnaires_id = 1;  // Example for a specific questionnaire
$answer = $_POST['delivery_rating'];  // Capture feedback for a question
$users_id = 1;  // Example user ID (normally this would be taken from session or login)

// Bind parameters and execute
$stmt->bindParam(':questions_id', $questions_id);
$stmt->bindParam(':questionnaires_id', $questionnaires_id);
$stmt->bindParam(':answer', $answer);
$stmt->bindParam(':users_id', $users_id);
$stmt->bindParam(':orders_id', $lastOrderId);

$stmt->execute();

// Question 2: Rate parcel condition
$questions_id = 2;
$answer = $_POST['parcel_condition_rating'];
$stmt->bindParam(':questions_id', $questions_id);
$stmt->bindParam(':answer', $answer);
$stmt->execute();

// Question 3: Rate courier behavior
$questions_id = 3;
$answer = $_POST['parcel_condition_rating'];
$stmt->bindParam(':questions_id', $questions_id);
$stmt->bindParam(':answer', $answer);
$stmt->execute();

// Redirect back to homepage or thank-you page
header("Location: index.html");
?>
