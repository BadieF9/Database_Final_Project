create database Example;

use Example;

CREATE TABLE workers (
  worker_id INT IDENTITY(1,1) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  monthly_payment Integer NOT NULL,
  PRIMARY KEY (worker_id) 
);

CREATE TABLE floors (
  floor_id INT IDENTITY(1,1) NOT NULL,
  floor_number INT NOT NULL,
  PRIMARY KEY (floor_id)
);

CREATE TABLE floor_worker (
  floor_id INT NOT NULL,
  worker_id INT NOT NULL,
  FOREIGN KEY (floor_id) REFERENCES floors(id) ON DELETE CASCADE,
  FOREIGN KEY (worker_id) REFERENCES workers(id) ON DELETE CASCADE
);

CREATE TABLE rooms (
  room_id INT IDENTITY(1,1) NOT NULL,
  bed_number INT NOT NULL,
  vip BOOLEAN NOT NULL,
  room_number INT NOT NULL,
  floor_id INT NOT NULL,
  DEFAULT FALSE FOR vip,
  PRIMARY KEY (room_id),
  FOREIGN KEY (floor_id) REFERENCES floors(id) ON DELETE CASCADE
);

CREATE TABLE families (
  family_id INT IDENTITY(1,1) NOT NULL,
  family_lastname VARCHAR(50) NOT NULL,
  family_number INT NOT NULL,
  room_id INT NOT NULL,
  PRIMARY KEY (family_id),
  FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE CASCADE
);

CREATE TABLE restaurants (
  restaurant_id INT IDENTITY(1,1) NOT NULL,
  name VARCHAR(75) NOT NULL,
  floor_id INT NOT NULL,
  worker_id INT NOT NULL,
  PRIMARY KEY (restaurant_id),
  FOREIGN KEY (floor_id) REFERENCES floors(id) ON DELETE CASCADE,
);

