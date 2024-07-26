<?php
require_once '../config/database.php'; // Include database connection
require_once '../config/csrf.php'; // Include CSRF token functions

// Validate CSRF token for POST requests
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!validateCsrfToken($_POST['csrf_token'])) {
        echo "Invalid CSRF token";
        exit;
    }
}

// SQL query to calculate the total warehouse value in EUR
$sql = '
    WITH combined AS (
        SELECT
            COALESCE(pa.pid, p.pid) AS pid,
            COALESCE(pa.purchase_price_usd, p.purchase_price_usd) AS purchase_price_usd,
            COALESCE(pa.rate_eur_usd, p.rate_eur_usd) AS rate_eur_usd,
            COALESCE(pa.stock_quantity, p.stock_quantity) AS stock_quantity
        FROM product p
        LEFT JOIN product_attribute pa ON p.pid = pa.pid
        WHERE pa.paid IS NOT NULL AND pa.purchase_price_usd IS NOT NULL AND pa.rate_eur_usd IS NOT NULL AND pa.stock_quantity IS NOT NULL
        UNION
        SELECT
            p.pid,
            p.purchase_price_usd,
            p.rate_eur_usd,
            p.stock_quantity
        FROM product p
        LEFT JOIN product_attribute pa ON p.pid = pa.pid
        WHERE pa.pid IS NULL
    )
    SELECT
        SUM(purchase_price_usd * rate_eur_usd * stock_quantity) AS total_warehouse_value_eur
    FROM combined;
';

try {
    // Prepare and execute SQL query
    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    
    // Format and output the result
    $totalValue = number_format($result['total_warehouse_value_eur'], 2, ',', ' ');
    echo $totalValue . ' €';
} catch (PDOException $e) {
    // Output error message if SQL query fails
    echo "Error: " . $e->getMessage();
}
?>
