CREATE DATABASE IF NOT EXISTS futarg;
USE futarg;

CREATE TABLE IF NOT EXISTS futarg.equipos (
id_equipo INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(100),
pais VARCHAR (50),
ciudad VARCHAR (50),
fecha_fundacion DATE
);


CREATE TABLE IF NOT EXISTS futarg.estadios (
id_estadio INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(100),
ciudad VARCHAR (50),
capacidad INT
);


CREATE TABLE IF NOT EXISTS futarg.arbitros (
id_arbitro INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(60),
apellido VARCHAR (60),
nacionalidad VARCHAR (50)
);


CREATE TABLE IF NOT EXISTS futarg.jugadores (
id_jugador INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(100),
apellido VARCHAR (50),
nacionalidad VARCHAR (50),
fecha_nacimiento DATE,
posicion VARCHAR(30)
);


CREATE TABLE IF NOT EXISTS futarg.competiciones (
id_competicion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(100) UNIQUE,
pais VARCHAR (50),
nivel VARCHAR (30)
);


CREATE TABLE IF NOT EXISTS futarg.fechas (
id_fecha INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
numero_fecha INT,
descripcion VARCHAR (100)
);


CREATE TABLE IF NOT EXISTS futarg.partidos(
id_partido INT NOT NULL PRIMARY KEY,
id_competicion INT,
FOREIGN KEY (id_competicion) REFERENCES futarg.competiciones(id_competicion),
id_fecha INT,
FOREIGN KEY (id_fecha) REFERENCES futarg.fechas(id_fecha),
id_equipo_local INT,
FOREIGN KEY (id_equipo_local) REFERENCES futarg.equipos(id_equipo),
id_equipo_visitante INT,
FOREIGN KEY (id_equipo_visitante) REFERENCES futarg.equipos(id_equipo),
id_estadio INT,
FOREIGN KEY (id_estadio) REFERENCES futarg.estadios(id_estadio),
id_arbitro INT,
FOREIGN KEY (id_arbitro) REFERENCES futarg.arbitros(id_arbitro),
fecha_partido DATE,
goles_local TINYINT,
goles_visitnate TINYINT
);

CREATE TABLE IF NOT EXISTS futarg.alineaciones (
id_partido INT NOT NULL,
id_jugador INT NOT NULL,
id_equipo INT NOT NULL,
titular BOOLEAN,
minutos_jugados TINYINT,
PRIMARY KEY (id_partido,id_jugador),
FOREIGN KEY (id_partido) REFERENCES futarg.partidos(id_partido),
FOREIGN KEY (id_jugador) REFERENCES futarg.jugadores(id_jugador),
FOREIGN KEY (id_equipo) REFERENCES futarg.equipos(id_equipo)
);

CREATE TABLE IF NOT EXISTS futarg.eventos (
id_evento INT NOT NULL PRIMARY KEY,
id_partido INT,
FOREIGN KEY (id_partido) REFERENCES futarg.partidos(id_partido),
id_jugador INT, 
FOREIGN KEY (id_jugador) REFERENCES futarg.jugadores(id_jugador),
minuto TINYINT,
tipo_evento VARCHAR(50)
);

INSERT INTO futarg.equipos (id_equipo, nombre, pais, ciudad, fecha_fundacion) VALUES 
(1, 'River Plate', 'Argentina', 'Buenos Aires', '1901-05-25'),
(2, 'Boca Juniors', 'Argentina', 'Buenos Aires', '1905-04-03'),
(3, 'Independiente', 'Argentina', 'Avellaneda', '1904-08-01'),
(4, 'Racing Club', 'Argentina', 'Avellaneda', '1903-03-25'),
(5, 'San Lorenzo de Almagro', 'Argentina', 'Buenos Aires', '1908-04-01'),
(6, 'Club Atlético Huracán', 'Argentina', 'Buenos Aires', '1908-11-01'),
(7, 'Vélez Sarsfield', 'Argentina', 'Buenos Aires', '1910-01-01'),
(8, 'Estudiantes de La Plata', 'Argentina', 'La Plata', '1905-08-04'),
(9, 'Club Atlético Lanús', 'Argentina', 'Lanús', '1915-01-03'),
(10, 'Club Atlético Banfield', 'Argentina', 'Banfield', '1896-01-21'),
(11, 'Argentinos Juniors', 'Argentina', 'Buenos Aires', '1904-08-15'),
(12, 'Club Atlético Tigre', 'Argentina', 'Victoria', '1902-08-03'),
(13, 'Defensa y Justicia', 'Argentina', 'Florencio Varela', '1935-05-20'),
(14, 'Club Atlético Newell\'s Old Boys', 'Argentina', 'Rosario', '1903-11-03'),
(15, 'Club Atlético Rosario Central', 'Argentina', 'Rosario', '1889-12-24'),
(16, 'Club Atlético Colón', 'Argentina', 'Santa Fe', '1905-05-05'),
(17, 'Godoy Cruz Antonio Tomba', 'Argentina', 'Godoy Cruz', '1921-06-21'),
(18, 'Club Atlético Tucumán', 'Argentina', 'San Miguel de Tucumán', '1902-09-27'),
(19, 'Club Atlético Unión', 'Argentina', 'Santa Fe', '1907-04-15'),
(20, 'Club de Gimnasia y Esgrima La Plata', 'Argentina', 'La Plata', '1887-06-03');

INSERT INTO futarg.estadios (id_estadio, nombre, ciudad, capacidad) VALUES 
(1, 'Estadio Monumental Antonio Vespucio Liberti', 'Buenos Aires', 83000),
(2, 'Estadio Alberto J. Armando', 'Buenos Aires', 54000),
(3, 'Estadio Libertadores de América', 'Avellaneda', 48000),
(4, 'Estadio Presidente Perón', 'Avellaneda', 51000),
(5, 'Estadio Pedro Bidegain', 'Buenos Aires', 47000),
(6, 'Estadio Tomás Adolfo Ducó', 'Buenos Aires', 48000),
(7, 'Estadio José Amalfitani', 'Buenos Aires', 49500),
(8, 'Estadio Jorge Luis Hirschi', 'La Plata', 30000),
(9, 'Estadio Ciudad de Lanús', 'Lanús', 46000),
(10, 'Estadio Florencio Solá', 'Banfield', 35000),
(11, 'Estadio Diego Armando Maradona', 'Buenos Aires', 26000),
(12, 'Estadio José Dellagiovanna', 'Victoria', 26000),
(13, 'Estadio Norberto Tito Tomaghello', 'Florencio Varela', 20000),
(14, 'Estadio Marcelo Bielsa', 'Rosario', 38000),
(15, 'Estadio Gigante de Arroyito', 'Rosario', 46000),
(16, 'Estadio Brigadier General Estanislao López', 'Santa Fe', 33000),
(17, 'Estadio Malvinas Argentinas', 'Godoy Cruz', 30000),
(18, 'Estadio Monumental José Fierro', 'San Miguel de Tucumán', 32000),
(19, 'Estadio 15 de Abril', 'Santa Fe', 28000),
(20, 'Estadio Juan Carmelo Zerillo', 'La Plata', 21000);

