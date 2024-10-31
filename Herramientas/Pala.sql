CREATE TABLE Pala(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Nombre_pico VARCHAR(50) NOT NULL,
  de_que_esta_hecho VARCHAR(50) NOT NULL,
  durabilidad INT NOT NULL,
  ataque DECIMAL NOT NULL,
  items_id INT,
  FOREIGN KEY (items_id) REFERENCES items(id)
)

INSERT INTO Pala(Nombre_Pala, de_que_esta_hecho, durabilidad, ataque)
 VALUES
 ("Pala de madera", "1 de madera y dos palos de madera", 59, 1.0),
 ("Pala de piedra", "1 de piedra y dos palos de madera", 131, 1.5),
 ("Pala de oro", "1 de oro y dos palos de madera", 32, 1.0),
 ("Pala de hierro", "1 de hierro y dos palos de madera", 250, 2.0),
 ("Pala de diamante", "1 de diamante y dos palos de madera", 1561, 2.5);