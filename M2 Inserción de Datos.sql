-- -----------------------------------------------------------------------------------
-- Script completo de inserción de datos (500+ registros distribuidos)
-- Datos realistas para sistema educativo en SQL Server
-- -----------------------------------------------------------------------------------
USE SistemaEducativo;
GO
-- -----------------------------------------------------------------------------------
-- 1. Instituciones (3 registros)
-- -----------------------------------------------------------------------------------
INSERT INTO Instituciones (nombre, direccion, telefono, email) 
VALUES 
('Unidad Educativa "San José"', 'Av. Principal 123, Quito', '022222222', 'sanjose@edu.ec'),
('Colegio "Los Pinos"', 'Calle 10 de Agosto 456, Guayaquil', '023333333', 'pinos@edu.ec'),
('Instituto Tecnológico "Albert Einstein"', 'Av. Amazonas 789, Cuenca', '024444444', 'einstein@edu.ec');

-- -----------------------------------------------------------------------------------
-- 2. Estudiantes (150 registros - aproximadamente 50 por institución)
-- -----------------------------------------------------------------------------------
INSERT INTO Estudiantes (cedula, nombres, apellidos, fecha_nacimiento, genero, direccion, telefono, email, institucion_id)
VALUES 
-- Institución 1 (50 estudiantes)
-- Institución 1 (50 estudiantes)
('1750012345', 'Juan Carlos', 'Pérez González', '2005-03-15', 'M', 'Calle 123, Quito', '0987654321', 'juan.perez@email.com', 1),
('1750012346', 'María José', 'López Martínez', '2005-07-22', 'F', 'Av. Principal 456, Quito', '0987654322', 'maria.lopez@email.com', 1),
('1750012347', 'Carlos Andrés', 'García Ruiz', '2006-01-10', 'M', 'Calle 789, Quito', '0987654323', 'carlos.garcia@email.com', 1),
('1750012348', 'Andrea Elizabeth', 'Vargas Mendoza', '2005-04-12', 'F', 'Av. Amazonas 2345', '0987654324', 'andrea.vargas@email.com', 1),
('1750012349', 'Luis Fernando', 'Morales Salazar', '2005-11-05', 'M', 'Calle Galápagos 678', '0987654325', 'luis.morales@email.com', 1),
('1750012350', 'Sofía Alejandra', 'Castro Benítez', '2006-02-28', 'F', 'Av. Shyris 1001', '0987654326', 'sofia.castro@email.com', 1),
('1750012351', 'David Esteban', 'Ortega Pazmiño', '2005-09-17', 'M', 'Calle Rumipamba 456', '0987654327', 'david.ortega@email.com', 1),
('1750012352', 'Daniela Carolina', 'Santillán Reyes', '2005-12-03', 'F', 'Av. 6 de Diciembre 789', '0987654328', 'daniela.santillan@email.com', 1),
('1750012353', 'José Luis', 'Zambrano Vélez', '2005-08-19', 'M', 'Calle Toledo 321', '0987654329', 'jose.zambrano@email.com', 1),
('1750012354', 'Valeria Nicole', 'Paredes Cordero', '2006-01-25', 'F', 'Av. Occidental 654', '0987654330', 'valeria.paredes@email.com', 1),
('1750012355', 'Fernando Xavier', 'Guerrero Jaramillo', '2005-06-11', 'M', 'Calle Almagro 987', '0987654331', 'fernando.guerrero@email.com', 1),
('1750012356', 'Gabriela Michelle', 'Salazar Torres', '2005-10-08', 'F', 'Av. 10 de Agosto 543', '0987654332', 'gabriela.salazar@email.com', 1),
('1750012357', 'Pablo Andrés', 'Figueroa Espinoza', '2005-07-14', 'M', 'Calle Mariana de Jesús 210', '0987654333', 'pablo.figueroa@email.com', 1),
('1750012358', 'Melissa Raquel', 'Rojas Zambrano', '2006-03-09', 'F', 'Av. Colón 876', '0987654334', 'melissa.rojas@email.com', 1),
('1750012359', 'Roberto Carlos', 'Mendoza López', '2005-05-22', 'M', 'Calle Whymper 432', '0987654335', 'roberto.mendoza@email.com', 1),
('1750012360', 'Karen Dayana', 'Suárez Viteri', '2005-12-15', 'F', 'Av. América 765', '0987654336', 'karen.suarez@email.com', 1),
('1750012361', 'Jorge Luis', 'Vera Castillo', '2005-04-30', 'M', 'Calle Juan León Mera 109', '0987654337', 'jorge.vera@email.com', 1),
('1750012362', 'Diana Carolina', 'Córdova Paz', '2006-02-18', 'F', 'Av. Coruña 298', '0987654338', 'diana.cordova@email.com', 1),
('1750012363', 'Mario Alfredo', 'Barrera Salinas', '2005-11-27', 'M', 'Calle Portugal 654', '0987654339', 'mario.barrera@email.com', 1),
('1750012364', 'Jessica Pamela', 'Narváez Gómez', '2005-08-03', 'F', 'Av. Eloy Alfaro 321', '0987654340', 'jessica.narvaez@email.com', 1),
('1750012365', 'Oscar René', 'Carvajal Haro', '2005-09-21', 'M', 'Calle Río Coca 876', '0987654341', 'oscar.carvajal@email.com', 1),
('1750012366', 'María Fernanda', 'Palacios Ruiz', '2006-01-07', 'F', 'Av. de los Shyris 543', '0987654342', 'maria.palacios@email.com', 1),
('1750012367', 'Diego Armando', 'Vallejo Molina', '2005-07-29', 'M', 'Calle La Niña 210', '0987654343', 'diego.vallejo@email.com', 1),
('1750012368', 'Nataly Elizabeth', 'Escobar Guzmán', '2005-10-14', 'F', 'Av. Mariscal Sucre 987', '0987654344', 'nataly.escobar@email.com', 1),
('1750012369', 'Wilson Eduardo', 'Ponce León', '2005-06-08', 'M', 'Calle Guayaquil 654', '0987654345', 'wilson.ponce@email.com', 1),
('1750012370', 'Stephanie Nicole', 'Rosales Vélez', '2006-03-25', 'F', 'Av. Atahualpa 321', '0987654346', 'stephanie.rosales@email.com', 1),
('1750012371', 'Christian David', 'Ávila Mendoza', '2005-12-12', 'M', 'Calle Imbabura 876', '0987654347', 'christian.avila@email.com', 1),
('1750012372', 'Katherine Lorena', 'Chávez Salvatierra', '2005-05-19', 'F', 'Av. 12 de Octubre 543', '0987654348', 'katherine.chavez@email.com', 1),
('1750012373', 'José Antonio', 'Miranda Ríos', '2005-09-03', 'M', 'Calle Tarqui 210', '0987654349', 'jose.miranda@email.com', 1),
('1750012374', 'Paola Vanessa', 'Villacís Ortega', '2006-02-11', 'F', 'Av. Orellana 987', '0987654350', 'paola.villacis@email.com', 1),
('1750012375', 'Walter Fernando', 'Gómez Paredes', '2005-11-28', 'M', 'Calle Antisana 654', '0987654351', 'walter.gomez@email.com', 1),
('1750012376', 'Lissette Alexandra', 'Torres Zambrano', '2005-07-16', 'F', 'Av. Pedro Vicente Maldonado 321', '0987654352', 'lissette.torres@email.com', 1),
('1750012377', 'Alex Javier', 'Salinas Castro', '2005-04-09', 'M', 'Calle Latacunga 876', '0987654353', 'alex.salinas@email.com', 1),
('1750012378', 'Mónica Patricia', 'Lara Jaramillo', '2006-01-22', 'F', 'Av. Simón Bolívar 543', '0987654354', 'monica.lara@email.com', 1),
('1750012379', 'Vinicio Marcelo', 'Peñaherrera Sánchez', '2005-08-07', 'M', 'Calle Chimborazo 210', '0987654355', 'vinicio.penaherrera@email.com', 1),
('1750012380', 'Gabriela Estefanía', 'Vélez Cordero', '2005-10-31', 'F', 'Av. República 987', '0987654356', 'gabriela.velez@email.com', 1),
('1750012381', 'Patricio Andrés', 'Ríos Haro', '2005-06-14', 'M', 'Calle Tungurahua 654', '0987654357', 'patricio.rios@email.com', 1),
('1750012382', 'Jennifer Lorena', 'Molina Pazmiño', '2006-03-08', 'F', 'Av. Napo 321', '0987654358', 'jennifer.molina@email.com', 1),
('1750012383', 'Mauricio Javier', 'Castillo Salazar', '2005-12-25', 'M', 'Calle Pichincha 876', '0987654359', 'mauricio.castillo@email.com', 1),
('1750012384', 'Carolina Alejandra', 'Benavides López', '2005-05-11', 'F', 'Av. Granados 543', '0987654360', 'carolina.benavides@email.com', 1),
('1750012385', 'Fabricio Andrés', 'Espinosa Vélez', '2005-09-26', 'M', 'Calle Cotopaxi 210', '0987654361', 'fabricio.espinosa@email.com', 1),
('1750012386', 'Domenica Michelle', 'Carrasco Reyes', '2006-02-03', 'F', 'Av. El Inca 987', '0987654362', 'domenica.carrasco@email.com', 1),
('1750012387', 'Byron Xavier', 'Andrade Mendoza', '2005-07-19', 'M', 'Calle Los Andes 654', '0987654363', 'byron.andrade@email.com', 1),
('1750012388', 'Estefanía Maribel', 'Guzmán Torres', '2005-11-12', 'F', 'Av. Galo Plaza 321', '0987654364', 'estefania.guzman@email.com', 1),
('1750012389', 'Jonathan Paul', 'Viteri Salinas', '2005-04-05', 'M', 'Calle Amazonas 876', '0987654365', 'jonathan.viteri@email.com', 1),
('1750012390', 'Brenda Lissette', 'Pazmiño Ríos', '2006-01-18', 'F', 'Av. de la Prensa 543', '0987654366', 'brenda.pazmino@email.com', 1),
('1750012391', 'Gustavo Adolfo', 'León Castro', '2005-08-23', 'M', 'Calle San Gregorio 210', '0987654367', 'gustavo.leon@email.com', 1),
('1750012392', 'Diana Marisol', 'Sánchez Jaramillo', '2005-10-09', 'F', 'Av. Interoceánica 987', '0987654368', 'diana.sanchez@email.com', 1),
('1750012393', 'Ricardo Alfonso', 'Méndez Cordero', '2005-06-27', 'M', 'Calle Bellavista 654', '0987654369', 'ricardo.mendez@email.com', 1),
('1750012394', 'María Belén', 'Villacres Salvatierra', '2006-03-14', 'F', 'Av. Morán Valverde 321', '0987654370', 'maria.villacres@email.com', 1),
-- ------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------
-- Institución 2 (50 estudiantes)
('1750023456', 'Ana Lucía', 'Rodríguez Paz', '2005-05-18', 'F', 'Calle 1011, Guayaquil', '0987654422', 'ana.rodriguez@email.com', 2),
('1750023457', 'Pedro Alfonso', 'Martínez Sánchez', '2005-11-30', 'M', 'Av. 9 de Octubre 1213, Guayaquil', '0987654423', 'pedro.martinez@email.com', 2),
('1750023458', 'Carlos Eduardo', 'Gómez Zambrano', '2005-08-12', 'M', 'Calle Boyacá 234', '0987654424', 'carlos.gomez@email.com', 2),
('1750023459', 'María Gabriela', 'Suárez Vélez', '2006-01-25', 'F', 'Av. Francisco de Orellana 567', '0987654425', 'maria.suarez@email.com', 2),
('1750023460', 'Fernando José', 'Díaz Cordero', '2005-07-03', 'M', 'Calle Julián Coronel 890', '0987654426', 'fernando.diaz@email.com', 2),
('1750023461', 'Patricia Elizabeth', 'Vera Mendoza', '2005-04-15', 'F', 'Av. Juan Tanca Marengo 1234', '0987654427', 'patricia.vera@email.com', 2),
('1750023462', 'Roberto Andrés', 'Pazmiño López', '2005-12-08', 'M', 'Cle. Luis Urdaneta 456', '0987654428', 'roberto.pazmino@email.com', 2),
('1750023463', 'Diana Carolina', 'Salazar Ríos', '2006-02-19', 'F', 'Av. Las Américas 789', '0987654429', 'diana.salazar@email.com', 2),
('1750023464', 'Jorge Luis', 'Castro Torres', '2005-09-11', 'M', 'Cle. Aguirre 1011', '0987654430', 'jorge.castro@email.com', 2),
('1750023465', 'Gabriela Alejandra', 'Molina Vélez', '2005-06-22', 'F', 'Av. Delta 1213', '0987654431', 'gabriela.molina@email.com', 2),
('1750023466', 'Luis Fernando', 'Rosales Haro', '2005-10-05', 'M', 'Cle. Carchi 1415', '0987654432', 'luis.rosales@email.com', 2),
('1750023467', 'Sofía Margarita', 'Vargas Jaramillo', '2006-03-30', 'F', 'Av. Pedro Menéndez Gilbert 1617', '0987654433', 'sofia.vargas@email.com', 2),
('1750023468', 'David Alejandro', 'Ordoñez Salinas', '2005-07-17', 'M', 'Cle. Portete 1819', '0987654434', 'david.ordonez@email.com', 2),
('1750023469', 'Karen Daniela', 'Córdova Paz', '2005-11-24', 'F', 'Av. Guillermo Cubillo 2021', '0987654435', 'karen.cordova@email.com', 2),
('1750023470', 'José Manuel', 'Barrera López', '2005-05-08', 'M', 'Cle. Vélez 2223', '0987654436', 'jose.barrera@email.com', 2),
('1750023471', 'María José', 'Santillán Ríos', '2006-01-12', 'F', 'Av. Carlos Julio Arosemena 2425', '0987654437', 'maria.santillan@email.com', 2),
('1750023472', 'Pablo Andrés', 'Figueroa Mendoza', '2005-08-27', 'M', 'Cle. Huancavilca 2627', '0987654438', 'pablo.figueroa@email.com', 2),
('1750023473', 'Andrea Nicole', 'Palacios Castro', '2005-04-03', 'F', 'Av. Francisco de Marcos 2829', '0987654439', 'andrea.palacios@email.com', 2),
('1750023474', 'Mario Xavier', 'Vallejo Zambrano', '2005-12-16', 'M', 'Cle. Alejo Lascano 3031', '0987654440', 'mario.vallejo@email.com', 2),
('1750023475', 'Jessica Pamela', 'Escobar Vélez', '2006-02-28', 'F', 'Av. Juan Pueblo 3233', '0987654441', 'jessica.escobar@email.com', 2),
('1750023476', 'Oscar René', 'Ponce Salazar', '2005-09-09', 'M', 'Cle. 25 de Julio 3435', '0987654442', 'oscar.ponce@email.com', 2),
('1750023477', 'Natalia Elizabeth', 'Rosales Cordero', '2005-06-14', 'F', 'Av. Miguel H. Alcívar 3637', '0987654443', 'natalia.rosales@email.com', 2),
('1750023478', 'Christian David', 'Ávila López', '2005-10-31', 'M', 'Cle. Tungurahua 3839', '0987654444', 'christian.avila@email.com', 2),
('1750023479', 'Katherine Lorena', 'Chávez Torres', '2006-03-15', 'F', 'Av. Benjamín Carrión 4041', '0987654445', 'katherine.chavez@email.com', 2),
('1750023480', 'José Antonio', 'Miranda Ríos', '2005-07-22', 'M', 'Cle. El Oro 4243', '0987654446', 'jose.miranda@email.com', 2),
('1750023481', 'Paola Vanessa', 'Villacís Haro', '2005-11-05', 'F', 'Av. José María Egas 4445', '0987654447', 'paola.villacis@email.com', 2),
('1750023482', 'Walter Fernando', 'Gómez Jaramillo', '2006-01-18', 'M', 'Cle. Manabí 4647', '0987654448', 'walter.gomez@email.com', 2),
('1750023483', 'Lissette Alexandra', 'Torres Salinas', '2005-08-03', 'F', 'Av. Juan Montalvo 4849', '0987654449', 'lissette.torres@email.com', 2),
('1750023484', 'Alex Javier', 'Salinas Vélez', '2005-04-26', 'M', 'Cle. Los Ríos 5051', '0987654450', 'alex.salinas@email.com', 2),
('1750023485', 'Mónica Patricia', 'Lara Paz', '2006-02-09', 'F', 'Av. Abdón Calderón 5253', '0987654451', 'monica.lara@email.com', 2),
('1750023486', 'Vinicio Marcelo', 'Peñaherrera López', '2005-09-12', 'M', 'Cle. Chimborazo 5455', '0987654452', 'vinicio.penaherrera@email.com', 2),
('1750023487', 'Gabriela Estefanía', 'Vélez Ríos', '2005-06-25', 'F', 'Av. Olmedo 5657', '0987654453', 'gabriela.velez@email.com', 2),
('1750023488', 'Patricio Andrés', 'Ríos Castro', '2005-12-30', 'M', 'Cle. Pichincha 5859', '0987654454', 'patricio.rios@email.com', 2),
('1750023489', 'Jennifer Lorena', 'Molina Zambrano', '2006-03-05', 'F', 'Av. Quito 6061', '0987654455', 'jennifer.molina@email.com', 2),
('1750023490', 'Mauricio Javier', 'Castillo Vélez', '2005-07-08', 'M', 'Cle. Guayas 6263', '0987654456', 'mauricio.castillo@email.com', 2),
('1750023491', 'Carolina Alejandra', 'Benavides Salazar', '2005-10-21', 'F', 'Av. Machala 6465', '0987654457', 'carolina.benavides@email.com', 2),
('1750023492', 'Fabricio Andrés', 'Espinosa López', '2005-05-14', 'M', 'Cle. Esmeraldas 6667', '0987654458', 'fabricio.espinosa@email.com', 2),
('1750023493', 'Domenica Michelle', 'Carrasco Torres', '2006-01-27', 'F', 'Av. Cuenca 6869', '0987654459', 'domenica.carrasco@email.com', 2),
('1750023494', 'Byron Xavier', 'Andrade Ríos', '2005-08-10', 'M', 'Cle. Loja 7071', '0987654460', 'byron.andrade@email.com', 2),
('1750023495', 'Estefanía Maribel', 'Guzmán Haro', '2005-04-03', 'F', 'Av. Milagro 7273', '0987654461', 'estefania.guzman@email.com', 2),
('1750023496', 'Jonathan Paul', 'Viteri Jaramillo', '2005-11-16', 'M', 'Cle. Daule 7475', '0987654462', 'jonathan.viteri@email.com', 2),
('1750023497', 'Brenda Lissette', 'Pazmiño Salinas', '2006-02-19', 'F', 'Av. Durán 7677', '0987654463', 'brenda.pazmino@email.com', 2),
('1750023498', 'Gustavo Adolfo', 'León Vélez', '2005-09-02', 'M', 'Cle. Samborondón 7879', '0987654464', 'gustavo.leon@email.com', 2),
('1750023499', 'Diana Marisol', 'Sánchez Paz', '2005-06-15', 'F', 'Av. Naranjal 8081', '0987654465', 'diana.sanchez@email.com', 2),
('1750023500', 'Ricardo Alfonso', 'Méndez López', '2005-12-28', 'M', 'Cle. Yaguachi 8283', '0987654466', 'ricardo.mendez@email.com', 2),
('1750023501', 'María Belén', 'Villacres Torres', '2006-03-11', 'F', 'Av. Babahoyo 8485', '0987654467', 'maria.villacres@email.com', 2),
('1750023502', 'Juan Carlos', 'Paredes Ríos', '2005-07-24', 'M', 'Cle. Vinces 8687', '0987654468', 'juan.paredes@email.com', 2),
('1750023503', 'María Fernanda', 'Córdova Castro', '2005-10-07', 'F', 'Av. Quevedo 8889', '0987654469', 'maria.cordova@email.com', 2),
('1750023504', 'Diego Armando', 'Salvatierra Zambrano', '2005-05-20', 'M', 'Cle. Jipijapa 9091', '0987654470', 'diego.salvatierra@email.com', 2),
('1750023505', 'Nataly Elizabeth', 'Escobar Vélez', '2006-01-03', 'F', 'Av. Manta 9293', '0987654471', 'nataly.escobar@email.com', 2),
-- ------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------
-- Institución 3 (50 estudiantes)
('1750034567', 'Luisa Fernanda', 'González López', '2006-02-14', 'F', 'Calle Larga 1415, Cuenca', '0987654523', 'luisa.gonzalez@email.com', 3),
('1750034568', 'Diego Alejandro', 'Hernández Castro', '2005-09-25', 'M', 'Av. Loja 1617, Cuenca', '0987654524', 'diego.hernandez@email.com', 3),
('1750034569', 'María José', 'Vázquez Mendoza', '2005-07-18', 'F', 'Calle Simón Bolívar 1819', '0987654525', 'maria.vazquez@email.com', 3),
('1750034570', 'Carlos Andrés', 'Torres Salazar', '2005-11-30', 'M', 'Av. Fray Vicente Solano 2021', '0987654526', 'carlos.torres@email.com', 3),
('1750034571', 'Andrea Carolina', 'Dávila Cordero', '2006-03-22', 'F', 'Calle Gran Colombia 2223', '0987654527', 'andrea.davila@email.com', 3),
('1750034572', 'José Luis', 'Paredes Vélez', '2005-08-15', 'M', 'Av. Manuel J. Calle 2425', '0987654528', 'jose.paredes@email.com', 3),
('1750034573', 'Sofía Alejandra', 'Molina Ríos', '2005-05-08', 'F', 'Calle Presidente Córdova 2627', '0987654529', 'sofia.molina@email.com', 3),
('1750034574', 'David Esteban', 'Carrasco Paz', '2005-12-21', 'M', 'Av. Huayna Cápac 2829', '0987654530', 'david.carrasco@email.com', 3),
('1750034575', 'Daniela Patricia', 'Salinas López', '2006-01-14', 'F', 'Calle Mariscal Sucre 3031', '0987654531', 'daniela.salinas@email.com', 3),
('1750034576', 'Fernando Xavier', 'Vélez Jaramillo', '2005-10-07', 'M', 'Av. 12 de Abril 3233', '0987654532', 'fernando.velez@email.com', 3),
('1750034577', 'Gabriela Michelle', 'Guzmán Torres', '2005-04-30', 'F', 'Calle Benigno Malo 3435', '0987654533', 'gabriela.guzman@email.com', 3),
('1750034578', 'Pablo Andrés', 'Figueroa Castro', '2005-09-12', 'M', 'Av. Don Bosco 3637', '0987654534', 'pablo.figueroa@email.com', 3),
('1750034579', 'Melissa Raquel', 'Rojas Zambrano', '2006-02-25', 'F', 'Calle Luis Cordero 3839', '0987654535', 'melissa.rojas@email.com', 3),
('1750034580', 'Roberto Carlos', 'Mendoza López', '2005-07-18', 'M', 'Av. Pumapungo 4041', '0987654536', 'roberto.mendoza@email.com', 3),
('1750034581', 'Karen Dayana', 'Suárez Viteri', '2005-12-11', 'F', 'Calle Tarqui 4243', '0987654537', 'karen.suarez@email.com', 3),
('1750034582', 'Jorge Luis', 'Vera Castillo', '2005-05-04', 'M', 'Av. Solano 4445', '0987654538', 'jorge.vera@email.com', 3),
('1750034583', 'Diana Carolina', 'Córdova Paz', '2006-03-17', 'F', 'Calle Borrero 4647', '0987654539', 'diana.cordova@email.com', 3),
('1750034584', 'Mario Alfredo', 'Barrera Salinas', '2005-10-10', 'M', 'Av. Las Américas 4849', '0987654540', 'mario.barrera@email.com', 3),
('1750034585', 'Jessica Pamela', 'Narváez Gómez', '2005-08-23', 'F', 'Calle Hermano Miguel 5051', '0987654541', 'jessica.narvaez@email.com', 3),
('1750034586', 'Oscar René', 'Carvajal Haro', '2005-06-16', 'M', 'Av. Ordoñez Lasso 5253', '0987654542', 'oscar.carvajal@email.com', 3),
('1750034587', 'María Fernanda', 'Palacios Ruiz', '2006-01-29', 'F', 'Calle Juan Jaramillo 5455', '0987654543', 'maria.palacios@email.com', 3),
('1750034588', 'Diego Armando', 'Vallejo Molina', '2005-09-02', 'M', 'Av. Ricardo Darquea 5657', '0987654544', 'diego.vallejo@email.com', 3),
('1750034589', 'Nataly Elizabeth', 'Escobar Guzmán', '2005-04-15', 'F', 'Calle Miguel Vélez 5859', '0987654545', 'nataly.escobar@email.com', 3),
('1750034590', 'Wilson Eduardo', 'Ponce León', '2005-11-28', 'M', 'Av. Fray Vicente Solano 6061', '0987654546', 'wilson.ponce@email.com', 3),
('1750034591', 'Stephanie Nicole', 'Rosales Vélez', '2006-02-10', 'F', 'Calle Gaspar Sangurima 6263', '0987654547', 'stephanie.rosales@email.com', 3),
('1750034592', 'Christian David', 'Ávila Mendoza', '2005-07-03', 'M', 'Av. Loja 6465', '0987654548', 'christian.avila@email.com', 3),
('1750034593', 'Katherine Lorena', 'Chávez Salvatierra', '2005-12-26', 'F', 'Calle Presidente Borrero 6667', '0987654549', 'katherine.chavez@email.com', 3),
('1750034594', 'José Antonio', 'Miranda Ríos', '2005-05-19', 'M', 'Av. Manuel Vega 6869', '0987654550', 'jose.miranda@email.com', 3),
('1750034595', 'Paola Vanessa', 'Villacís Ortega', '2006-01-01', 'F', 'Calle Luis Moreno Mora 7071', '0987654551', 'paola.villacis@email.com', 3),
('1750034596', 'Walter Fernando', 'Gómez Paredes', '2005-08-14', 'M', 'Av. Diego de Tapia 7273', '0987654552', 'walter.gomez@email.com', 3),
('1750034597', 'Lissette Alexandra', 'Torres Zambrano', '2005-06-07', 'F', 'Calle Juan Montalvo 7475', '0987654553', 'lissette.torres@email.com', 3),
('1750034598', 'Alex Javier', 'Salinas Castro', '2005-11-20', 'M', 'Av. 12 de Noviembre 7677', '0987654554', 'alex.salinas@email.com', 3),
('1750034599', 'Mónica Patricia', 'Lara Jaramillo', '2006-03-05', 'F', 'Calle Honorato Vásquez 7879', '0987654555', 'monica.lara@email.com', 3),
('1750034600', 'Vinicio Marcelo', 'Peñaherrera Sánchez', '2005-10-18', 'M', 'Av. Gil Ramírez Dávalos 8081', '0987654556', 'vinicio.penaherrera@email.com', 3),
('1750034601', 'Gabriela Estefanía', 'Vélez Cordero', '2005-07-11', 'F', 'Calle Federico Proaño 8283', '0987654557', 'gabriela.velez@email.com', 3),
('1750034602', 'Patricio Andrés', 'Ríos Haro', '2005-12-24', 'M', 'Av. Fray Vicente Solano 8485', '0987654558', 'patricio.rios@email.com', 3),
('1750034603', 'Jennifer Lorena', 'Molina Pazmiño', '2006-02-06', 'F', 'Calle Antonio Borrero 8687', '0987654559', 'jennifer.molina@email.com', 3),
('1750034604', 'Mauricio Javier', 'Castillo Salazar', '2005-09-19', 'M', 'Av. Pumapungo 8889', '0987654560', 'mauricio.castillo@email.com', 3),
('1750034605', 'Carolina Alejandra', 'Benavides López', '2005-04-02', 'F', 'Calle Miguel León 9091', '0987654561', 'carolina.benavides@email.com', 3),
('1750034606', 'Fabricio Andrés', 'Espinosa Vélez', '2005-11-15', 'M', 'Av. Solano 9293', '0987654562', 'fabricio.espinosa@email.com', 3),
('1750034607', 'Domenica Michelle', 'Carrasco Reyes', '2006-01-28', 'F', 'Calle Coronel Talbot 9495', '0987654563', 'domenica.carrasco@email.com', 3),
('1750034608', 'Byron Xavier', 'Andrade Mendoza', '2005-08-11', 'M', 'Av. Las Américas 9697', '0987654564', 'byron.andrade@email.com', 3),
('1750034609', 'Estefanía Maribel', 'Guzmán Torres', '2005-05-24', 'F', 'Calle Daniel Córdova 9899', '0987654565', 'estefania.guzman@email.com', 3),
('1750034610', 'Jonathan Paul', 'Viteri Salinas', '2005-10-07', 'M', 'Av. Ordoñez Lasso 100101', '0987654566', 'jonathan.viteri@email.com', 3),
('1750034611', 'Brenda Lissette', 'Pazmiño Ríos', '2006-03-20', 'F', 'Calle Manuel J. Calle 102103', '0987654567', 'brenda.pazmino@email.com', 3),
('1750034612', 'Gustavo Adolfo', 'León Castro', '2005-07-13', 'M', 'Av. Ricardo Darquea 104105', '0987654568', 'gustavo.leon@email.com', 3),
('1750034613', 'Diana Marisol', 'Sánchez Jaramillo', '2005-12-06', 'F', 'Calle Miguel Vélez 106107', '0987654569', 'diana.sanchez@email.com', 3),
('1750034614', 'Ricardo Alfonso', 'Méndez Cordero', '2005-09-29', 'M', 'Av. Fray Vicente Solano 108109', '0987654570', 'ricardo.mendez@email.com', 3),
('1750034615', 'María Belén', 'Villacres Salvatierra', '2006-02-11', 'F', 'Calle Gaspar Sangurima 110111', '0987654571', 'maria.villacres@email.com', 3),
('1750034616', 'Juan Carlos', 'Paredes Ríos', '2005-06-04', 'M', 'Av. Loja 112113', '0987654572', 'juan.paredes@email.com', 3);