INSERT INTO futarg.jugadores (id_jugador, nombre, apellido, nacionalidad, fecha_nacimiento, posicion) VALUES 
(1, 'Franco', 'Armani', 'Argentina', '1986-10-16', 'Arquero'),
(2, 'Enzo', 'Pérez', 'Argentina', '1986-02-22', 'Mediocampista'),
(3, 'Jorge', 'Carrascal', 'Colombia', '1999-05-25', 'Volante'),
(4, 'Nicolás', 'De la Cruz', 'Uruguay', '1997-06-01', 'Mediocampista'),
(5, 'Pablo', 'Solari', 'Argentina', '1997-03-22', 'Delantero'),
(6, 'Miguel', 'Borja', 'Colombia', '1993-01-26', 'Delantero'),
(7, 'Leandro', 'González Pirez', 'Argentina', '1992-02-26', 'Defensor'),
(8, 'Paulo', 'Díaz', 'Chile', '1994-08-25', 'Defensor'),
(9, 'Bruno', 'Zuculini', 'Argentina', '1993-04-02', 'Volante'),
(10, 'Emanuel', 'Mammana', 'Argentina', '1996-02-10', 'Defensor'),
(11, 'Lucas', 'Beltrán', 'Argentina', '2001-03-29', 'Delantero'),
(12, 'Agustín', 'Palavecino', 'Argentina', '1996-02-20', 'Volante'),
(13, 'Nicolás', 'Fonseca', 'Colombia', '2000-02-22', 'Mediocampista'),
(14, 'Franco', 'Ibarra', 'Argentina', '2002-02-06', 'Mediocampista'),
(15, 'Ramiro', 'Sanguinetti', 'Argentina', '2002-03-16', 'Defensor'),
(16, 'Sergio', 'Romero', 'Argentina', '1987-02-22', 'Arquero'),
(17, 'Marcos', 'Rojo', 'Argentina', '1990-03-20', 'Defensor'),
(18, 'Cristian', 'Medina', 'Argentina', '2002-06-01', 'Volante'),
(19, 'Edinson', 'Cavani', 'Uruguay', '1987-02-14', 'Delantero'),
(20, 'Sebastián', 'Villa', 'Colombia', '1996-05-19', 'Delantero'),
(21, 'Juan', 'Riquelme', 'Argentina', '1978-06-24', 'Mediocampista'),
(22, 'Luis', 'Advíncula', 'Perú', '1990-03-02', 'Defensor'),
(23, 'Nicolás', 'Figal', 'Argentina', '1994-04-03', 'Defensor'),
(24, 'Agustín', 'Sandez', 'Argentina', '2001-09-12', 'Defensor'),
(25, 'Darío', 'Benedetto', 'Argentina', '1986-05-10', 'Delantero'),
(26, 'Exequiel', 'Zeballos', 'Argentina', '2002-04-24', 'Delantero'),
(27, 'Guillermo', 'Fernández', 'Argentina', '1991-10-11', 'Mediocampista'),
(28, 'Javier', 'García', 'Argentina', '1997-10-29', 'Arquero'),
(29, 'Alan', 'Varela', 'Argentina', '2001-07-04', 'Volante'),
(30, 'Kevin', 'Zenón', 'Argentina', '2002-02-24', 'Mediocampista'),
(31, 'Leandro', 'Rey', 'Argentina', '1999-07-15', 'Arquero'),
(32, 'Jhon', 'Candia', 'Paraguay', '1998-03-15', 'Delantero'),
(33, 'Leandro', 'Fernández', 'Argentina', '1995-03-12', 'Defensor'),
(34, 'Santiago', 'Trellez', 'Colombia', '1997-02-17', 'Delantero'),
(35, 'Adrián', ' Martínez', 'Argentina', '1992-11-08', 'Arquero'),
(36, 'Andrés', 'Roche', 'Argentina', '1998-05-02', 'Defensor'),
(37, 'Juan', 'Sforza', 'Argentina', '2002-02-12', 'Mediocampista'),
(38, 'Tomas', 'Pochettino', 'Argentina', '2001-02-07', 'Mediocampista'),
(39, 'Mauricio', 'Cuero', 'Colombia', '1996-05-28', 'Delantero'),
(40, 'Fabián', 'Lobo', 'Argentina', '2002-03-06', 'Mediocampista'),
(41, 'Lucas', 'González', 'Argentina', '1997-07-21', 'Defensor'),
(42, 'Javier', 'Correa', 'Argentina', '1992-10-10', 'Delantero'),
(43, 'Sergio', 'Barreto', 'Argentina', '1999-07-05', 'Volante'),
(44, 'Ayrton', 'Preciado', 'Ecuador', '1997-12-17', 'Delantero'),
(45, 'Aníbal', 'Moreno', 'Argentina', '2000-05-12', 'Volante'),
(46, 'Gabriel', 'Arias', 'Argentina', '1987-09-13', 'Arquero'),
(47, 'Gastón', 'Giménez', 'Argentina', '1991-07-27', 'Volante'),
(48, 'Aníbal', 'Godoy', 'Paraguay', '1991-02-10', 'Volante'),
(49, 'Johan', 'Carbonero', 'Colombia', '1999-07-27', 'Mediocampista'),
(50, 'Roger', 'Martínez', 'Colombia', '1994-06-23', 'Delantero'),
(51, 'Agustín', 'Almendra', 'Argentina', '2000-02-11', 'Volante'),
(52, 'Leonardo', 'Sigali', 'Argentina', '1988-05-28', 'Defensor'),
(53, 'Iván', 'Arboleda', 'Colombia', '1996-04-24', 'Arquero'),
(54, 'Eugenio', 'Mena', 'Chile', '1988-07-18', 'Defensor'),
(55, 'Haibin', 'Zhao', 'China', '1999-01-15', 'Mediocampista'),
(56, 'Tomás', 'Chancalay', 'Argentina', '2000-01-01', 'Delantero'),
(57, 'Marcelo', 'Díaz', 'Chile', '1986-12-30', 'Volante'),
(58, 'Javier', 'Lanus', 'Argentina', '1992-10-10', 'Delantero'), 
(59, 'Nicolás', 'López', 'Argentina', '1986-10-01', 'Defensor'),
(60, 'Mauricio', 'Martínez', 'Argentina', '1998-12-12', 'Defensor'),
(61, 'Sebastián', 'Torrico', 'Argentina', '1980-02-22', 'Arquero'),
(62, 'Malcom', 'Braida', 'Argentina', '1997-11-20', 'Mediocampista'),
(63, 'Adam', 'Le Fondre', 'Australia', '1986-12-15', 'Delantero'),
(64, 'Gustavo', 'Bou', 'Argentina', '1990-02-18', 'Delantero'),
(65, 'Ezequiel', 'Cerutti', 'Argentina', '1992-01-17', 'Delantero'),
(66, 'Federico', 'Girotti', 'Argentina', '1999-02-04', 'Delantero'),
(67, 'Gabriel', 'Rojo', 'Argentina', '1997-03-14', 'Defensor'),
(68, 'Diego', 'Godín', 'Uruguay', '1986-02-16', 'Defensor'),
(69, 'Ezequiel', 'Ávila', 'Argentina', '1985-02-06', 'Delantero'),
(70, 'Nahuel', 'Barrios', 'Argentina', '1998-06-12', 'Mediocampista'),
(71, 'Francisco', 'Mac Allister', 'Argentina', '1995-10-07', 'Volante'),
(72, 'Christian', 'Olivares', 'Argentina', '1999-05-17', 'Arquero'),
(73, 'Eric', 'Remedi', 'Argentina', '1995-06-04', 'Volante'),
(74, 'Juan', 'Bruno', 'Argentina', '1998-02-14', 'Defensor'),
(75, 'Walter', 'Kempes', 'Argentina', '1998-09-14', 'Delantero'),
(76, 'Ignacio', 'Casile', 'Argentina', '1987-02-13', 'Arquero'),
(77, 'Gino', 'Peruzzi', 'Argentina', '1992-06-09', 'Defensor'),
(78, 'Lucas', 'Merkis', 'Argentina', '1993-06-07', 'Defensor'),
(79, 'Mauro', 'Gómez', 'Argentina', '1988-10-14', 'Delantero'),
(80, 'Matías', 'Córdoba', 'Argentina', '1998-05-17', 'Mediocampista'),
(81, 'Jesús', 'Rendón', 'Colombia', '1998-11-18', 'Defensor'),
(82, 'Juan', 'Heinze', 'Argentina', '1978-05-19', 'Defensor'),
(83, 'Santiago', 'Caseres', 'Argentina', '1997-02-22', 'Volante'),
(84, 'Cristián', 'Techera', 'Uruguay', '1992-05-05', 'Delantero'),
(85, 'Andrés', 'Chávez', 'Argentina', '1991-03-21', 'Delantero'),
(86, 'Ramiro', 'Funes Mori', 'Argentina', '1991-03-05', 'Defensor'),
(87, 'Patricio', 'Pizarro', 'Argentina', '2000-04-17', 'Arquero'),
(88, 'Juan', 'Garro', 'Argentina', '1999-11-13', 'Mediocampista'),
(89, 'Nicolás', 'Primera', 'Argentina', '1999-08-04', 'Defensor'),
(90, 'Iván', 'Maestro', 'Argentina', '1999-03-05', 'Mediocampista'),
(91, 'Walter', 'Benítez', 'Argentina', '1993-03-19', 'Arquero'),
(92, 'Germán', 'Conti', 'Argentina', '1990-06-03', 'Defensor'),
(93, 'Luis', 'Abraham', 'Argentina', '1999-02-13', 'Defensor'),
(94, 'Julián', 'Fernández', 'Argentina', '2004-01-27', 'Mediocampista'),
(95, 'Thiago', 'Almada', 'Argentina', '2001-02-26', 'Mediocampista'),
(96, 'Lucas', 'Janson', 'Argentina', '1994-08-16', 'Delantero'),
(97, 'Cristian', 'Oswaldo', 'Colombia', '2000-08-05', 'Delantero'),
(98, 'Juan', 'Martínez', 'Argentina', '2000-07-29', 'Arquero'),
(99, 'Francisco', 'Gialleonardo', 'Argentina', '1993-12-07', 'Defensor'),
(100, 'Bruno', 'Sepúlveda', 'Argentina', '1999-10-11', 'Defensor'),
(101, 'Braian', 'Romero', 'Argentina', '1991-06-15', 'Delantero'),
(102, 'Jonathan', 'Gómez', 'Argentina', '1998-12-21', 'Volante'),
(103, 'Valentín', 'Gómez', 'Argentina', '2002-02-16', 'Defensor'),
(104, 'Abiel', 'Osorio', 'Colombia', '2004-02-17', 'Delantero'),
(105, 'Mauricio', 'Moreno', 'Argentina', '1998-01-19', 'Mediocampista'),
(106, 'Mariano', 'Andújar', 'Argentina', '1983-07-30', 'Arquero'),
(107, 'Emmanuel', 'Mammana', 'Argentina', '1996-02-10', 'Defensor'),
(108, 'Lucas', 'Lózano', 'Argentina', '1999-02-10', 'Defensor'),
(109, 'Joaquín', 'Pereyra', 'Argentina', '1994-01-30', 'Mediocampista'),
(110, 'Mauro', 'Boselli', 'Argentina', '1985-05-22', 'Delantero'),
(111, 'Santiago', 'Ascacíbar', 'Argentina', '1997-02-25', 'Volante'),
(112, 'Javier', 'Mascherano', 'Argentina', '1984-06-08', 'Volante'),
(113, 'Leandro', 'Díaz', 'Argentina', '1998-06-06', 'Delantero'),
(114, 'Juan', 'Foyth', 'Argentina', '1998-01-15', 'Defensor'),
(115, 'Federico', 'Fernández', 'Argentina', '1989-02-21', 'Defensor'),
(116, 'Guido', 'Carrillo', 'Argentina', '1991-05-25', 'Delantero'),
(117, 'Diego', 'Godín', 'Uruguay', '1986-02-16', 'Defensor'),
(118, 'Lucas', ' Rodríguez', 'Argentina', '1999-07-17', 'Mediocampista'),
(119, 'Ezequiel', 'Muñoz', 'Argentina', '1990-02-07', 'Defensor'),
(120, 'Mateo', 'Retegui', 'Italia', '1999-04-29', 'Delantero'),
(121, 'Lautaro', 'Voy', 'Argentina', '1998-11-19', 'Arquero'),
(122, 'Frank', 'Sonny', 'Argentina', '1998-02-14', 'Defensor'),
(123, 'Iván', 'Gómez', 'Argentina', '1998-04-02', 'Defensor'),
(124, 'José', 'Sand', 'Argentina', '1980-07-17', 'Delantero'),
(125, 'Diego', 'González', 'Argentina', '1998-02-09', 'Mediocampista'),
(126, 'Maximiliano', 'Araújo', 'Uruguay', '1999-02-15', 'Delantero'),
(127, 'Pedro', 'De La Vega', 'Argentina', '2001-02-07', 'Mediocampista'),
(128, 'Lautaro', 'Acosta', 'Argentina', '1988-03-14', 'Volante'),
(129, 'Francisco', 'Metilli', 'Argentina', '1999-03-12', 'Mediocampista'),
(130, 'Joaquín', 'Novillo', 'Argentina', '1998-02-05', 'Volante'),
(131, 'Federico', 'Barrera', 'Argentina', '1996-05-18', 'Defensor'),
(132, 'Tomás', 'Belgrano', 'Argentina', '2003-06-19', 'Arquero'),
(133, 'Gastón', 'Verón', 'Argentina', '2000-04-26', 'Defensor'),
(134, 'Abel', 'Hernández', 'Uruguay', '1990-08-08', 'Delantero'),
(135, 'Alejandro', 'Brahim', 'Argentina', '2002-03-17', 'Mediocampista'),
(136, 'Enrique', 'Bologna', 'Argentina', '1985-02-18', 'Arquero'),
(137, 'Adrián', 'Márquez', 'Argentina', '1996-10-05', 'Defensor'),
(138, 'Erik', 'Lamela', 'Argentina', '1992-03-04', 'Mediocampista'),
(139, 'Jesús', 'Ramos', 'Venezuela', '1997-10-25', 'Delantero'),
(140, 'Víctor', 'López', 'Argentina', '1997-06-09', 'Defensor'),
(141, 'Giuliano', 'Galoppo', 'Argentina', '1999-06-24', 'Mediocampista'),
(142, 'Milton', 'Casco', 'Argentina', '1988-10-11', 'Defensor'),
(143, 'Nicolás', 'Domínguez', 'Argentina', '1996-06-28', 'Volante'),
(144, 'Agustín', 'Álvarez', 'Argentina', '1999-09-20', 'Delantero'),
(145, 'Facundo', 'Kröpfl', 'Argentina', '2001-05-28', 'Delantero'),
(146, 'Lucas', 'Brozzo', 'Argentina', '2000-01-20', 'Mediocampista'),
(147, 'Julián', 'López', 'Argentina', '1997-01-31', 'Arquero'),
(148, 'Mauricio', 'Cuero', 'Colombia', '1996-05-28', 'Delantero'),
(149, 'Joaquín', 'Pereyra', 'Argentina', '2000-12-12', 'Mediocampista'),
(150, 'Cristian', 'Lema', 'Argentina', '1990-03-24', 'Defensor'),
(151, 'Lucas', 'Chávez', 'Argentina', '1995-03-12', 'Arquero'),
(152, 'Nicolás', 'Tagliafico', 'Argentina', '1992-08-31', 'Defensor'),
(153, 'Miguel', 'Torres', 'Argentina', '1994-01-12', 'Defensor'),
(154, 'Fausto', 'Vera', 'Argentina', '2000-03-16', 'Volante'),
(155, 'Javier', 'Zanetti', 'Argentina', '1973-08-10', 'Defensor'),
(156, 'Kevin', 'Mac Allister', 'Argentina', '1997-11-07', 'Mediocampista'),
(157, 'Diego', 'González', 'Argentina', '1998-02-09', 'Delantero'),
(158, 'Gaston', 'Verón', 'Argentina', '2000-04-26', 'Mediocampista'),
(159, 'Franco', 'Carboni', 'Argentina', '2003-04-16', 'Defensor'),
(160, 'Pablo', 'Magnín', 'Argentina', '1997-04-25', 'Delantero'),
(161, 'Tomás', 'Conechny', 'Argentina', '1998-03-29', 'Mediocampista'),
(162, 'Matías', 'Romero', 'Argentina', '1998-01-15', 'Volante'),
(163, 'Cristian', 'Olivares', 'Argentina', '1999-05-17', 'Arquero'),
(164, 'Leonel', 'Mosevich', 'Argentina', '1998-05-04', 'Defensor'),
(165, 'Santiago', 'Castro', 'Argentina', '2004-03-12', 'Delantero'),
(166, 'Mateo', 'Retegui', 'Argentina', '1999-04-29', 'Delantero'),
(167, 'Walter', 'Calvo', 'Argentina', '2002-03-14', 'Arquero'),
(168, 'Gonzalo', 'Gorriarán', 'Argentina', '1995-03-12', 'Mediocampista'),
(169, 'Flavio', 'Blanco', 'Argentina', '1998-02-12', 'Defensor'),
(170, 'Jonathan', 'Gómez', 'Argentina', '1998-12-21', 'Volante'),
(171, 'Luis', 'Oyarzún', 'Chile', '1999-03-12', 'Defensor'),
(172, 'Mateo', 'Fiorotto', 'Argentina', '2002-04-22', 'Arquero'),
(173, 'Nicolás', 'Fernández', 'Argentina', '1998-04-12', 'Mediocampista'),
(174, 'Joaquín', 'Ibáñez', 'Argentina', '1999-07-18', 'Defensor'),
(175, 'Blas', 'Armoa', 'Paraguay', '2000-02-05', 'Delantero'),
(176, 'Lucas', 'Menossi', 'Argentina', '1997-07-14', 'Volante'),
(177, 'Alexis', 'Mendoza', 'Argentina', '2001-05-10', 'Defensor'),
(178, 'Leonardo', 'Sequeira', 'Argentina', '1995-05-22', 'Mediocampista'),
(179, 'Guido', 'Navarro', 'Argentina', '2000-02-19', 'Delantero'),
(180, 'Lautaro', 'Ruiz', 'Argentina', '1999-01-24', 'Arquero'),
(181, 'Fernando', 'Monetti', 'Argentina', '1989-02-21', 'Arquero'),
(182, 'Enzo', 'Coacci', 'Argentina', '2001-12-17', 'Defensor'),
(183, 'Francisco', 'Pizzini', 'Argentina', '1993-09-19', 'Mediocampista'),
(184, 'Federico', 'Gattoni', 'Argentina', '1999-02-16', 'Defensor'),
(185, 'Adrián', 'Martínez', 'Argentina', '1992-11-08', 'Arquero'),
(186, 'Tomás', 'Escalante', 'Argentina', '1997-10-16', 'Defensor'),
(187, 'Julián', 'López', 'Argentina', '1989-10-20', 'Volante'),
(188, 'Walter', 'Bou', 'Argentina', '1993-08-25', 'Delantero'),
(189, 'Brian', 'Fernández', 'Argentina', '1994-09-26', 'Delantero'),
(190, 'David', 'Terans', 'Uruguay', '1994-08-11', 'Mediocampista'),
(191, 'Nicolás', 'Tripi', 'Argentina', '1994-01-04', 'Defensor'),
(192, 'Agustín', 'Cardozo', 'Argentina', '1997-05-30', 'Mediocampista'),
(193, 'Yairo', 'Yau', 'Argentina', '1999-04-12', 'Delantero'),
(194, 'Fabián', 'Candia', 'Argentina', '1998-06-17', 'Volante'),
(195, 'Ignacio', 'Gariglio', 'Argentina', '1995-04-08', 'Defensor'),
(196, 'Pablo', 'Pérez', 'Argentina', '1985-08-10', 'Volante'),
(197, 'Julián', 'Cardozo', 'Argentina', '1991-01-02', 'Delantero'),
(198, 'Juan', 'Sforza', 'Argentina', '2002-02-12', 'Mediocampista'),
(199, 'Brian', 'Aguirre', 'Argentina', '2000-01-25', 'Delantero'),
(200, 'Cristian', 'Lema', 'Argentina', '1990-03-24', 'Defensor'),
(201, 'Alexis', 'Ducasse', 'Argentina', '1997-10-11', 'Defensor'),
(202, 'Héctor', 'Fértoli', 'Argentina', '1994-12-03', 'Delantero'),
(203, 'Cristian', 'Bernardi', 'Argentina', '1993-03-10', 'Mediocampista'),
(204, 'Jeremías', 'Ledesma', 'Argentina', '1993-02-11', 'Arquero'),
(205, 'Juan', 'Cafaro', 'Argentina', '1999-10-11', 'Defensor'),
(206, 'Braian', 'Rivero', 'Argentina', '1996-02-22', 'Volante'),
(207, 'Ezequiel', 'Piovi', 'Argentina', '1995-04-11', 'Defensor'),
(208, 'Lucas', 'Beltrán', 'Argentina', '2001-03-29', 'Delantero'),
(209, 'Gustavo', 'Velázquez', 'Argentina', '1998-05-19', 'Defensor'),
(210, 'Facundo', 'Percia', 'Argentina', '1998-06-24', 'Arquero'),
(211, 'Jorge', 'Broun', 'Argentina', '1986-05-26', 'Arquero'),
(212, 'Tobias', 'Cervera', 'Argentina', '1998-05-10', 'Mediocampista'),
(213, 'Emiliano', 'Vecchio', 'Argentina', '1992-11-16', 'Mediocampista'),
(214, 'Facundo', 'Mallo', 'Argentina', '1995-01-05', 'Defensor'),
(215, 'Kily', 'González', 'Argentina', '1974-08-14', 'Mediocampista'),
(216, 'Gonzalo', 'Martínez', 'Argentina', '1993-06-13', 'Volante'),
(217, 'Alejandro', 'Donatti', 'Argentina', '1988-10-24', 'Defensor'),
(218, 'Marcelo', 'Larrondo', 'Argentina', '1988-08-16', 'Delantero'),
(219, 'Alfonso', 'Parisi', 'Argentina', '1988-12-29', 'Delantero'),
(220, 'Lautaro', 'Girotti', 'Argentina', '2004-02-18', 'Delantero'),
(221, 'Germán', 'Ferreyra', 'Argentina', '1997-02-04', 'Mediocampista'),
(222, 'Cristian', 'Chávez', 'Argentina', '1986-06-16', 'Defensor'),
(223, 'Juan', 'Komar', 'Argentina', '1996-08-22', 'Volante'),
(224, 'Jaminton', 'Campaz', 'Colombia', '2000-05-24', 'Mediocampista'),
(225, 'Tomás', 'O Connor', 'Argentina', '1999-06-15', 'Delantero'),
(226, 'Ignacio', 'Don', 'Argentina', '1995-02-12', 'Arquero'),
(227, 'Facundo', 'Mura', 'Argentina', '1999-03-23', 'Arquero'),
(228, 'Facundo', 'Goltz', 'Argentina', '1995-06-16', 'Defensor'),
(229, 'Tomás', 'Pochettino', 'Argentina', '2001-02-07', 'Mediocampista'),
(230, 'Rafael', 'Delgado', 'Argentina', '1990-01-13', 'Defensor'),
(231, 'Federico', 'Lértora', 'Argentina', '1996-03-05', 'Volante'),
(232, 'Luis', 'Rodríguez', 'Argentina', '1985-03-04', 'Mediocampista'),
(233, 'Tomás', 'Chancalay', 'Argentina', '2000-01-01', 'Delantero'),
(234, 'Ramiro', 'Costa', 'Argentina', '1992-08-21', 'Delantero'),
(235, 'Alan', 'Franco', 'Argentina', '1996-10-11', 'Defensor'),
(236, 'Mauro', 'Manotas', 'Colombia', '1995-07-15', 'Delantero'),
(237, 'Jeremías', 'Cacéres', 'Argentina', '1998-10-12', 'Defensor'),
(238, 'Julián', 'Chicco', 'Argentina', '2003-02-24', 'Mediocampista'),
(239, 'Rodrigo', 'Aliendro', 'Argentina', '1993-02-16', 'Volante'),
(240, 'Lucas', 'Beraldi', 'Argentina', '2001-03-29', 'Defensor'),
(241, 'Nelson', 'Ibáñez', 'Argentina', '1981-11-13', 'Arquero'),
(242, 'Tomás', 'Cardona', 'Argentina', '1995-10-10', 'Defensor'),
(243, 'Víctor', 'Cuesta', 'Argentina', '1988-11-19', 'Defensor'),
(244, 'Diego', 'Rodríguez', 'Uruguay', '1989-09-04', 'Defensor'),
(245, 'Nelson', 'Acevedo', 'Argentina', '1988-01-22', 'Volante'),
(246, 'Juan', 'Brunetta', 'Argentina', '1997-05-12', 'Mediocampista'),
(247, 'Tomás', 'Badaloni', 'Argentina', '2000-05-22', 'Mediocampista'),
(248, 'Guillermo', 'Pol', 'Argentina', '1994-06-12', 'Mediocampista'),
(249, 'Matías', 'Ramírez', 'Argentina', '1996-11-17', 'Delantero'),
(250, 'Orellano', 'Ramón', 'Argentina', '2000-03-03', 'Mediocampista'),
(251, 'Fermín', 'López', 'Argentina', '1999-10-11', 'Delantero'),
(252, 'Joaquín', 'Varela', 'Argentina', '1998-09-24', 'Defensor'),
(253, 'Mauricio', 'Martínez', 'Argentina', '1998-04-20', 'Defensor'),
(254, 'Diego', 'Flores', 'Argentina', '1997-12-15', 'Volante'),
(255, 'Omar', 'Duarte', 'Argentina', '1995-05-10', 'Arquero'),
(256, 'Lucas', 'Acosta', 'Argentina', '1995-03-12', 'Arquero'),
(257, 'Renzo', 'Giampaoli', 'Argentina', '1998-06-25', 'Defensor'),
(258, 'Guillermo', 'Ortiz', 'Argentina', '1992-08-09', 'Defensor'),
(259, 'Marcelo', 'Estigarribia', 'Paraguay', '1987-09-21', 'Volante'),
(260, 'Rafael', 'Sósimo', 'Argentina', '1998-06-16', 'Defensor'),
(261, 'Ramiro', 'Ruiz Rodríguez', 'Argentina', '1997-05-17', 'Mediocampista'),
(262, 'Jonathan', 'Torres', 'Argentina', '2000-01-12', 'Delantero'),
(263, 'Mauro', 'Milano', 'Argentina', '1999-05-20', 'Volante'),
(264, 'David', 'Barbona', 'Argentina', '1995-02-22', 'Mediocampista'),
(265, 'Mateo', 'Coronel', 'Argentina', '1998-02-28', 'Delantero'),
(266, 'Alexis', 'Castro', 'Argentina', '1994-10-10', 'Volante'),
(267, 'Tomás', 'Pozzo', 'Argentina', '2000-05-05', 'Mediocampista'),
(268, 'Bruno', 'Bianchi', 'Argentina', '1999-03-18', 'Defensor'),
(269, 'Federico', 'Santander', 'Paraguay', '1991-06-04', 'Delantero'),
(270, 'Cristian', 'Menéndez', 'Argentina', '1988-04-02', 'Delantero'),
(271, 'Gaspar', 'Servio', 'Argentina', '1999-03-02', 'Arquero'),
(272, 'Manuel', 'Capasso', 'Argentina', '1996-09-19', 'Defensor'),
(273, 'Juan', 'Insaurralde', 'Paraguay', '1984-10-20', 'Defensor'),
(274, 'Víctor', 'Salazar', 'Argentina', '1996-05-26', 'Defensor'),
(275, 'Ezequiel', 'Bonifacio', 'Argentina', '1994-05-09', 'Defensor'),
(276, 'Diego', 'Zabala', 'Uruguay', '1991-09-19', 'Mediocampista'),
(277, 'Federico', 'Acevedo', 'Argentina', '1996-03-25', 'Volante'),
(278, 'Facundo', 'Kröpfl', 'Argentina', '2001-05-28', 'Mediocampista'),
(279, 'Franco', 'Fragapane', 'Argentina', '1998-02-22', 'Delantero'),
(280, 'Jonathan', 'Menéndez', 'Argentina', '1999-03-05', 'Delantero'),
(281, 'Juan', 'Cruz', 'Argentina', '1999-03-23', 'Delantero'),
(282, 'Claudio', 'Mosca', 'Argentina', '1991-04-02', 'Volante'),
(283, 'Germán', 'Berterame', 'Argentina', '1998-11-03', 'Delantero'),
(284, 'Paulo', 'Rosales', 'Argentina', '2000-10-01', 'Mediocampista'),
(285, 'Carlos', 'Auzqui', 'Argentina', '1991-03-16', 'Delantero'),
(286, 'Rodrigo', 'Rey', 'Argentina', '1991-03-08', 'Arquero'),
(287, 'Leonardo', 'Morales', 'Argentina', '1987-01-23', 'Defensor'),
(288, 'Erik', 'Godoy', 'Argentina', '1993-08-16', 'Defensor'),
(289, 'Matías', 'García', 'Argentina', '1996-02-14', 'Volante'),
(290, 'Pablo', 'Vegetti', 'Argentina', '1988-10-15', 'Delantero'),
(291, 'Brahian', 'Alemán', 'Uruguay', '1990-12-22', 'Mediocampista'),
(292, 'Cristian', 'Tarragona', 'Argentina', '1991-03-23', 'Delantero'),
(293, 'Ignacio', 'Miramón', 'Argentina', '1999-06-13', 'Volante'),
(294, 'Cristian', 'Chimino', 'Argentina', '1999-03-18', 'Delantero'),
(295, 'Facundo', 'Oreja', 'Argentina', '1999-04-14', 'Defensor'),
(296, 'Ramiro', 'Sordo', 'Argentina', '1997-06-04', 'Arquero'),
(297, 'Nicolás', 'Colazo', 'Argentina', '1990-01-09', 'Mediocampista'),
(298, 'Luca', 'Orellano', 'Argentina', '2000-03-27', 'Delantero'),
(299, 'Jorge', 'Recalde', 'Paraguay', '1997-06-02', 'Defensor'),
(300, 'Federico', 'Pereyra', 'Argentina', '1989-04-04', 'Volante');

