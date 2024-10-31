CREATE TABLE Azada(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Nombre_pico VARCHAR(50) NOT NULL,
  de_que_esta_hecho VARCHAR(50) NOT NULL,
  durabilidad INT NOT NULL,
  ataque DECIMAL NOT NULL,
  items_id INT,
  FOREIGN KEY (items_id) REFERENCES items(id)
)

INSERT INTO Azada(Nombre_pico, de_que_esta_hecho, durabilidad, ataque)
 VALUES
 ("Azada de madera", "2 de madera y dos palos de madera", 59, 0.5),
 ("Azada de piedra", "2 de piedra y dos palos de madera", 131, 0.5),
 ("Azada de oro", "2 de oro y dos palos de madera", 32, 0.5),
 ("Azada de hierro", "2 de hierro y dos palos de madera", 250, 0.5),
 ("Azada de diamante", "2 de diamante y dos palos de madera", 1561, 0.5);
