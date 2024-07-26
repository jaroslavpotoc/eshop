<?php
require_once 'csrf.php'; // Include the CSRF token functions

header('Content-Type: text/plain'); // Set the content type to plain text
echo generateCsrfToken(); // Output the CSRF token
?>
