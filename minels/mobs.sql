INSERT INTO mobs(nombre_mob, tipo_mob, dano_mob, vida_mob, movilidad, distancia_ataque, bioma, interaccion_id, dimension_id, reproduccion);
VALUES ('Zombi', 'Hostil', '3', '20', 'Terrestre', 'Cuerpo a cuerpo', '', 'Golpear', 'Mundo', 'no'),
('Esqueleto', 'Hostil', '3', '20', 'Terrestre', 'A distancia', '', 'Golpear', 'Mundo', 'no'),
('Creeper', 'Hostil', '42', '20', 'Terrestre', 'Cuerpo a cuerpo','', 'Golpear', 'Mundo', 'no'),
('Araña', 'Neutral', '2', '16', 'Terrestre', 'Cuerpo a cuerpo', '', 'Golpear', 'Mundo', 'no'),
('Enderman', 'Neutral', '6', '40', 'Terrestre', 'Cuerpo a cuerpo', '', 'Golpear', 'Fin', 'no'),
('Cerdo', 'Pasivo', '0', '10','Terrestre', 'No ataca', '', 'Golpear, Alimentar o Montar', 'Mundo', 'si'),
('Oveja', 'Pasivo', '0', '8', 'Terrestre', 'No ataca', '', 'Golpear, Alimentar o Trasquilar', 'Mundo', 'si'),
('Vaca', 'Pasivo', '0', '10', 'Terrestre', 'No ataca', '', 'Golpear, Alimentar o Ordeñar', 'Mundo', 'si'),
('Pollo', 'Pasivo', '0', '4', 'Terrestre', 'No ataca', '', 'Golpear o Alimentar', 'Mundo', 'si'),
('Caballo', 'Pasivo', '0', '23', 'Terrestre', 'No ataca', '', 'Golpear, Alimentar o Montar', 'Mundo', 'si'),
('Ghast', 'Hostil', '12', '10', 'Volador', 'A distancia', '', 'Golpear', 'Inframundo', 'no'); 