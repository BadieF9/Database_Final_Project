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