INSERT INTO futarg.arbitros (id_arbitro, nombre, apellido, nacionalidad) VALUES 
(1, 'Patricio', 'Loustau', 'Argentina'),
(2, 'Facundo', 'Tello', 'Argentina'),
(3, 'Fernando', 'Rapallini', 'Argentina'),
(4, 'Yael', 'Falcón Pérez', 'Argentina'),
(5, 'Darío', 'Herrera', 'Argentina'),
(6, 'Nicolás', 'Ramírez', 'Argentina'),
(7, 'Andrés', 'Merlos', 'Argentina'),
(8, 'Fernando', 'Espinoza', 'Argentina'),
(9, 'Silvio', 'Trucco', 'Argentina'),
(10, 'Jorge', 'Baliño', 'Argentina'),
(11, 'Mauro', 'Vigliano', 'Argentina'),
(12, 'Diego', 'Abal', 'Argentina');

INSERT INTO futarg.competiciones (id_competicion, nombre, pais, nivel) VALUES 
(1, 'Liga Profesional de Fútbol', 'Argentina', 'Primera División'),
(2, 'Copa Argentina', 'Argentina', 'Eliminación Directa'),
(3, 'Copa Libertadores', 'Conmebol', 'Internacional');

INSERT INTO futarg.fechas (id_fecha, numero_fecha, descripcion) VALUES 
(1, 1, 'Fecha 1 - Torneo Regular'),
(2, 2, 'Fecha 2 - Torneo Regular'),
(3, 3, 'Fecha 3 - Torneo Regular'),
(4, 4, 'Fecha 4 - Torneo Regular'),
(5, 5, 'Fecha 5 - Torneo Regular');

INSERT INTO futarg.partidos (id_partido, id_competicion, id_fecha, id_equipo_local, id_equipo_visitante, id_estadio, id_arbitro, fecha_partido, goles_local, goles_visitnate) VALUES 
-- FECHA 1 (IDs Partidos 1 al 10)
(1, 1, 1, 1, 2, 1, 3, '2024-02-10', 1, 1),
(2, 1, 1, 3, 4, 3, 1, '2024-02-10', 2, 2),
(3, 1, 1, 5, 6, 5, 2, '2024-02-11', 0, 0),
(4, 1, 1, 7, 8, 7, 4, '2024-02-11', 3, 1),
(5, 1, 1, 9, 10, 9, 5, '2024-02-12', 1, 2),
(6, 1, 1, 11, 12, 11, 7, '2024-02-12', 1, 0),
(7, 1, 1, 13, 14, 13, 9, '2024-02-13', 2, 1),
(8, 1, 1, 15, 16, 15, 10, '2024-02-13', 0, 3),
(9, 1, 1, 17, 18, 17, 8, '2024-02-14', 2, 2),
(10, 1, 1, 19, 20, 19, 12, '2024-02-14', 1, 4),

-- FECHA 2 (IDs Partidos 11 al 20)
(11, 1, 2, 1, 3, 1, 3, '2024-02-17', 2, 0),
(12, 1, 2, 2, 4, 2, 1, '2024-02-17', 1, 2),
(13, 1, 2, 5, 7, 5, 2, '2024-02-18', 1, 1),
(14, 1, 2, 6, 8, 6, 4, '2024-02-18', 0, 0),
(15, 1, 2, 9, 11, 9, 5, '2024-02-19', 3, 0),
(16, 1, 2, 10, 12, 10, 7, '2024-02-19', 1, 1),
(17, 1, 2, 13, 15, 13, 9, '2024-02-20', 0, 2),
(18, 1, 2, 14, 16, 14, 10, '2024-02-20', 2, 1),
(19, 1, 2, 17, 19, 17, 8, '2024-02-21', 1, 0),
(20, 1, 2, 18, 20, 18, 12, '2024-02-21', 1, 1),

-- FECHA 3 (IDs Partidos 21 al 30)
(21, 1, 3, 1, 4, 1, 3, '2024-02-24', 0, 1),
(22, 1, 3, 2, 3, 2, 1, '2024-02-24', 2, 2),
(23, 1, 3, 5, 8, 5, 2, '2024-02-25', 4, 1),
(24, 1, 3, 6, 7, 6, 4, '2024-02-25', 1, 3),
(25, 1, 3, 9, 12, 9, 5, '2024-02-26', 0, 0),
(26, 1, 3, 10, 11, 10, 7, '2024-02-26', 1, 2),
(27, 1, 3, 13, 16, 13, 9, '2024-02-27', 2, 2),
(28, 1, 3, 14, 15, 14, 10, '2024-02-27', 1, 0),
(29, 1, 3, 17, 20, 17, 8, '2024-02-28', 3, 1),
(30, 1, 3, 18, 19, 18, 12, '2024-02-28', 0, 2),

-- FECHA 4 (IDs Partidos 31 al 40)
(31, 1, 4, 1, 6, 1, 3, '2024-03-02', 2, 1),
(32, 1, 4, 2, 7, 2, 1, '2024-03-02', 1, 3),
(33, 1, 4, 3, 8, 3, 2, '2024-03-03', 0, 0),
(34, 1, 4, 4, 9, 4, 4, '2024-03-03', 2, 2),
(35, 1, 4, 5, 10, 5, 5, '2024-03-04', 1, 1),
(36, 1, 4, 11, 16, 11, 7, '2024-03-04', 3, 0),
(37, 1, 4, 12, 17, 12, 9, '2024-03-05', 1, 2),
(38, 1, 4, 13, 18, 13, 10, '2024-03-05', 0, 0),
(39, 1, 4, 14, 19, 14, 8, '2024-03-06', 2, 1),
(40, 1, 4, 15, 20, 15, 12, '2024-03-06', 1, 1),

-- FECHA 5 (IDs Partidos 41 al 50)
(41, 1, 5, 1, 7, 1, 3, '2024-03-09', 1, 0),
(42, 1, 5, 2, 8, 2, 1, '2024-03-09', 2, 2),
(43, 1, 5, 3, 9, 3, 2, '2024-03-10', 1, 1),
(44, 1, 5, 4, 10, 4, 4, '2024-03-10', 0, 3),
(45, 1, 5, 5, 6, 5, 5, '2024-03-11', 2, 2),
(46, 1, 5, 11, 17, 11, 7, '2024-03-11', 0, 1),
(47, 1, 5, 12, 18, 12, 9, '2024-03-12', 1, 3),
(48, 1, 5, 13, 19, 13, 10, '2024-03-12', 2, 0),
(49, 1, 5, 14, 20, 14, 8, '2024-03-13', 1, 1),
(50, 1, 5, 15, 16, 15, 12, '2024-03-13', 0, 0);

INSERT INTO futarg.alineaciones (id_partido, id_jugador, id_equipo, titular, minutos_jugados) VALUES 
-- PARTIDO 1: River (1) vs Boca (2) | Jugadores River: 1-15, Boca: 16-30
(1, 1, 1, TRUE, 90), (1, 2, 1, TRUE, 90), (1, 3, 1, TRUE, 90), (1, 4, 1, TRUE, 90), (1, 5, 1, TRUE, 90),
(1, 6, 1, TRUE, 90), (1, 7, 1, TRUE, 90), (1, 8, 1, TRUE, 90), (1, 9, 1, TRUE, 90), (1, 10, 1, TRUE, 90),
(1, 11, 1, TRUE, 90), (1, 12, 1, FALSE, 0), (1, 13, 1, FALSE, 0), (1, 14, 1, FALSE, 0), (1, 15, 1, FALSE, 0),
(1, 16, 2, TRUE, 90), (1, 17, 2, TRUE, 90), (1, 18, 2, TRUE, 90), (1, 19, 2, TRUE, 90), (1, 20, 2, TRUE, 90),
(1, 21, 2, TRUE, 90), (1, 22, 2, TRUE, 90), (1, 23, 2, TRUE, 90), (1, 24, 2, TRUE, 90), (1, 25, 2, TRUE, 90),
(1, 26, 2, TRUE, 90), (1, 27, 2, FALSE, 0), (1, 28, 2, FALSE, 0), (1, 29, 2, FALSE, 0), (1, 30, 2, FALSE, 0),

-- PARTIDO 2: Independiente (3) vs Racing (4) | Jugadores Indep: 31-45, Racing: 46-60
(2, 31, 3, TRUE, 90), (2, 32, 3, TRUE, 90), (2, 33, 3, TRUE, 90), (2, 34, 3, TRUE, 90), (2, 35, 3, TRUE, 90),
(2, 36, 3, TRUE, 90), (2, 37, 3, TRUE, 90), (2, 38, 3, TRUE, 90), (2, 39, 3, TRUE, 90), (2, 40, 3, TRUE, 90),
(2, 41, 3, TRUE, 90), (2, 42, 3, FALSE, 0), (2, 43, 3, FALSE, 0), (2, 44, 3, FALSE, 0), (2, 45, 3, FALSE, 0),
(2, 46, 4, TRUE, 90), (2, 47, 4, TRUE, 90), (2, 48, 4, TRUE, 90), (2, 49, 4, TRUE, 90), (2, 50, 4, TRUE, 90),
(2, 51, 4, TRUE, 90), (2, 52, 4, TRUE, 90), (2, 53, 4, TRUE, 90), (2, 54, 4, TRUE, 90), (2, 55, 4, TRUE, 90),
(2, 56, 4, TRUE, 90), (2, 57, 4, FALSE, 0), (2, 58, 4, FALSE, 0), (2, 59, 4, FALSE, 0), (2, 60, 4, FALSE, 0),

-- PARTIDO 3: San Lorenzo (5) vs Huracán (6) | Jugadores SL: 61-75, Huracán: 76-90
(3, 61, 5, TRUE, 90), (3, 62, 5, TRUE, 90), (3, 63, 5, TRUE, 90), (3, 64, 5, TRUE, 90), (3, 65, 5, TRUE, 90),
(3, 66, 5, TRUE, 90), (3, 67, 5, TRUE, 90), (3, 68, 5, TRUE, 90), (3, 69, 5, TRUE, 90), (3, 70, 5, TRUE, 90),
(3, 71, 5, TRUE, 90), (3, 72, 5, FALSE, 0), (3, 73, 5, FALSE, 0), (3, 74, 5, FALSE, 0), (3, 75, 5, FALSE, 0),
(3, 76, 6, TRUE, 90), (3, 77, 6, TRUE, 90), (3, 78, 6, TRUE, 90), (3, 79, 6, TRUE, 90), (3, 80, 6, TRUE, 90),
(3, 81, 6, TRUE, 90), (3, 82, 6, TRUE, 90), (3, 83, 6, TRUE, 90), (3, 84, 6, TRUE, 90), (3, 85, 6, TRUE, 90),
(3, 86, 6, TRUE, 90), (3, 87, 6, FALSE, 0), (3, 88, 6, FALSE, 0), (3, 89, 6, FALSE, 0), (3, 90, 6, FALSE, 0),

-- PARTIDO 4: Vélez (7) vs Estudiantes (8) | Jugadores Vélez: 91-105, Estudiantes: 106-120
(4, 91, 7, TRUE, 90), (4, 92, 7, TRUE, 90), (4, 93, 7, TRUE, 90), (4, 94, 7, TRUE, 90), (4, 95, 7, TRUE, 90),
(4, 96, 7, TRUE, 90), (4, 97, 7, TRUE, 90), (4, 98, 7, TRUE, 90), (4, 99, 7, TRUE, 90), (4, 100, 7, TRUE, 90),
(4, 101, 7, TRUE, 90), (4, 102, 7, FALSE, 0), (4, 103, 7, FALSE, 0), (4, 104, 7, FALSE, 0), (4, 105, 7, FALSE, 0),
(4, 106, 8, TRUE, 90), (4, 107, 8, TRUE, 90), (4, 108, 8, TRUE, 90), (4, 109, 8, TRUE, 90), (4, 110, 8, TRUE, 90),
(4, 111, 8, TRUE, 90), (4, 112, 8, TRUE, 90), (4, 113, 8, TRUE, 90), (4, 114, 8, TRUE, 90), (4, 115, 8, TRUE, 90),
(4, 116, 8, TRUE, 90), (4, 117, 8, FALSE, 0), (4, 118, 8, FALSE, 0), (4, 119, 8, FALSE, 0), (4, 120, 8, FALSE, 0),

