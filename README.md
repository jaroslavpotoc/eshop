# E-shop Warehouse Value Calculation

## Overview

This project calculates the total value of a warehouse in an e-commerce system. It involves fetching and processing data from a MySQL database and displaying the result on a web page with CSRF protection.

## Setup

1. **Clone the Repository:**
    ```bash
    git clone https://github.com/jaroslavpotoc/eshop.git
    ```

2. **Install Dependencies:**
    - Ensure you have Composer installed.
    - Run the following command to install dependencies:
      ```bash
      composer install
      ```

3. **Database Configuration:**
    - Edit the `config/database.php` file to include your MySQL database credentials.

4. **Database Setup:**
    - Import the SQL schema from `sql/queries.sql` into your MySQL database.
    - Example SQL schema:
      ```sql
      CREATE TABLE product (
          pid INT PRIMARY KEY,
          purchase_price_usd DECIMAL(10, 2),
          rate_eur_usd DECIMAL(10, 4),
          stock_quantity INT
      );

      CREATE TABLE product_attribute (
          pid INT,
          purchase_price_usd DECIMAL(10, 2),
          rate_eur_usd DECIMAL(10, 4),
          stock_quantity INT,
          PRIMARY KEY (pid),
          FOREIGN KEY (pid) REFERENCES product(pid)
      );

      INSERT INTO product (pid, purchase_price_usd, rate_eur_usd, stock_quantity) VALUES
      (1, 100.00, 0.90, 10),
      (2, 200.00, 0.85, 5);

      INSERT INTO product_attribute (pid, purchase_price_usd, rate_eur_usd, stock_quantity) VALUES
      (1, 95.00, 0.90, 20),
      (3, 150.00, 0.87, 15);
      ```

5. **CSRF Configuration:**
    - Ensure that the CSRF protection setup is correct. The `config/csrf.php` file handles CSRF tokens.

## Usage

1. **Start the Server:**
    - Use a local server like Apache or Nginx, or run PHP’s built-in server for development:
      ```bash
      php -S localhost:8000 -t public
      ```

2. **Access the Application:**
    - Open `http://localhost:8000/public/index.html` in your web browser.

3. **Fetch Warehouse Value:**
    - Click the "Získať hodnotu skladu" button on the main page to see the calculated total value.

## Expansion

- **Adding New Features:**
  - Update the SQL queries in `sql/queries.sql` as needed.
  - Modify or add new PHP scripts in the `public` directory.

- **Adding More Styles:**
  - Edit `css/styles.css` to add or modify styles.

- **Improving Front-End:**
  - Update `js/script.js` for enhanced client-side functionality.

## Contributing

- Contributions are welcome! Please submit a pull request or report issues.

## License

- This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
