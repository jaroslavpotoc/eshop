<?php
// Database connection details
$host = 'localhost';
$db = 'eshop';
$user = 'jaroslavpotocny';
$pass = '';

try {
    // Create a new PDO instance and connect to the database
    $pdo = new PDO("pgsql:host=$host;dbname=$db", $user, $pass);
    
    // Set error reporting to throw exceptions
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    // Output error message if connection fails
    echo "Error: " . $e->getMessage();
}
?>