-- PARTIDO 5: Lanús (9) vs Banfield (10) | Jugadores Lanús: 121-135, Banfield: 136-150
(5, 121, 9, TRUE, 90), (5, 122, 9, TRUE, 90), (5, 123, 9, TRUE, 90), (5, 124, 9, TRUE, 90), (5, 125, 9, TRUE, 90),
(5, 126, 9, TRUE, 90), (5, 127, 9, TRUE, 90), (5, 128, 9, TRUE, 90), (5, 129, 9, TRUE, 90), (5, 130, 9, TRUE, 90),
(5, 131, 9, TRUE, 90), (5, 132, 9, FALSE, 0), (5, 133, 9, FALSE, 0), (5, 134, 9, FALSE, 0), (5, 135, 9, FALSE, 0),
(5, 136, 10, TRUE, 90), (5, 137, 10, TRUE, 90), (5, 138, 10, TRUE, 90), (5, 139, 10, TRUE, 90), (5, 140, 10, TRUE, 90),
(5, 141, 10, TRUE, 90), (5, 142, 10, TRUE, 90), (5, 143, 10, TRUE, 90), (5, 144, 10, TRUE, 90), (5, 145, 10, TRUE, 90),
(5, 146, 10, TRUE, 90), (5, 147, 10, FALSE, 0), (5, 148, 10, FALSE, 0), (5, 149, 10, FALSE, 0), (5, 150, 10, FALSE, 0),

-- PARTIDO 6: Argentinos (11) vs Tigre (12) | Jugadores Argentinos: 151-165, Tigre: 166-180
(6, 151, 11, TRUE, 90), (6, 152, 11, TRUE, 90), (6, 153, 11, TRUE, 90), (6, 154, 11, TRUE, 90), (6, 155, 11, TRUE, 90),
(6, 156, 11, TRUE, 90), (6, 157, 11, TRUE, 90), (6, 158, 11, TRUE, 90), (6, 159, 11, TRUE, 90), (6, 160, 11, TRUE, 90),
(6, 161, 11, TRUE, 90), (6, 162, 11, FALSE, 0), (6, 163, 11, FALSE, 0), (6, 164, 11, FALSE, 0), (6, 165, 11, FALSE, 0),
(6, 166, 12, TRUE, 90), (6, 167, 12, TRUE, 90), (6, 168, 12, TRUE, 90), (6, 169, 12, TRUE, 90), (6, 170, 12, TRUE, 90),
(6, 171, 12, TRUE, 90), (6, 172, 12, TRUE, 90), (6, 173, 12, TRUE, 90), (6, 174, 12, TRUE, 90), (6, 175, 12, TRUE, 90),
(6, 176, 12, TRUE, 90), (6, 177, 12, FALSE, 0), (6, 178, 12, FALSE, 0), (6, 179, 12, FALSE, 0), (6, 180, 12, FALSE, 0),

-- PARTIDO 7: Defensa y Justicia (13) vs Newell's (14) | Jugadores Defensa: 181-195, Newells: 196-210
(7, 181, 13, TRUE, 90), (7, 182, 13, TRUE, 90), (7, 183, 13, TRUE, 90), (7, 184, 13, TRUE, 90), (7, 185, 13, TRUE, 90),
(7, 186, 13, TRUE, 90), (7, 187, 13, TRUE, 90), (7, 188, 13, TRUE, 90), (7, 189, 13, TRUE, 90), (7, 190, 13, TRUE, 90),
(7, 191, 13, TRUE, 90), (7, 192, 13, FALSE, 0), (7, 193, 13, FALSE, 0), (7, 194, 13, FALSE, 0), (7, 195, 13, FALSE, 0),
(7, 196, 14, TRUE, 90), (7, 197, 14, TRUE, 90), (7, 198, 14, TRUE, 90), (7, 199, 14, TRUE, 90), (7, 200, 14, TRUE, 90),
(7, 201, 14, TRUE, 90), (7, 202, 14, TRUE, 90), (7, 203, 14, TRUE, 90), (7, 204, 14, TRUE, 90), (7, 205, 14, TRUE, 90),
(7, 206, 14, TRUE, 90), (7, 207, 14, FALSE, 0), (7, 208, 14, FALSE, 0), (7, 209, 14, FALSE, 0), (7, 210, 14, FALSE, 0),

-- PARTIDO 8: Rosario Central (15) vs Colón (16) | Jugadores Central: 211-225, Colon: 226-240
(8, 211, 15, TRUE, 90), (8, 212, 15, TRUE, 90), (8, 213, 15, TRUE, 90), (8, 214, 15, TRUE, 90), (8, 215, 15, TRUE, 90),
(8, 216, 15, TRUE, 90), (8, 217, 15, TRUE, 90), (8, 218, 15, TRUE, 90), (8, 219, 15, TRUE, 90), (8, 220, 15, TRUE, 90),
(8, 221, 15, TRUE, 90), (8, 222, 15, FALSE, 0), (8, 223, 15, FALSE, 0), (8, 224, 15, FALSE, 0), (8, 225, 15, FALSE, 0),
(8, 226, 16, TRUE, 90), (8, 227, 16, TRUE, 90), (8, 228, 16, TRUE, 90), (8, 229, 16, TRUE, 90), (8, 230, 16, TRUE, 90),
(8, 231, 16, TRUE, 90), (8, 232, 16, TRUE, 90), (8, 233, 16, TRUE, 90), (8, 234, 16, TRUE, 90), (8, 235, 16, TRUE, 90),
(8, 236, 16, TRUE, 90), (8, 237, 16, FALSE, 0), (8, 238, 16, FALSE, 0), (8, 239, 16, FALSE, 0), (8, 240, 16, FALSE, 0),

-- PARTIDO 9: Godoy Cruz (17) vs Atlético Tucumán (18) | Jugadores Godoy: 241-255, Tucumán: 256-270
(9, 241, 17, TRUE, 90), (9, 242, 17, TRUE, 90), (9, 243, 17, TRUE, 90), (9, 244, 17, TRUE, 90), (9, 245, 17, TRUE, 90),
(9, 246, 17, TRUE, 90), (9, 247, 17, TRUE, 90), (9, 248, 17, TRUE, 90), (9, 249, 17, TRUE, 90), (9, 250, 17, TRUE, 90),
(9, 251, 17, TRUE, 90), (9, 252, 17, FALSE, 0), (9, 253, 17, FALSE, 0), (9, 254, 17, FALSE, 0), (9, 255, 17, FALSE, 0),
(9, 256, 18, TRUE, 90), (9, 257, 18, TRUE, 90), (9, 258, 18, TRUE, 90), (9, 259, 18, TRUE, 90), (9, 260, 18, TRUE, 90),
(9, 261, 18, TRUE, 90), (9, 262, 18, TRUE, 90), (9, 263, 18, TRUE, 90), (9, 264, 18, TRUE, 90), (9, 265, 18, TRUE, 90),
(9, 266, 18, TRUE, 90), (9, 267, 18, FALSE, 0), (9, 268, 18, FALSE, 0), (9, 269, 18, FALSE, 0), (9, 270, 18, FALSE, 0),

-- PARTIDO 10: Unión (19) vs Gimnasia (20) | Jugadores Unión: 271-285, Gimnasia: 286-300
(10, 271, 19, TRUE, 90), (10, 272, 19, TRUE, 90), (10, 273, 19, TRUE, 90), (10, 274, 19, TRUE, 90), (10, 275, 19, TRUE, 90),
(10, 276, 19, TRUE, 90), (10, 277, 19, TRUE, 90), (10, 278, 19, TRUE, 90), (10, 279, 19, TRUE, 90), (10, 280, 19, TRUE, 90),
(10, 281, 19, TRUE, 90), (10, 282, 19, FALSE, 0), (10, 283, 19, FALSE, 0), (10, 284, 19, FALSE, 0), (10, 285, 19, FALSE, 0),
(10, 286, 20, TRUE, 90), (10, 287, 20, TRUE, 90), (10, 288, 20, TRUE, 90), (10, 289, 20, TRUE, 90), (10, 290, 20, TRUE, 90),
(10, 291, 20, TRUE, 90), (10, 292, 20, TRUE, 90), (10, 293, 20, TRUE, 90), (10, 294, 20, TRUE, 90), (10, 295, 20, TRUE, 90),
(10, 296, 20, TRUE, 90), (10, 297, 20, FALSE, 0), (10, 298, 20, FALSE, 0), (10, 299, 20, FALSE, 0), (10, 300, 20, FALSE, 0),

-- PARTIDO 11: River (1) vs Indep (3) | IDs River: 1-15, Indep: 31-45
(11, 1, 1, TRUE, 90), (11, 2, 1, TRUE, 90), (11, 3, 1, TRUE, 90), (11, 4, 1, TRUE, 90), (11, 5, 1, TRUE, 90),
(11, 6, 1, TRUE, 90), (11, 7, 1, TRUE, 90), (11, 8, 1, TRUE, 90), (11, 9, 1, TRUE, 90), (11, 10, 1, TRUE, 90),
(11, 11, 1, TRUE, 90), (11, 12, 1, FALSE, 0), (11, 13, 1, FALSE, 0), (11, 14, 1, FALSE, 0), (11, 15, 1, FALSE, 0),
(11, 31, 3, TRUE, 90), (11, 32, 3, TRUE, 90), (11, 33, 3, TRUE, 90), (11, 34, 3, TRUE, 90), (11, 35, 3, TRUE, 90),
(11, 36, 3, TRUE, 90), (11, 37, 3, TRUE, 90), (11, 38, 3, TRUE, 90), (11, 39, 3, TRUE, 90), (11, 40, 3, TRUE, 90),
(11, 41, 3, TRUE, 90), (11, 42, 3, FALSE, 0), (11, 43, 3, FALSE, 0), (11, 44, 3, FALSE, 0), (11, 45, 3, FALSE, 0),

-- PARTIDO 12: Boca (2) vs Racing (4) | IDs Boca: 16-30, Racing: 46-60
(12, 16, 2, TRUE, 90), (12, 17, 2, TRUE, 90), (12, 18, 2, TRUE, 90), (12, 19, 2, TRUE, 90), (12, 20, 2, TRUE, 90),
(12, 21, 2, TRUE, 90), (12, 22, 2, TRUE, 90), (12, 23, 2, TRUE, 90), (12, 24, 2, TRUE, 90), (12, 25, 2, TRUE, 90),
(12, 26, 2, TRUE, 90), (12, 27, 2, FALSE, 0), (12, 28, 2, FALSE, 0), (12, 29, 2, FALSE, 0), (12, 30, 2, FALSE, 0),
(12, 46, 4, TRUE, 90), (12, 47, 4, TRUE, 90), (12, 48, 4, TRUE, 90), (12, 49, 4, TRUE, 90), (12, 50, 4, TRUE, 90),
(12, 51, 4, TRUE, 90), (12, 52, 4, TRUE, 90), (12, 53, 4, TRUE, 90), (12, 54, 4, TRUE, 90), (12, 55, 4, TRUE, 90),
(12, 56, 4, TRUE, 90), (12, 57, 4, FALSE, 0), (12, 58, 4, FALSE, 0), (12, 59, 4, FALSE, 0), (12, 60, 4, FALSE, 0),

-- PARTIDO 13: San Lorenzo (5) vs Vélez (7) | IDs SL: 61-75, Vélez: 91-105
(13, 61, 5, TRUE, 90), (13, 62, 5, TRUE, 90), (13, 63, 5, TRUE, 90), (13, 64, 5, TRUE, 90), (13, 65, 5, TRUE, 90),
(13, 66, 5, TRUE, 90), (13, 67, 5, TRUE, 90), (13, 68, 5, TRUE, 90), (13, 69, 5, TRUE, 90), (13, 70, 5, TRUE, 90),
(13, 71, 5, TRUE, 90), (13, 72, 5, FALSE, 0), (13, 73, 5, FALSE, 0), (13, 74, 5, FALSE, 0), (13, 75, 5, FALSE, 0),
(13, 91, 7, TRUE, 90), (13, 92, 7, TRUE, 90), (13, 93, 7, TRUE, 90), (13, 94, 7, TRUE, 90), (13, 95, 7, TRUE, 90),
(13, 96, 7, TRUE, 90), (13, 97, 7, TRUE, 90), (13, 98, 7, TRUE, 90), (13, 99, 7, TRUE, 90), (13, 100, 7, TRUE, 90),
(13, 101, 7, TRUE, 90), (13, 102, 7, FALSE, 0), (13, 103, 7, FALSE, 0), (13, 104, 7, FALSE, 0), (13, 105, 7, FALSE, 0),

-- PARTIDO 14: Huracán (6) vs Estudiantes (8) | IDs Huracán: 76-90, Estudiantes: 106-120
(14, 76, 6, TRUE, 90), (14, 77, 6, TRUE, 90), (14, 78, 6, TRUE, 90), (14, 79, 6, TRUE, 90), (14, 80, 6, TRUE, 90),
(14, 81, 6, TRUE, 90), (14, 82, 6, TRUE, 90), (14, 83, 6, TRUE, 90), (14, 84, 6, TRUE, 90), (14, 85, 6, TRUE, 90),
(14, 86, 6, TRUE, 90), (14, 87, 6, FALSE, 0), (14, 88, 6, FALSE, 0), (14, 89, 6, FALSE, 0), (14, 90, 6, FALSE, 0),
(14, 106, 8, TRUE, 90), (14, 107, 8, TRUE, 90), (14, 108, 8, TRUE, 90), (14, 109, 8, TRUE, 90), (14, 110, 8, TRUE, 90),
(14, 111, 8, TRUE, 90), (14, 112, 8, TRUE, 90), (14, 113, 8, TRUE, 90), (14, 114, 8, TRUE, 90), (14, 115, 8, TRUE, 90),
(14, 116, 8, TRUE, 90), (14, 117, 8, FALSE, 0), (14, 118, 8, FALSE, 0), (14, 119, 8, FALSE, 0), (14, 120, 8, FALSE, 0),

-- PARTIDO 15: Lanús (9) vs Argentinos (11) | IDs Lanús: 121-135, Argentinos: 151-165
(15, 121, 9, TRUE, 90), (15, 122, 9, TRUE, 90), (15, 123, 9, TRUE, 90), (15, 124, 9, TRUE, 90), (15, 125, 9, TRUE, 90),
(15, 126, 9, TRUE, 90), (15, 127, 9, TRUE, 90), (15, 128, 9, TRUE, 90), (15, 129, 9, TRUE, 90), (15, 130, 9, TRUE, 90),
(15, 131, 9, TRUE, 90), (15, 132, 9, FALSE, 0), (15, 133, 9, FALSE, 0), (15, 134, 9, FALSE, 0), (15, 135, 9, FALSE, 0),
(15, 151, 11, TRUE, 90), (15, 152, 11, TRUE, 90), (15, 153, 11, TRUE, 90), (15, 154, 11, TRUE, 90), (15, 155, 11, TRUE, 90),
(15, 156, 11, TRUE, 90), (15, 157, 11, TRUE, 90), (15, 158, 11, TRUE, 90), (15, 159, 11, TRUE, 90), (15, 160, 11, TRUE, 90),
(15, 161, 11, TRUE, 90), (15, 162, 11, FALSE, 0), (15, 163, 11, FALSE, 0), (15, 164, 11, FALSE, 0), (15, 165, 11, FALSE, 0),

-- PARTIDO 16: Banfield (10) vs Tigre (12) | IDs Banfield: 136-150, Tigre: 166-180
(16, 136, 10, TRUE, 90), (16, 137, 10, TRUE, 90), (16, 138, 10, TRUE, 90), (16, 139, 10, TRUE, 90), (16, 140, 10, TRUE, 90),
(16, 141, 10, TRUE, 90), (16, 142, 10, TRUE, 90), (16, 143, 10, TRUE, 90), (16, 144, 10, TRUE, 90), (16, 145, 10, TRUE, 90),
(16, 146, 10, TRUE, 90), (16, 147, 10, FALSE, 0), (16, 148, 10, FALSE, 0), (16, 149, 10, FALSE, 0), (16, 150, 10, FALSE, 0),
(16, 166, 12, TRUE, 90), (16, 167, 12, TRUE, 90), (16, 168, 12, TRUE, 90), (16, 169, 12, TRUE, 90), (16, 170, 12, TRUE, 90),
(16, 171, 12, TRUE, 90), (16, 172, 12, TRUE, 90), (16, 173, 12, TRUE, 90), (16, 174, 12, TRUE, 90), (16, 175, 12, TRUE, 90),
(16, 176, 12, TRUE, 90), (16, 177, 12, FALSE, 0), (16, 178, 12, FALSE, 0), (16, 179, 12, FALSE, 0), (16, 180, 12, FALSE, 0),

