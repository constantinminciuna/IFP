create database ifp;
use ifp;

drop table if exists sede;
create table sede(
id int auto_increment primary key,
citta varchar(255),
indirizzo varchar(255),
telefono varchar(255)
);

drop table if exists docente;
create table docente(
id int auto_increment primary key,
nome varchar(255),
cognome varchar(255),
telefono varchar(255),
titolo_di_studio varchar(255)
);

drop table if exists corso;
create table corso(
id int auto_increment primary key,
nome varchar(255),
durata int,
id_docente int,
foreign key (id_docente) references docente(id) on delete set null on update cascade
);

create table user(
id int auto_increment primary key,
username varchar(50) unique,
nome varchar(255),
cognome varchar(255),
email varchar(255),
password varchar(255)
);

INSERT INTO ifp.corso (id, durata, nome, id_docente) VALUES ('1', '500', 'Amministrazione Aziendale', '1');
INSERT INTO ifp.corso (id, durata, nome, id_docente) VALUES ('2', '400', 'Digital Marketing', '2');
INSERT INTO ifp.corso (id, durata, nome, id_docente) VALUES ('3', '300', 'Moda', '3');
INSERT INTO ifp.corso (id, durata, nome, id_docente) VALUES ('4', '350', 'Segreteria ed Amministrazione', '4');
INSERT INTO ifp.corso (id, durata, nome, id_docente) VALUES ('5', '540', 'Web Design e Graphic Design', '5');
INSERT INTO ifp.corso (id, durata, nome, id_docente) VALUES ('6', '510', 'Social Media Manager', '6');
INSERT INTO ifp.corso (id, durata, nome, id_docente) VALUES ('7', '380', 'Animatore Sociale', '7');
INSERT INTO ifp.corso (id, durata, nome, id_docente) VALUES ('8', '390', "Educazione dell'Infanzia", '8');

INSERT INTO ifp.sede (id, citta, indirizzo, telefono) VALUES ('1', 'Roma', 'Via Cantore 55', '06888444');
INSERT INTO ifp.sede (id, citta, indirizzo, telefono) VALUES ('2', 'Milano', 'Via Mazzini 34', '024444');
INSERT INTO ifp.sede (id, citta, indirizzo, telefono) VALUES ('3', 'Treviso', 'Via Cavour 67', '03466666');
INSERT INTO ifp.sede (id, citta, indirizzo, telefono) VALUES ('4', 'Padova', 'Via Vittorio Emanuele 31', '08955555');
INSERT INTO ifp.sede (id, citta, indirizzo, telefono) VALUES ('5', 'Bari', 'Via Firenze 56', '349888');
INSERT INTO ifp.sede (id, citta, indirizzo, telefono) VALUES ('6', 'Torino', 'Via dei Mulini 87', '011456666');

INSERT INTO ifp.docente (id, cognome, nome, telefono, titolo_di_studio) VALUES ('1', 'Franceschini', 'Mario', '333444555', 'laurea');
INSERT INTO ifp.docente (id, cognome, nome, telefono, titolo_di_studio) VALUES ('2', 'Rossi', 'Daniele', '333555444', 'diploma');
INSERT INTO ifp.docente (id, cognome, nome, telefono, titolo_di_studio) VALUES ('3', 'Bianchi', 'Mario', '333666999', 'laurea');
INSERT INTO ifp.docente (id, cognome, nome, telefono, titolo_di_studio) VALUES ('4', 'Bianchi', 'Laura', '333666888', 'laurea');
INSERT INTO ifp.docente (id, cognome, nome, telefono, titolo_di_studio) VALUES ('5', 'Altobelli', 'Giuseppe', '333666777', 'diploma');
INSERT INTO ifp.docente (id, cognome, nome, telefono, titolo_di_studio) VALUES ('6', 'Rossi', 'Franco', '333666666', 'laurea');
INSERT INTO ifp.docente (id, cognome, nome, telefono, titolo_di_studio) VALUES ('7', 'Testini', 'Andrea', '333666555', 'laurea');
INSERT INTO ifp.docente (id, cognome, nome, telefono, titolo_di_studio) VALUES ('8', 'Russo', 'Sergio', '333111222', 'laurea');