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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




CREATE TABLE authority (
  id integer NOT NULL auto_increment PRIMARY KEY,
  role varchar(255) NOT NULL UNIQUE
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
 CREATE TABLE kayttaja (
  id integer NOT NULL auto_increment PRIMARY KEY,
  kayttaja varchar(255) NOT NULL UNIQUE,
  password_encrypted varchar(255) NOT NULL,
  enabled tinyint NOT NULL,
  etunimi varchar(255) default NULL,
  sukunimi varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE kayttaja_authority (
  id integer NOT NULL auto_increment PRIMARY KEY,
  kayttaja_id integer NOT NULL,
  authority_id integer NOT NULL,
  FOREIGN KEY (kayttaja_id) REFERENCES kayttaja(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (authority_id) REFERENCES authority(id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
