-- Table: roles
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(45) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

-- Table: users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,
    roles_id INT,
    FOREIGN KEY (roles_id) REFERENCES roles(id)
);

-- Table: orders
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,
    users_id INT,
    FOREIGN KEY (users_id) REFERENCES users(id)
);

-- Table: products
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    price_ht DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

-- Table: packages
CREATE TABLE packages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fragile TINYINT(1) DEFAULT 0,
    orders_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL,
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

-- Table: questionnaires
CREATE TABLE questionnaires (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

-- Table: questions
CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL
);

-- Table: questions_has_questionnaires
CREATE TABLE questions_has_questionnaires (
    rate_id INT AUTO_INCREMENT PRIMARY KEY,
    questions_id INT,
    questionnaires_id INT,
    answer TINYINT(1),
    users_id INT,
    orders_id INT,
    FOREIGN KEY (questions_id) REFERENCES questions(id),
    FOREIGN KEY (questionnaires_id) REFERENCES questionnaires(id),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (orders_id) REFERENCES orders(id),
);

-- Table: products_has_orders
CREATE TABLE products_has_orders (
    products_id INT,
    orders_id INT,
    PRIMARY KEY (products_id, orders_id),
    FOREIGN KEY (products_id) REFERENCES products(id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);
