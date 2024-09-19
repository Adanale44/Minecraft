use minecraft;
show tables;

CREATE TABLE items (
  ID INT PRIMARY KEY,
  nombre_item VARCHAR(50) NOT NULL
);


CREATE TABLE jugadores (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  nombres VARCHAR(20),
  inventario_id INT FOREIGN KEY,
  ubicacionuser_id INT FOREIGN KEY ,
  fecha_registro DATE,
);


CREATE TABLE inventario (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  items_id VARCHAR,
  inventario_id INT PRIMARY KEY,
  ubicacionuser_id INT PRIMARY KEY,
  fecha_registro DATE,
);


CREATE TABLE mobs (
  ID INT PRIMARY KEY,
  nombre_mob VARCHAR(255),
  tipo_mob VARCHAR(50),
  dano_mob INT BOOLEAN,
  movilidad INT BOOLEAN,
  distancia_ataque INT,
  bioma INT FOREIGN KEY,
  interaccion_id INT FOREIGN KEY,
  reproduccion BOOLEAN,
);


CREATE TABLE interaccionuser (
  ID INT,
  user_id INT FOREIGN KEY,
  mob_id INT FOREIGN KEY,
  tipo_interaccion TEXT,
  fecha_interaccion DATE,
);