-- PARTIDO 17: Defensa y Justicia (13) vs Rosario Central (15) | IDs Defensa: 181-195, Central: 211-225
(17, 181, 13, TRUE, 90), (17, 182, 13, TRUE, 90), (17, 183, 13, TRUE, 90), (17, 184, 13, TRUE, 90), (17, 185, 13, TRUE, 90),
(17, 186, 13, TRUE, 90), (17, 187, 13, TRUE, 90), (17, 188, 13, TRUE, 90), (17, 189, 13, TRUE, 90), (17, 190, 13, TRUE, 90),
(17, 191, 13, TRUE, 90), (17, 192, 13, FALSE, 0), (17, 193, 13, FALSE, 0), (17, 194, 13, FALSE, 0), (17, 195, 13, FALSE, 0),
(17, 211, 15, TRUE, 90), (17, 212, 15, TRUE, 90), (17, 213, 15, TRUE, 90), (17, 214, 15, TRUE, 90), (17, 215, 15, TRUE, 90),
(17, 216, 15, TRUE, 90), (17, 217, 15, TRUE, 90), (17, 218, 15, TRUE, 90), (17, 219, 15, TRUE, 90), (17, 220, 15, TRUE, 90),
(17, 221, 15, TRUE, 90), (17, 222, 15, FALSE, 0), (17, 223, 15, FALSE, 0), (17, 224, 15, FALSE, 0), (17, 225, 15, FALSE, 0),

-- PARTIDO 18: Newell's (14) vs Colón (16) | IDs Newells: 196-210, Colon: 226-240
(18, 196, 14, TRUE, 90), (18, 197, 14, TRUE, 90), (18, 198, 14, TRUE, 90), (18, 199, 14, TRUE, 90), (18, 200, 14, TRUE, 90),
(18, 201, 14, TRUE, 90), (18, 202, 14, TRUE, 90), (18, 203, 14, TRUE, 90), (18, 204, 14, TRUE, 90), (18, 205, 14, TRUE, 90),
(18, 206, 14, TRUE, 90), (18, 207, 14, FALSE, 0), (18, 208, 14, FALSE, 0), (18, 209, 14, FALSE, 0), (18, 210, 14, FALSE, 0),
(18, 226, 16, TRUE, 90), (18, 227, 16, TRUE, 90), (18, 228, 16, TRUE, 90), (18, 229, 16, TRUE, 90), (18, 230, 16, TRUE, 90),
(18, 231, 16, TRUE, 90), (18, 232, 16, TRUE, 90), (18, 233, 16, TRUE, 90), (18, 234, 16, TRUE, 90), (18, 235, 16, TRUE, 90),
(18, 236, 16, TRUE, 90), (18, 237, 16, FALSE, 0), (18, 238, 16, FALSE, 0), (18, 239, 16, FALSE, 0), (18, 240, 16, FALSE, 0),

-- PARTIDO 19: Godoy Cruz (17) vs Unión (19) | IDs Godoy: 241-255, Union: 271-285
(19, 241, 17, TRUE, 90), (19, 242, 17, TRUE, 90), (19, 243, 17, TRUE, 90), (19, 244, 17, TRUE, 90), (19, 245, 17, TRUE, 90),
(19, 246, 17, TRUE, 90), (19, 247, 17, TRUE, 90), (19, 248, 17, TRUE, 90), (19, 249, 17, TRUE, 90), (19, 250, 17, TRUE, 90),
(19, 251, 17, TRUE, 90), (19, 252, 17, FALSE, 0), (19, 253, 17, FALSE, 0), (19, 254, 17, FALSE, 0), (19, 255, 17, FALSE, 0),
(19, 271, 19, TRUE, 90), (19, 272, 19, TRUE, 90), (19, 273, 19, TRUE, 90), (19, 274, 19, TRUE, 90), (19, 275, 19, TRUE, 90),
(19, 276, 19, TRUE, 90), (19, 277, 19, TRUE, 90), (19, 278, 19, TRUE, 90), (19, 279, 19, TRUE, 90), (19, 280, 19, TRUE, 90),
(19, 281, 19, TRUE, 90), (19, 282, 19, FALSE, 0), (19, 283, 19, FALSE, 0), (19, 284, 19, FALSE, 0), (19, 285, 19, FALSE, 0),

-- PARTIDO 20: Atlético Tucumán (18) vs Gimnasia (20) | IDs Tucuman: 256-270, Gimnasia: 286-300
(20, 256, 18, TRUE, 90), (20, 257, 18, TRUE, 90), (20, 258, 18, TRUE, 90), (20, 259, 18, TRUE, 90), (20, 260, 18, TRUE, 90),
(20, 261, 18, TRUE, 90), (20, 262, 18, TRUE, 90), (20, 263, 18, TRUE, 90), (20, 264, 18, TRUE, 90), (20, 265, 18, TRUE, 90),
(20, 266, 18, TRUE, 90), (20, 267, 18, FALSE, 0), (20, 268, 18, FALSE, 0), (20, 269, 18, FALSE, 0), (20, 270, 18, FALSE, 0),
(20, 286, 20, TRUE, 90), (20, 287, 20, TRUE, 90), (20, 288, 20, TRUE, 90), (20, 289, 20, TRUE, 90), (20, 290, 20, TRUE, 90),
(20, 291, 20, TRUE, 90), (20, 292, 20, TRUE, 90), (20, 293, 20, TRUE, 90), (20, 294, 20, TRUE, 90), (20, 295, 20, TRUE, 90),
(20, 296, 20, TRUE, 90), (20, 297, 20, FALSE, 0), (20, 298, 20, FALSE, 0), (20, 299, 20, FALSE, 0), (20, 300, 20, FALSE, 0),

-- === FECHA 3 (Partidos 21 al 30) ===

-- PARTIDO 21: River (1) vs Racing (4) | IDs River: 1-15, Racing: 46-60
(21, 1, 1, TRUE, 90), (21, 2, 1, TRUE, 90), (21, 3, 1, TRUE, 90), (21, 4, 1, TRUE, 90), (21, 5, 1, TRUE, 90),
(21, 6, 1, TRUE, 90), (21, 7, 1, TRUE, 90), (21, 8, 1, TRUE, 90), (21, 9, 1, TRUE, 90), (21, 10, 1, TRUE, 90),
(21, 11, 1, TRUE, 90), (21, 12, 1, FALSE, 0), (21, 13, 1, FALSE, 0), (21, 14, 1, FALSE, 0), (21, 15, 1, FALSE, 0),
(21, 46, 4, TRUE, 90), (21, 47, 4, TRUE, 90), (21, 48, 4, TRUE, 90), (21, 49, 4, TRUE, 90), (21, 50, 4, TRUE, 90),
(21, 51, 4, TRUE, 90), (21, 52, 4, TRUE, 90), (21, 53, 4, TRUE, 90), (21, 54, 4, TRUE, 90), (21, 55, 4, TRUE, 90),
(21, 56, 4, TRUE, 90), (21, 57, 4, FALSE, 0), (21, 58, 4, FALSE, 0), (21, 59, 4, FALSE, 0), (21, 60, 4, FALSE, 0),

-- PARTIDO 22: Boca (2) vs Indep (3) | IDs Boca: 16-30, Indep: 31-45
(22, 16, 2, TRUE, 90), (22, 17, 2, TRUE, 90), (22, 18, 2, TRUE, 90), (22, 19, 2, TRUE, 90), (22, 20, 2, TRUE, 90),
(22, 21, 2, TRUE, 90), (22, 22, 2, TRUE, 90), (22, 23, 2, TRUE, 90), (22, 24, 2, TRUE, 90), (22, 25, 2, TRUE, 90),
(22, 26, 2, TRUE, 90), (22, 27, 2, FALSE, 0), (22, 28, 2, FALSE, 0), (22, 29, 2, FALSE, 0), (22, 30, 2, FALSE, 0),
(22, 31, 3, TRUE, 90), (22, 32, 3, TRUE, 90), (22, 33, 3, TRUE, 90), (22, 34, 3, TRUE, 90), (22, 35, 3, TRUE, 90),
(22, 36, 3, TRUE, 90), (22, 37, 3, TRUE, 90), (22, 38, 3, TRUE, 90), (22, 39, 3, TRUE, 90), (22, 40, 3, TRUE, 90),
(22, 41, 3, TRUE, 90), (22, 42, 3, FALSE, 0), (22, 43, 3, FALSE, 0), (22, 44, 3, FALSE, 0), (22, 45, 3, FALSE, 0),

-- PARTIDO 23: San Lorenzo (5) vs Estudiantes (8) | IDs SL: 61-75, Estudiantes: 106-120
(23, 61, 5, TRUE, 90), (23, 62, 5, TRUE, 90), (23, 63, 5, TRUE, 90), (23, 64, 5, TRUE, 90), (23, 65, 5, TRUE, 90),
(23, 66, 5, TRUE, 90), (23, 67, 5, TRUE, 90), (23, 68, 5, TRUE, 90), (23, 69, 5, TRUE, 90), (23, 70, 5, TRUE, 90),
(23, 71, 5, TRUE, 90), (23, 72, 5, FALSE, 0), (23, 73, 5, FALSE, 0), (23, 74, 5, FALSE, 0), (23, 75, 5, FALSE, 0),
(23, 106, 8, TRUE, 90), (23, 107, 8, TRUE, 90), (23, 108, 8, TRUE, 90), (23, 109, 8, TRUE, 90), (23, 110, 8, TRUE, 90),
(23, 111, 8, TRUE, 90), (23, 112, 8, TRUE, 90), (23, 113, 8, TRUE, 90), (23, 114, 8, TRUE, 90), (23, 115, 8, TRUE, 90),
(23, 116, 8, TRUE, 90), (23, 117, 8, FALSE, 0), (23, 118, 8, FALSE, 0), (23, 119, 8, FALSE, 0), (23, 120, 8, FALSE, 0),

-- PARTIDO 24: Huracán (6) vs Vélez (7) | IDs Huracán: 76-90, Vélez: 91-105
(24, 76, 6, TRUE, 90), (24, 77, 6, TRUE, 90), (24, 78, 6, TRUE, 90), (24, 79, 6, TRUE, 90), (24, 80, 6, TRUE, 90),
(24, 81, 6, TRUE, 90), (24, 82, 6, TRUE, 90), (24, 83, 6, TRUE, 90), (24, 84, 6, TRUE, 90), (24, 85, 6, TRUE, 90),
(24, 86, 6, TRUE, 90), (24, 87, 6, FALSE, 0), (24, 88, 6, FALSE, 0), (24, 89, 6, FALSE, 0), (24, 90, 6, FALSE, 0),
(24, 91, 7, TRUE, 90), (24, 92, 7, TRUE, 90), (24, 93, 7, TRUE, 90), (24, 94, 7, TRUE, 90), (24, 95, 7, TRUE, 90),
(24, 96, 7, TRUE, 90), (24, 97, 7, TRUE, 90), (24, 98, 7, TRUE, 90), (24, 99, 7, TRUE, 90), (24, 100, 7, TRUE, 90),
(24, 101, 7, TRUE, 90), (24, 102, 7, FALSE, 0), (24, 103, 7, FALSE, 0), (24, 104, 7, FALSE, 0), (24, 105, 7, FALSE, 0),

-- PARTIDO 25: Lanús (9) vs Tigre (12) | IDs Lanús: 121-135, Tigre: 166-180
(25, 121, 9, TRUE, 90), (25, 122, 9, TRUE, 90), (25, 123, 9, TRUE, 90), (25, 124, 9, TRUE, 90), (25, 125, 9, TRUE, 90),
(25, 126, 9, TRUE, 90), (25, 127, 9, TRUE, 90), (25, 128, 9, TRUE, 90), (25, 129, 9, TRUE, 90), (25, 130, 9, TRUE, 90),
(25, 131, 9, TRUE, 90), (25, 132, 9, FALSE, 0), (25, 133, 9, FALSE, 0), (25, 134, 9, FALSE, 0), (25, 135, 9, FALSE, 0),
(25, 166, 12, TRUE, 90), (25, 167, 12, TRUE, 90), (25, 168, 12, TRUE, 90), (25, 169, 12, TRUE, 90), (25, 170, 12, TRUE, 90),
(25, 171, 12, TRUE, 90), (25, 172, 12, TRUE, 90), (25, 173, 12, TRUE, 90), (25, 174, 12, TRUE, 90), (25, 175, 12, TRUE, 90),
(25, 176, 12, TRUE, 90), (25, 177, 12, FALSE, 0), (25, 178, 12, FALSE, 0), (25, 179, 12, FALSE, 0), (25, 180, 12, FALSE, 0),

-- PARTIDO 26: Banfield (10) vs Argentinos (11) | IDs Banfield: 136-150, Argentinos: 151-165
(26, 136, 10, TRUE, 90), (26, 137, 10, TRUE, 90), (26, 138, 10, TRUE, 90), (26, 139, 10, TRUE, 90), (26, 140, 10, TRUE, 90),
(26, 141, 10, TRUE, 90), (26, 142, 10, TRUE, 90), (26, 143, 10, TRUE, 90), (26, 144, 10, TRUE, 90), (26, 145, 10, TRUE, 90),
(26, 146, 10, TRUE, 90), (26, 147, 10, FALSE, 0), (26, 148, 10, FALSE, 0), (26, 149, 10, FALSE, 0), (26, 150, 10, FALSE, 0),
(26, 151, 11, TRUE, 90), (26, 152, 11, TRUE, 90), (26, 153, 11, TRUE, 90), (26, 154, 11, TRUE, 90), (26, 155, 11, TRUE, 90),
(26, 156, 11, TRUE, 90), (26, 157, 11, TRUE, 90), (26, 158, 11, TRUE, 90), (26, 159, 11, TRUE, 90), (26, 160, 11, TRUE, 90),
(26, 161, 11, TRUE, 90), (26, 162, 11, FALSE, 0), (26, 163, 11, FALSE, 0), (26, 164, 11, FALSE, 0), (26, 165, 11, FALSE, 0),

-- PARTIDO 27: Defensa y Justicia (13) vs Colón (16) | IDs Defensa: 181-195, Colon: 226-240
(27, 181, 13, TRUE, 90), (27, 182, 13, TRUE, 90), (27, 183, 13, TRUE, 90), (27, 184, 13, TRUE, 90), (27, 185, 13, TRUE, 90),
(27, 186, 13, TRUE, 90), (27, 187, 13, TRUE, 90), (27, 188, 13, TRUE, 90), (27, 189, 13, TRUE, 90), (27, 190, 13, TRUE, 90),
(27, 191, 13, TRUE, 90), (27, 192, 13, FALSE, 0), (27, 193, 13, FALSE, 0), (27, 194, 13, FALSE, 0), (27, 195, 13, FALSE, 0),
(27, 226, 16, TRUE, 90), (27, 227, 16, TRUE, 90), (27, 228, 16, TRUE, 90), (27, 229, 16, TRUE, 90), (27, 230, 16, TRUE, 90),
(27, 231, 16, TRUE, 90), (27, 232, 16, TRUE, 90), (27, 233, 16, TRUE, 90), (27, 234, 16, TRUE, 90), (27, 235, 16, TRUE, 90),
(27, 236, 16, TRUE, 90), (27, 237, 16, FALSE, 0), (27, 238, 16, FALSE, 0), (27, 239, 16, FALSE, 0), (27, 240, 16, FALSE, 0),

