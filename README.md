# E-shop Warehouse Value Calculation

## Overview

This project calculates the total value of a warehouse in an e-commerce system. It involves fetching and processing data from a PostgreSQL database and displaying the result on a web page.

## Setup

1. **Clone the Repository:**
    ```bash
    git clone https://your-repository-url.git
    ```

2. **Install Dependencies:**
    - Ensure you have Composer installed.
    - Run the following command to install dependencies:
      ```bash
      composer install
      ```

3. **Database Configuration:**
    - Edit the `config/database.php` file to include your database credentials.

4. **Database Setup:**
    - Import the SQL schema from `sql/queries.sql` into your database.

5. **CSRF Configuration:**
    - Ensure that the CSRF protection setup is correct. The `csrf.php` file handles CSRF tokens.

## Usage

1. **Start the Server:**
    - Use a local server like Apache or Nginx, or run PHP’s built-in server for development:
      ```bash
      php -S localhost:8000 -t public
      ```

2. **Access the Application:**
    - Open `http://localhost:8000` in your web browser.

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
