<?php
require_once 'csrf.php';

header('Content-Type: text/plain');
echo generateCsrfToken(); // Output the CSRF token
?>