-- PARTIDO 28: Newell's (14) vs Rosario Central (15) | IDs Newells: 196-210, Central: 211-225
(28, 196, 14, TRUE, 90), (28, 197, 14, TRUE, 90), (28, 198, 14, TRUE, 90), (28, 199, 14, TRUE, 90), (28, 200, 14, TRUE, 90),
(28, 201, 14, TRUE, 90), (28, 202, 14, TRUE, 90), (28, 203, 14, TRUE, 90), (28, 204, 14, TRUE, 90), (28, 205, 14, TRUE, 90),
(28, 206, 14, TRUE, 90), (28, 207, 14, FALSE, 0), (28, 208, 14, FALSE, 0), (28, 209, 14, FALSE, 0), (28, 210, 14, FALSE, 0),
(28, 211, 15, TRUE, 90), (28, 212, 15, TRUE, 90), (28, 213, 15, TRUE, 90), (28, 214, 15, TRUE, 90), (28, 215, 15, TRUE, 90),
(28, 216, 15, TRUE, 90), (28, 217, 15, TRUE, 90), (28, 218, 15, TRUE, 90), (28, 219, 15, TRUE, 90), (28, 220, 15, TRUE, 90),
(28, 221, 15, TRUE, 90), (28, 222, 15, FALSE, 0), (28, 223, 15, FALSE, 0), (28, 224, 15, FALSE, 0), (28, 225, 15, FALSE, 0),

-- PARTIDO 29: Godoy Cruz (17) vs Gimnasia (20) | IDs Godoy: 241-255, Gimnasia: 286-300
(29, 241, 17, TRUE, 90), (29, 242, 17, TRUE, 90), (29, 243, 17, TRUE, 90), (29, 244, 17, TRUE, 90), (29, 245, 17, TRUE, 90),
(29, 246, 17, TRUE, 90), (29, 247, 17, TRUE, 90), (29, 248, 17, TRUE, 90), (29, 249, 17, TRUE, 90), (29, 250, 17, TRUE, 90),
(29, 251, 17, TRUE, 90), (29, 252, 17, FALSE, 0), (29, 253, 17, FALSE, 0), (29, 254, 17, FALSE, 0), (29, 255, 17, FALSE, 0),
(29, 286, 20, TRUE, 90), (29, 287, 20, TRUE, 90), (29, 288, 20, TRUE, 90), (29, 289, 20, TRUE, 90), (29, 290, 20, TRUE, 90),
(29, 291, 20, TRUE, 90), (29, 292, 20, TRUE, 90), (29, 293, 20, TRUE, 90), (29, 294, 20, TRUE, 90), (29, 295, 20, TRUE, 90),
(29, 296, 20, TRUE, 90), (29, 297, 20, FALSE, 0), (29, 298, 20, FALSE, 0), (29, 299, 20, FALSE, 0), (29, 300, 20, FALSE, 0),

-- PARTIDO 30: Atlético Tucumán (18) vs Unión (19) | IDs Tucuman: 256-270, Union: 271-285
(30, 256, 18, TRUE, 90), (30, 257, 18, TRUE, 90), (30, 258, 18, TRUE, 90), (30, 259, 18, TRUE, 90), (30, 260, 18, TRUE, 90),
(30, 261, 18, TRUE, 90), (30, 262, 18, TRUE, 90), (30, 263, 18, TRUE, 90), (30, 264, 18, TRUE, 90), (30, 265, 18, TRUE, 90),
(30, 266, 18, TRUE, 90), (30, 267, 18, FALSE, 0), (30, 268, 18, FALSE, 0), (30, 269, 18, FALSE, 0), (30, 270, 18, FALSE, 0),
(30, 271, 19, TRUE, 90), (30, 272, 19, TRUE, 90), (30, 273, 19, TRUE, 90), (30, 274, 19, TRUE, 90), (30, 275, 19, TRUE, 90),
(30, 276, 19, TRUE, 90), (30, 277, 19, TRUE, 90), (30, 278, 19, TRUE, 90), (30, 279, 19, TRUE, 90), (30, 280, 19, TRUE, 90),
(30, 281, 19, TRUE, 90), (30, 282, 19, FALSE, 0), (30, 283, 19, FALSE, 0), (30, 284, 19, FALSE, 0), (30, 285, 19, FALSE, 0),

-- PARTIDO 31: River (1) vs Huracán (6) | IDs River: 1-15, Huracán: 76-90
(31, 1, 1, TRUE, 90), (31, 2, 1, TRUE, 90), (31, 3, 1, TRUE, 90), (31, 4, 1, TRUE, 90), (31, 5, 1, TRUE, 90),
(31, 6, 1, TRUE, 90), (31, 7, 1, TRUE, 90), (31, 8, 1, TRUE, 90), (31, 9, 1, TRUE, 90), (31, 10, 1, TRUE, 90),
(31, 11, 1, TRUE, 90), (31, 12, 1, FALSE, 0), (31, 13, 1, FALSE, 0), (31, 14, 1, FALSE, 0), (31, 15, 1, FALSE, 0),
(31, 76, 6, TRUE, 90), (31, 77, 6, TRUE, 90), (31, 78, 6, TRUE, 90), (31, 79, 6, TRUE, 90), (31, 80, 6, TRUE, 90),
(31, 81, 6, TRUE, 90), (31, 82, 6, TRUE, 90), (31, 83, 6, TRUE, 90), (31, 84, 6, TRUE, 90), (31, 85, 6, TRUE, 90),
(31, 86, 6, TRUE, 90), (31, 87, 6, FALSE, 0), (31, 88, 6, FALSE, 0), (31, 89, 6, FALSE, 0), (31, 90, 6, FALSE, 0),

-- PARTIDO 32: Boca (2) vs Vélez (7) | IDs Boca: 16-30, Vélez: 91-105
(32, 16, 2, TRUE, 90), (32, 17, 2, TRUE, 90), (32, 18, 2, TRUE, 90), (32, 19, 2, TRUE, 90), (32, 20, 2, TRUE, 90),
(32, 21, 2, TRUE, 90), (32, 22, 2, TRUE, 90), (32, 23, 2, TRUE, 90), (32, 24, 2, TRUE, 90), (32, 25, 2, TRUE, 90),
(32, 26, 2, TRUE, 90), (32, 27, 2, FALSE, 0), (32, 28, 2, FALSE, 0), (32, 29, 2, FALSE, 0), (32, 30, 2, FALSE, 0),
(32, 91, 7, TRUE, 90), (32, 92, 7, TRUE, 90), (32, 93, 7, TRUE, 90), (32, 94, 7, TRUE, 90), (32, 95, 7, TRUE, 90),
(32, 96, 7, TRUE, 90), (32, 97, 7, TRUE, 90), (32, 98, 7, TRUE, 90), (32, 99, 7, TRUE, 90), (32, 100, 7, TRUE, 90),
(32, 101, 7, TRUE, 90), (32, 102, 7, FALSE, 0), (32, 103, 7, FALSE, 0), (32, 104, 7, FALSE, 0), (32, 105, 7, FALSE, 0),

-- PARTIDO 33: Indep (3) vs Estudiantes (8) | IDs Indep: 31-45, Estudiantes: 106-120
(33, 31, 3, TRUE, 90), (33, 32, 3, TRUE, 90), (33, 33, 3, TRUE, 90), (33, 34, 3, TRUE, 90), (33, 35, 3, TRUE, 90),
(33, 36, 3, TRUE, 90), (33, 37, 3, TRUE, 90), (33, 38, 3, TRUE, 90), (33, 39, 3, TRUE, 90), (33, 40, 3, TRUE, 90),
(33, 41, 3, TRUE, 90), (33, 42, 3, FALSE, 0), (33, 43, 3, FALSE, 0), (33, 44, 3, FALSE, 0), (33, 45, 3, FALSE, 0),
(33, 106, 8, TRUE, 90), (33, 107, 8, TRUE, 90), (33, 108, 8, TRUE, 90), (33, 109, 8, TRUE, 90), (33, 110, 8, TRUE, 90),
(33, 111, 8, TRUE, 90), (33, 112, 8, TRUE, 90), (33, 113, 8, TRUE, 90), (33, 114, 8, TRUE, 90), (33, 115, 8, TRUE, 90),
(33, 116, 8, TRUE, 90), (33, 117, 8, FALSE, 0), (33, 118, 8, FALSE, 0), (33, 119, 8, FALSE, 0), (33, 120, 8, FALSE, 0),

-- PARTIDO 34: Racing (4) vs Lanús (9) | IDs Racing: 46-60, Lanús: 121-135
(34, 46, 4, TRUE, 90), (34, 47, 4, TRUE, 90), (34, 48, 4, TRUE, 90), (34, 49, 4, TRUE, 90), (34, 50, 4, TRUE, 90),
(34, 51, 4, TRUE, 90), (34, 52, 4, TRUE, 90), (34, 53, 4, TRUE, 90), (34, 54, 4, TRUE, 90), (34, 55, 4, TRUE, 90),
(34, 56, 4, TRUE, 90), (34, 57, 4, FALSE, 0), (34, 58, 4, FALSE, 0), (34, 59, 4, FALSE, 0), (34, 60, 4, FALSE, 0),
(34, 121, 9, TRUE, 90), (34, 122, 9, TRUE, 90), (34, 123, 9, TRUE, 90), (34, 124, 9, TRUE, 90), (34, 125, 9, TRUE, 90),
(34, 126, 9, TRUE, 90), (34, 127, 9, TRUE, 90), (34, 128, 9, TRUE, 90), (34, 129, 9, TRUE, 90), (34, 130, 9, TRUE, 90),
(34, 131, 9, TRUE, 90), (34, 132, 9, FALSE, 0), (34, 133, 9, FALSE, 0), (34, 134, 9, FALSE, 0), (34, 135, 9, FALSE, 0),

-- PARTIDO 35: San Lorenzo (5) vs Banfield (10) | IDs SL: 61-75, Banfield: 136-150
(35, 61, 5, TRUE, 90), (35, 62, 5, TRUE, 90), (35, 63, 5, TRUE, 90), (35, 64, 5, TRUE, 90), (35, 65, 5, TRUE, 90),
(35, 66, 5, TRUE, 90), (35, 67, 5, TRUE, 90), (35, 68, 5, TRUE, 90), (35, 69, 5, TRUE, 90), (35, 70, 5, TRUE, 90),
(35, 71, 5, TRUE, 90), (35, 72, 5, FALSE, 0), (35, 73, 5, FALSE, 0), (35, 74, 5, FALSE, 0), (35, 75, 5, FALSE, 0),
(35, 136, 10, TRUE, 90), (35, 137, 10, TRUE, 90), (35, 138, 10, TRUE, 90), (35, 139, 10, TRUE, 90), (35, 140, 10, TRUE, 90),
(35, 141, 10, TRUE, 90), (35, 142, 10, TRUE, 90), (35, 143, 10, TRUE, 90), (35, 144, 10, TRUE, 90), (35, 145, 10, TRUE, 90),
(35, 146, 10, TRUE, 90), (35, 147, 10, FALSE, 0), (35, 148, 10, FALSE, 0), (35, 149, 10, FALSE, 0), (35, 150, 10, FALSE, 0),

-- PARTIDO 36: Argentinos (11) vs Colón (16) | IDs Argentinos: 151-165, Colon: 226-240
(36, 151, 11, TRUE, 90), (36, 152, 11, TRUE, 90), (36, 153, 11, TRUE, 90), (36, 154, 11, TRUE, 90), (36, 155, 11, TRUE, 90),
(36, 156, 11, TRUE, 90), (36, 157, 11, TRUE, 90), (36, 158, 11, TRUE, 90), (36, 159, 11, TRUE, 90), (36, 160, 11, TRUE, 90),
(36, 161, 11, TRUE, 90), (36, 162, 11, FALSE, 0), (36, 163, 11, FALSE, 0), (36, 164, 11, FALSE, 0), (36, 165, 11, FALSE, 0),
(36, 226, 16, TRUE, 90), (36, 227, 16, TRUE, 90), (36, 228, 16, TRUE, 90), (36, 229, 16, TRUE, 90), (36, 230, 16, TRUE, 90),
(36, 231, 16, TRUE, 90), (36, 232, 16, TRUE, 90), (36, 233, 16, TRUE, 90), (36, 234, 16, TRUE, 90), (36, 235, 16, TRUE, 90),
(36, 236, 16, TRUE, 90), (36, 237, 16, FALSE, 0), (36, 238, 16, FALSE, 0), (36, 239, 16, FALSE, 0), (36, 240, 16, FALSE, 0),

-- PARTIDO 37: Tigre (12) vs Godoy Cruz (17) | IDs Tigre: 166-180, Godoy: 241-255
(37, 166, 12, TRUE, 90), (37, 167, 12, TRUE, 90), (37, 168, 12, TRUE, 90), (37, 169, 12, TRUE, 90), (37, 170, 12, TRUE, 90),
(37, 171, 12, TRUE, 90), (37, 172, 12, TRUE, 90), (37, 173, 12, TRUE, 90), (37, 174, 12, TRUE, 90), (37, 175, 12, TRUE, 90),
(37, 176, 12, TRUE, 90), (37, 177, 12, FALSE, 0), (37, 178, 12, FALSE, 0), (37, 179, 12, FALSE, 0), (37, 180, 12, FALSE, 0),
(37, 241, 17, TRUE, 90), (37, 242, 17, TRUE, 90), (37, 243, 17, TRUE, 90), (37, 244, 17, TRUE, 90), (37, 245, 17, TRUE, 90),
(37, 246, 17, TRUE, 90), (37, 247, 17, TRUE, 90), (37, 248, 17, TRUE, 90), (37, 249, 17, TRUE, 90), (37, 250, 17, TRUE, 90),
(37, 251, 17, TRUE, 90), (37, 252, 17, FALSE, 0), (37, 253, 17, FALSE, 0), (37, 254, 17, FALSE, 0), (37, 255, 17, FALSE, 0),

-- PARTIDO 38: Defensa y Justicia (13) vs Atlético Tucumán (18) | IDs Defensa: 181-195, Tucuman: 256-270
(38, 181, 13, TRUE, 90), (38, 182, 13, TRUE, 90), (38, 183, 13, TRUE, 90), (38, 184, 13, TRUE, 90), (38, 185, 13, TRUE, 90),
(38, 186, 13, TRUE, 90), (38, 187, 13, TRUE, 90), (38, 188, 13, TRUE, 90), (38, 189, 13, TRUE, 90), (38, 190, 13, TRUE, 90),
(38, 191, 13, TRUE, 90), (38, 192, 13, FALSE, 0), (38, 193, 13, FALSE, 0), (38, 194, 13, FALSE, 0), (38, 195, 13, FALSE, 0),
(38, 256, 18, TRUE, 90), (38, 257, 18, TRUE, 90), (38, 258, 18, TRUE, 90), (38, 259, 18, TRUE, 90), (38, 260, 18, TRUE, 90),
(38, 261, 18, TRUE, 90), (38, 262, 18, TRUE, 90), (38, 263, 18, TRUE, 90), (38, 264, 18, TRUE, 90), (38, 265, 18, TRUE, 90),
(38, 266, 18, TRUE, 90), (38, 267, 18, FALSE, 0), (38, 268, 18, FALSE, 0), (38, 269, 18, FALSE, 0), (38, 270, 18, FALSE, 0),

-- PARTIDO 39: Newell's (14) vs Unión (19) | IDs Newells: 196-210, Union: 271-285
(39, 196, 14, TRUE, 90), (39, 197, 14, TRUE, 90), (39, 198, 14, TRUE, 90), (39, 199, 14, TRUE, 90), (39, 200, 14, TRUE, 90),
(39, 201, 14, TRUE, 90), (39, 202, 14, TRUE, 90), (39, 203, 14, TRUE, 90), (39, 204, 14, TRUE, 90), (39, 205, 14, TRUE, 90),
(39, 206, 14, TRUE, 90), (39, 207, 14, FALSE, 0), (39, 208, 14, FALSE, 0), (39, 209, 14, FALSE, 0), (39, 210, 14, FALSE, 0),
(39, 271, 19, TRUE, 90), (39, 272, 19, TRUE, 90), (39, 273, 19, TRUE, 90), (39, 274, 19, TRUE, 90), (39, 275, 19, TRUE, 90),
(39, 276, 19, TRUE, 90), (39, 277, 19, TRUE, 90), (39, 278, 19, TRUE, 90), (39, 279, 19, TRUE, 90), (39, 280, 19, TRUE, 90),
(39, 281, 19, TRUE, 90), (39, 282, 19, FALSE, 0), (39, 283, 19, FALSE, 0), (39, 284, 19, FALSE, 0), (39, 285, 19, FALSE, 0),

