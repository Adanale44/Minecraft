CREATE TABLE Pico(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Nombre_pico VARCHAR(50) NOT NULL,
  de_que_esta_hecho VARCHAR(50) NOT NULL,
  durabilidad INT NOT NULL,
  ataque DECIMAL NOT NULL,
  items_id INT,
  FOREIGN KEY (items_id) REFERENCES items(id)
)

INSERT INTO Pico(Nombre_pico, de_que_esta_hecho, durabilidad, ataque)
 VALUES
 ("Pico de madera", "3 de madera y dos palos de madera", 60, 1.0),
 ("Pico de piedra", "3 de piedra y dos palos de madera", 132, 1.5),
 ("Pico de oro", "3 de oro y dos palos de madera", 33, 1.0),
 ("Pico de hierro", "3 de hierro y dos palos de madera", 251, 2.0),
 ("Pico de diamante", "3 de diamante y dos palos de madera", 1562, 2.5);
