CREATE TABLE  fiilikset(
	id SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	fiilis1 int NOT NULL,
	fiilis2 int NOT NULL,
	fiilis3 int NOT NULL,
	fiilis4 int NOT NULL,
	fiilis5 int NOT NULL,
	keskiarvo DECIMAL (5,2),
	aanet int NOT NULL,
	nimi varchar (30),
	pvm DATE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

