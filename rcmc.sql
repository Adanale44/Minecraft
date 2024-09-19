use minecraft;
show tables;

CREATE TABLE jugadores (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  nombres VARCHAR(20),
  inventario_id INT,
  ubicacionuser_id INT,
  fecha_registro DATETIME,
  PRIMARY KEY (inventario_id, ubicacionuser_id), 
  FOREIGN KEY (inventario_id) REFERENCES cursos(id),
  FOREIGN KEY (ubicacionuser_id) REFERENCES cursos(id)
);


CREATE TABLE inventario (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  items_id VARCHAR,
  user_id INT PRIMARY KEY,
  cantidad INT,
  PRIMARY KEY (user_id, items_id), 
  FOREIGN KEY (user_id) REFERENCES cursos(id),
  FOREIGN KEY (items_id) REFERENCES cursos(id)  
);


CREATE TABLE mobs (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  nombre_mob VARCHAR(255),
  tipo_mob VARCHAR(50),
  dano_mob INT,
  movilidad INT,
  distancia_ataque BOOLEAN DEFAULT FALSE,
  bioma INT ,
  interaccion_id INT,
  reproduccion BOOLEAN,
  PRIMARY KEY (interaccion_id), 
  FOREIGN KEY (interaccion_id) REFERENCES cursos(id)
);


CREATE TABLE interaccionuser (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  jugadores_id INT,
  mob_id INT,
  tipo_interaccion TEXT,
  fecha_interaccion DATETIME,
  PRIMARY KEY (jugadores_id, mod_id), 
  FOREIGN KEY (jugadores_id) REFERENCES cursos(id),
  FOREIGN KEY (mod_id) REFERENCES cursos(id)
);

CREATE TABLE biomas(
 ID INT AUTO_INCREMENT PRIMARY KEY,
 nombre_bioma VARCHAR(255),
 humedad FLOAT,
 temperatura FLOAT,
 geografia INT,
 ubicacionuser_id INT,
 mod_id INT,
 descripcion_de_bioma TEXT,
 PRIMARY KEY (ubicacionuser, mod_id), 
 FOREIGN KEY (ubicacionuser_id) REFERENCES cursos(id),
 FOREIGN KEY (mod_id) REFERENCES cursos(id)   
);

CREATE TABLE ubicacionuser(
 ID INT AUTO_INCREMENT PRIMARY KEY,
 coordx INT,
 coordz INT,
 coordy INT
);

CREATE TABLE estructura(
 ID INT AUTO_INCREMENT PRIMARY KEY,
 nombre_estructura VARCHAR(255),
 descripcion_de_estructura TEXT,
 bioma_id INT,
 dimension_id INT,
 mob_id INT,
 PRIMARY KEY (bioma_id,dimension_id,mob_id),
 FOREIGN KEY (ubicacionuser_id) REFERENCES cursos(id),
 FOREIGN KEY (mod_id) REFERENCES cursos(id) 
);