CREATE TABLE restaurant_tables (
  table_id INT IDENTITY(1,1) NOT NULL,
  table_capacity INT NOT NULL,
  reserved BOOLEAN NOT NULL,
  restaurant_id INT NOT NULL,
  PRIMARY KEY (table_id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
);

CREATE TABLE restaurant_orders (
  order_id INT NOT NULL,
  order_ready BOOLEAN NOT NULL,
  total_price INT NOT NULL,
  payed BOOLEAN NOT NULL,
  PRIMARY KEY (order_id),
  DEFAULT FALSE FOR payed,
  DEFAULT FALSE FOR order_ready
);

CREATE TABLE order_table (
  order_table_id INT IDENTITY(1,1) NOT NULL,
  table_id INT NOT NULL,
  order_id INT NOT NULL,
  PRIMARY KEY (order_table_id),
  FOREIGN KEY (table_id) REFERENCES restaurant_tables(table_id) ON DELETE CASCADE,
  FOREIGN KEY (order_id) REFERENCES restaurant_orders(order_id) on DELETE CASCADE
);

CREATE TABLE foods (
  food_id INT IDENTITY(1,1) NOT NULL,
  name VARCHAR(255) NOT NULL,
  price INT NOT NULL,
  PRIMARY KEY (food_id),
  DEFAULT 0 FOR price
);

CREATE TABLE food_number (
  food_number_id INT IDENTITY(1,1) NOT NULL,
  number INT NOT NULL,
  food_id INT NOT NULL,
  order_id INT NOT NULL,
  PRIMARY KEY (food_number_id),
  FOREIGN KEY (food_id) REFERENCES foods(id) ON DELETE CASCADE,
  FOREIGN KEY (order_id) REFERENCES restaurant_orders(order_id) ON DELETE CASCADE
);

INSERT INTO WORKERS (first_name, last_name, monthly_payment, floor_id) Values ("Asghar", "Asgharian", 4500);
INSERT INTO WORKERS (first_name, last_name, monthly_payment, floor_id) Values ("Mamad", "Mamadian", 1000);
INSERT INTO WORKERS (first_name, last_name, monthly_payment, floor_id) Values ("Javad", "Javadian", 12000);

INSERT INTO floors (floor_number) VALUES (1);
INSERT INTO floors (floor_number) VALUES (2);
INSERT INTO floors (floor_number) VALUES (3);

INSERT INTO floor_worker (worker_id, floor_id) VALUES (1, 2);
INSERT INTO floor_worker (worker_id, floor_id) VALUES (1, 2);
INSERT INTO floor_worker (worker_id, floor_id) VALUES (2, 3);
INSERT INTO floor_worker (worker_id, floor_id) VALUES (3, 1);

INSERT INTO rooms (bed_number, vip, room_number, floor_id) VALUES (2, FALSE, FALSE, 101, 1);
INSERT INTO rooms (bed_number, vip, room_number, floor_id) VALUES (2, FALSE, FALSE, 102, 2);
INSERT INTO rooms (bed_number, vip, room_number, floor_id) VALUES (3, FALSE, FALSE, 103, 3);

INSERT INTO families (family_lastname, family_number, room_id) VALUES ("Jafarian", 2, 101);
INSERT INTO families (family_lastname, family_number, room_id) VALUES ("Shol Dastian", 2, 102);
INSERT INTO families (family_lastname, family_number, room_id) VALUES ("Sag Vand", 3, 103);

INSERT INTO restaurants (name, floor_id) VALUES ("Floor 1", 1);
INSERT INTO restaurants (name, floor_id) VALUES ("Floor 2", 2);
INSERT INTO restaurants (name, floor_id) VALUES ("Floor 3", 3);

INSERT INTO restaurant_tables (table_capacity, reserved, restaurant_id) VALUES (5, FALSE, 1);
INSERT INTO restaurant_tables (table_capacity, reserved, restaurant_id) VALUES (5, FALSE, 1);
INSERT INTO restaurant_tables (table_capacity, reserved, restaurant_id) VALUES (5, FALSE, 1);
INSERT INTO restaurant_tables (table_capacity, reserved, restaurant_id) VALUES (5, FALSE, 1);
INSERT INTO restaurant_tables (table_capacity, reserved, restaurant_id) VALUES (5, FALSE, 1);
INSERT INTO restaurant_tables (table_capacity, reserved, restaurant_id) VALUES (5, FALSE, 2);
INSERT INTO restaurant_tables (table_capacity, reserved, restaurant_id) VALUES (5, FALSE, 2);
INSERT INTO restaurant_tables (table_capacity, reserved, restaurant_id) VALUES (5, FALSE, 2);
INSERT INTO restaurant_tables (table_capacity, reserved, restaurant_id) VALUES (5, FALSE, 2);
INSERT INTO restaurant_tables (table_capacity, reserved, restaurant_id) VALUES (5, FALSE, 2);
INSERT INTO restaurant_tables (table_capacity, reserved, restaurant_id) VALUES (5, FALSE, 3);
INSERT INTO restaurant_tables (table_capacity, reserved, restaurant_id) VALUES (5, FALSE, 3);
INSERT INTO restaurant_tables (table_capacity, reserved, restaurant_id) VALUES (5, FALSE, 3);
INSERT INTO restaurant_tables (table_capacity, reserved, restaurant_id) VALUES (5, FALSE, 3);
INSERT INTO restaurant_tables (table_capacity, reserved, restaurant_id) VALUES (5, FALSE, 3);

INSERT INTO foods (name, price) VALUES ("Salad", 100);
INSERT INTO foods (name, price) VALUES ("Kebab", 200);
INSERT INTO foods (name, price) VALUES ("Ice Cream", 5);
INSERT INTO foods (name, price) VALUES ("Jelly", 2);

INSERT INTO restaurant_orders (order_ready, total_price, payed) VALUES (FALSE, 302, FALSE);
INSERT INTO restaurant_orders (order_ready, total_price, payed) VALUES (FALSE, 205, FALSE);
INSERT INTO restaurant_orders (order_ready, total_price, payed) VALUES (FALSE, 22, FALSE);
INSERT INTO restaurant_orders (order_ready, total_price, payed) VALUES (FALSE, 28, FALSE);
INSERT INTO restaurant_orders (order_ready, total_price, payed) VALUES (FALSE, 1550, FALSE);

INSERT INTO food_numbers (food_id, number, order_id) VALUES (1, 3, 1);
INSERT INTO food_numbers (food_id, number, order_id) VALUES (4, 1, 1);
INSERT INTO food_numbers (food_id, number, order_id) VALUES (2, 1, 2);
INSERT INTO food_numbers (food_id, number, order_id) VALUES (3, 1, 2);
INSERT INTO food_numbers (food_id, number, order_id) VALUES (3, 4, 3);
INSERT INTO food_numbers (food_id, number, order_id) VALUES (4, 1, 3);
INSERT INTO food_numbers (food_id, number, order_id) VALUES (4, 14, 4);
INSERT INTO food_numbers (food_id, number, order_id) VALUES (2, 5, 5);
INSERT INTO food_numbers (food_id, number, order_id) VALUES (1, 5, 5);
INSERT INTO food_numbers (food_id, number, order_id) VALUES (3, 10, 5);


INSERT INTO order_table (table_id, order_id) VALUES (1, 1);
INSERT INTO order_table (table_id, order_id) VALUES (2, 2);
INSERT INTO order_table (table_id, order_id) VALUES (3, 3);
INSERT INTO order_table (table_id, order_id) VALUES (4, 4);
INSERT INTO order_table (table_id, order_id) VALUES (5, 5);