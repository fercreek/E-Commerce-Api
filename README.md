
# E-Commerce API

A RESTful API built with Ruby on Rails to manage an e-commerce system. It includes full features for authentication, products, orders, and personalized recommendations.

---

## **Features**
1. Authentication with JWT.
2. Complete CRUD for:
   - Users
   - Products
   - Orders
3. Recommendation functionality:
   - Based on categories and past purchases.
4. Security:
   - Endpoint protection for authenticated users.
5. PostgreSQL database.

---

## **Prerequisites**
- Ruby 3.x
- Rails 7.x
- PostgreSQL 13 or higher

---

## **Project Setup**

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd ecommerce_api
   ```

2. **Install gems:**
   ```bash
   bundle install
   ```

3. **Configure the database:**
   Update `config/database.yml` with your PostgreSQL database credentials. Then run:
   ```bash
   rails db:create
   rails db:migrate
   ```

4. **Seed initial data:**
   ```bash
   rails db:seed
   ```

5. **Start the server:**
   ```bash
   rails s
   ```
   The application will be available at `http://localhost:3000`.

---

## **Main Routes**

### **Authentication**
| Method | Endpoint   | Description        |
|--------|------------|--------------------|
| POST   | `/signup`  | Register a user.   |
| POST   | `/login`   | Log in and get a token.|

### **Products**
| Method | Endpoint                  | Description                     |
|--------|---------------------------|---------------------------------|
| GET    | `/products`               | List all products.              |
| POST   | `/products`               | Create a new product.           |
| GET    | `/products/:id`           | Get product details.            |
| GET    | `/products/recommendations` | Get recommended products.       |

### **Orders**
| Method | Endpoint     | Description                       |
|--------|--------------|-----------------------------------|
| POST   | `/orders`    | Create a new order.               |

---

## **Recommendation Feature**
Recommended products are based on categories of products previously purchased.

Recommendation endpoint:
```bash
GET /products/recommendations
Authorization: Bearer <token>
```

---

## **Running Tests**
The project includes exhaustive tests using RSpec. To run the tests:
```bash
bundle exec rspec
```

---

## **Initial Data**
- User: `johndoe@example.com`
- Password: `password123`
- 50 preloaded products.

---

## **Future Enhancements**
1. Multi-tag system for products.
2. Advanced recommendations with Machine Learning.
3. Caching of results to improve performance.

---

## **License**
This project is licensed under the MIT License.