-- -----------------------------------------------------------------------------------
-- 3. Responsables (100 registros - aproximadamente 2 por estudiante)
-- -----------------------------------------------------------------------------------
INSERT INTO Responsables (cedula, nombres, apellidos, parentesco, telefono, email, direccion)
VALUES 
-- Responsables para estudiantes de institución 1
('1712345678', 'Carlos Andrés', 'Pérez Ruiz', 'Padre', '0987654333', 'carlos.perez@email.com', 'Calle 123, Quito'),
('1712345679', 'Ana María', 'Pérez González', 'Madre', '0987654334', 'ana.perez@email.com', 'Calle 123, Quito'),
('1712345680', 'José Luis', 'López Mendoza', 'Padre', '0987654335', 'jose.lopez@email.com', 'Av. Principal 456, Quito'),
('1712345681', 'María Elena', 'López Martínez', 'Madre', '0987654336', 'maria.lopez@email.com', 'Av. Principal 456, Quito'),
('1712345682', 'Fernando Xavier', 'García Salazar', 'Padre', '0987654337', 'fernando.garcia@email.com', 'Calle 789, Quito'),
('1712345683', 'Lucía Margarita', 'García Ruiz', 'Madre', '0987654338', 'lucia.garcia@email.com', 'Calle 789, Quito'),
('1712345684', 'Alberto Juan', 'Vargas Cordero', 'Padre', '0987654339', 'alberto.vargas@email.com', 'Av. Amazonas 2345'),
('1712345685', 'Patricia Elizabeth', 'Vargas Mendoza', 'Madre', '0987654340', 'patricia.vargas@email.com', 'Av. Amazonas 2345'),
('1712345686', 'Luis Antonio', 'Morales Vélez', 'Padre', '0987654341', 'luis.morales@email.com', 'Calle Galápagos 678'),
('1712345687', 'Carmen Rosa', 'Morales Salazar', 'Madre', '0987654342', 'carmen.morales@email.com', 'Calle Galápagos 678'),
('1712345688', 'Ricardo Alfonso', 'Castro Benítez', 'Padre', '0987654343', 'ricardo.castro@email.com', 'Av. Shyris 1001'),
('1712345689', 'Sandra Maribel', 'Castro Benítez', 'Madre', '0987654344', 'sandra.castro@email.com', 'Av. Shyris 1001'),
('1712345690', 'Oscar René', 'Ortega Pazmiño', 'Padre', '0987654345', 'oscar.ortega@email.com', 'Calle Rumipamba 456'),
('1712345691', 'Verónica Alexandra', 'Ortega Pazmiño', 'Madre', '0987654346', 'veronica.ortega@email.com', 'Calle Rumipamba 456'),
('1712345692', 'Juan Pablo', 'Santillán Reyes', 'Padre', '0987654347', 'juan.santillan@email.com', 'Av. 6 de Diciembre 789'),
('1712345693', 'Mónica Patricia', 'Santillán Reyes', 'Madre', '0987654348', 'monica.santillan@email.com', 'Av. 6 de Diciembre 789'),
('1712345694', 'Pedro José', 'Zambrano Vélez', 'Padre', '0987654349', 'pedro.zambrano@email.com', 'Calle Toledo 321'),
('1712345695', 'Laura Estefanía', 'Zambrano Vélez', 'Madre', '0987654350', 'laura.zambrano@email.com', 'Calle Toledo 321'),
('1712345696', 'Fernando Xavier', 'Paredes Cordero', 'Padre', '0987654351', 'fernando.paredes@email.com', 'Av. Occidental 654'),
('1712345697', 'Diana Carolina', 'Paredes Cordero', 'Madre', '0987654352', 'diana.paredes@email.com', 'Av. Occidental 654'),
('1712345698', 'Roberto Carlos', 'Guerrero Jaramillo', 'Padre', '0987654353', 'roberto.guerrero@email.com', 'Calle Almagro 987'),
('1712345699', 'María Fernanda', 'Guerrero Jaramillo', 'Madre', '0987654354', 'maria.guerrero@email.com', 'Calle Almagro 987'),
('1712345700', 'José Antonio', 'Salazar Torres', 'Padre', '0987654355', 'jose.salazar@email.com', 'Av. 10 de Agosto 543'),
('1712345701', 'Patricia Elizabeth', 'Salazar Torres', 'Madre', '0987654356', 'patricia.salazar@email.com', 'Av. 10 de Agosto 543'),
('1712345702', 'Luis Fernando', 'Figueroa Espinoza', 'Padre', '0987654357', 'luis.figueroa@email.com', 'Calle Mariana de Jesús 210'),
('1712345703', 'Gabriela Michelle', 'Figueroa Espinoza', 'Madre', '0987654358', 'gabriela.figueroa@email.com', 'Calle Mariana de Jesús 210'),
('1712345704', 'Carlos Andrés', 'Rojas Zambrano', 'Padre', '0987654359', 'carlos.rojas@email.com', 'Av. Colón 876'),
('1712345705', 'María José', 'Rojas Zambrano', 'Madre', '0987654360', 'maria.rojas@email.com', 'Av. Colón 876'),
('1712345706', 'Juan Carlos', 'Mendoza López', 'Padre', '0987654361', 'juan.mendoza@email.com', 'Calle Whymper 432'),
('1712345707', 'Ana Lucía', 'Mendoza López', 'Madre', '0987654362', 'ana.mendoza@email.com', 'Calle Whymper 432'),
('1712345708', 'Pedro Alfonso', 'Suárez Viteri', 'Padre', '0987654363', 'pedro.suarez@email.com', 'Av. América 765'),
('1712345709', 'Sofía Alejandra', 'Suárez Viteri', 'Madre', '0987654364', 'sofia.suarez@email.com', 'Av. América 765'),
('1712345710', 'Diego Armando', 'Vera Castillo', 'Padre', '0987654365', 'diego.vera@email.com', 'Calle Juan León Mera 109'),
('1712345711', 'Daniela Carolina', 'Vera Castillo', 'Madre', '0987654366', 'daniela.vera@email.com', 'Calle Juan León Mera 109'),
('1712345712', 'Mario Alfredo', 'Córdova Paz', 'Padre', '0987654367', 'mario.cordova@email.com', 'Av. Coruña 298'),
('1712345713', 'Jessica Pamela', 'Córdova Paz', 'Madre', '0987654368', 'jessica.cordova@email.com', 'Av. Coruña 298'),
('1712345714', 'Oscar René', 'Barrera Salinas', 'Padre', '0987654369', 'oscar.barrera@email.com', 'Calle Portugal 654'),
('1712345715', 'Nataly Elizabeth', 'Barrera Salinas', 'Madre', '0987654370', 'nataly.barrera@email.com', 'Calle Portugal 654'),
('1712345716', 'Wilson Eduardo', 'Narváez Gómez', 'Padre', '0987654371', 'wilson.narvaez@email.com', 'Av. Eloy Alfaro 321'),
('1712345717', 'Stephanie Nicole', 'Narváez Gómez', 'Madre', '0987654372', 'stephanie.narvaez@email.com', 'Av. Eloy Alfaro 321'),
('1712345718', 'Christian David', 'Carvajal Haro', 'Padre', '0987654373', 'christian.carvajal@email.com', 'Calle Río Coca 876'),
('1712345719', 'Katherine Lorena', 'Carvajal Haro', 'Madre', '0987654374', 'katherine.carvajal@email.com', 'Calle Río Coca 876'),
('1712345720', 'José Luis', 'Palacios Ruiz', 'Padre', '0987654375', 'jose.palacios@email.com', 'Av. de los Shyris 543'),
('1712345721', 'María Belén', 'Palacios Ruiz', 'Madre', '0987654376', 'maria.palacios@email.com', 'Av. de los Shyris 543'),
('1712345722', 'Pablo Andrés', 'Vallejo Molina', 'Padre', '0987654377', 'pablo.vallejo@email.com', 'Calle La Niña 210'),
('1712345723', 'Melissa Raquel', 'Vallejo Molina', 'Madre', '0987654378', 'melissa.vallejo@email.com', 'Calle La Niña 210'),
('1712345724', 'Roberto Carlos', 'Escobar Guzmán', 'Padre', '0987654379', 'roberto.escobar@email.com', 'Av. Mariscal Sucre 987'),
('1712345725', 'Karen Dayana', 'Escobar Guzmán', 'Madre', '0987654380', 'karen.escobar@email.com', 'Av. Mariscal Sucre 987'),
('1712345726', 'Jorge Luis', 'Ponce León', 'Padre', '0987654381', 'jorge.ponce@email.com', 'Calle Guayaquil 654'),
('1712345727', 'Diana Carolina', 'Ponce León', 'Madre', '0987654382', 'diana.ponce@email.com', 'Calle Guayaquil 654'),
-- ------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------
-- Responsables para estudiantes de institución 2
('1723456789', 'María Fernanda', 'Rodríguez Paz', 'Madre', '0987654434', 'maria.rodriguez@email.com', 'Calle 1011, Guayaquil'),
('1723456790', 'Roberto Carlos', 'Martínez López', 'Padre', '0987654435', 'roberto.martinez@email.com', 'Av. 9 de Octubre 1213, Guayaquil'),
('1723456791', 'Carlos Eduardo', 'Gómez Zambrano', 'Padre', '0987654436', 'carlos.gomez@email.com', 'Calle Boyacá 234'),
('1723456792', 'Ana Lucía', 'Suárez Vélez', 'Madre', '0987654437', 'ana.suarez@email.com', 'Av. Francisco de Orellana 567'),
('1723456793', 'Fernando José', 'Díaz Cordero', 'Padre', '0987654438', 'fernando.diaz@email.com', 'Calle Julián Coronel 890'),
('1723456794', 'Patricia Elizabeth', 'Vera Mendoza', 'Madre', '0987654439', 'patricia.vera@email.com', 'Av. Juan Tanca Marengo 1234'),
('1723456795', 'Roberto Andrés', 'Pazmiño López', 'Padre', '0987654440', 'roberto.pazmino@email.com', 'Calle Luis Urdaneta 456'),
('1723456796', 'Diana Carolina', 'Salazar Ríos', 'Madre', '0987654441', 'diana.salazar@email.com', 'Av. Las Américas 789'),
('1723456797', 'Jorge Luis', 'Castro Torres', 'Padre', '0987654442', 'jorge.castro@email.com', 'Calle Aguirre 1011'),
('1723456798', 'Gabriela Alejandra', 'Molina Vélez', 'Madre', '0987654443', 'gabriela.molina@email.com', 'Av. Delta 1213'),
('1723456799', 'Luis Fernando', 'Rosales Haro', 'Padre', '0987654444', 'luis.rosales@email.com', 'Calle Carchi 1415'),
('1723456800', 'Sofía Margarita', 'Vargas Jaramillo', 'Madre', '0987654445', 'sofia.vargas@email.com', 'Av. Pedro Menéndez Gilbert 1617'),
('1723456801', 'David Alejandro', 'Ordoñez Salinas', 'Padre', '0987654446', 'david.ordonez@email.com', 'Calle Portete 1819'),
('1723456802', 'Karen Daniela', 'Córdova Paz', 'Madre', '0987654447', 'karen.cordova@email.com', 'Av. Guillermo Cubillo 2021'),
('1723456803', 'José Manuel', 'Barrera López', 'Padre', '0987654448', 'jose.barrera@email.com', 'Calle Vélez 2223'),
('1723456804', 'María José', 'Santillán Ríos', 'Madre', '0987654449', 'maria.santillan@email.com', 'Av. Carlos Julio Arosemena 2425'),
('1723456805', 'Pablo Andrés', 'Figueroa Mendoza', 'Padre', '0987654450', 'pablo.figueroa@email.com', 'Calle Huancavilca 2627'),
('1723456806', 'Andrea Nicole', 'Palacios Castro', 'Madre', '0987654451', 'andrea.palacios@email.com', 'Av. Francisco de Marcos 2829'),
('1723456807', 'Mario Xavier', 'Vallejo Zambrano', 'Padre', '0987654452', 'mario.vallejo@email.com', 'Calle Alejo Lascano 3031'),
('1723456808', 'Jessica Pamela', 'Escobar Vélez', 'Madre', '0987654453', 'jessica.escobar@email.com', 'Av. Juan Pueblo 3233'),
('1723456809', 'Oscar René', 'Ponce Salazar', 'Padre', '0987654454', 'oscar.ponce@email.com', 'Calle 25 de Julio 3435'),
('1723456810', 'Natalia Elizabeth', 'Rosales Cordero', 'Madre', '0987654455', 'natalia.rosales@email.com', 'Av. Miguel H. Alcívar 3637'),
('1723456811', 'Christian David', 'Ávila López', 'Padre', '0987654456', 'christian.avila@email.com', 'Calle Tungurahua 3839'),
('1723456812', 'Katherine Lorena', 'Chávez Torres', 'Madre', '0987654457', 'katherine.chavez@email.com', 'Av. Benjamín Carrión 4041'),
('1723456813', 'José Antonio', 'Miranda Ríos', 'Padre', '0987654458', 'jose.miranda@email.com', 'Calle El Oro 4243'),
('1723456814', 'Paola Vanessa', 'Villacís Haro', 'Madre', '0987654459', 'paola.villacis@email.com', 'Av. José María Egas 4445'),
('1723456815', 'Walter Fernando', 'Gómez Jaramillo', 'Padre', '0987654460', 'walter.gomez@email.com', 'Calle Manabí 4647'),
('1723456816', 'Lissette Alexandra', 'Torres Salinas', 'Madre', '0987654461', 'lissette.torres@email.com', 'Av. Juan Montalvo 4849'),
('1723456817', 'Alex Javier', 'Salinas Vélez', 'Padre', '0987654462', 'alex.salinas@email.com', 'Calle Los Ríos 5051'),
('1723456818', 'Mónica Patricia', 'Lara Paz', 'Madre', '0987654463', 'monica.lara@email.com', 'Av. Abdón Calderón 5253'),
('1723456819', 'Vinicio Marcelo', 'Peñaherrera López', 'Padre', '0987654464', 'vinicio.penaherrera@email.com', 'Calle Chimborazo 5455'),
('1723456820', 'Gabriela Estefanía', 'Vélez Ríos', 'Madre', '0987654465', 'gabriela.velez@email.com', 'Av. Olmedo 5657'),
('1723456821', 'Patricio Andrés', 'Ríos Castro', 'Padre', '0987654466', 'patricio.rios@email.com', 'Calle Pichincha 5859'),
('1723456822', 'Jennifer Lorena', 'Molina Zambrano', 'Madre', '0987654467', 'jennifer.molina@email.com', 'Av. Quito 6061'),
('1723456823', 'Mauricio Javier', 'Castillo Vélez', 'Padre', '0987654468', 'mauricio.castillo@email.com', 'Calle Guayas 6263'),
('1723456824', 'Carolina Alejandra', 'Benavides Salazar', 'Madre', '0987654469', 'carolina.benavides@email.com', 'Av. Machala 6465'),
('1723456825', 'Fabricio Andrés', 'Espinosa López', 'Padre', '0987654470', 'fabricio.espinosa@email.com', 'Calle Esmeraldas 6667'),
('1723456826', 'Domenica Michelle', 'Carrasco Torres', 'Madre', '0987654471', 'domenica.carrasco@email.com', 'Av. Cuenca 6869'),
('1723456827', 'Byron Xavier', 'Andrade Ríos', 'Padre', '0987654472', 'byron.andrade@email.com', 'Calle Loja 7071'),
('1723456828', 'Estefanía Maribel', 'Guzmán Haro', 'Madre', '0987654473', 'estefania.guzman@email.com', 'Av. Milagro 7273'),
('1723456829', 'Jonathan Paul', 'Viteri Jaramillo', 'Padre', '0987654474', 'jonathan.viteri@email.com', 'Calle Daule 7475'),
('1723456830', 'Brenda Lissette', 'Pazmiño Salinas', 'Madre', '0987654475', 'brenda.pazmino@email.com', 'Av. Durán 7677'),
('1723456831', 'Gustavo Adolfo', 'León Vélez', 'Padre', '0987654476', 'gustavo.leon@email.com', 'Calle Samborondón 7879'),
('1723456832', 'Diana Marisol', 'Sánchez Paz', 'Madre', '0987654477', 'diana.sanchez@email.com', 'Av. Naranjal 8081'),
('1723456833', 'Ricardo Alfonso', 'Méndez López', 'Padre', '0987654478', 'ricardo.mendez@email.com', 'Calle Yaguachi 8283'),
('1723456834', 'María Belén', 'Villacres Torres', 'Madre', '0987654479', 'maria.villacres@email.com', 'Av. Babahoyo 8485'),
('1723456835', 'Juan Carlos', 'Paredes Ríos', 'Padre', '0987654480', 'juan.paredes@email.com', 'Calle Vinces 8687'),
('1723456836', 'María Fernanda', 'Córdova Castro', 'Madre', '0987654481', 'maria.cordova@email.com', 'Av. Quevedo 8889'),
('1723456837', 'Diego Armando', 'Salvatierra Zambrano', 'Padre', '0987654482', 'diego.salvatierra@email.com', 'Calle Jipijapa 9091'),
('1723456838', 'Nataly Elizabeth', 'Escobar Vélez', 'Madre', '0987654483', 'nataly.escobar@email.com', 'Av. Manta 9293'),
-- ------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------
-- Responsables para estudiantes de institución 3
('1734567890', 'Luisa Fernanda', 'González López', 'Madre', '0987654534', 'luisa.gonzalez@email.com', 'Calle Larga 1415, Cuenca'),
('1734567891', 'Diego Alejandro', 'Hernández Castro', 'Padre', '0987654535', 'diego.hernandez@email.com', 'Av. Loja 1617, Cuenca'),
('1734567892', 'María José', 'Vázquez Mendoza', 'Madre', '0987654536', 'maria.vazquez@email.com', 'Calle Simón Bolívar 1819'),
('1734567893', 'Carlos Andrés', 'Torres Salazar', 'Padre', '0987654537', 'carlos.torres@email.com', 'Av. Fray Vicente Solano 2021'),
('1734567894', 'Andrea Carolina', 'Dávila Cordero', 'Madre', '0987654538', 'andrea.davila@email.com', 'Calle Gran Colombia 2223'),
('1734567895', 'José Luis', 'Paredes Vélez', 'Padre', '0987654539', 'jose.paredes@email.com', 'Av. Manuel J. Calle 2425'),
('1734567896', 'Sofía Alejandra', 'Molina Ríos', 'Madre', '0987654540', 'sofia.molina@email.com', 'Calle Presidente Córdova 2627'),
('1734567897', 'David Esteban', 'Carrasco Paz', 'Padre', '0987654541', 'david.carrasco@email.com', 'Av. Huayna Cápac 2829'),
('1734567898', 'Daniela Patricia', 'Salinas López', 'Madre', '0987654542', 'daniela.salinas@email.com', 'Calle Mariscal Sucre 3031'),
('1734567899', 'Fernando Xavier', 'Vélez Jaramillo', 'Padre', '0987654543', 'fernando.velez@email.com', 'Av. 12 de Abril 3233'),
('1734567900', 'Gabriela Michelle', 'Guzmán Torres', 'Madre', '0987654544', 'gabriela.guzman@email.com', 'Calle Benigno Malo 3435'),
('1734567901', 'Pablo Andrés', 'Figueroa Castro', 'Padre', '0987654545', 'pablo.figueroa@email.com', 'Av. Don Bosco 3637'),
('1734567902', 'Melissa Raquel', 'Rojas Zambrano', 'Madre', '0987654546', 'melissa.rojas@email.com', 'Calle Luis Cordero 3839'),
('1734567903', 'Roberto Carlos', 'Mendoza López', 'Padre', '0987654547', 'roberto.mendoza@email.com', 'Av. Pumapungo 4041'),
('1734567904', 'Karen Dayana', 'Suárez Viteri', 'Madre', '0987654548', 'karen.suarez@email.com', 'Calle Tarqui 4243'),
('1734567905', 'Jorge Luis', 'Vera Castillo', 'Padre', '0987654549', 'jorge.vera@email.com', 'Av. Solano 4445'),
('1734567906', 'Diana Carolina', 'Córdova Paz', 'Madre', '0987654550', 'diana.cordova@email.com', 'Calle Borrero 4647'),
('1734567907', 'Mario Alfredo', 'Barrera Salinas', 'Padre', '0987654551', 'mario.barrera@email.com', 'Av. Las Américas 4849'),
('1734567908', 'Jessica Pamela', 'Narváez Gómez', 'Madre', '0987654552', 'jessica.narvaez@email.com', 'Calle Hermano Miguel 5051'),
('1734567909', 'Oscar René', 'Carvajal Haro', 'Padre', '0987654553', 'oscar.carvajal@email.com', 'Av. Ordoñez Lasso 5253'),
('1734567910', 'María Fernanda', 'Palacios Ruiz', 'Madre', '0987654554', 'maria.palacios@email.com', 'Calle Juan Jaramillo 5455'),
('1734567911', 'Diego Armando', 'Vallejo Molina', 'Padre', '0987654555', 'diego.vallejo@email.com', 'Av. Ricardo Darquea 5657'),
('1734567912', 'Nataly Elizabeth', 'Escobar Guzmán', 'Madre', '0987654556', 'nataly.escobar@email.com', 'Calle Miguel Vélez 5859'),
('1734567913', 'Wilson Eduardo', 'Ponce León', 'Padre', '0987654557', 'wilson.ponce@email.com', 'Av. Fray Vicente Solano 6061'),
('1734567914', 'Stephanie Nicole', 'Rosales Vélez', 'Madre', '0987654558', 'stephanie.rosales@email.com', 'Calle Gaspar Sangurima 6263'),
('1734567915', 'Christian David', 'Ávila Mendoza', 'Padre', '0987654559', 'christian.avila@email.com', 'Av. Loja 6465'),
('1734567916', 'Katherine Lorena', 'Chávez Salvatierra', 'Madre', '0987654560', 'katherine.chavez@email.com', 'Calle Presidente Borrero 6667'),
('1734567917', 'José Antonio', 'Miranda Ríos', 'Padre', '0987654561', 'jose.miranda@email.com', 'Av. Manuel Vega 6869'),
('1734567918', 'Paola Vanessa', 'Villacís Ortega', 'Madre', '0987654562', 'paola.villacis@email.com', 'Calle Luis Moreno Mora 7071'),
('1734567919', 'Walter Fernando', 'Gómez Paredes', 'Padre', '0987654563', 'walter.gomez@email.com', 'Av. Diego de Tapia 7273'),
('1734567920', 'Lissette Alexandra', 'Torres Zambrano', 'Madre', '0987654564', 'lissette.torres@email.com', 'Calle Juan Montalvo 7475'),
('1734567921', 'Alex Javier', 'Salinas Castro', 'Padre', '0987654565', 'alex.salinas@email.com', 'Av. 12 de Noviembre 7677'),
('1734567922', 'Mónica Patricia', 'Lara Jaramillo', 'Madre', '0987654566', 'monica.lara@email.com', 'Calle Honorato Vásquez 7879'),
('1734567923', 'Vinicio Marcelo', 'Peñaherrera Sánchez', 'Padre', '0987654567', 'vinicio.penaherrera@email.com', 'Av. Gil Ramírez Dávalos 8081'),
('1734567924', 'Gabriela Estefanía', 'Vélez Cordero', 'Madre', '0987654568', 'gabriela.velez@email.com', 'Calle Federico Proaño 8283'),
('1734567925', 'Patricio Andrés', 'Ríos Haro', 'Padre', '0987654569', 'patricio.rios@email.com', 'Av. Fray Vicente Solano 8485'),
('1734567926', 'Jennifer Lorena', 'Molina Pazmiño', 'Madre', '0987654570', 'jennifer.molina@email.com', 'Calle Antonio Borrero 8687'),
('1734567927', 'Mauricio Javier', 'Castillo Salazar', 'Padre', '0987654571', 'mauricio.castillo@email.com', 'Av. Pumapungo 8889'),
('1734567928', 'Carolina Alejandra', 'Benavides López', 'Madre', '0987654572', 'carolina.benavides@email.com', 'Calle Miguel León 9091'),
('1734567929', 'Fabricio Andrés', 'Espinosa Vélez', 'Padre', '0987654573', 'fabricio.espinosa@email.com', 'Av. Solano 9293'),
('1734567930', 'Domenica Michelle', 'Carrasco Reyes', 'Madre', '0987654574', 'domenica.carrasco@email.com', 'Calle Coronel Talbot 9495'),
('1734567931', 'Byron Xavier', 'Andrade Mendoza', 'Padre', '0987654575', 'byron.andrade@email.com', 'Av. Las Américas 9697'),
('1734567932', 'Estefanía Maribel', 'Guzmán Torres', 'Madre', '0987654576', 'estefania.guzman@email.com', 'Calle Daniel Córdova 9899'),
('1734567933', 'Jonathan Paul', 'Viteri Salinas', 'Padre', '0987654577', 'jonathan.viteri@email.com', 'Av. Ordoñez Lasso 100101'),
('1734567934', 'Brenda Lissette', 'Pazmiño Ríos', 'Madre', '0987654578', 'brenda.pazmino@email.com', 'Calle Manuel J. Calle 102103'),
('1734567935', 'Gustavo Adolfo', 'León Castro', 'Padre', '0987654579', 'gustavo.leon@email.com', 'Av. Ricardo Darquea 104105'),
('1734567936', 'Diana Marisol', 'Sánchez Jaramillo', 'Madre', '0987654580', 'diana.sanchez@email.com', 'Calle Miguel Vélez 106107'),
('1734567937', 'Ricardo Alfonso', 'Méndez Cordero', 'Padre', '0987654581', 'ricardo.mendez@email.com', 'Av. Fray Vicente Solano 108109'),
('1734567938', 'María Belén', 'Villacres Salvatierra', 'Madre', '0987654582', 'maria.villacres@email.com', 'Calle Gaspar Sangurima 110111'),
('1734567939', 'Juan Carlos', 'Paredes Ríos', 'Padre', '0987654583', 'juan.paredes@email.com', 'Av. Loja 112113');


