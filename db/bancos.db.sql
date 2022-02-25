BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "banco" (
	"id_banco"	INTEGER,
	"nombre"	TEXT,
	PRIMARY KEY("id_banco" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "sucursal" (
	"id_sucursal"	INTEGER,
	"direccion"	TEXT NOT NULL UNIQUE,
	"id_banco"	INTEGER,
	FOREIGN KEY("id_banco") REFERENCES "banco"("id_banco"),
	PRIMARY KEY("id_sucursal" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "empleado" (
	"rut_empleado"	TEXT NOT NULL UNIQUE,
	"nombre"	TEXT NOT NULL,
	"edad"	INTEGER NOT NULL,
	"id_sucursal"	INTEGER,
	FOREIGN KEY("id_sucursal") REFERENCES "sucursal"("id_sucursal"),
	PRIMARY KEY("rut_empleado")
);
CREATE TABLE IF NOT EXISTS "usuario" (
	"email"	TEXT NOT NULL UNIQUE,
	"password"	TEXT NOT NULL,
	"rut_empleado"	TEXT,
	"rut_vigilante"	TEXT,
	FOREIGN KEY("rut_empleado") REFERENCES "empleado"("rut_empleado"),
	FOREIGN KEY("rut_vigilante") REFERENCES "vigilante"("rut_vigilante")
);
CREATE TABLE IF NOT EXISTS "reportes_vigilante" (
	"detalle_reporte"	TEXT NOT NULL,
	"rut_vigilante"	TEXT,
	"fecha_reporte"	TEXT NOT NULL,
	"hora_registro"	TEXT,
	FOREIGN KEY("rut_vigilante") REFERENCES "vigilante"("rut_vigilante")
);
CREATE TABLE IF NOT EXISTS "registro_empleado" (
	"horario_entrada"	TEXT,
	"horario_salida"	TEXT,
	"detalle_anomalia"	TEXT,
	"rut_empleado"	TEXT,
	"fecha_registro"	TEXT,
	FOREIGN KEY("rut_empleado") REFERENCES "empleado"("rut_empleado")
);
CREATE TABLE IF NOT EXISTS "vigilante" (
	"rut_vigilante"	TEXT NOT NULL UNIQUE,
	"nombre"	TEXT NOT NULL,
	"edad"	INTEGER NOT NULL,
	"fecha_contratacion"	TEXT NOT NULL,
	"id_sucursal"	INTEGER,
	FOREIGN KEY("id_sucursal") REFERENCES "sucursal"("id_sucursal"),
	PRIMARY KEY("rut_vigilante")
);
INSERT INTO "banco" VALUES (1,'Banco Estado');
INSERT INTO "banco" VALUES (2,'Banco de Chile');
INSERT INTO "banco" VALUES (3,'Scotiabank');
INSERT INTO "banco" VALUES (4,'Banco Falabella');
INSERT INTO "banco" VALUES (5,'Banco Santander');
INSERT INTO "sucursal" VALUES (1,'Vicuna Mackenna 888',1);
INSERT INTO "sucursal" VALUES (2,'Matucana 24245',5);
INSERT INTO "sucursal" VALUES (3,'Moneda 425',2);
INSERT INTO "sucursal" VALUES (4,'Agustinas 663',2);
INSERT INTO "sucursal" VALUES (5,'Las Condes 818',3);
INSERT INTO "sucursal" VALUES (6,'Vitacura 998',5);
INSERT INTO "sucursal" VALUES (7,'Agustinas 24945',4);
INSERT INTO "sucursal" VALUES (8,'Estacion Central 111',1);
INSERT INTO "sucursal" VALUES (9,'Pajaritos 976',3);
INSERT INTO "empleado" VALUES ('8998333-1','Mauricio Silva',44,2);
INSERT INTO "empleado" VALUES ('158423333-1','Alejandra Correa',32,3);
INSERT INTO "empleado" VALUES ('9993812-1','Carlos Rojas',50,1);
INSERT INTO "empleado" VALUES ('15849933-1','Felipe Montecinos',30,6);
INSERT INTO "empleado" VALUES ('23283983-1','Henrique Montiel',26,4);
INSERT INTO "empleado" VALUES ('15229933-1','Manuel Jara',37,8);
INSERT INTO "usuario" VALUES ('mauricio@gmail.com','d21433s','8998333-1',NULL);
INSERT INTO "usuario" VALUES ('alejandra@gmail.com','daaas23','158423333-1',NULL);
INSERT INTO "usuario" VALUES ('carlos@gmail.com','233dd22','9993812-1',NULL);
INSERT INTO "usuario" VALUES ('felipe@gmail.com','dads5556','15849933-1',NULL);
INSERT INTO "usuario" VALUES ('henrique@gmail.com','ddd123432','23283983-1',NULL);
INSERT INTO "usuario" VALUES ('manuel@gmail.com','d13d2ddr3f','15229933-1',NULL);
INSERT INTO "usuario" VALUES ('rodrigo@gmail.com','d21433s',NULL,'6343135-1');
INSERT INTO "usuario" VALUES ('claudio@gmail.com','daaas23',NULL,'23554535-1');
INSERT INTO "usuario" VALUES ('jose@gmail.com','233dd22',NULL,'16777344-1');
INSERT INTO "usuario" VALUES ('maximiliano@gmail.com','dads5556',NULL,'12566343-1');
INSERT INTO "usuario" VALUES ('ignacio@gmail.com','ddd123432',NULL,'13283983-1');
INSERT INTO "reportes_vigilante" VALUES ('Cliente se altera pero es controlado','6343135-1','2022-01-02','13:30');
INSERT INTO "reportes_vigilante" VALUES ('Termina la jornada sin mayor problema','6343135-1','2022-01-02','18:00');
INSERT INTO "reportes_vigilante" VALUES ('Ninguna novedad en la sucursal','23554535-1','2022-01-14','18:00');
INSERT INTO "reportes_vigilante" VALUES ('Se llama a carabineros ya que se detecta que en el sector hay vehiculos dandose vueltas','16777344-1','2022-02-14','15:00');
INSERT INTO "reportes_vigilante" VALUES ('Termina la jordana sin mayor problema, problema dado a las 15:00 fue controlado, no hay mas novedades','16777344-1','2022-02-14','18:00');
INSERT INTO "reportes_vigilante" VALUES ('Termina la jornada sin mayor problema','12566343-1','2022-01-02','18:00');
INSERT INTO "reportes_vigilante" VALUES ('Se reporta problemas con los sistemas a los clientes','13283983-1','2022-01-26','12:13');
INSERT INTO "reportes_vigilante" VALUES ('Clientes se alteran ya por largas filas de espera','13283983-1','2022-01-26','13:00');
INSERT INTO "reportes_vigilante" VALUES ('Termina la jornada sin mayor problema, los problemas del sistema fueron solucionados','13283983-1','2022-01-26','18:00');
INSERT INTO "registro_empleado" VALUES ('18:00','19:00','Se encontro un objeto perdido','8998333-1','2022-02-01');
INSERT INTO "registro_empleado" VALUES ('18:30','19:30','','158423333-1','2022-01-01');
INSERT INTO "registro_empleado" VALUES ('19:00','20:00','Computadores encendidos','9993812-1','2022-02-10');
INSERT INTO "registro_empleado" VALUES ('18:30','18:45','','15229933-1','2022-02-20');
INSERT INTO "vigilante" VALUES ('6343135-1','Rodrigo Arenas',44,'2000-01-16',3);
INSERT INTO "vigilante" VALUES ('23554535-1','Claudio Silva',44,'2005-06-22',5);
INSERT INTO "vigilante" VALUES ('16777344-1','Jose Cardenas',44,'2010-04-01',7);
INSERT INTO "vigilante" VALUES ('12566343-1','Maximiliano Aguirre',44,'2004-01-01',1);
INSERT INTO "vigilante" VALUES ('13283983-1','Ignacio Latorre',44,'2000-06-17',6);
COMMIT;
