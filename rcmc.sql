--1. Tabla jugadores
CREATE TABLE jugadores (
    jugador_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(50) NOT NULL,  -- Nombre del jugador en Minecraft
    tiempo_total_jugado BIGINT DEFAULT 0,  -- Experiencia acumulada
    salud FLOAT DEFAULT 20,  -- Salud del jugador
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,  -- Fecha de creación
    ultima_actividad DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- Última vez que jugó
);
--2. Tabla items
CREATE TABLE items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_item VARCHAR(255) NOT NULL,
    tipo_item ENUM('herramienta', 'bloque', 'alimento', 'material', 'poción', 'decoración', 'arma') NOT NULL,
    subcategoria_item VARCHAR(100),  -- Subcategorías como tipo de material
    durabilidad INT DEFAULT 0,  -- Durabilidad del ítem, si aplica
    apilable BOOLEAN DEFAULT TRUE,  -- Si puede apilarse
    descripcion TEXT,
    interaccion BOOLEAN DEFAULT FALSE,  -- Indica si se puede interactuar
    se_puede_craftear BOOLEAN DEFAULT FALSE  -- Indica si el ítem se puede craftear
);
--3. Tabla bloques
CREATE TABLE bloques (
    bloque_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_bloque VARCHAR(255) NOT NULL,
    tipo_bloque ENUM('material', 'decoración') NOT NULL,
    durabilidad INT DEFAULT 0,  -- Durabilidad del bloque, si aplica
    apilable BOOLEAN DEFAULT TRUE,  -- Si puede apilarse
    genera_naturalmente BOOLEAN DEFAULT FALSE,  -- Indica si el bloque se genera naturalmente
    exclusivo BOOLEAN DEFAULT FALSE,  -- Indica si el bloque es exclusivo de una dimensión o bioma
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
    tipo_mob ENUM('hostil', 'neutral', 'pasivo') NOT NULL,
    salud_mob INT DEFAULT 10,  -- Vida del mob
    daño_mob INT DEFAULT 0,  -- Daño infligido
    ataque_a_distancia BOOLEAN DEFAULT FALSE,  -- Si el mob tiene ataques a distancia
    habilidad_especial VARCHAR(100),  -- Habilidad especial (ej. invocar, explosión)
    reproduccion BOOLEAN DEFAULT FALSE,  -- Si el mob puede reproducirse
    puede_aparecer_de_dia BOOLEAN DEFAULT TRUE,  -- Indica si el mob puede aparecer de día
    puede_aparecer_de_noche BOOLEAN DEFAULT TRUE,  -- Indica si el mob puede aparecer de noche
    luminosidad_minima INT DEFAULT 0,  -- Luminosidad mínima para aparecer
    generacion_natural BOOLEAN DEFAULT TRUE,  -- Indica si el mob puede generarse naturalmente
    nace_de VARCHAR(100),  -- Especifica si el mob nace de otro (ej. "huevo de slime")
    invocacion_requerida VARCHAR(100),  -- Método de invocación si es necesario
    INDEX idx_nombre_mob (nombre_mob)  -- Índice para búsquedas rápidas por nombre
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
    salud_jefe INT DEFAULT 100,  -- Salud del jefe
    daño_jefe INT DEFAULT 10,  -- Daño infligido
    ataque_a_distancia BOOLEAN DEFAULT FALSE,  -- Si el jefe tiene ataques a distancia
    habilidad_especial VARCHAR(100),  -- Habilidad especial del jefe
    puede_ser_invocado BOOLEAN DEFAULT TRUE,  -- Si el jefe puede ser invocado
    requisitos_invocacion VARCHAR(255),  -- Requisitos para invocar al jefe
    loot TEXT,  -- Botín que deja el jefe al ser derrotado
    dimension_id INT,  -- Dimensión donde se puede invocar el jefe
    FOREIGN KEY (dimension_id) REFERENCES dimensiones(dimension_id),  -- Relación con la tabla dimensiones
    INDEX idx_nombre_jefe (nombre_jefe)  -- Índice para búsquedas rápidas por nombre
);
--11. Tabla Relacional jefe_bioma
CREATE TABLE jefe_bioma (
    jefe_id INT,
    bioma_id INT,
    PRIMARY KEY (jefe_id, bioma_id),
    FOREIGN KEY (jefe_id) REFERENCES jefes(jefe_id),
    FOREIGN KEY (bioma_id) REFERENCES biomas(bioma_id)
);
--12. Tabla dimensiones
CREATE TABLE dimensiones (
    dimension_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_dimension ENUM('Overworld', 'Nether', 'End') NOT NULL,
    descripcion_dimension TEXT,
    dificultad_dimension ENUM('fácil', 'normal', 'difícil') NOT NULL,  -- Dificultad de la dimensión
    puede_generar_mobs BOOLEAN DEFAULT TRUE,  -- Indica si la dimensión puede generar mobs
    INDEX idx_nombre_dimension (nombre_dimension)
);
--13. Tabla biomas
CREATE TABLE biomas (
    bioma_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_bioma VARCHAR(255) NOT NULL,
    tipo_bioma ENUM('terrestre', 'acuático', 'subterráneo') NOT NULL,  -- Tipo de bioma
    terreno ENUM('plano', 'montañoso', 'valle') NOT NULL,  -- Tipo de terreno
    temperatura DECIMAL(5,2) NOT NULL,  -- Temperatura del bioma
    humedad DECIMAL(5,2) NOT NULL,  -- Nivel de humedad
    puede_generar_mobs BOOLEAN DEFAULT TRUE,  -- Indica si el bioma puede generar mobs
    genera_naturalmente BOOLEAN DEFAULT TRUE  -- Indica si el bioma se genera naturalmente
);