-- Ver estudiantes de la institución 3
SELECT estudiante_id, nombres, apellidos 
FROM Estudiantes 
WHERE institucion_id = 1
ORDER BY estudiante_id;

-- Ver responsables correspondientes
SELECT responsable_id, nombres, apellidos 
FROM Responsables 
WHERE responsable_id = 1
ORDER BY responsable_id;



-- -----------------------------------------------------------------------------------
-- 5. Docentes (30 registros - 10 por institución)
-- -----------------------------------------------------------------------------------
INSERT INTO Docentes (cedula, nombres, apellidos, fecha_nacimiento, titulo, especialidad, telefono, email, institucion_id)
VALUES 
-- Docentes institución 1 (10 registros)
('1711122233', 'Pedro Alfonso', 'Ramírez Sánchez', '1980-05-10', 'Licenciado en Matemáticas', 'Matemáticas', '0987665544', 'pedro.ramirez@email.com', 1),
('1711122234', 'Lucía Fernanda', 'Mendoza Paz', '1982-11-20', 'Licenciada en Literatura', 'Lenguaje y Comunicación', '0987665545', 'lucia.mendoza@email.com', 1),
('1711122235', 'Carlos Andrés', 'Vega Morales', '1975-08-15', 'Magíster en Física', 'Física', '0987665546', 'carlos.vega@email.com', 1),
('1711122236', 'María José', 'Torres Zambrano', '1983-04-25', 'Licenciada en Ciencias Sociales', 'Estudios Sociales', '0987665547', 'maria.torres@email.com', 1),
('1711122237', 'Fernando Xavier', 'Pazmiño López', '1979-12-05', 'Doctor en Química', 'Química', '0987665548', 'fernando.pazmino@email.com', 1),
('1711122238', 'Ana Lucía', 'Guerrero Castro', '1981-07-30', 'Licenciada en Biología', 'Biología', '0987665549', 'ana.guerrero@email.com', 1),
('1711122239', 'Diego Armando', 'Salazar Ríos', '1977-09-18', 'Licenciado en Educación Física', 'Educación Física', '0987665550', 'diego.salazar@email.com', 1),
('1711122240', 'Patricia Elizabeth', 'Vélez Cordero', '1984-03-22', 'Licenciada en Artes Plásticas', 'Arte', '0987665551', 'patricia.velez@email.com', 1),
('1711122241', 'Juan Pablo', 'Molina Benítez', '1976-06-12', 'Licenciado en Informática', 'Informática Educativa', '0987665552', 'juan.molina@email.com', 1),
('1711122242', 'Gabriela Michelle', 'Suárez Viteri', '1980-10-08', 'Licenciada en Psicología Educativa', 'Desarrollo Humano', '0987665553', 'gabriela.suarez@email.com', 1),
-- ------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------
-- Docentes institución 2 (10 registros)
('1722334455', 'Roberto Carlos', 'Gómez López', '1978-03-15', 'Ingeniero en Ciencias', 'Física', '0987665645', 'roberto.gomez@email.com', 2),
('1722334456', 'Sofía Alejandra', 'Castro Méndez', '1985-07-22', 'Licenciada en Idiomas', 'Inglés', '0987665646', 'sofia.castro@email.com', 2),
('1722334457', 'Luis Fernando', 'Vélez Zambrano', '1976-11-30', 'Magíster en Matemáticas', 'Matemáticas Avanzadas', '0987665647', 'luis.velez@email.com', 2),
('1722334458', 'María Fernanda', 'Rosales Paz', '1982-09-14', 'Licenciada en Literatura', 'Lengua y Literatura', '0987665648', 'maria.rosales@email.com', 2),
('1722334459', 'Carlos Eduardo', 'Mendoza Salazar', '1979-05-18', 'Doctor en Química', 'Química Orgánica', '0987665649', 'carlos.mendoza@email.com', 2),
('1722334460', 'Patricia Maribel', 'Ordoñez Ríos', '1983-12-05', 'Licenciada en Biología', 'Ciencias Naturales', '0987665650', 'patricia.ordonez@email.com', 2),
('1722334461', 'Fernando José', 'Paredes Castro', '1977-08-22', 'Licenciado en Historia', 'Estudios Sociales', '0987665651', 'fernando.paredes@email.com', 2),
('1722334462', 'Gabriela Estefanía', 'Villacís Torres', '1984-04-10', 'Licenciada en Artes Visuales', 'Educación Artística', '0987665652', 'gabriela.villacis@email.com', 2),
('1722334463', 'José Manuel', 'Salvatierra Molina', '1980-10-28', 'Ingeniero en Sistemas', 'Informática', '0987665653', 'jose.salvatierra@email.com', 2),
('1722334464', 'Diana Carolina', 'Benavides López', '1981-06-15', 'Licenciada en Psicología', 'Orientación Vocacional', '0987665654', 'diana.benavides@email.com', 2),
-- ------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------
-- Docentes institución 3 (10 registros)
('1733445566', 'Mario Alberto', 'Ruiz Vélez', '1975-08-12', 'Doctor en Física', 'Física Cuántica', '0987665745', 'mario.ruiz@email.com', 3),
('1733445567', 'Ana Lucía', 'Pazmiño Mendoza', '1982-11-25', 'Magíster en Matemáticas', 'Matemáticas Superiores', '0987665746', 'ana.pazmino@email.com', 3),
('1733445568', 'Diego Fernando', 'Salinas Castro', '1979-04-18', 'Ingeniero en Sistemas', 'Programación Avanzada', '0987665747', 'diego.salinas@email.com', 3),
('1733445569', 'Carolina Elizabeth', 'Viteri López', '1983-07-30', 'Doctora en Química', 'Química Analítica', '0987665748', 'carolina.viteri@email.com', 3),
('1733445570', 'Pablo Andrés', 'Torres Zambrano', '1977-02-15', 'Magíster en Electrónica', 'Robótica', '0987665749', 'pablo.torres@email.com', 3),
('1733445571', 'María Belén', 'Córdova Ríos', '1984-09-22', 'Ingeniera en Biotecnología', 'Biotecnología', '0987665750', 'maria.cordova@email.com', 3),
('1733445572', 'Ricardo Alfonso', 'Méndez Salazar', '1976-12-08', 'Doctor en Ciencias de la Computación', 'Inteligencia Artificial', '0987665751', 'ricardo.mendez@email.com', 3),
('1733445573', 'Valeria Nicole', 'Vélez Benítez', '1985-03-17', 'Magíster en Nanotecnología', 'Nanociencias', '0987665752', 'valeria.velez@email.com', 3),
('1733445574', 'Gustavo Adolfo', 'León Paz', '1978-10-05', 'Ingeniero en Telecomunicaciones', 'Redes Digitales', '0987665753', 'gustavo.leon@email.com', 3),
('1733445575', 'Diana Marisol', 'Sánchez Molina', '1981-06-28', 'Doctora en Ingeniería', 'Energías Renovables', '0987665754', 'diana.sanchez@email.com', 3);

