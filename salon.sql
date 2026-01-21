-- salon.sql
-- Drop tables if they exist
DROP TABLE IF EXISTS appointments;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS services;

-- Create customers table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL
);

-- Create services table
CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Create appointments table
CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id) ON DELETE CASCADE,
    service_id INT REFERENCES services(service_id) ON DELETE CASCADE,
    time TIMESTAMP NOT NULL
);

-- Insert sample services
INSERT INTO services (name) VALUES
('Haircut'),
('Manicure'),
('Pedicure'),
('Hair Coloring'),
('Facial');

-- Insert sample customers
INSERT INTO customers (name, phone) VALUES
('Alice Johnson', '081234567890'),
('Bob Smith', '082345678901');

-- Insert sample appointments
INSERT INTO appointments (customer_id, service_id, time) VALUES
(1, 1, '2026-01-25 10:00:00'),
(2, 3, '2026-01-25 11:00:00');
