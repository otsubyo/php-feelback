-- Insert roles
INSERT INTO roles (title) VALUES ('Admin'), ('Customer');

-- Insert users
INSERT INTO users (username, email, password, roles_id) VALUES
('willy', 'willy@example.com', 'password123', 2),
('colin', 'colin@example.com', 'password456', 2);
('carl', 'carl@example.com', 'password789', 2);

-- Insert products
INSERT INTO products (title, price_ht) VALUES
('Laptop', 799.99),
('Smartphone', 499.99),
('Headphones', 99.99);

-- Insert orders
INSERT INTO orders (users_id) VALUES (1), (2);

-- Insert packages
INSERT INTO packages (fragile, orders_id) VALUES (1, 1), (0, 2);

-- Insert questionnaires
INSERT INTO questionnaires (title, description) VALUES
('Delivery Experience', 'Rate the overall delivery process');

-- Insert questions
INSERT INTO questions (title) VALUES
('Rate delivery time'),
('Rate parcel condition'),
('Rate courier behavior');

-- Insert products related to orders
INSERT INTO products_has_orders (products_id, orders_id) VALUES
(1, 1),
(2, 2),
(3, 2);

-- Insert feedback (answers) for the questionnaire
INSERT INTO questions_has_questionnaires (questions_id, questionnaires_id, answer, users_id, orders_id) VALUES
(1, 1, 5, 1, 1),
(2, 1, 4, 1, 1),
(3, 1, 5, 1, 1),
(1, 1, 3, 2, 2),
(2, 1, 4, 2, 2),
(3, 1, 4, 2, 2);
