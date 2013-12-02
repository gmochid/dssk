<?php

require_once 'lib/database.php';

function returnToMainPage($message) {
	header('Location: index.php?error=' . $message);
}

$link = new PDO(DATABASE_INFO, DATABASE_USERNAME, DATABASE_PASSWORD);

$sql = "SELECT * FROM user WHERE username=?";
$stmt = $link->prepare($sql);

if(!$stmt->execute(array($_POST['username']))) {
    $stmt->closeCursor();
    returnToMainPage("Can't connect to database");
}

$row = $stmt->fetch();

if(!$row) {
	$stmt->closeCursor();
    returnToMainPage("Username not exist");
}

if($row['password'] == md5($_POST['password'])) {
	
} else {
	$stmt->closeCursor();
    returnToMainPage("Password mismatch");
}

?>
