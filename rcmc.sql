use minecraft;
show tables;

CREATE TABLE jugadores (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  nombres VARCHAR(20),
  ubicacionuser_id INT,
  PRIMARY KEY (inventario_id, ubicacionuser_id), 
  FOREIGN KEY (inventario_id) REFERENCES cursos(id),
  FOREIGN KEY (ubicacionuser_id) REFERENCES cursos(id)
);

CREATE TABLE item (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  nombres_item VARCHAR(20),
  categoria_dimension TEXT,
  descripcion TEXT
  );

CREATE TABLE estructuras(
  ID INT AUTO_INCREMENT PRIMARY KEY,
  nombre_estructura VARCHAR(250),
  bioma_id INT,
  dimesion_id INT,
  mob_id
  PRIMARY KEY (inventario_id, ubicacionuser_id), 
  FOREIGN KEY (inventario_id) REFERENCES cursos(id),
  FOREIGN KEY (ubicacionuser_id) REFERENCES cursos(id)
);

CREATE TABLE mobs (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  nombre_mob VARCHAR(255),
  tipo_mob VARCHAR(50),
  dano_mob INT,
  movilidad INT,
  animal BOOLEAN,
  mounstro BOOLEAN,
  humano BOOLEAN,
  distancia_ataque BOOLEAN DEFAULT FALSE,
  bioma INT ,
  interaccion_id INT,
  reproduccion BOOLEAN,
  boss BOOLEAN,
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
 dimensiones_id INT,
 mob_id INT,
 PRIMARY KEY (bioma_id,dimensiones_id,mob_id),
 FOREIGN KEY (bioma_id) REFERENCES cursos(id),
 FOREIGN KEY (dimensiones_id) REFERENCES cursos(id),
 FOREIGN KEY (mod_id) REFERENCES cursos(id) 
);

CREATE TABLE dimensiones(
ID INT PRIMARY KEY,
nombre_de_dimension VARCHAR(20),
descripcion_de_dimension TEXT,
ubicacionuser_id INT,
mob_id INT,
PRIMARY KEY (ubicacionuser_id,mob_id),
FOREIGN KEY (ubicacionuser_id) REFERENCES cursos(id),
FOREIGN KEY (mod_id) REFERENCES cursos(id)
)

