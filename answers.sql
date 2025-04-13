create database BookStore;
use BookStore;

-- Create country table
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

-- Create address table
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    postal_code VARCHAR(20) NOT NULL,
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Create publisher table
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(255) NOT NULL,
    publisher_email VARCHAR(100),
    publisher_phone VARCHAR(20)
);

-- Create book_language table
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50) NOT NULL,
    language_code VARCHAR(5) NOT NULL
);

-- Create author table
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL,
    author_email VARCHAR(100),
    author_bio TEXT
);

-- Create book table
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    publication_date DATE,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    publisher_id INT,
    language_id INT,
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

-- Create book_author junction table
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- Create address_status table
CREATE TABLE address_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(30) NOT NULL
);

-- Create customer table
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Create customer_address table
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

-- Create shipping_method table
CREATE TABLE shipping_method (
    shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100) NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    estimated_days INT
);

-- Create order_status table
CREATE TABLE order_status (
    order_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

-- Create cust_order table
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    shipping_address_id INT NOT NULL,
    shipping_method_id INT NOT NULL,
    order_status_id INT NOT NULL,
    order_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_address_id) REFERENCES address(address_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

-- Create order_line table
CREATE TABLE order_line (
    order_line_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Create order_history table
CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    order_status_id INT NOT NULL,
    status_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    comments TEXT,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);

-- Sample data for country table (Kenya, South Africa, Nigeria)
INSERT INTO country (country_name) VALUES 
('Kenya'),
('South Africa'),
('Nigeria');

-- Sample data for address table
INSERT INTO address (city, state, postal_code, country_id) VALUES 
('Nairobi', NULL, '00100', 1),
('Cape Town', 'Western Cape', '8001', 2),
('Lagos', 'Lagos State', '100001', 3);

-- Sample data for publisher table
INSERT INTO publisher (publisher_name, publisher_email, publisher_phone) VALUES 
('Longhorn Publishers', 'info@longhornpublishers.com', '+254-20-6532579'),
('Jonathan Ball Publishers', 'info@jonathanball.co.za', '+27-11-6013000'),
('Kachifo Limited', 'info@kachifo.com', '+234-1-7406186');

-- Sample data for book_language table
INSERT INTO book_language (language_name, language_code) VALUES 
('English', 'en'),
('Swahili', 'sw'),
('Yoruba', 'yo');

-- Sample data for author table
INSERT INTO author (author_name, author_email, author_bio) VALUES 
('Ngũgĩ wa Thiong\'o', 'ngugi@example.com', 'Kenyan writer and academic'),
('Chimamanda Ngozi Adichie', 'chimamanda@example.com', 'Nigerian novelist and short story writer'),
('Deon Meyer', 'deon@example.com', 'South African crime fiction author');

-- Sample data for book table
INSERT INTO book (title, isbn, publication_date, price, description, publisher_id, language_id) VALUES 
('Weep Not, Child', '9780143026242', '1964-01-15', 15.99, 'A novel about the Mau Mau Uprising', 1, 1),
('Half of a Yellow Sun', '9780007200283', '2006-08-11', 18.99, 'Set during the Biafran War', 3, 1),
('Fever', '9781444723571', '2017-03-07', 19.99, 'A post-apocalyptic crime thriller', 2, 1);

-- Sample data for book_author junction table
INSERT INTO book_author (book_id, author_id) VALUES 
(1, 1), -- Weep Not, Child by Ngũgĩ wa Thiong'o
(2, 2), -- Half of a Yellow Sun by Chimamanda Ngozi Adichie
(3, 3); -- Fever by Deon Meyer

-- Sample data for address_status table
INSERT INTO address_status (status_name) VALUES 
('Current'),
('Previous'),
('Shipping');

-- Sample data for customer table
INSERT INTO customer (first_name, last_name, email, phone, registration_date) VALUES 
('Kamau', 'Mwangi', 'kamau.mwangi@example.com', '+254-722-123456', '2024-01-15 10:00:00'),
('Thabo', 'Mbeki', 'thabo.mbeki@example.com', '+27-83-4567890', '2024-02-10 14:30:00'),
('Oluwaseun', 'Adebayo', 'oluwaseun.adebayo@example.com', '+234-803-7654321', '2024-03-05 09:15:00');

-- Sample data for customer_address table
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES 
(1, 1, 1), -- Kamau's address in Nairobi
(2, 2, 1), -- Thabo's address in Cape Town
(3, 3, 1); -- Oluwaseun's address in Lagos

-- Sample data for shipping_method table
INSERT INTO shipping_method (method_name, cost, estimated_days) VALUES 
('Standard Shipping', 4.99, 7),
('Express Shipping', 9.99, 3),
('Premium Delivery', 19.99, 1);

-- Sample data for order_status table
INSERT INTO order_status (status_name) VALUES 
('Pending'),
('Shipped'),
('Delivered');

-- Sample data for cust_order table
INSERT INTO cust_order (customer_id, order_date, shipping_address_id, shipping_method_id, order_status_id, order_total) VALUES 
(1, '2025-03-20 11:30:00', 1, 1, 1, 20.98),
(2, '2025-03-25 15:45:00', 2, 2, 2, 28.98),
(3, '2025-04-01 09:00:00', 3, 3, 3, 39.98);

-- Sample data for order_line table
INSERT INTO order_line (order_id, book_id, quantity, price) VALUES 
(1, 1, 1, 15.99), -- Kamau ordered Weep Not, Child
(2, 3, 1, 19.99), -- Thabo ordered Fever
(3, 2, 1, 18.99); -- Oluwaseun ordered Half of a Yellow Sun

-- Sample data for order_history table
INSERT INTO order_history (order_id, order_status_id, status_date, comments) VALUES 
(1, 1, '2025-03-20 11:30:00', 'Order placed'),
(2, 1, '2025-03-25 15:45:00', 'Order placed'),
(2, 2, '2025-03-26 09:10:00', 'Order shipped via express shipping'),
(3, 1, '2025-04-01 09:00:00', 'Order placed'),
(3, 2, '2025-04-01 10:30:00', 'Order shipped via premium delivery'),
(3, 3, '2025-04-02 14:15:00', 'Order delivered');

CREATE USER 'bs_admin'@'localhost' IDENTIFIED BY 'Secure_Admin_Pass123';
GRANT ALL PRIVILEGES ON BookStore.* TO 'bs_admin'@'localhost';

CREATE USER 'bs_report'@'localhost' IDENTIFIED BY 'Secure_Report_Pass456';
GRANT SELECT ON BookStore.* TO 'bs_report'@'localhost';

CREATE USER 'bs_app'@'localhost' IDENTIFIED BY 'Secure_App_Pass789';
GRANT SELECT, INSERT, UPDATE, DELETE ON BookStore.* TO 'bs_app'@'localhost';*/

-- Find all books by a specific author
SELECT b.title, b.isbn, b.price
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
WHERE a.author_name = 'Ngũgĩ wa Thiong\'o';

-- Find all orders for a specific customer
SELECT co.order_id, co.order_date, os.status_name, co.order_total
FROM cust_order co
JOIN order_status os ON co.order_status_id = os.order_status_id
WHERE co.customer_id = 1;

-- Get a list of all books ordered by a specific customer
SELECT c.first_name, c.last_name, b.title, ol.quantity, ol.price
FROM customer c
JOIN cust_order co ON c.customer_id = co.customer_id
JOIN order_line ol ON co.order_id = ol.order_id
JOIN book b ON ol.book_id = b.book_id
WHERE c.customer_id = 1;

-- Count books by language
SELECT l.language_name, COUNT(b.book_id) AS book_count
FROM book b
JOIN book_language l ON b.language_id = l.language_id
GROUP BY l.language_name;

-- Find the total value of orders by country
SELECT c.country_name, SUM(co.order_total) AS total_sales
FROM cust_order co
JOIN address a ON co.shipping_address_id = a.address_id
JOIN country c ON a.country_id = c.country_id
GROUP BY c.country_name;
