CREATE TABLE Armadura(
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Nombre_armadura VARCHAR(255) NOT NULL,
  de_que_esta_hecho VARCHAR(255) NOT NULL,
  durabilidad INT NOT NULL,
  defensa INT NOT NULL,
  Durabilidad/Unidad,
  items_id INT,
  PRIMARY KEY (items_id),
  FOREIGN KEY (items_id) REFERENCES items(items_id)
)
INSERT INTO Armadura(Nombre_armadura, de_que_esta_hecho, durabilidad, defensa)
 VALUES
("Casco de cuero","5 de cuero", 55, 0.5,68%),("Pechera de cuero","8 de cuero", 80, 1.5), 68%	61%	66%	100%
("Pantalon de cuero","7 de cuero", 75, 1.0),("Botas de cuero","4 de cuero", 65, 0.5),
  
("Casco de oro","5 de oro", 77, 1.0,68%),("Pechera de oro","8 de oro", 112, 2.5),
("Pantalon de oro","7 de oro", 105, 1.5),("Botas de oro","4 de oro", 91, 0.5),
  
("Casco de cota de malla ","5 de fuego", 165, 1.0,68%),("Pechera de cota de malla","8 de fuego", 240, 2.5), 165	240	225	195
("Pantalon de cota de malla","7 de fuego", 225, 2.0),("Botas de cota de malla","4 de fuego", 195, 0.5),
  
("Casco de hierro","5 de hierro", 165, 1.0,68%),("Pechera de hierro","8 de hierro", 240, 3.0),
("Pantalon de hierro","7 de hierro", 225, 2.5),("Botas de hierro","4 de hierro", 195, 1.0),

("Casco de diamante","5 de diamantes", 363, 1.5,68%),("Pechera de diamante","8 de diamantes", 528, 4.0), 
("Pantalon de diamante","7 de diamantes", 495, 3.0),("Botas de diamante","4 de diamantes", 429, 1.5),