-- -----------------------------------------------------------------------------------
-- 6. Cursos (15 registros - 5 por institución)
-- -----------------------------------------------------------------------------------
INSERT INTO Cursos (nombre, descripcion, nivel, institucion_id)
VALUES 
-- Cursos institución 1
-- Cursos para la Institución 1 (5 registros completos)
('1ro BGU - Ciencias', 'Primer año de Bachillerato General Unificado - Ciencias', 'Bachillerato', 1),
('2do BGU - Ciencias', 'Segundo año de Bachillerato General Unificado - Ciencias', 'Bachillerato', 1),
('3ro BGU - Ciencias', 'Tercer año de Bachillerato General Unificado - Ciencias', 'Bachillerato', 1),
('8vo EGB', 'Octavo año de Educación General Básica', 'Básica', 1),
('9no EGB', 'Noveno año de Educación General Básica', 'Básica', 1),
('10mo EGB', 'Décimo año de Educación General Básica', 'Básica', 1),
-- ------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------
-- Cursos para la Institución 2 (5 registros completos con especializaciones)
('1ro BGU - Informática', 'Primer año de Bachillerato Técnico en Informática', 'Bachillerato Técnico', 2),
('2do BGU - Informática', 'Segundo año de Bachillerato Técnico en Informática', 'Bachillerato Técnico', 2),
('3ro BGU - Informática', 'Tercer año de Bachillerato Técnico en Informática con especialización en Programación', 'Bachillerato Técnico', 2),
('8vo EGB', 'Octavo año de Educación General Básica', 'Básica', 2),
('9no EGB', 'Noveno año de Educación General Básica con énfasis en Tecnología', 'Básica', 2),
('10mo EGB', 'Décimo año de Educación General Básica con introducción a herramientas digitales', 'Básica', 2),
-- ------------------------------------------------------------------------------------- -----------------------------------------------------------------------------------
-- Cursos para la Institución 3 (5 registros completos con enfoque científico-tecnológico)
('1ro BGU - Ciencias Experimentales', 'Bachillerato en Ciencias con laboratorios avanzados', 'Bachillerato en Ciencias', 3),
('2do BGU - Ciencias Experimentales', 'Segundo año con énfasis en investigación científica', 'Bachillerato en Ciencias', 3),
('3ro BGU - Físico-Matemático', 'Tercer año con especialización en Física y Matemáticas', 'Bachillerato en Ciencias', 3),
('8vo EGB Acelerado', 'Educación básica con programa intensivo en ciencias', 'Básica Acelerada', 3),
('9no EGB Acelerado', 'Preparación para bachillerato científico', 'Básica Acelerada', 3),
('10mo EGB Acelerado', 'Transición a bachillerato con proyectos científicos', 'Básica Acelerada', 3);

