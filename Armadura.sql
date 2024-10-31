CREATE TABLE Armadura(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Nombre_armadura VARCHAR(255) NOT NULL,
  de_que_esta_hecho VARCHAR(255) NOT NULL,
  durabilidad INT NOT NULL,
  defensa DECIMAL NOT NULL,
  items_id INT,
  PRIMARY KEY (items_id),
  FOREIGN KEY (items_id) REFERENCES items(items_id)
)

INSERT INTO Armadura(Nombre_armadura, de_que_esta_hecho, durabilidad, defensa)
