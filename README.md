# Laravel E-Commerce API (Backend)

This is a robust backend for an E-Commerce application built with Laravel. It features a complete database schema, authentication, and product management.
<p align="center">
  <table border="0">
    <tr>
      <td><img src="https://github.com/joyal777/laravel-ecommerce/blob/main/public/Screenshot%202026-01-13%20204132.png?raw=true" width="200"></td>
      <td><img src="https://github.com/joyal777/laravel-ecommerce/blob/main/public/Screenshot%202026-01-13%20194626.png?raw=true" width="200"></td>
      <td><img src="https://github.com/joyal777/laravel-ecommerce/blob/main/public/Screenshot%202026-01-13%20194650.png?raw=true" width="200"></td>
      <td><img src="https://github.com/joyal777/laravel-ecommerce/blob/main/public/Screenshot%202026-01-13%20194843.png?raw=true" width="200"></td>
      <td><img src="https://github.com/joyal777/laravel-ecommerce/blob/main/public/Screenshot%202026-01-13%20194903.png?raw=true" width="200"></td>
      <td><img src="https://github.com/joyal777/laravel-ecommerce/blob/main/public/Screenshot%202026-01-13%20204025.png?raw=true" width="200"></td>
      <td><img src="https://github.com/joyal777/laravel-ecommerce/blob/main/public/Screenshot%202026-01-13%20204050.png?raw=true" width="200"></td>
      <td><img src="https://github.com/joyal777/laravel-ecommerce/blob/main/public/Screenshot%202026-01-13%20203727.png?raw=true" width="200"></td>
    </tr>
  </table>
</p>

## 🚀 Features
* **Database Management:** Includes a pre-built `.sql` dump and Laravel Migrations/Seeders.
* **Product Architecture:** Supports Categories, Products, and Orders.
* **Authentication:** Built-in API authentication.
* **Factories:** Realistic dummy data generation for testing.

---

## 🛠 Installation

Follow these steps to get your development environment running:

1. **Clone the repository**
   ```bash
   git clone <https://github.com/joyal777/laravel-ecommerce.git>
   cd <laravel-ecommerce>
2. **Install Dependencies**
   ```bash
   composer install
   npm install
3. **Environment Setup**
   ```bash
   cp .env.example .env
   php artisan key:generate
4. **Database config**
   ```bash
    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=laravel-ecommerce
    DB_USERNAME=root
    DB_PASSWORD=
5. **Migration**
   ```bash
    php artisan migrate --seed
    or 
    copy the db in /database/laravel-ecommerce.sql
6. **Run**
   ```bash
   php artisan serve
