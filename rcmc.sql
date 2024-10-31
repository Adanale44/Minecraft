--1. Tabla jugadores
CREATE TABLE jugadores (
    jugador_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(50) NOT NULL,
    tiempo_total_jugado BIGINT DEFAULT 0, 
    salud FLOAT DEFAULT 20,  
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP, 
    ultima_actividad DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
);
--2. Tabla items
CREATE TABLE items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_item VARCHAR(255) NOT NULL,
    tipo_item ENUM('herramienta', 'bloque', 'alimento', 'material', 'poción', 'decoración', 'arma') NOT NULL,
    subcategoria_item VARCHAR(100),
    durabilidad INT DEFAULT 0,
    apilable BOOLEAN,
    descripcion TEXT,
    interaccion BOOLEAN,
    se_puede_craftear BOOLEAN
);
--3. Tabla bloques
CREATE TABLE bloques (
    bloque_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_bloque VARCHAR(255) NOT NULL,
    tipo_bloque ENUM('material', 'decoración') NOT NULL,
    durabilidad INT DEFAULT 0,  
    apilable BOOLEAN, 
    genera_naturalmente BOOLEAN, 
    exclusivo BOOLEAN, 
    descripcion TEXT
);
--4. Tabla Relacional item_dimension
CREATE TABLE item_dimension (
    item_id INT,
    dimension_id INT,
    PRIMARY KEY (item_id, dimension_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id),
    FOREIGN KEY (dimension_id) REFERENCES dimensiones(dimension_id)
);
--5. Tabla Relacional bloque_dimension
CREATE TABLE bloque_dimension (
    bloque_id INT,
    dimension_id INT,
    PRIMARY KEY (bloque_id, dimension_id),
    FOREIGN KEY (bloque_id) REFERENCES bloques(bloque_id),
    FOREIGN KEY (dimension_id) REFERENCES dimensiones(dimension_id)
);
--6. Tabla Relacional bloque_bioma
CREATE TABLE bloque_bioma (
    bloque_id INT,
    bioma_id INT,
    PRIMARY KEY (bloque_id, bioma_id),
    FOREIGN KEY (bloque_id) REFERENCES bloques(bloque_id),
    FOREIGN KEY (bioma_id) REFERENCES biomas(bioma_id)
);
--7. Tabla mobs
CREATE TABLE mobs (
    mob_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_mob VARCHAR(255) NOT NULL,
    tipo_mob ENUM('Hostil', 'Neutral', 'Pasivo') NOT NULL,
    salud_mob INT DEFAULT 10,
    daño_mob INT DEFAULT 0,  
    ataque_a_distancia BOOLEAN,
    habilidad_especial VARCHAR(100),
    reproduccion BOOLEAN,
    luminosidad_minima INT DEFAULT 0,
    generacion_natural BOOLEAN, 
    nace_de VARCHAR(100),
    invocacion_requerida VARCHAR(100)
);
--8. Tabla Relacional mob_bioma
CREATE TABLE mob_bioma (
    mob_id INT,
    bioma_id INT,
    PRIMARY KEY (mob_id, bioma_id),
    FOREIGN KEY (mob_id) REFERENCES mobs(mob_id),
    FOREIGN KEY (bioma_id) REFERENCES biomas(bioma_id)
);
--9. Tabla Relacional mob_dimension
CREATE TABLE mob_dimension (
    mob_id INT,
    dimension_id INT,
    PRIMARY KEY (mob_id, dimension_id),
    FOREIGN KEY (mob_id) REFERENCES mobs(mob_id),
    FOREIGN KEY (dimension_id) REFERENCES dimensiones(dimension_id)
);
--10. Tabla jefes
CREATE TABLE jefes (
    jefe_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_jefe VARCHAR(255) NOT NULL,
    salud_jefe INT, 
    dañomax_jefe INT , 
    dañomin_jefe INT,
    ataque_a_distancia BOOLEAN,  
    habilidad_especial VARCHAR(100),  
    puede_ser_invocado BOOLEAN,
    requisitos_invocacion VARCHAR(255),
    biomas_donde VARCHAR(100),
    dimension_donde VARCHAR(100),
    loot TEXT
);
--11. Tabla dimensiones
CREATE TABLE dimensiones (
    dimension_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_dimension ENUM('Overworld', 'Nether', 'End') NOT NULL,
    descripcion_dimension TEXT,
    puede_generar_mobs BOOLEAN,
);
--12. Tabla biomas
CREATE TABLE biomas (
    bioma_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_bioma VARCHAR(255) NOT NULL,
    tipo_bioma ENUM('terrestre', 'acuático', 'subterráneo') NOT NULL,
    geografia ENUM('plano', 'montañoso', 'valle') NOT NULL, 
    temperatura DECIMAL(5,2) NOT NULL, 
    generar_mob_pass BOOLEAN,
    generar_mob_hoss BOOLEAN,
    genera_naturalmente BOOLEAN 
);