-- -----------------------------------------------------------------------------------
-- 7. Materias (45 registros - 15 por institución, 3 por curso)
-- -----------------------------------------------------------------------------------
INSERT INTO Materias (nombre, descripcion, horas_semanales, curso_id)
VALUES 
-- Materias para Institución 1 (15 registros completos - 3 por curso)
-- Para 1ro BGU - Ciencias (curso_id = 1)
('Matemáticas', 'Álgebra, geometría y funciones matemáticas', 5, 1),
('Lengua y Literatura', 'Análisis literario y comunicación escrita', 4, 1),
('Ciencias Naturales', 'Biología, química y física integradas', 4, 1),
-- Para 2do BGU - Ciencias (curso_id = 2)
('Matemáticas Avanzadas', 'Trigonometría y geometría analítica', 5, 2),
('Literatura Universal', 'Estudio de obras literarias clásicas', 4, 2),
('Biología Celular', 'Estructura y función celular', 4, 2),
-- Para 3ro BGU - Ciencias (curso_id = 3)
('Cálculo Diferencial', 'Fundamentos del cálculo matemático', 6, 3),
('Química Orgánica', 'Compuestos y reacciones orgánicas', 5, 3),
('Física Moderna', 'Introducción a la física contemporánea', 5, 3),
-- Para 8vo EGB (curso_id = 4)
('Matemáticas Básicas', 'Aritmética y geometría fundamental', 4, 4),
('Lengua y Comunicación', 'Redacción y comprensión lectora', 4, 4),
('Ciencias Naturales Básicas', 'Introducción a biología y física', 3, 4),
-- Para 9no EGB (curso_id = 5)
('Álgebra Elemental', 'Expresiones algebraicas básicas', 4, 5),
('Literatura Ecuatoriana', 'Estudio de autores nacionales', 3, 5),
('Ciencias Ambientales', 'Ecología y conservación', 3, 5),
-- Para 10mo EGB (curso_id = 6)
('Geometría Plana', 'Estudio de figuras bidimensionales', 4, 6),
('Comunicación Oral', 'Desarrollo de habilidades discursivas', 3, 6),
('Física Fundamental', 'Conceptos básicos de mecánica', 4, 6),
-- -----------------------------------------------------------------------------------
-- Materias para Institución 2 (15 registros completos - 3 por curso técnico)
-- Para 1ro BGU - Informática (curso_id = 7)
('Matemáticas Aplicadas', 'Lógica matemática para programación', 5, 7),
('Programación Básica', 'Fundamentos con Python', 6, 7),
('Redes y Conectividad', 'Introducción a redes de computadoras', 4, 7),
-- Para 2do BGU - Informática (curso_id = 8)
('Base de Datos', 'Diseño e implementación con SQL', 5, 8),
('Programación Web', 'HTML, CSS y JavaScript', 6, 8),
('Sistemas Operativos', 'Administración de Windows/Linux', 4, 8),
-- Para 3ro BGU - Informática (curso_id = 9)
('Desarrollo de Software', 'Metodologías ágiles y proyectos', 6, 9),
('Seguridad Informática', 'Fundamentos de ciberseguridad', 5, 9),
('Inteligencia Artificial', 'Introducción a machine learning', 5, 9),
-- Para 8vo EGB (curso_id = 10)
('Tecnología Básica', 'Ofimática y herramientas digitales', 3, 10),
('Matemáticas Computacionales', 'Pensamiento algorítmico', 4, 10),
('Ciencias Digitales', 'Tecnología en la vida cotidiana', 3, 10),
-- Para 9no EGB (curso_id = 11)
('Programación Visual', 'Desarrollo con entornos gráficos', 4, 11),
('Robótica Educativa', 'Construcción de robots básicos', 4, 11),
('Diseño Gráfico', 'Herramientas de diseño digital', 3, 11),
-- Para 10mo EGB (curso_id = 12)
('Emprendimiento Tecnológico', 'Startups y modelos de negocio digital', 3, 12),
('Desarrollo de Apps Móviles', 'Creación de aplicaciones básicas', 5, 12),
('Ética Digital', 'Responsabilidad en el uso de tecnología', 2, 12),
-- -----------------------------------------------------------------------------------
-- Materias para Institución 3 (15 registros completos - 3 por curso científico)
-- Para 1ro BGU - Ciencias Experimentales (curso_id = 13)
('Matemáticas Científicas', 'Álgebra y geometría analítica', 6, 13),
('Física Experimental', 'Métodos de laboratorio básico', 5, 13),
('Química General', 'Principios y reacciones químicas', 5, 13),
-- Para 2do BGU - Ciencias Experimentales (curso_id = 14)
('Cálculo Científico', 'Límites y derivadas aplicadas', 6, 14),
('Biología Molecular', 'Estructura del ADN y proteínas', 5, 14),
('Termodinámica', 'Principios energéticos y entropía', 5, 14),
-- Para 3ro BGU - Físico-Matemático (curso_id = 15)
('Física Cuántica', 'Modelos atómicos y partículas', 7, 15),
('Análisis Matemático', 'Ecuaciones diferenciales', 7, 15),
('Investigación Científica', 'Metodología de proyectos', 4, 15),
-- Para 8vo EGB Acelerado (curso_id = 16)
('Ciencias Integradas', 'Física-Química-Biología', 5, 16),
('Matemáticas Avanzadas', 'Álgebra y geometría avanzada', 5, 16),
('Técnicas de Laboratorio', 'Seguridad e instrumentación', 4, 16),
-- Para 9no EGB Acelerado (curso_id = 17)
('Pre-Cálculo', 'Funciones y trigonometría', 5, 17),
('Biología Celular Avanzada', 'Metabolismo y genética', 5, 17),
('Química Inorgánica', 'Tabla periódica y enlaces', 4, 17),
-- Para 10mo EGB Acelerado (curso_id = 18)
('Introducción al Cálculo', 'Límites y derivadas básicas', 5, 18),
('Física Moderna Básica', 'Relatividad y mecánica cuántica', 5, 18),
('Proyectos Científicos', 'Diseño experimental', 4, 18);

-- -----------------------------------------------------------------------------------
-- 8. Asignación Docente-Materia (60 registros - aproximadamente 2 materias por docente)
-- -----------------------------------------------------------------------------------
INSERT INTO Docente_Materia (docente_id, materia_id, periodo)
VALUES 
-- Asignaciones para institución 1

(1, 1, '2023-2024'),  -- Matemáticas (1ro BGU)
(1, 4, '2023-2024'),  -- Matemáticas Avanzadas (2do BGU)

(2, 2, '2023-2024'),  -- Lengua y Literatura (1ro BGU)
(2, 5, '2023-2024'),  -- Literatura Universal (2do BGU)

(3, 3, '2023-2024'),  -- Ciencias Naturales - Física (1ro BGU)
(3, 9, '2023-2024'),  -- Física Moderna (3ro BGU)

(4, 12, '2023-2024'), -- Ciencias Ambientales (9no EGB)
(4, 15, '2023-2024'), -- Ciencias Naturales Básicas - Sociales (8vo EGB)

(5, 8, '2023-2024'),  -- Química Orgánica (3ro BGU)
(5, 3, '2023-2024'),  -- Ciencias Naturales - Química (1ro BGU)

(6, 6, '2023-2024'),  -- Biología Celular (2do BGU)
(6, 3, '2023-2024'),  -- Ciencias Naturales - Biología (1ro BGU)

(7, 51, '2023-2024'), -- Educación Física (1ro BGU) [Nueva materia]
(7, 52, '2023-2024'), -- Educación Física (2do BGU) [Nueva materia]

(8, 53, '2023-2024'), -- Arte y Cultura (1ro BGU) [Nueva materia]
(8, 54, '2023-2024'), -- Arte y Cultura (2do BGU) [Nueva materia]

(9, 55, '2023-2024'), -- Tecnología Educativa (1ro BGU) [Nueva materia]
(9, 56, '2023-2024'), -- Tecnología Educativa (2do BGU) [Nueva materia]

(10, 57, '2023-2024'), -- Desarrollo Humano (1ro BGU) [Nueva materia]
(10, 14, '2023-2024'), -- Comunicación Oral (10mo EGB)
-- -----------------------------------------------------------------------------------

-- Asignaciones para institución 2 (20 registros - 2 materias por docente)
(11, 16, '2023-2024'),  -- Redes y Conectividad (1ro BGU Informática)
(11, 22, '2023-2024'),  -- Seguridad Informática (3ro BGU Informática)

(12, 20, '2023-2024'),  -- Programación Web (2do BGU Informática)
(12, 26, '2023-2024'),  -- Desarrollo de Apps Móviles (10mo EGB)

(13, 19, '2023-2024'),  -- Matemáticas Aplicadas (1ro BGU Informática)
(13, 25, '2023-2024'),  -- Programación Visual (9no EGB)

(14, 24, '2023-2024'),  -- Diseño Gráfico (9no EGB)
(14, 27, '2023-2024'),  -- Ética Digital (10mo EGB)

(15, 21, '2023-2024'),  -- Base de Datos (2do BGU Informática)
(15, 23, '2023-2024'),  -- Inteligencia Artificial (3ro BGU Informática)

(16, 22, '2023-2024'),  -- Sistemas Operativos (2do BGU Informática)
(16, 28, '2023-2024'),  -- Técnicas de Laboratorio (8vo EGB)

(17, 25, '2023-2024'),  -- Robótica Educativa (9no EGB)
(17, 29, '2023-2024'),  -- Ciencias Digitales (8vo EGB)

(18, 24, '2023-2024'),  -- Diseño Gráfico (9no EGB)
(18, 30, '2023-2024'),  -- Tecnología Básica (8vo EGB)

(19, 17, '2023-2024'),  -- Programación Básica (1ro BGU Informática)
(19, 31, '2023-2024'),  -- Matemáticas Computacionales (8vo EGB)

(20, 27, '2023-2024'),  -- Ética Digital (10mo EGB)
(20, 32, '2023-2024'), -- Emprendimiento Tecnológico (10mo EGB)  

-- -----------------------------------------------------------------------------------
-- Asignaciones para institución 3 (20 registros - 2 materias por docente)

(21, 33, '2023-2024'),  -- Física Experimental (1ro BGU Ciencias)
(21, 45, '2023-2024'),  -- Física Cuántica (3ro BGU Físico-Matemático)

(22, 34, '2023-2024'),  -- Matemáticas Científicas (1ro BGU Ciencias)
(22, 40, '2023-2024'),  -- Análisis Matemático (3ro BGU Físico-Matemático)

(23, 39, '2023-2024'),  -- Investigación Científica (3ro BGU)
(23, 48, '2023-2024'),  -- Proyectos Científicos (10mo EGB)

(24, 35, '2023-2024'),  -- Química General (1ro BGU Ciencias)
(24, 47, '2023-2024'),  -- Química Inorgánica (9no EGB)

(25, 42, '2023-2024'),  -- Técnicas de Laboratorio (8vo EGB)
(25, 49, '2023-2024'),  -- Robótica Científica (Electiva)

(26, 38, '2023-2024'),  -- Biología Molecular (2do BGU Ciencias)
(26, 46, '2023-2024'),  -- Biología Celular Avanzada (9no EGB)

(27, 39, '2023-2024'),  -- Investigación Científica (3ro BGU)
(27, 48, '2023-2024'),  -- Proyectos Científicos (10mo EGB)

(28, 37, '2023-2024'),  -- Termodinámica (2do BGU Ciencias)
(28, 42, '2023-2024'),  -- Técnicas de Laboratorio (8vo EGB)

(29, 36, '2023-2024'),  -- Cálculo Científico (2do BGU Ciencias)
(29, 44, '2023-2024'),  -- Pre-Cálculo (9no EGB)

(30, 43, '2023-2024'),  -- Ciencias Integradas (8vo EGB)
(30, 50, '2023-2024');  -- Física Moderna Básica (10mo EGB) 