-- PARTIDO 40: Rosario Central (15) vs Gimnasia (20) | IDs Central: 211-225, Gimnasia: 286-300
(40, 211, 15, TRUE, 90), (40, 212, 15, TRUE, 90), (40, 213, 15, TRUE, 90), (40, 214, 15, TRUE, 90), (40, 215, 15, TRUE, 90),
(40, 216, 15, TRUE, 90), (40, 217, 15, TRUE, 90), (40, 218, 15, TRUE, 90), (40, 219, 15, TRUE, 90), (40, 220, 15, TRUE, 90),
(40, 221, 15, TRUE, 90), (40, 222, 15, FALSE, 0), (40, 223, 15, FALSE, 0), (40, 224, 15, FALSE, 0), (40, 225, 15, FALSE, 0),
(40, 286, 20, TRUE, 90), (40, 287, 20, TRUE, 90), (40, 288, 20, TRUE, 90), (40, 289, 20, TRUE, 90), (40, 290, 20, TRUE, 90),
(40, 291, 20, TRUE, 90), (40, 292, 20, TRUE, 90), (40, 293, 20, TRUE, 90), (40, 294, 20, TRUE, 90), (40, 295, 20, TRUE, 90),
(40, 296, 20, TRUE, 90), (40, 297, 20, FALSE, 0), (40, 298, 20, FALSE, 0), (40, 299, 20, FALSE, 0), (40, 300, 20, FALSE, 0),

-- === FECHA 5 (Partidos 41 al 50) ===

-- PARTIDO 41: River (1) vs Vélez (7) | IDs River: 1-15, Vélez: 91-105
(41, 1, 1, TRUE, 90), (41, 2, 1, TRUE, 90), (41, 3, 1, TRUE, 90), (41, 4, 1, TRUE, 90), (41, 5, 1, TRUE, 90),
(41, 6, 1, TRUE, 90), (41, 7, 1, TRUE, 90), (41, 8, 1, TRUE, 90), (41, 9, 1, TRUE, 90), (41, 10, 1, TRUE, 90),
(41, 11, 1, TRUE, 90), (41, 12, 1, FALSE, 0), (41, 13, 1, FALSE, 0), (41, 14, 1, FALSE, 0), (41, 15, 1, FALSE, 0),
(41, 91, 7, TRUE, 90), (41, 92, 7, TRUE, 90), (41, 93, 7, TRUE, 90), (41, 94, 7, TRUE, 90), (41, 95, 7, TRUE, 90),
(41, 96, 7, TRUE, 90), (41, 97, 7, TRUE, 90), (41, 98, 7, TRUE, 90), (41, 99, 7, TRUE, 90), (41, 100, 7, TRUE, 90),
(41, 101, 7, TRUE, 90), (41, 102, 7, FALSE, 0), (41, 103, 7, FALSE, 0), (41, 104, 7, FALSE, 0), (41, 105, 7, FALSE, 0),

-- PARTIDO 42: Boca (2) vs Estudiantes (8) | IDs Boca: 16-30, Estudiantes: 106-120
(42, 16, 2, TRUE, 90), (42, 17, 2, TRUE, 90), (42, 18, 2, TRUE, 90), (42, 19, 2, TRUE, 90), (42, 20, 2, TRUE, 90),
(42, 21, 2, TRUE, 90), (42, 22, 2, TRUE, 90), (42, 23, 2, TRUE, 90), (42, 24, 2, TRUE, 90), (42, 25, 2, TRUE, 90),
(42, 26, 2, TRUE, 90), (42, 27, 2, FALSE, 0), (42, 28, 2, FALSE, 0), (42, 29, 2, FALSE, 0), (42, 30, 2, FALSE, 0),
(42, 106, 8, TRUE, 90), (42, 107, 8, TRUE, 90), (42, 108, 8, TRUE, 90), (42, 109, 8, TRUE, 90), (42, 110, 8, TRUE, 90),
(42, 111, 8, TRUE, 90), (42, 112, 8, TRUE, 90), (42, 113, 8, TRUE, 90), (42, 114, 8, TRUE, 90), (42, 115, 8, TRUE, 90),
(42, 116, 8, TRUE, 90), (42, 117, 8, FALSE, 0), (42, 118, 8, FALSE, 0), (42, 119, 8, FALSE, 0), (42, 120, 8, FALSE, 0),

-- PARTIDO 43: Indep (3) vs Lanús (9) | IDs Indep: 31-45, Lanús: 121-135
(43, 31, 3, TRUE, 90), (43, 32, 3, TRUE, 90), (43, 33, 3, TRUE, 90), (43, 34, 3, TRUE, 90), (43, 35, 3, TRUE, 90),
(43, 36, 3, TRUE, 90), (43, 37, 3, TRUE, 90), (43, 38, 3, TRUE, 90), (43, 39, 3, TRUE, 90), (43, 40, 3, TRUE, 90),
(43, 41, 3, TRUE, 90), (43, 42, 3, FALSE, 0), (43, 43, 3, FALSE, 0), (43, 44, 3, FALSE, 0), (43, 45, 3, FALSE, 0),
(43, 121, 9, TRUE, 90), (43, 122, 9, TRUE, 90), (43, 123, 9, TRUE, 90), (43, 124, 9, TRUE, 90), (43, 125, 9, TRUE, 90),
(43, 126, 9, TRUE, 90), (43, 127, 9, TRUE, 90), (43, 128, 9, TRUE, 90), (43, 129, 9, TRUE, 90), (43, 130, 9, TRUE, 90),
(43, 131, 9, TRUE, 90), (43, 132, 9, FALSE, 0), (43, 133, 9, FALSE, 0), (43, 134, 9, FALSE, 0), (43, 135, 9, FALSE, 0),

-- PARTIDO 44: Racing (4) vs Banfield (10) | IDs Racing: 46-60, Banfield: 136-150
(44, 46, 4, TRUE, 90), (44, 47, 4, TRUE, 90), (44, 48, 4, TRUE, 90), (44, 49, 4, TRUE, 90), (44, 50, 4, TRUE, 90),
(44, 51, 4, TRUE, 90), (44, 52, 4, TRUE, 90), (44, 53, 4, TRUE, 90), (44, 54, 4, TRUE, 90), (44, 55, 4, TRUE, 90),
(44, 56, 4, TRUE, 90), (44, 57, 4, FALSE, 0), (44, 58, 4, FALSE, 0), (44, 59, 4, FALSE, 0), (44, 60, 4, FALSE, 0),
(44, 136, 10, TRUE, 90), (44, 137, 10, TRUE, 90), (44, 138, 10, TRUE, 90), (44, 139, 10, TRUE, 90), (44, 140, 10, TRUE, 90),
(44, 141, 10, TRUE, 90), (44, 142, 10, TRUE, 90), (44, 143, 10, TRUE, 90), (44, 144, 10, TRUE, 90), (44, 145, 10, TRUE, 90),
(44, 146, 10, TRUE, 90), (44, 147, 10, FALSE, 0), (44, 148, 10, FALSE, 0), (44, 149, 10, FALSE, 0), (44, 150, 10, FALSE, 0),

-- PARTIDO 45: San Lorenzo (5) vs Huracán (6) | IDs SL: 61-75, Huracán: 76-90
(45, 61, 5, TRUE, 90), (45, 62, 5, TRUE, 90), (45, 63, 5, TRUE, 90), (45, 64, 5, TRUE, 90), (45, 65, 5, TRUE, 90),
(45, 66, 5, TRUE, 90), (45, 67, 5, TRUE, 90), (45, 68, 5, TRUE, 90), (45, 69, 5, TRUE, 90), (45, 70, 5, TRUE, 90),
(45, 71, 5, TRUE, 90), (45, 72, 5, FALSE, 0), (45, 73, 5, FALSE, 0), (45, 74, 5, FALSE, 0), (45, 75, 5, FALSE, 0),
(45, 76, 6, TRUE, 90), (45, 77, 6, TRUE, 90), (45, 78, 6, TRUE, 90), (45, 79, 6, TRUE, 90), (45, 80, 6, TRUE, 90),
(45, 81, 6, TRUE, 90), (45, 82, 6, TRUE, 90), (45, 83, 6, TRUE, 90), (45, 84, 6, TRUE, 90), (45, 85, 6, TRUE, 90),
(45, 86, 6, TRUE, 90), (45, 87, 6, FALSE, 0), (45, 88, 6, FALSE, 0), (45, 89, 6, FALSE, 0), (45, 90, 6, FALSE, 0),

-- PARTIDO 46: Argentinos (11) vs Godoy Cruz (17) | IDs Argentinos: 151-165, Godoy: 241-255
(46, 151, 11, TRUE, 90), (46, 152, 11, TRUE, 90), (46, 153, 11, TRUE, 90), (46, 154, 11, TRUE, 90), (46, 155, 11, TRUE, 90),
(46, 156, 11, TRUE, 90), (46, 157, 11, TRUE, 90), (46, 158, 11, TRUE, 90), (46, 159, 11, TRUE, 90), (46, 160, 11, TRUE, 90),
(46, 161, 11, TRUE, 90), (46, 162, 11, FALSE, 0), (46, 163, 11, FALSE, 0), (46, 164, 11, FALSE, 0), (46, 165, 11, FALSE, 0),
(46, 241, 17, TRUE, 90), (46, 242, 17, TRUE, 90), (46, 243, 17, TRUE, 90), (46, 244, 17, TRUE, 90), (46, 245, 17, TRUE, 90),
(46, 246, 17, TRUE, 90), (46, 247, 17, TRUE, 90), (46, 248, 17, TRUE, 90), (46, 249, 17, TRUE, 90), (46, 250, 17, TRUE, 90),
(46, 251, 17, TRUE, 90), (46, 252, 17, FALSE, 0), (46, 253, 17, FALSE, 0), (46, 254, 17, FALSE, 0), (46, 255, 17, FALSE, 0),

-- PARTIDO 47: Tigre (12) vs Atlético Tucumán (18) | IDs Tigre: 166-180, Tucuman: 256-270
(47, 166, 12, TRUE, 90), (47, 167, 12, TRUE, 90), (47, 168, 12, TRUE, 90), (47, 169, 12, TRUE, 90), (47, 170, 12, TRUE, 90),
(47, 171, 12, TRUE, 90), (47, 172, 12, TRUE, 90), (47, 173, 12, TRUE, 90), (47, 174, 12, TRUE, 90), (47, 175, 12, TRUE, 90),
(47, 176, 12, TRUE, 90), (47, 177, 12, FALSE, 0), (47, 178, 12, FALSE, 0), (47, 179, 12, FALSE, 0), (47, 180, 12, FALSE, 0),
(47, 256, 18, TRUE, 90), (47, 257, 18, TRUE, 90), (47, 258, 18, TRUE, 90), (47, 259, 18, TRUE, 90), (47, 260, 18, TRUE, 90),
(47, 261, 18, TRUE, 90), (47, 262, 18, TRUE, 90), (47, 263, 18, TRUE, 90), (47, 264, 18, TRUE, 90), (47, 265, 18, TRUE, 90),
(47, 266, 18, TRUE, 90), (47, 267, 18, FALSE, 0), (47, 268, 18, FALSE, 0), (47, 269, 18, FALSE, 0), (47, 270, 18, FALSE, 0),

-- PARTIDO 48: Defensa y Justicia (13) vs Unión (19) | IDs Defensa: 181-195, Union: 271-285
(48, 181, 13, TRUE, 90), (48, 182, 13, TRUE, 90), (48, 183, 13, TRUE, 90), (48, 184, 13, TRUE, 90), (48, 185, 13, TRUE, 90),
(48, 186, 13, TRUE, 90), (48, 187, 13, TRUE, 90), (48, 188, 13, TRUE, 90), (48, 189, 13, TRUE, 90), (48, 190, 13, TRUE, 90),
(48, 191, 13, TRUE, 90), (48, 192, 13, FALSE, 0), (48, 193, 13, FALSE, 0), (48, 194, 13, FALSE, 0), (48, 195, 13, FALSE, 0),
(48, 271, 19, TRUE, 90), (48, 272, 19, TRUE, 90), (48, 273, 19, TRUE, 90), (48, 274, 19, TRUE, 90), (48, 275, 19, TRUE, 90),
(48, 276, 19, TRUE, 90), (48, 277, 19, TRUE, 90), (48, 278, 19, TRUE, 90), (48, 279, 19, TRUE, 90), (48, 280, 19, TRUE, 90),
(48, 281, 19, TRUE, 90), (48, 282, 19, FALSE, 0), (48, 283, 19, FALSE, 0), (48, 284, 19, FALSE, 0), (48, 285, 19, FALSE, 0),

-- PARTIDO 49: Newell's (14) vs Gimnasia (20) | IDs Newells: 196-210, Gimnasia: 286-300
(49, 196, 14, TRUE, 90), (49, 197, 14, TRUE, 90), (49, 198, 14, TRUE, 90), (49, 199, 14, TRUE, 90), (49, 200, 14, TRUE, 90),
(49, 201, 14, TRUE, 90), (49, 202, 14, TRUE, 90), (49, 203, 14, TRUE, 90), (49, 204, 14, TRUE, 90), (49, 205, 14, TRUE, 90),
(49, 206, 14, TRUE, 90), (49, 207, 14, FALSE, 0), (49, 208, 14, FALSE, 0), (49, 209, 14, FALSE, 0), (49, 210, 14, FALSE, 0),
(49, 286, 20, TRUE, 90), (49, 287, 20, TRUE, 90), (49, 288, 20, TRUE, 90), (49, 289, 20, TRUE, 90), (49, 290, 20, TRUE, 90),
(49, 291, 20, TRUE, 90), (49, 292, 20, TRUE, 90), (49, 293, 20, TRUE, 90), (49, 294, 20, TRUE, 90), (49, 295, 20, TRUE, 90),
(49, 296, 20, TRUE, 90), (49, 297, 20, FALSE, 0), (49, 298, 20, FALSE, 0), (49, 299, 20, FALSE, 0), (49, 300, 20, FALSE, 0),

-- PARTIDO 50: Rosario Central (15) vs Colón (16) | IDs Central: 211-225, Colon: 226-240
(50, 211, 15, TRUE, 90), (50, 212, 15, TRUE, 90), (50, 213, 15, TRUE, 90), (50, 214, 15, TRUE, 90), (50, 215, 15, TRUE, 90),
(50, 216, 15, TRUE, 90), (50, 217, 15, TRUE, 90), (50, 218, 15, TRUE, 90), (50, 219, 15, TRUE, 90), (50, 220, 15, TRUE, 90),
(50, 221, 15, TRUE, 90), (50, 222, 15, FALSE, 0), (50, 223, 15, FALSE, 0), (50, 224, 15, FALSE, 0), (50, 225, 15, FALSE, 0),
(50, 226, 16, TRUE, 90), (50, 227, 16, TRUE, 90), (50, 228, 16, TRUE, 90), (50, 229, 16, TRUE, 90), (50, 230, 16, TRUE, 90),
(50, 231, 16, TRUE, 90), (50, 232, 16, TRUE, 90), (50, 233, 16, TRUE, 90), (50, 234, 16, TRUE, 90), (50, 235, 16, TRUE, 90),
(50, 236, 16, TRUE, 90), (50, 237, 16, FALSE, 0), (50, 238, 16, FALSE, 0), (50, 239, 16, FALSE, 0), (50, 240, 16, FALSE, 0);

INSERT INTO futarg.eventos (id_evento, id_partido, id_jugador, minuto, tipo_evento) VALUES 
-- === FECHA 1 ===
-- Partido 1: River 1 - 1 Boca
(1, 1, 5, 23, 'Gol'), (2, 1, 19, 67, 'Gol'),
-- Partido 2: Indep 2 - 2 Racing
(3, 2, 32, 12, 'Gol'), (4, 2, 49, 34, 'Gol'), (5, 2, 39, 55, 'Gol'), (6, 2, 56, 89, 'Gol'),
-- Partido 3: SL 0 - 0 Huracán (Sin goles)
-- Partido 4: Vélez 3 - 1 Estudiantes
(7, 4, 95, 10, 'Gol'), (8, 4, 109, 35, 'Gol'), (9, 4, 99, 50, 'Gol'), (10, 4, 98, 77, 'Gol'),
-- Partido 5: Lanús 1 - 2 Banfield
(11, 5, 125, 20, 'Gol'), (12, 5, 138, 40, 'Gol'), (13, 5, 145, 65, 'Gol'),
-- Partido 6: Argentinos 1 - 0 Tigre
(14, 6, 155, 80, 'Gol'),
-- Partido 7: Defensa y Justicia 2 - 1 Newell's
(15, 7, 183, 15, 'Gol'), (16, 7, 197, 30, 'Gol'), (17, 7, 186, 60, 'Gol'),
-- Partido 8: Central 0 - 3 Colón
(18, 8, 226, 25, 'Gol'), (19, 8, 234, 50, 'Gol'), (20, 8, 235, 85, 'Gol'),
-- Partido 9: Godoy Cruz 2 - 2 Tucumán
(21, 9, 241, 10, 'Gol'), (22, 9, 262, 30, 'Gol'), (23, 9, 249, 70, 'Gol'), (24, 9, 265, 88, 'Gol'),
-- Partido 10: Unión 1 - 4 Gimnasia
(25, 10, 276, 12, 'Gol'), (26, 10, 290, 20, 'Gol'), (27, 10, 283, 40, 'Gol'), (28, 10, 285, 60, 'Gol'), (29, 10, 292, 90, 'Gol'),