-- -----------------------------------------------------------------------------------
-- 9. Matrículas (150 registros - 1 por estudiante para el periodo actual)
-- -----------------------------------------------------------------------------------
INSERT INTO Matriculas (estudiante_id, curso_id, periodo, estado)
VALUES 
-- Matrículas para institución 1
-- 1ro BGU Ciencias (curso_id = 1)
(1, 1, '2023-2024', 'Activo'),   -- Juan Carlos Pérez González
(2, 1, '2023-2024', 'Activo'),   -- María José López Martínez
(3, 1, '2023-2024', 'Activo'),   -- Carlos Andrés García Ruiz
(4, 1, '2023-2024', 'Activo'),   -- Andrea Elizabeth Vargas Mendoza
(5, 1, '2023-2024', 'Activo'),   -- Luis Fernando Morales Salazar
(6, 1, '2023-2024', 'Activo'),   -- Sofía Alejandra Castro Benítez
(7, 1, '2023-2024', 'Activo'),   -- David Esteban Ortega Pazmiño
(8, 1, '2023-2024', 'Activo'),   -- Daniela Carolina Santillán Reyes
(9, 1, '2023-2024', 'Activo'),   -- José Luis Zambrano Vélez
(10, 1, '2023-2024', 'Activo'),  -- Valeria Nicole Paredes Cordero
-- 2do BGU Ciencias (curso_id = 2)
(11, 2, '2023-2024', 'Activo'),  -- Fernando Xavier Guerrero Jaramillo
(12, 2, '2023-2024', 'Activo'),  -- Gabriela Michelle Salazar Torres
(13, 2, '2023-2024', 'Activo'),  -- Pablo Andrés Figueroa Espinoza
(14, 2, '2023-2024', 'Activo'),  -- Melissa Raquel Rojas Zambrano
(15, 2, '2023-2024', 'Activo'),  -- Roberto Carlos Mendoza López
(16, 2, '2023-2024', 'Activo'),  -- Karen Dayana Suárez Viteri
(17, 2, '2023-2024', 'Activo'),  -- Jorge Luis Vera Castillo
(18, 2, '2023-2024', 'Activo'),  -- Diana Carolina Córdova Paz
(19, 2, '2023-2024', 'Activo'),  -- Mario Alfredo Barrera Salinas
(20, 2, '2023-2024', 'Activo'),  -- Jessica Pamela Narváez Gómez
-- 3ro BGU Ciencias (curso_id = 3)
(21, 3, '2023-2024', 'Activo'),  -- Oscar René Carvajal Haro
(22, 3, '2023-2024', 'Activo'),  -- María Fernanda Palacios Ruiz
(23, 3, '2023-2024', 'Activo'),  -- Diego Armando Vallejo Molina
(24, 3, '2023-2024', 'Activo'),  -- Nataly Elizabeth Escobar Guzmán
(25, 3, '2023-2024', 'Activo'),  -- Wilson Eduardo Ponce León
(26, 3, '2023-2024', 'Activo'),  -- Stephanie Nicole Rosales Vélez
(27, 3, '2023-2024', 'Activo'),  -- Christian David Ávila Mendoza
(28, 3, '2023-2024', 'Activo'),  -- Katherine Lorena Chávez Salvatierra
(29, 3, '2023-2024', 'Activo'),  -- José Antonio Miranda Ríos
(30, 3, '2023-2024', 'Activo'),  -- Paola Vanessa Villacís Ortega
-- 8vo EGB (curso_id = 4)
(31, 4, '2023-2024', 'Activo'),  -- Walter Fernando Gómez Paredes
(32, 4, '2023-2024', 'Activo'),  -- Lissette Alexandra Torres Zambrano
(33, 4, '2023-2024', 'Activo'),  -- Alex Javier Salinas Castro
(34, 4, '2023-2024', 'Activo'),  -- Mónica Patricia Lara Jaramillo
(35, 4, '2023-2024', 'Activo'),  -- Vinicio Marcelo Peñaherrera Sánchez
(36, 4, '2023-2024', 'Activo'),  -- Gabriela Estefanía Vélez Cordero
(37, 4, '2023-2024', 'Activo'),  -- Patricio Andrés Ríos Haro
(38, 4, '2023-2024', 'Activo'),  -- Jennifer Lorena Molina Pazmiño
(39, 4, '2023-2024', 'Activo'),  -- Mauricio Javier Castillo Salazar
(40, 4, '2023-2024', 'Activo'),  -- Carolina Alejandra Benavides López
-- 9no EGB (curso_id = 5)
(41, 5, '2023-2024', 'Activo'),  -- Fabricio Andrés Espinosa Vélez
(42, 5, '2023-2024', 'Activo'),  -- Domenica Michelle Carrasco Reyes
(43, 5, '2023-2024', 'Activo'),  -- Byron Xavier Andrade Mendoza
(44, 5, '2023-2024', 'Activo'),  -- Estefanía Maribel Guzmán Torres
(45, 5, '2023-2024', 'Activo'),  -- Jonathan Paul Viteri Salinas
(46, 5, '2023-2024', 'Activo'),  -- Brenda Lissette Pazmiño Ríos
(47, 5, '2023-2024', 'Activo'),  -- Gustavo Adolfo León Castro
(48, 5, '2023-2024', 'Activo'),  -- Diana Marisol Sánchez Jaramillo
(49, 5, '2023-2024', 'Activo'),  -- Ricardo Alfonso Méndez Cordero
(50, 5, '2023-2024', 'Activo'),  -- María Belén Villacres Salvatierra
-- -----------------------------------------------------------------------------------
-- Matrículas para institución 2 y 3
-- 1ro BGU Informática (curso_id = 7)
(51, 7, '2023-2024', 'Activo'),  -- Ana Lucía Rodríguez Paz
(52, 7, '2023-2024', 'Activo'),  -- Pedro Alfonso Martínez Sánchez
(53, 7, '2023-2024', 'Activo'),  -- Carlos Eduardo Gómez Zambrano
(54, 7, '2023-2024', 'Activo'),  -- María Gabriela Suárez Vélez
(55, 7, '2023-2024', 'Activo'),  -- Fernando José Díaz Cordero
(56, 7, '2023-2024', 'Activo'),  -- Patricia Elizabeth Vera Mendoza
(57, 7, '2023-2024', 'Activo'),  -- Roberto Andrés Pazmiño López
(58, 7, '2023-2024', 'Activo'),  -- Diana Carolina Salazar Ríos
(59, 7, '2023-2024', 'Activo'),  -- Jorge Luis Castro Torres
(60, 7, '2023-2024', 'Activo'),  -- Gabriela Alejandra Molina Vélez
-- 2do BGU Informática (curso_id = 8)
(61, 8, '2023-2024', 'Activo'),  -- Luis Fernando Rosales Haro
(62, 8, '2023-2024', 'Activo'),  -- Sofía Margarita Vargas Jaramillo
(63, 8, '2023-2024', 'Activo'),  -- David Alejandro Ordoñez Salinas
(64, 8, '2023-2024', 'Activo'),  -- Karen Daniela Córdova Paz
(65, 8, '2023-2024', 'Activo'),  -- José Manuel Barrera López
(66, 8, '2023-2024', 'Activo'),  -- María José Santillán Ríos
(67, 8, '2023-2024', 'Activo'),  -- Pablo Andrés Figueroa Mendoza
(68, 8, '2023-2024', 'Activo'),  -- Andrea Nicole Palacios Castro
(69, 8, '2023-2024', 'Activo'),  -- Mario Xavier Vallejo Zambrano
(70, 8, '2023-2024', 'Activo'),  -- Jessica Pamela Escobar Vélez
-- 3ro BGU Informática (curso_id = 9)
(71, 9, '2023-2024', 'Activo'),  -- Oscar René Ponce Salazar
(72, 9, '2023-2024', 'Activo'),  -- Natalia Elizabeth Rosales Cordero
(73, 9, '2023-2024', 'Activo'),  -- Christian David Ávila López
(74, 9, '2023-2024', 'Activo'),  -- Katherine Lorena Chávez Torres
(75, 9, '2023-2024', 'Activo'),  -- José Antonio Miranda Ríos
(76, 9, '2023-2024', 'Activo'),  -- Paola Vanessa Villacís Haro
(77, 9, '2023-2024', 'Activo'),  -- Walter Fernando Gómez Jaramillo
(78, 9, '2023-2024', 'Activo'),  -- Lissette Alexandra Torres Salinas
(79, 9, '2023-2024', 'Activo'),  -- Alex Javier Salinas Vélez
(80, 9, '2023-2024', 'Activo'),  -- Mónica Patricia Lara Paz
-- 8vo EGB (curso_id = 10)
(81, 10, '2023-2024', 'Activo'), -- Vinicio Marcelo Peñaherrera López
(82, 10, '2023-2024', 'Activo'), -- Gabriela Estefanía Vélez Ríos
(83, 10, '2023-2024', 'Activo'), -- Patricio Andrés Ríos Castro
(84, 10, '2023-2024', 'Activo'), -- Jennifer Lorena Molina Zambrano
(85, 10, '2023-2024', 'Activo'), -- Mauricio Javier Castillo Vélez
(86, 10, '2023-2024', 'Activo'), -- Carolina Alejandra Benavides Salazar
(87, 10, '2023-2024', 'Activo'), -- Fabricio Andrés Espinosa López
(88, 10, '2023-2024', 'Activo'), -- Domenica Michelle Carrasco Torres
(89, 10, '2023-2024', 'Activo'), -- Byron Xavier Andrade Ríos
(90, 10, '2023-2024', 'Activo'), -- Estefanía Maribel Guzmán Haro
-- 9no EGB (curso_id = 11)
(91, 11, '2023-2024', 'Activo'), -- Jonathan Paul Viteri Jaramillo
(92, 11, '2023-2024', 'Activo'), -- Brenda Lissette Pazmiño Salinas
(93, 11, '2023-2024', 'Activo'), -- Gustavo Adolfo León Vélez
(94, 11, '2023-2024', 'Activo'), -- Diana Marisol Sánchez Paz
(95, 11, '2023-2024', 'Activo'), -- Ricardo Alfonso Méndez López
(96, 11, '2023-2024', 'Activo'), -- María Belén Villacres Torres
(97, 11, '2023-2024', 'Activo'), -- Juan Carlos Paredes Ríos
(98, 11, '2023-2024', 'Activo'), -- María Fernanda Córdova Castro
(99, 11, '2023-2024', 'Activo'), -- Diego Armando Salvatierra Zambrano
(100, 11, '2023-2024', 'Activo'), -- Nataly Elizabeth Escobar Vélez
-- -----------------------------------------------------------------------------------
-- Matrículas para institución 3 (50 registros - 1 por estudiante)
-- 1ro BGU Ciencias Experimentales (curso_id = 13)
(101, 13, '2023-2024', 'Activo'),  -- Luisa Fernanda González López
(102, 13, '2023-2024', 'Activo'),  -- Diego Alejandro Hernández Castro
(103, 13, '2023-2024', 'Activo'),  -- María José Vázquez Mendoza
(104, 13, '2023-2024', 'Activo'),  -- Carlos Andrés Torres Salazar
(105, 13, '2023-2024', 'Activo'),  -- Andrea Carolina Dávila Cordero
(106, 13, '2023-2024', 'Activo'),  -- José Luis Paredes Vélez
(107, 13, '2023-2024', 'Activo'),  -- Sofía Alejandra Molina Ríos
(108, 13, '2023-2024', 'Activo'),  -- David Esteban Carrasco Paz
(109, 13, '2023-2024', 'Activo'),  -- Daniela Patricia Salinas López
(110, 13, '2023-2024', 'Activo'), -- Fernando Xavier Vélez Jaramillo
-- 2do BGU Ciencias Experimentales (curso_id = 14)
(111, 14, '2023-2024', 'Activo'), -- Gabriela Michelle Guzmán Torres
(112, 14, '2023-2024', 'Activo'), -- Pablo Andrés Figueroa Castro
(113, 14, '2023-2024', 'Activo'), -- Melissa Raquel Rojas Zambrano
(114, 14, '2023-2024', 'Activo'), -- Roberto Carlos Mendoza López
(115, 14, '2023-2024', 'Activo'), -- Karen Dayana Suárez Viteri
(116, 14, '2023-2024', 'Activo'), -- Jorge Luis Vera Castillo
(117, 14, '2023-2024', 'Activo'), -- Diana Carolina Córdova Paz
(118, 14, '2023-2024', 'Activo'), -- Mario Alfredo Barrera Salinas
(119, 14, '2023-2024', 'Activo'), -- Jessica Pamela Narváez Gómez
(120, 14, '2023-2024', 'Activo'), -- Oscar René Carvajal Haro
-- 3ro BGU Físico-Matemático (curso_id = 15)
(121, 15, '2023-2024', 'Activo'), -- María Fernanda Palacios Ruiz
(122, 15, '2023-2024', 'Activo'), -- Diego Armando Vallejo Molina
(123, 15, '2023-2024', 'Activo'), -- Nataly Elizabeth Escobar Guzmán
(124, 15, '2023-2024', 'Activo'), -- Wilson Eduardo Ponce León
(125, 15, '2023-2024', 'Activo'), -- Stephanie Nicole Rosales Vélez
(126, 15, '2023-2024', 'Activo'), -- Christian David Ávila Mendoza
(127, 15, '2023-2024', 'Activo'), -- Katherine Lorena Chávez Salvatierra
(128, 15, '2023-2024', 'Activo'), -- José Antonio Miranda Ríos
(129, 15, '2023-2024', 'Activo'), -- Paola Vanessa Villacís Ortega
(130, 15, '2023-2024', 'Activo'), -- Walter Fernando Gómez Paredes
-- 8vo EGB Acelerado (curso_id = 16)
(131, 16, '2023-2024', 'Activo'), -- Lissette Alexandra Torres Zambrano
(132, 16, '2023-2024', 'Activo'), -- Alex Javier Salinas Castro
(133, 16, '2023-2024', 'Activo'), -- Mónica Patricia Lara Jaramillo
(134, 16, '2023-2024', 'Activo'), -- Vinicio Marcelo Peñaherrera Sánchez
(135, 16, '2023-2024', 'Activo'), -- Gabriela Estefanía Vélez Cordero
(136, 16, '2023-2024', 'Activo'), -- Patricio Andrés Ríos Haro
(137, 16, '2023-2024', 'Activo'), -- Jennifer Lorena Molina Pazmiño
(138, 16, '2023-2024', 'Activo'), -- Mauricio Javier Castillo Salazar
(139, 16, '2023-2024', 'Activo'), -- Carolina Alejandra Benavides López
(140, 16, '2023-2024', 'Activo'), -- Fabricio Andrés Espinosa Vélez
-- 9no EGB Acelerado (curso_id = 17)
(141, 17, '2023-2024', 'Activo'), -- Domenica Michelle Carrasco Reyes
(142, 17, '2023-2024', 'Activo'), -- Byron Xavier Andrade Mendoza
(143, 17, '2023-2024', 'Activo'), -- Estefanía Maribel Guzmán Torres
(144, 17, '2023-2024', 'Activo'), -- Jonathan Paul Viteri Salinas
(145, 17, '2023-2024', 'Activo'), -- Brenda Lissette Pazmiño Ríos
(146, 17, '2023-2024', 'Activo'), -- Gustavo Adolfo León Castro
(147, 17, '2023-2024', 'Activo'), -- Diana Marisol Sánchez Jaramillo
(148, 17, '2023-2024', 'Activo'), -- Ricardo Alfonso Méndez Cordero
(149, 17, '2023-2024', 'Activo'), -- María Belén Villacres Salvatierra
(150, 17, '2023-2024', 'Activo'); -- Juan Carlos Paredes Ríos

-- -----------------------------------------------------------------------------------
-- 10. Asistencias (300 registros - aproximadamente 2 por estudiante)
-- -----------------------------------------------------------------------------------
INSERT INTO Asistencias (estudiante_id, materia_id, fecha, estado)
VALUES 
-- Asistencias para estudiantes de institución 1
-- Septiembre 2023 - Primer Semestre
-- Estudiantes de 1ro BGU (curso_id = 1)
(1, 1, '2023-09-05', 'P'),  -- Juan Carlos presente en Matemáticas
(1, 2, '2023-09-06', 'A'),  -- Juan Carlos ausente en Lenguaje
(2, 1, '2023-09-05', 'P'),  -- María José presente en Matemáticas
(2, 3, '2023-09-07', 'P'),  -- María José presente en Ciencias
(3, 2, '2023-09-06', 'T'),  -- Carlos Andrés con tardanza en Lenguaje
(3, 3, '2023-09-07', 'P'),  -- Carlos Andrés presente en Ciencias
(4, 1, '2023-09-05', 'A'),  -- Andrea ausente en Matemáticas
(4, 2, '2023-09-06', 'P'),  -- Andrea presente en Lenguaje
(5, 1, '2023-09-05', 'P'),  -- Luis presente en Matemáticas
(5, 3, '2023-09-07', 'A'),  -- Luis ausente en Ciencias
-- Estudiantes de 2do BGU (curso_id = 2)
(11, 4, '2023-09-05', 'P'),  -- Fernando presente en Matemáticas Avanzadas
(11, 5, '2023-09-06', 'P'),  -- Fernando presente en Literatura
(12, 6, '2023-09-08', 'T'),  -- Gabriela con tardanza en Biología
(12, 4, '2023-09-05', 'P'),  -- Gabriela presente en Matemáticas
(13, 5, '2023-09-06', 'A'),  -- Pablo ausente en Literatura
(13, 6, '2023-09-08', 'P'),  -- Pablo presente en Biología
(14, 4, '2023-09-05', 'P'),  -- Melissa presente en Matemáticas
(14, 5, '2023-09-06', 'P'),  -- Melissa presente en Literatura
(15, 6, '2023-09-08', 'A'),  -- Roberto ausente en Biología
(15, 4, '2023-09-05', 'P'),  -- Roberto presente en Matemáticas
-- Estudiantes de 3ro BGU (curso_id = 3)
(21, 7, '2023-09-12', 'P'),  -- Oscar presente en Cálculo
(21, 9, '2023-09-14', 'P'),  -- Oscar presente en Física Moderna
(22, 8, '2023-09-13', 'T'),  -- María con tardanza en Química
(22, 7, '2023-09-12', 'P'),  -- María presente en Cálculo
(23, 8, '2023-09-13', 'A'),  -- Diego ausente en Química
(23, 9, '2023-09-14', 'P'),  -- Diego presente en Física
(24, 7, '2023-09-12', 'P'),  -- Nataly presente en Cálculo
(24, 8, '2023-09-13', 'P'),  -- Nataly presente en Química
(25, 9, '2023-09-14', 'A'),  -- Wilson ausente en Física
(25, 7, '2023-09-12', 'P'),  -- Wilson presente en Cálculo
-- Estudiantes de 8vo EGB (curso_id = 4)
(31, 10, '2023-09-19', 'P'), -- Walter presente en Matemáticas Básicas
(31, 11, '2023-09-20', 'P'), -- Walter presente en Lengua
(32, 12, '2023-09-21', 'T'), -- Lissette con tardanza en Ciencias
(32, 10, '2023-09-19', 'P'), -- Lissette presente en Matemáticas
(33, 11, '2023-09-20', 'A'), -- Alex ausente en Lengua
(33, 12, '2023-09-21', 'P'), -- Alex presente en Ciencias
(34, 10, '2023-09-19', 'P'), -- Mónica presente en Matemáticas
(34, 11, '2023-09-20', 'P'), -- Mónica presente en Lengua
(35, 12, '2023-09-21', 'A'), -- Vinicio ausente en Ciencias
(35, 10, '2023-09-19', 'P'), -- Vinicio presente en Matemáticas
-- Estudiantes de 9no EGB (curso_id = 5)
(41, 13, '2023-09-26', 'P'), -- Fabricio presente en Álgebra
(41, 14, '2023-09-27', 'P'), -- Fabricio presente en Literatura
(42, 15, '2023-09-28', 'T'), -- Domenica con tardanza en Ciencias Ambientales
(42, 13, '2023-09-26', 'P'), -- Domenica presente en Álgebra
(43, 14, '2023-09-27', 'A'), -- Byron ausente en Literatura
(43, 15, '2023-09-28', 'P'), -- Byron presente en Ciencias
(44, 13, '2023-09-26', 'P'), -- Estefanía presente en Álgebra
(44, 14, '2023-09-27', 'P'), -- Estefanía presente en Literatura
(45, 15, '2023-09-28', 'A'), -- Jonathan ausente en Ciencias
(45, 13, '2023-09-26', 'P'), -- Jonathan presente en Álgebra
-- Estudiantes de 10mo EGB (curso_id = 6)
(46, 16, '2023-10-03', 'P'), -- Brenda presente en Geometría
(46, 17, '2023-10-04', 'P'), -- Brenda presente en Comunicación
(47, 18, '2023-10-05', 'T'), -- Gustavo con tardanza en Física
(47, 16, '2023-10-03', 'P'), -- Gustavo presente en Geometría
(48, 17, '2023-10-04', 'A'), -- Diana ausente en Comunicación
(48, 18, '2023-10-05', 'P'), -- Diana presente en Física
(49, 16, '2023-10-03', 'P'), -- Ricardo presente en Geometría
(49, 17, '2023-10-04', 'P'), -- Ricardo presente en Comunicación
(50, 18, '2023-10-05', 'A'), -- María Belén ausente en Física
(50, 16, '2023-10-03', 'P'), -- María Belén presente en Geometría    
-- -----------------------------------------------------------------------------------
-- Asistencias para estudiantes de institución 2 (100 registros - 2 por estudiante)
-- Septiembre-Octubre 2023 - Primer Semestre
-- Estudiantes de 1ro BGU (curso_id = 7)
(51, 19, '2023-09-05', 'P'),  -- Ana Lucía presente en Física
(51, 20, '2023-09-06', 'P'),  -- Ana Lucía presente en Química
(52, 19, '2023-09-05', 'A'),  -- Pedro Antonio ausente en Física
(52, 21, '2023-09-07', 'P'),  -- Pedro Antonio presente en Biología
(53, 20, '2023-09-06', 'T'),  -- Laura Sofía con tardanza en Química
(53, 21, '2023-09-07', 'P'),  -- Laura Sofía presente en Biología
(54, 19, '2023-09-05', 'P'),  -- Carlos Eduardo presente en Física
(54, 20, '2023-09-06', 'A'),  -- Carlos Eduardo ausente en Química
(55, 21, '2023-09-07', 'P'),  -- Daniela Alejandra presente en Biología
(55, 19, '2023-09-05', 'P'),  -- Daniela Alejandra presente en Física
-- Estudiantes de 2do BGU (curso_id = 8)
(61, 22, '2023-09-12', 'P'),  -- Javier presente en Historia
(61, 23, '2023-09-13', 'P'),  -- Javier presente en Geografía
(62, 22, '2023-09-12', 'A'),  -- Sofía ausente en Historia
(62, 24, '2023-09-14', 'P'),  -- Sofía presente en Filosofía
(63, 23, '2023-09-13', 'T'),  -- David con tardanza en Geografía
(63, 24, '2023-09-14', 'P'),  -- David presente en Filosofía
(64, 22, '2023-09-12', 'P'),  -- Valeria presente en Historia
(64, 23, '2023-09-13', 'A'),  -- Valeria ausente en Geografía
(65, 24, '2023-09-14', 'P'),  -- Andrés presente en Filosofía
(65, 22, '2023-09-12', 'P'),  -- Andrés presente en Historia
-- Estudiantes de 3ro BGU (curso_id = 9)
(71, 25, '2023-09-19', 'P'),  -- Camila presente en Economía
(71, 26, '2023-09-20', 'P'),  -- Camila presente en Emprendimiento
(72, 25, '2023-09-19', 'T'),  -- Ricardo con tardanza en Economía
(72, 27, '2023-09-21', 'P'),  -- Ricardo presente en Contabilidad
(73, 26, '2023-09-20', 'A'),  -- Patricia ausente en Emprendimiento
(73, 27, '2023-09-21', 'P'),  -- Patricia presente en Contabilidad
(74, 25, '2023-09-19', 'P'),  -- Felipe presente en Economía
(74, 26, '2023-09-20', 'P'),  -- Felipe presente en Emprendimiento
(75, 27, '2023-09-21', 'A'),  -- Carolina ausente en Contabilidad
(75, 25, '2023-09-19', 'P'),  -- Carolina presente en Economía
-- Estudiantes de 8vo EGB (curso_id = 10)
(81, 28, '2023-09-26', 'P'),  -- Marcelo presente en Matemáticas
(81, 29, '2023-09-27', 'P'),  -- Marcelo presente en Lengua
(82, 28, '2023-09-26', 'A'),  -- Daniela ausente en Matemáticas
(82, 30, '2023-09-28', 'P'),  -- Daniela presente en Ciencias Sociales
(83, 29, '2023-09-27', 'P'),  -- Kevin presente en Lengua
(83, 30, '2023-09-28', 'T'),  -- Kevin con tardanza en Ciencias Sociales
(84, 28, '2023-09-26', 'P'),  -- Gabriela presente en Matemáticas
(84, 29, '2023-09-27', 'A'),  -- Gabriela ausente en Lengua
(85, 30, '2023-09-28', 'P'),  -- Josué presente en Ciencias Sociales
(85, 28, '2023-09-26', 'P'),  -- Josué presente en Matemáticas
-- Estudiantes de 9no EGB (curso_id = 11)
(91, 31, '2023-10-03', 'P'),  -- Michelle presente en Educación Física
(91, 32, '2023-10-04', 'P'),  -- Michelle presente en Arte
(92, 31, '2023-10-03', 'T'),  -- Christian con tardanza en Educación Física
(92, 33, '2023-10-05', 'P'),  -- Christian presente en Música
(93, 32, '2023-10-04', 'A'),  -- Alexandra ausente en Arte
(93, 33, '2023-10-05', 'P'),  -- Alexandra presente en Música
(94, 31, '2023-10-03', 'P'),  -- José presente en Educación Física
(94, 32, '2023-10-04', 'P'),  -- José presente en Arte
(95, 33, '2023-10-05', 'A'),  -- Marisol ausente en Música
(95, 31, '2023-10-03', 'P'),  -- Marisol presente en Educación Física
-- Estudiantes de 10mo EGB (curso_id = 12)
(96, 34, '2023-10-10', 'P'),  -- Esteban presente en Computación
(96, 35, '2023-10-11', 'P'),  -- Esteban presente en Inglés
(97, 34, '2023-10-10', 'A'),  -- Priscila ausente en Computación
(97, 36, '2023-10-12', 'P'),  -- Priscila presente en Ciencias Naturales
(98, 35, '2023-10-11', 'P'),  -- Diego presente en Inglés
(98, 36, '2023-10-12', 'T'),  -- Diego con tardanza en Ciencias Naturales
(99, 34, '2023-10-10', 'P'),  -- Vanessa presente en Computación
(99, 35, '2023-10-11', 'A'),  -- Vanessa ausente en Inglés
(100, 36, '2023-10-12', 'P'), -- Jorge presente en Ciencias Naturales
(100, 34, '2023-10-10', 'P'), -- Jorge presente en Computación
-- -----------------------------------------------------------------------------------

-- Asistencias para estudiantes de institución 3 (100 registros - 2 por estudiante)
-- Septiembre-Octubre 2023 - Primer Semestre
-- Estudiantes de 1ro BGU (curso_id = 13)
(101, 37, '2023-09-05', 'P'),  -- Luisa Fernanda presente en Matemáticas Avanzadas
(101, 38, '2023-09-06', 'A'),  -- Luisa Fernanda ausente en Literatura Universal
(102, 37, '2023-09-05', 'T'),  -- Carlos Manuel con tardanza en Matemáticas Avanzadas
(102, 39, '2023-09-07', 'P'),  -- Carlos Manuel presente en Biología Molecular
(103, 38, '2023-09-06', 'P'),  -- Ana Patricia presente en Literatura Universal
(103, 39, '2023-09-07', 'P'),  -- Ana Patricia presente en Biología Molecular
(104, 37, '2023-09-05', 'A'),  -- José Luis ausente en Matemáticas Avanzadas
(104, 38, '2023-09-06', 'P'),  -- José Luis presente en Literatura Universal
(105, 39, '2023-09-07', 'T'),  -- Diana Carolina con tardanza en Biología Molecular
(105, 37, '2023-09-05', 'P'),  -- Diana Carolina presente en Matemáticas Avanzadas

-- Estudiantes de 2do BGU (curso_id = 14)
(111, 40, '2023-09-12', 'P'),  -- Fernando Xavier presente en Física Cuántica
(111, 41, '2023-09-13', 'P'),  -- Fernando Xavier presente en Química Orgánica
(112, 40, '2023-09-12', 'A'),  -- María Gabriela ausente en Física Cuántica
(112, 42, '2023-09-14', 'P'),  -- María Gabriela presente en Historia del Arte
(113, 41, '2023-09-13', 'P'),  -- Diego Alejandro presente en Química Orgánica
(113, 42, '2023-09-14', 'T'),  -- Diego Alejandro con tardanza en Historia del Arte
(114, 40, '2023-09-12', 'P'),  -- Valeria Elizabeth presente en Física Cuántica
(114, 41, '2023-09-13', 'A'),  -- Valeria Elizabeth ausente en Química Orgánica
(115, 42, '2023-09-14', 'P'),  -- Christian David presente en Historia del Arte
(115, 40, '2023-09-12', 'P'),  -- Christian David presente en Física Cuántica

-- Estudiantes de 3ro BGU (curso_id = 15)
(121, 43, '2023-09-19', 'P'),  -- Andrea Nicole presente en Economía Internacional
(121, 44, '2023-09-20', 'P'),  -- Andrea Nicole presente en Filosofía Contemporánea
(122, 43, '2023-09-19', 'T'),  -- Juan Sebastián con tardanza en Economía Internacional
(122, 45, '2023-09-21', 'P'),  -- Juan Sebastián presente en Derecho Constitucional
(123, 44, '2023-09-20', 'A'),  -- Paula Alejandra ausente en Filosofía Contemporánea
(123, 45, '2023-09-21', 'P'),  -- Paula Alejandra presente en Derecho Constitucional
(124, 43, '2023-09-19', 'P'),  -- Luis Fernando presente en Economía Internacional
(124, 44, '2023-09-20', 'P'),  -- Luis Fernando presente en Filosofía Contemporánea
(125, 45, '2023-09-21', 'A'),  -- Gabriela Estefanía ausente en Derecho Constitucional
(125, 43, '2023-09-19', 'P'),  -- Gabriela Estefanía presente en Economía Internacional

-- Estudiantes de 8vo EGB (curso_id = 16)
(131, 46, '2023-09-26', 'P'),  -- Miguel Ángel presente en Matemáticas Básicas
(131, 47, '2023-09-27', 'P'),  -- Miguel Ángel presente en Comunicación Oral
(132, 46, '2023-09-26', 'A'),  -- Daniela Estefanía ausente en Matemáticas Básicas
(132, 48, '2023-09-28', 'P'),  -- Daniela Estefanía presente en Ciencias Naturales
(133, 47, '2023-09-27', 'P'),  -- Kevin Josué presente en Comunicación Oral
(133, 48, '2023-09-28', 'T'),  -- Kevin Josué con tardanza en Ciencias Naturales
(134, 46, '2023-09-26', 'P'),  -- María José presente en Matemáticas Básicas
(134, 47, '2023-09-27', 'A'),  -- María José ausente en Comunicación Oral
(135, 48, '2023-09-28', 'P'),  -- José Daniel presente en Ciencias Naturales
(135, 46, '2023-09-26', 'P'),  -- José Daniel presente en Matemáticas Básicas

-- Estudiantes de 9no EGB (curso_id = 17)
(141, 49, '2023-10-03', 'P'),  -- Kerly Anahí presente en Educación Cultural y Artística
(141, 50, '2023-10-04', 'P'),  -- Kerly Anahí presente en Inglés Avanzado
(142, 49, '2023-10-03', 'T'),  -- Steven Alexander con tardanza en Educación Cultural y Artística
(142, 51, '2023-10-05', 'P'),  -- Steven Alexander presente en Computación
(143, 50, '2023-10-04', 'A'),  -- Mishell Dayana ausente en Inglés Avanzado
(143, 51, '2023-10-05', 'P'),  -- Mishell Dayana presente en Computación
(144, 49, '2023-10-03', 'P'),  -- Jhonatan Paul presente en Educación Cultural y Artística
(144, 50, '2023-10-04', 'P'),  -- Jhonatan Paul presente en Inglés Avanzado
(145, 51, '2023-10-05', 'A'),  -- Evelyn Nicole ausente en Computación
(145, 49, '2023-10-03', 'P'),  -- Evelyn Nicole presente en Educación Cultural y Artística

-- Estudiantes de 10mo EGB (curso_id = 18)
(146, 52, '2023-10-10', 'P'),  -- David Andrés presente en Educación Física
(146, 53, '2023-10-11', 'P'),  -- David Andrés presente en Emprendimiento
(147, 52, '2023-10-10', 'A'),  -- Génesis Alejandra ausente en Educación Física
(147, 54, '2023-10-12', 'P'),  -- Génesis Alejandra presente en Ciencias Sociales
(148, 53, '2023-10-11', 'P'),  -- Bryan Esteban presente en Emprendimiento
(148, 54, '2023-10-12', 'T'),  -- Bryan Esteban con tardanza en Ciencias Sociales
(149, 52, '2023-10-10', 'P'),  -- Nicole Valentina presente en Educación Física
(149, 53, '2023-10-11', 'A'),  -- Nicole Valentina ausente en Emprendimiento
(150, 54, '2023-10-12', 'P'),  -- Diego Armando presente en Ciencias Sociales
(150, 52, '2023-10-10', 'P');  -- Diego Armando presente en Educación Física

-- -----------------------------------------------------------------------------------
-- 11. Calificaciones (150 registros - 1 por estudiante en cada materia matriculada)
-- -----------------------------------------------------------------------------------
INSERT INTO Calificaciones (estudiante_id, materia_id, periodo, parcial1, parcial2, parcial3, promedio)
VALUES 

-- Calificaciones completas para Institución 1 (150 registros - 3 materias por estudiante)
-- Periodo 2023-2024