-- === FECHA 2 ===
-- Partido 11: River 2 - 0 Indep
(30, 11, 1, 15, 'Gol'), (31, 11, 4, 78, 'Gol'),
-- Partido 12: Boca 1 - 2 Racing
(32, 12, 25, 33, 'Gol'), (33, 12, 46, 50, 'Gol'), (34, 12, 56, 88, 'Gol'),
-- Partido 13: SL 1 - 1 Vélez
(35, 13, 61, 22, 'Gol'), (36, 13, 91, 66, 'Gol'),
-- Partido 14: Huracán 0 - 0 Estudiantes (Sin goles)
-- Partido 15: Lanús 3 - 0 Argentinos
(37, 15, 121, 10, 'Gol'), (38, 15, 123, 45, 'Gol'), (39, 15, 127, 80, 'Gol'),
-- Partido 16: Banfield 1 - 1 Tigre
(40, 16, 136, 55, 'Gol'), (41, 16, 166, 90, 'Gol'),
-- Partido 17: Defensa 0 - 2 Central
(42, 17, 211, 34, 'Gol'), (43, 17, 212, 89, 'Gol'),
-- Partido 18: Newell's 2 - 1 Colón
(44, 18, 196, 12, 'Gol'), (45, 18, 233, 67, 'Gol'), (46, 18, 202, 85, 'Gol'),
-- Partido 19: Godoy 1 - 0 Unión
(47, 19, 242, 50, 'Gol'),
-- Partido 20: Tucumán 1 - 1 Gimnasia
(48, 20, 256, 40, 'Gol'), (49, 20, 291, 75, 'Gol'),

-- === FECHA 3 ===
-- Partido 21: River 0 - 1 Racing
(50, 21, 47, 60, 'Gol'),
-- Partido 22: Boca 2 - 2 Indep
(51, 22, 21, 15, 'Gol'), (52, 22, 26, 70, 'Gol'), (53, 22, 31, 30, 'Gol'), (54, 22, 40, 82, 'Gol'),
-- Partido 23: SL 4 - 1 Estudiantes
(55, 23, 62, 10, 'Gol'), (56, 23, 64, 30, 'Gol'), (57, 23, 69, 50, 'Gol'), (58, 23, 70, 75, 'Gol'), (59, 23, 107, 65, 'Gol'),
-- Partido 24: Huracán 1 - 3 Vélez
(60, 24, 79, 40, 'Gol'), (61, 24, 97, 20, 'Gol'), (62, 24, 98, 55, 'Gol'), (63, 24, 101, 88, 'Gol'),
-- Partido 25: Lanús 0 - 0 Tigre (Sin goles)
-- Partido 26: Banfield 1 - 2 Argentinos
(64, 26, 138, 60, 'Gol'), (65, 26, 158, 25, 'Gol'), (66, 26, 161, 80, 'Gol'),
-- Partido 27: Defensa 2 - 2 Colón
(67, 27, 184, 33, 'Gol'), (68, 27, 190, 88, 'Gol'), (69, 27, 228, 50, 'Gol'), (70, 27, 231, 77, 'Gol'),
-- Partido 28: Newell's 1 - 0 Central
(71, 28, 203, 45, 'Gol'),
-- Partido 29: Godoy 3 - 1 Gimnasia
(72, 29, 243, 11, 'Gol'), (73, 29, 248, 44, 'Gol'), (74, 29, 250, 78, 'Gol'), (75, 29, 287, 66, 'Gol'),
-- Partido 30: Tucumán 0 - 2 Unión
(76, 30, 274, 39, 'Gol'), (77, 30, 279, 92, 'Gol'),

-- === FECHA 4 ===
-- Partido 31: River 2 - 1 Huracán
(78, 31, 2, 20, 'Gol'), (79, 31, 6, 70, 'Gol'), (80, 31, 76, 55, 'Gol'),
-- Partido 32: Boca 1 - 3 Vélez
(81, 32, 20, 30, 'Gol'), (82, 32, 92, 15, 'Gol'), (83, 32, 94, 60, 'Gol'), (84, 32, 102, 85, 'Gol'),
-- Partido 33: Indep 0 - 0 Estudiantes (Sin goles)
-- Partido 34: Racing 2 - 2 Lanús
(85, 34, 48, 22, 'Gol'), (86, 34, 55, 78, 'Gol'), (87, 34, 122, 40, 'Gol'), (88, 34, 131, 88, 'Gol'),
-- Partido 35: SL 1 - 1 Banfield
(89, 35, 65, 50, 'Gol'), (90, 35, 141, 65, 'Gol'),
-- Partido 36: Argentinos 3 - 0 Colón
(91, 36, 151, 15, 'Gol'), (92, 36, 156, 40, 'Gol'), (93, 36, 159, 85, 'Gol'),
-- Partido 37: Tigre 0 - 2 Godoy
(94, 37, 244, 35, 'Gol'), (95, 37, 247, 80, 'Gol'),
-- Partido 38: Defensa 0 - 0 Tucumán (Sin goles)
-- Partido 39: Newell's 2 - 1 Unión
(96, 39, 197, 25, 'Gol'), (97, 39, 200, 70, 'Gol'), (98, 39, 272, 55, 'Gol'),
-- Partido 40: Central 1 - 1 Gimnasia
(99, 40, 213, 60, 'Gol'), (100, 40, 288, 45, 'Gol'),

-- === FECHA 5 ===
-- Partido 41: River 1 - 0 Vélez
(101, 41, 3, 52, 'Gol'),
-- Partido 42: Boca 2 - 2 Estudiantes
(102, 42, 16, 18, 'Gol'), (103, 42, 22, 82, 'Gol'), (104, 42, 106, 33, 'Gol'), (105, 42, 110, 75, 'Gol'),
-- Partido 43: Indep 1 - 1 Lanús
(106, 43, 33, 40, 'Gol'), (107, 43, 128, 60, 'Gol'),
-- Partido 44: Racing 0 - 3 Banfield
(108, 44, 137, 20, 'Gol'), (109, 44, 142, 50, 'Gol'), (110, 44, 143, 80, 'Gol'),
-- Partido 45: SL 2 - 2 Huracán
(111, 45, 66, 15, 'Gol'), (112, 45, 68, 88, 'Gol'), (113, 45, 80, 35, 'Gol'), (114, 45, 86, 77, 'Gol'),
-- Partido 46: Argentinos 0 - 1 Godoy
(115, 46, 251, 65, 'Gol'),
-- Partido 47: Tigre 0 - 1 Tucumán
(116, 47, 260, 50, 'Gol'),
-- Partido 48: Defensa 2 - 0 Unión
(117, 48, 182, 30, 'Gol'), (118, 48, 185, 90, 'Gol'),
-- Partido 49: Newell's 1 - 1 Gimnasia
(119, 49, 204, 44, 'Gol'), (120, 49, 289, 70, 'Gol');
-- Partido 50: Central 0 - 0 Colón (Sin goles);


-- VISTAS

-- VISTA 1: Cantidad de goles por fecha
CREATE OR REPLACE VIEW goles_fecha AS 
SELECT 
	id_fecha,
	SUM(goles_local + goles_visitnate) AS Total_Goles
FROM 
	futarg.partidos
GROUP BY 
	id_fecha;

SELECT id_fecha, Total_Goles FROM goles_fecha;

-- VISTA 2: Cantidad de minutos jugados por Jugador (se consideró para la facilidad de la carga de datos que no existen los cambios en el partido, por eso un jugador o jugó los 5 partidos = 450 min ó no jugó)

CREATE OR REPLACE VIEW minutos_detalle_jugador AS
SELECT 
    j.id_jugador, 
    j.nombre, 
    j.apellido, 
    SUM(a.minutos_jugados) AS Minutos_Totales
FROM 
    futarg.jugadores j
JOIN 
    futarg.alineaciones a ON j.id_jugador = a.id_jugador
GROUP BY 
    j.id_jugador, j.nombre, j.apellido;

SELECT * FROM minutos_detalle_jugador 
ORDER BY Minutos_Totales DESC;

-- VISTA 3: Estadio con mas goles locales (para ver si "pesa" la localia)

CREATE OR REPLACE VIEW goles_por_estadio AS
SELECT 
    e.nombre AS nombre_estadio, 
    SUM(p.goles_local) AS total_goles_locales
FROM 
    futarg.estadios e
JOIN 
    futarg.partidos p ON e.id_estadio = p.id_estadio
GROUP BY 
    e.id_estadio, e.nombre
ORDER BY 
    total_goles_locales DESC;
    
SELECT * FROM goles_por_estadio;

-- FUNCTIONS

-- Function 1: Promedio de goles por 'Delanteros' y 'Mediocampistas' // Se tiene en cuenta que se cargaron solamente 5 fechas de partidos // 

DELIMITER //

CREATE FUNCTION fn_promedio_posicion_torneo (p_posicion VARCHAR(50))
RETURNS DECIMAL(10,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total_goles_posicion INT;
    DECLARE total_partidos INT DEFAULT 50; 
    DECLARE promedio DECIMAL(10,2);

    SELECT COUNT(e.id_evento) INTO total_goles_posicion
    FROM futarg.eventos e
    JOIN futarg.jugadores j ON e.id_jugador = j.id_jugador
    WHERE j.posicion = p_posicion 
      AND e.tipo_evento = 'Gol';

    
    SET promedio = total_goles_posicion / total_partidos;

    RETURN promedio;
END //

DELIMITER ;

SELECT 
    DISTINCT posicion, 
    fn_promedio_posicion_torneo(posicion) AS goles_por_partido
FROM 
    futarg.jugadores
WHERE
	posicion IN ('Delantero','Mediocampista');
    
-- Function 2: Cantidad de goles a favor, en contra y la diferencia por equipo

DELIMITER //

CREATE FUNCTION fn_goles_equipo (p_id_equipo INT, p_tipo VARCHAR(10))
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_favor INT DEFAULT 0;
    DECLARE v_contra INT DEFAULT 0;
    DECLARE v_resultado INT DEFAULT 0;

    SELECT 
        IFNULL(SUM(CASE WHEN id_equipo_local = p_id_equipo THEN goles_local ELSE 0 END), 0) +
        IFNULL(SUM(CASE WHEN id_equipo_visitante = p_id_equipo THEN goles_visitnate ELSE 0 END), 0)
    INTO v_favor
    FROM futarg.partidos;

    SELECT 
        IFNULL(SUM(CASE WHEN id_equipo_local = p_id_equipo THEN goles_visitnate ELSE 0 END), 0) +
        IFNULL(SUM(CASE WHEN id_equipo_visitante = p_id_equipo THEN goles_local ELSE 0 END), 0)
    INTO v_contra
    FROM futarg.partidos;

    IF p_tipo = 'favor' THEN
        SET v_resultado = v_favor;
    ELSEIF p_tipo = 'contra' THEN
        SET v_resultado = v_contra;
    ELSEIF p_tipo = 'dif' THEN
        SET v_resultado = v_favor - v_contra;
    END IF;

    RETURN v_resultado;
END //

DELIMITER ;

SELECT 
    nombre AS Equipo,
    fn_goles_equipo(id_equipo, 'favor') AS GF,
    fn_goles_equipo(id_equipo, 'contra') AS GC,
    fn_goles_equipo(id_equipo, 'dif') AS DF
FROM 
    futarg.equipos
ORDER BY 
    DF DESC;
    
-- PROCEDIMIENTOS

-- PROCEDIMIENTO 1: TABLA DE POSICIONES... 3 pts por ganar, 1 pt por empatar, 0 pts por perder.

DELIMITER //

DROP PROCEDURE IF EXISTS sp_generar_tabla_puntos //

CREATE PROCEDURE sp_generar_tabla_puntos()
BEGIN
    SELECT 
        e.nombre AS Equipo,
        SUM(CASE 
            WHEN (p.id_equipo_local = e.id_equipo AND p.goles_local > p.goles_visitnate) OR 
                 (p.id_equipo_visitante = e.id_equipo AND p.goles_visitnate > p.goles_local) THEN 3
            WHEN p.goles_local = p.goles_visitnate THEN 1
            ELSE 0 END) AS PTS
    FROM 
        futarg.equipos e
    JOIN 
        futarg.partidos p ON e.id_equipo = p.id_equipo_local OR e.id_equipo = p.id_equipo_visitante
    GROUP BY 
        e.id_equipo, e.nombre
    ORDER BY 
        PTS DESC;
END //

DELIMITER ;

CALL sp_generar_tabla_puntos();

-- PROCEDIMIENTO 2: Resumen de las fechas Equipo local vs Equipo Visitnate y la fecha en que se jugó

DELIMITER //

DROP PROCEDURE IF EXISTS sp_ver_fixture_fecha //

CREATE PROCEDURE sp_ver_fixture_fecha (IN p_numero_fecha INT)
BEGIN
    SELECT 
        p.id_partido,
        el.nombre AS Equipo_Local,
        p.goles_local,
        p.goles_visitnate AS Goles_Visitante,
        ev.nombre AS Equipo_Visitante,
        p.fecha_partido
    FROM 
        futarg.partidos p
    INNER JOIN 
        futarg.equipos el ON p.id_equipo_local = el.id_equipo
    INNER JOIN 
        futarg.equipos ev ON p.id_equipo_visitante = ev.id_equipo
    WHERE 
        p.id_fecha = p_numero_fecha
    ORDER BY 
        p.fecha_partido ASC;
END //

DELIMITER ;


-- Para ver los partidos de la Fecha 1 a la Fecha 5
CALL sp_ver_fixture_fecha(1);
CALL sp_ver_fixture_fecha(2);
CALL sp_ver_fixture_fecha(3);
CALL sp_ver_fixture_fecha(4);
CALL sp_ver_fixture_fecha(5);

-- TRIGGER

-- Trigger 1: Verficador de "Goles Negativos" para que no se cargue que un equipo metio goles negativos. Y finalmente verifico su funcionamiento.

DELIMITER //
CREATE TRIGGER tr_validar_goles_positivos
BEFORE INSERT ON futarg.partidos
FOR EACH ROW
BEGIN
    -- Si los goles locales son negativos, poner 0
    IF NEW.goles_local < 0 THEN
        SET NEW.goles_local = 0;
    END IF;
    
    -- Si los goles visitantes son negativos, poner 0
    IF NEW.goles_visitnate < 0 THEN
        SET NEW.goles_visitnate = 0;
    END IF;
END //
DELIMITER ;

INSERT INTO futarg.partidos 
(id_partido, id_competicion, id_fecha, id_equipo_local, id_equipo_visitante, id_estadio, id_arbitro, fecha_partido, goles_local, goles_visitnate) 
VALUES 
(999, 1, 1, 1, 2, 1, 1, '2023-10-27', -5, -2);

SELECT id_partido, goles_local, goles_visitnate 
FROM futarg.partidos 
WHERE id_partido = 999;

-- Trigger 2: Verificador que ningun jugador haya jugado mas de 90 minutos. Y finalmente verifico su funcionamiento.

DROP TRIGGER IF EXISTS tr_limitar_minutos_jugador;

DELIMITER //

CREATE TRIGGER tr_limitar_minutos_jugador
BEFORE INSERT ON alineaciones -- Asegurate que el nombre de la tabla sea exacto
FOR EACH ROW
BEGIN
    IF NEW.minutos_jugados > 90 THEN
        SET NEW.minutos_jugados = 90;
    END IF;
END //

DELIMITER ;

INSERT IGNORE INTO futarg.jugadores (id_jugador, nombre, apellido, nacionalidad, fecha_nacimiento, posicion) 
VALUES (7777, 'Prueba', 'Final', 'Arg', '1995-05-05', 'Arquero');

INSERT INTO futarg.alineaciones (id_partido, id_jugador, id_equipo, titular, minutos_jugados) 
VALUES (1, 7777, 1, 1, 120);

SELECT minutos_jugados 
FROM futarg.alineaciones 
WHERE id_jugador = 7777;