-- ==================== 1ro BGU (curso_id = 1) ====================
-- Estudiantes 1-10: Matemáticas (1), Lenguaje (2), Ciencias (3)
(1, 1, '2023-2024', 8.5, 7.8, 9.2, (8.5+7.8+9.2)/3),  -- Juan Carlos
(1, 2, '2023-2024', 7.0, 8.5, 9.0, (7.0+8.5+9.0)/3),
(1, 3, '2023-2024', 9.5, 8.0, 8.5, (9.5+8.0+8.5)/3),
-- -----------------------------------------------------------------------------------
(2, 1, '2023-2024', 6.5, 7.0, 8.0, (6.5+7.0+8.0)/3),   -- María José
(2, 2, '2023-2024', 8.0, 9.0, 9.5, (8.0+9.0+9.5)/3),
(2, 3, '2023-2024', 7.5, 8.5, 9.0, (7.5+8.5+9.0)/3),
-- -----------------------------------------------------------------------------------
(3, 1, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),   -- Carlos Andrés
(3, 2, '2023-2024', 9.0, 8.5, 9.0, (9.0+8.5+9.0)/3),
(3, 3, '2023-2024', 8.0, 7.5, 8.5, (8.0+7.5+8.5)/3),
-- -----------------------------------------------------------------------------------
(4, 1, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),   -- Andrea
(4, 2, '2023-2024', 6.0, 7.5, 8.0, (6.0+7.5+8.0)/3),
(4, 3, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
-- -----------------------------------------------------------------------------------
(5, 1, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),    -- Luis
(5, 2, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
(5, 3, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(6, 1, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),  -- Sofía
(6, 2, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
(6, 3, '2023-2024', 7.0, 8.0, 8.5, (7.0+8.0+8.5)/3),
-- -----------------------------------------------------------------------------------
(7, 1, '2023-2024', 6.0, 6.5, 7.0, (6.0+6.5+7.0)/3),    -- Diego
(7, 2, '2023-2024', 5.5, 6.0, 6.5, (5.5+6.0+6.5)/3),
(7, 3, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
-- -----------------------------------------------------------------------------------
(8, 1, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),    -- Patricia
(8, 2, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(8, 3, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(9, 1, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),    -- Javier
(9, 2, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(9, 3, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(10, 1, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3), -- Camila
(10, 2, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
(10, 3, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),

-- ==================== 2do BGU (curso_id = 2) ====================
-- Estudiantes 11-20: Matemáticas Avanzadas (4), Literatura (5), Biología (6)
(11, 4, '2023-2024', 9.0, 8.0, 9.5, (9.0+8.0+9.5)/3),   -- Fernando
(11, 5, '2023-2024', 7.5, 8.5, 9.0, (7.5+8.5+9.0)/3),
(11, 6, '2023-2024', 8.0, 9.0, 8.5, (8.0+9.0+8.5)/3),
-- -----------------------------------------------------------------------------------
(12, 4, '2023-2024', 6.0, 7.5, 8.0, (6.0+7.5+8.0)/3),   -- Gabriela
(12, 5, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),
(12, 6, '2023-2024', 7.0, 8.0, 7.5, (7.0+8.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(13, 4, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),   -- Pablo
(13, 5, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),
(13, 6, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(14, 4, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),   -- Melissa
(14, 5, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
(14, 6, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),
-- -----------------------------------------------------------------------------------
(15, 4, '2023-2024', 5.5, 6.0, 6.5, (5.5+6.0+6.5)/3),   -- Roberto
(15, 5, '2023-2024', 7.0, 8.0, 8.5, (7.0+8.0+8.5)/3),
(15, 6, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
-- -----------------------------------------------------------------------------------
(16, 4, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3), -- Daniela
(16, 5, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
(16, 6, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
-- -----------------------------------------------------------------------------------
(17, 4, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),   -- Ricardo
(17, 5, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(17, 6, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(18, 4, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),   -- Carolina
(18, 5, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
(18, 6, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
-- -----------------------------------------------------------------------------------
(19, 4, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),   -- Óscar
(19, 5, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
(19, 6, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(20, 4, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),   -- Fernanda
(20, 5, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(20, 6, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),

-- ==================== 3ro BGU (curso_id = 3) ====================
-- Estudiantes 21-30: Cálculo (7), Química (8), Física (9)
(21, 7, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),   -- Oscar
(21, 8, '2023-2024', 7.0, 8.0, 8.5, (7.0+8.0+8.5)/3),
(21, 9, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
-- -----------------------------------------------------------------------------------
(22, 7, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),   -- María
(22, 8, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
(22, 9, '2023-2024', 6.5, 7.5, 8.0, (6.5+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(23, 7, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),   -- Diego
(23, 8, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),
(23, 9, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
-- -----------------------------------------------------------------------------------
(24, 7, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3), -- Nataly
(24, 8, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
(24, 9, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
-- -----------------------------------------------------------------------------------
(25, 7, '2023-2024', 6.0, 6.5, 7.0, (6.0+6.5+7.0)/3),   -- Wilson
(25, 8, '2023-2024', 7.0, 8.0, 8.5, (7.0+8.0+8.5)/3),
(25, 9, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(26, 7, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),   -- Valeria
(26, 8, '2023-2024', 5.0, 6.0, 6.5, (5.0+6.0+6.5)/3),
(26, 9, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
-- -----------------------------------------------------------------------------------
(27, 7, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),   -- Andrés
(27, 8, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
(27, 9, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(28, 7, '2023-2024', 5.0, 6.0, 6.5, (5.0+6.0+6.5)/3),   -- Gabriela
(28, 8, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(28, 9, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
-- -----------------------------------------------------------------------------------
(29, 7, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3), -- David
(29, 8, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
(29, 9, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(30, 7, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),   -- Cristina
(30, 8, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(30, 9, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),

-- ==================== 8vo EGB (curso_id = 4) ====================
-- Estudiantes 31-40: Matemáticas Básicas (10), Lengua (11), Ciencias (12)
(31, 10, '2023-2024', 9.0, 8.5, 9.5, (9.0+8.5+9.5)/3), -- Walter
(31, 11, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
(31, 12, '2023-2024', 8.0, 9.0, 8.5, (8.0+9.0+8.5)/3),
-- -----------------------------------------------------------------------------------
(32, 10, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3), -- Lissette
(32, 11, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(32, 12, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(33, 10, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3), -- Alex
(33, 11, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
(33, 12, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(34, 10, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3), -- Mónica
(34, 11, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
(34, 12, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),
-- -----------------------------------------------------------------------------------
(35, 10, '2023-2024', 5.0, 6.0, 6.5, (5.0+6.0+6.5)/3), -- Vinicio
(35, 11, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(35, 12, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
-- -----------------------------------------------------------------------------------
(36, 10, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3), -- Esteban
(36, 11, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
(36, 12, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
-- -----------------------------------------------------------------------------------
(37, 10, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3), -- Karen
(37, 11, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(37, 12, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(38, 10, '2023-2024', 6.0, 6.5, 7.0, (6.0+6.5+7.0)/3), -- Felipe
(38, 11, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
(38, 12, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
-- -----------------------------------------------------------------------------------
(39, 10, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3), -- Daniel
(39, 11, '2023-2024', 5.0, 6.0, 6.5, (5.0+6.0+6.5)/3),
(39, 12, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
-- -----------------------------------------------------------------------------------
(40, 10, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3), -- Samantha
(40, 11, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(40, 12, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),

-- ==================== 9no EGB (curso_id = 5) ====================
-- Estudiantes 41-45: Álgebra (13), Literatura (14), Ciencias Ambientales (15)
(41, 13, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3), -- Fabricio
(41, 14, '2023-2024', 7.0, 8.0, 8.5, (7.0+8.0+8.5)/3),
(41, 15, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),
-- -----------------------------------------------------------------------------------
(42, 13, '2023-2024', 5.5, 6.0, 6.5, (5.5+6.0+6.5)/3), -- Domenica
(42, 14, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
(42, 15, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(43, 13, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3), -- Byron
(43, 14, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
(43, 15, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
-- -----------------------------------------------------------------------------------
(44, 13, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3), -- Estefanía
(44, 14, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
(44, 15, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
-- -----------------------------------------------------------------------------------
(45, 13, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3), -- Jonathan
(45, 14, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(45, 15, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),

-- ==================== 10mo EGB (curso_id = 6) ====================
-- Estudiantes 46-50: Geometría (16), Comunicación (17), Física (18)
(46, 16, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3), -- Brenda
(46, 17, '2023-2024', 7.0, 8.0, 8.5, (7.0+8.0+8.5)/3),
(46, 18, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(47, 16, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3), -- Gustavo
(47, 17, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
(47, 18, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
-- -----------------------------------------------------------------------------------
(48, 16, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3), -- Diana
(48, 17, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(48, 18, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(49, 16, '2023-2024', 6.0, 6.5, 7.0, (6.0+6.5+7.0)/3), -- Ricardo
(49, 17, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
(49, 18, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(50, 16, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3), -- María Belén
(50, 17, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
(50, 18, '2023-2024', 6.0, 6.5, 7.0, (6.0+6.5+7.0)/3),



-- Calificaciones completas para Institución 2 (150 registros - 3 materias por estudiante)
-- Periodo 2023-2024

-- ==================== 1ro BGU (curso_id = 7) ====================
-- Estudiantes 51-60: Física (19), Química (20), Biología (21)
(51, 19, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),  -- Ana Lucía
(51, 20, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
(51, 21, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
-- -----------------------------------------------------------------------------------
(52, 19, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),   -- Pedro Antonio
(52, 20, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
(52, 21, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(53, 19, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),  -- Laura Sofía
(53, 20, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
(53, 21, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
-- -----------------------------------------------------------------------------------
(54, 19, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),    -- Carlos Eduardo
(54, 20, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(54, 21, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(55, 19, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),    -- Daniela Alejandra
(55, 20, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),
(55, 21, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
-- -----------------------------------------------------------------------------------
(56, 19, '2023-2024', 5.5, 6.0, 6.5, (5.5+6.0+6.5)/3),    -- Miguel Ángel
(56, 20, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(56, 21, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
-- -----------------------------------------------------------------------------------
(57, 19, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),    -- Valentina María
(57, 20, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
(57, 21, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(58, 19, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),  -- José Luis
(58, 20, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
(58, 21, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
-- -----------------------------------------------------------------------------------
(59, 19, '2023-2024', 6.0, 6.5, 7.0, (6.0+6.5+7.0)/3),    -- Gabriela Fernanda
(59, 20, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
(59, 21, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(60, 19, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),    -- Diego Armando
(60, 20, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
(60, 21, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),

-- ==================== 2do BGU (curso_id = 8) ====================
-- Estudiantes 61-70: Historia (22), Geografía (23), Filosofía (24)
(61, 22, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),    -- Javier
(61, 23, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
(61, 24, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(62, 22, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),  -- Sofía
(62, 23, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
(62, 24, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
-- -----------------------------------------------------------------------------------
(63, 22, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),    -- David
(63, 23, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(63, 24, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),
-- -----------------------------------------------------------------------------------
(64, 22, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),    -- Valeria
(64, 23, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
(64, 24, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(65, 22, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),    -- Andrés
(65, 23, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(65, 24, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(66, 22, '2023-2024', 5.0, 6.0, 6.5, (5.0+6.0+6.5)/3),    -- Carolina
(66, 23, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(66, 24, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
-- -----------------------------------------------------------------------------------
(67, 22, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),    -- Felipe
(67, 23, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
(67, 24, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(68, 22, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),    -- Gabriela
(68, 23, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
(68, 24, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
-- -----------------------------------------------------------------------------------
(69, 22, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),  -- José
(69, 23, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
(69, 24, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(70, 22, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),    -- Marisol
(70, 23, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
(70, 24, '2023-2024', 5.0, 6.0, 6.5, (5.0+6.0+6.5)/3),

-- ==================== 3ro BGU (curso_id = 9) ====================
-- Estudiantes 71-80: Economía (25), Emprendimiento (26), Contabilidad (27)
(71, 25, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),   -- Camila
(71, 26, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
(71, 27, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
-- -----------------------------------------------------------------------------------
(72, 25, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),    -- Ricardo
(72, 26, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),
(72, 27, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(73, 25, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),    -- Patricia
(73, 26, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(73, 27, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
-- -----------------------------------------------------------------------------------
(74, 25, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),  -- Felipe
(74, 26, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),
(74, 27, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(75, 25, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),    -- Carolina
(75, 26, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
(75, 27, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),
-- -----------------------------------------------------------------------------------
(76, 25, '2023-2024', 5.5, 6.0, 6.5, (5.5+6.0+6.5)/3),    -- Oscar
(76, 26, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
(76, 27, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(77, 25, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),    -- Valeria
(77, 26, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
(77, 27, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(78, 25, '2023-2024', 6.0, 6.5, 7.0, (6.0+6.5+7.0)/3),    -- Diego
(78, 26, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(78, 27, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(79, 25, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),    -- Natalia
(79, 26, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
(79, 27, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
-- -----------------------------------------------------------------------------------
(80, 25, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),  -- Christian
(80, 26, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(80, 27, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),

-- ==================== 8vo EGB (curso_id = 10) ====================
-- Estudiantes 81-90: Matemáticas (28), Lengua (29), Ciencias Sociales (30)
(81, 28, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),   -- Marcelo
(81, 29, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
(81, 30, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(82, 28, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3), -- Daniela Estefanía
(82, 29, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
(82, 30, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(83, 28, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),    -- Kevin Josué
(83, 29, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
(83, 30, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
-- -----------------------------------------------------------------------------------
(84, 28, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),    -- María José
(84, 29, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(84, 30, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(85, 28, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),    -- José Daniel
(85, 29, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
(85, 30, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
-- -----------------------------------------------------------------------------------
(86, 28, '2023-2024', 5.0, 6.0, 6.5, (5.0+6.0+6.5)/3),    -- Andrea
(86, 29, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(86, 30, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(87, 28, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),    -- Luis
(87, 29, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
(87, 30, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(88, 28, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),  -- Gabriela
(88, 29, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(88, 30, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
-- -----------------------------------------------------------------------------------
(89, 28, '2023-2024', 6.0, 6.5, 7.0, (6.0+6.5+7.0)/3),    -- Diego
(89, 29, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
(89, 30, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(90, 28, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),    -- Carolina
(90, 29, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),
(90, 30, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),

-- ==================== 9no EGB (curso_id = 11) ====================
-- Estudiantes 91-95: Educación Cultural y Artística (31), Inglés Avanzado (32), Computación (33)
(91, 31, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),   -- Kerly Anahí
(91, 32, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
(91, 33, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(92, 31, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),  -- Steven Alexander
(92, 32, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
(92, 33, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
-- -----------------------------------------------------------------------------------
(93, 31, '2023-2024', 6.0, 6.5, 7.0, (6.0+6.5+7.0)/3),    -- Mishell Dayana
(93, 32, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(93, 33, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
-- -----------------------------------------------------------------------------------
(94, 31, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),    -- Jhonatan Paul
(94, 32, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
(94, 33, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(95, 31, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),    -- Evelyn Nicole
(95, 32, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(95, 33, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),

-- ==================== 10mo EGB (curso_id = 12) ====================
-- Estudiantes 96-100: Educación Física (34), Emprendimiento (35), Ciencias Sociales (36)
(96, 34, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),   -- David Andrés
(96, 35, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(96, 36, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),
-- -----------------------------------------------------------------------------------
(97, 34, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),    -- Génesis Alejandra
(97, 35, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
(97, 36, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(98, 34, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),  -- Bryan Esteban
(98, 35, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
(98, 36, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(99, 34, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),    -- Nicole Valentina
(99, 35, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(99, 36, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(100, 34, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),   -- Diego Armando
(100, 35, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(100, 36, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),



-- Calificaciones completas para Institución 3 (150 registros - 3 materias por estudiante)
-- Periodo 2023-2024

-- ==================== 1ro BGU (curso_id = 13) ====================
-- Estudiantes 101-110: Matemáticas Avanzadas (37), Literatura Universal (38), Biología Molecular (39)
(101, 37, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),  -- Luisa Fernanda
(101, 38, '2023-2024', 7.0, 8.0, 8.5, (7.0+8.0+8.5)/3),
(101, 39, '2023-2024', 6.5, 7.5, 8.0, (6.5+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(102, 37, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3), -- Carlos Manuel
(102, 38, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
(102, 39, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
-- -----------------------------------------------------------------------------------
(103, 37, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),   -- Ana Patricia
(103, 38, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(103, 39, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(104, 37, '2023-2024', 6.0, 6.5, 7.0, (6.0+6.5+7.0)/3),    -- José Luis
(104, 38, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
(104, 39, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(105, 37, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),    -- Diana Carolina
(105, 38, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
(105, 39, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
-- -----------------------------------------------------------------------------------
(106, 37, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),    -- Fernando Xavier
(106, 38, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
(106, 39, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(107, 37, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),  -- María Gabriela
(107, 38, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
(107, 39, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(108, 37, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),    -- Diego Alejandro
(108, 38, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(108, 39, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
-- -----------------------------------------------------------------------------------
(109, 37, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),    -- Valeria Elizabeth
(109, 38, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
(109, 39, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
-- -----------------------------------------------------------------------------------
(110, 37, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),   -- Christian David
(110, 38, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(110, 39, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),

-- ==================== 2do BGU (curso_id = 14) ====================
-- Estudiantes 111-120: Física Cuántica (40), Química Orgánica (41), Historia del Arte (42)
(111, 40, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),   -- Andrea Nicole
(111, 41, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(111, 42, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(112, 40, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),    -- Juan Sebastián
(112, 41, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
(112, 42, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(113, 40, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),    -- Paula Alejandra
(113, 41, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
(113, 42, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
-- -----------------------------------------------------------------------------------
(114, 40, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),  -- Luis Fernando
(114, 41, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(114, 42, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(115, 40, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),    -- Gabriela Estefanía
(115, 41, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
(115, 42, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
-- -----------------------------------------------------------------------------------
(116, 40, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),    -- Marcelo
(116, 41, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(116, 42, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(117, 40, '2023-2024', 5.5, 6.0, 6.5, (5.5+6.0+6.5)/3),    -- Daniela Estefanía
(117, 41, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
(117, 42, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
-- -----------------------------------------------------------------------------------
(118, 40, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),    -- Kevin Josué
(118, 41, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),
(118, 42, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(119, 40, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),  -- María José
(119, 41, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
(119, 42, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(120, 40, '2023-2024', 6.0, 6.5, 7.0, (6.0+6.5+7.0)/3),    -- José Daniel
(120, 41, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),
(120, 42, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),

-- ==================== 3ro BGU (curso_id = 15) ====================
-- Estudiantes 121-130: Economía Internacional (43), Filosofía Contemporánea (44), Derecho Constitucional (45)
(121, 43, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),   -- Kerly Anahí
(121, 44, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(121, 45, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),
-- -----------------------------------------------------------------------------------
(122, 43, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),  -- Steven Alexander
(122, 44, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
(122, 45, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(123, 43, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),    -- Mishell Dayana
(123, 44, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
(123, 45, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(124, 43, '2023-2024', 6.0, 6.5, 7.0, (6.0+6.5+7.0)/3),    -- Jhonatan Paul
(124, 44, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(124, 45, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
-- -----------------------------------------------------------------------------------
(125, 43, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),    -- Evelyn Nicole
(125, 44, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),
(125, 45, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(126, 43, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),    -- David Andrés
(126, 44, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
(126, 45, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
-- -----------------------------------------------------------------------------------
(127, 43, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),  -- Génesis Alejandra
(127, 44, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
(127, 45, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(128, 43, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),    -- Bryan Esteban
(128, 44, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
(128, 45, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(129, 43, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),    -- Nicole Valentina
(129, 44, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),
(129, 45, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(130, 43, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),    -- Diego Armando
(130, 44, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(130, 45, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),

-- ==================== 8vo EGB (curso_id = 16) ====================
-- Estudiantes 131-140: Matemáticas Básicas (46), Comunicación Oral (47), Ciencias Naturales (48)
(131, 46, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),   -- Andrea
(131, 47, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(131, 48, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(132, 46, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),    -- Luis
(132, 47, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
(132, 48, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(133, 46, '2023-2024', 6.0, 6.5, 7.0, (6.0+6.5+7.0)/3),    -- Gabriela
(133, 47, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
(133, 48, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
-- -----------------------------------------------------------------------------------
(134, 46, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),  -- Diego
(134, 47, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(134, 48, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(135, 46, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),    -- Carolina
(135, 47, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
(135, 48, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),

-- ==================== 9no EGB (curso_id = 17) ====================
-- Estudiantes 141-145: Educación Cultural y Artística (49), Inglés Avanzado (50), Computación (51)
(141, 49, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),   -- Miguel Ángel
(141, 50, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
(141, 51, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(142, 49, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3), -- Daniela Estefanía
(142, 50, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
(142, 51, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
-- -----------------------------------------------------------------------------------
(143, 49, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),   -- Kevin Josué
(143, 50, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),
(143, 51, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
-- -----------------------------------------------------------------------------------
(144, 49, '2023-2024', 6.0, 6.5, 7.0, (6.0+6.5+7.0)/3),    -- María José
(144, 50, '2023-2024', 9.5, 9.0, 10.0, (9.5+9.0+10.0)/3),
(144, 51, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(145, 49, '2023-2024', 8.0, 8.5, 9.0, (8.0+8.5+9.0)/3),    -- José Daniel
(145, 50, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
(145, 51, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),

-- ==================== 10mo EGB (curso_id = 18) ====================
-- Estudiantes 146-150: Educación Física (52), Emprendimiento (53), Ciencias Sociales (54)
(146, 52, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),   -- Andrea
(146, 53, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),
(146, 54, '2023-2024', 6.5, 7.0, 7.5, (6.5+7.0+7.5)/3),
-- -----------------------------------------------------------------------------------
(147, 52, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3), -- Luis
(147, 53, '2023-2024', 5.5, 6.5, 7.0, (5.5+6.5+7.0)/3),
(147, 54, '2023-2024', 7.0, 7.5, 8.0, (7.0+7.5+8.0)/3),
-- -----------------------------------------------------------------------------------
(148, 52, '2023-2024', 6.0, 6.5, 7.0, (6.0+6.5+7.0)/3),    -- Gabriela
(148, 53, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),
(148, 54, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
-- -----------------------------------------------------------------------------------
(149, 52, '2023-2024', 8.5, 9.0, 9.5, (8.5+9.0+9.5)/3),   -- Diego
(149, 53, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3),
(149, 54, '2023-2024', 5.0, 6.5, 7.0, (5.0+6.5+7.0)/3),
-- -----------------------------------------------------------------------------------
(150, 52, '2023-2024', 7.5, 8.0, 8.5, (7.5+8.0+8.5)/3),   -- Carolina
(150, 53, '2023-2024', 9.0, 9.5, 10.0, (9.0+9.5+10.0)/3),
(150, 54, '2023-2024', 6.0, 7.0, 7.5, (6.0+7.0+7.5)/3);


-- -----------------------------------------------------------------------------------
-- VISUALIZACIONES
-- -----------------------------------------------------------------------------------

-- Ver estudiantes de la institución 3
SELECT estudiante_id, nombres, apellidos 
FROM Estudiantes 
WHERE institucion_id = 1
ORDER BY estudiante_id;

-- Ver responsables correspondientes
SELECT responsable_id, nombres, apellidos 
FROM Responsables 
WHERE responsable_id = 1
ORDER BY responsable_id;




-- Verificación del total de registros
DECLARE @total_registros INT;
SELECT @total_registros = 
    (SELECT COUNT(*) FROM Instituciones) +
    (SELECT COUNT(*) FROM Estudiantes) +
    (SELECT COUNT(*) FROM Responsables) +
    (SELECT COUNT(*) FROM Estudiante_Responsable) +
    (SELECT COUNT(*) FROM Docentes) +
    (SELECT COUNT(*) FROM Cursos) +
    (SELECT COUNT(*) FROM Materias) +
    (SELECT COUNT(*) FROM Docente_Materia) +
    (SELECT COUNT(*) FROM Matriculas) +
    (SELECT COUNT(*) FROM Asistencias) +
    (SELECT COUNT(*) FROM Calificaciones);
    
PRINT CONCAT('Total de registros insertados: ', @total_registros);
-- Debería mostrar: Total de registros insertados: 500+

