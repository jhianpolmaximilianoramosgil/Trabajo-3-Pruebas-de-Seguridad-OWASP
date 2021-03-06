-- Table: UBIGEO
CREATE TABLE UBIGEO (
    CODUBI CHAR(6) NOT NULL,
    PROUBI varchar(150)  NOT NULL,
    DEPUBI varchar(150)  NOT NULL,
    DISUBI varchar(150)  NOT NULL,
    CONSTRAINT UBIGEO_pk PRIMARY KEY (CODUBI)
);

CREATE TABLE PERSONAL (
	IDPER integer  NOT NULL,
	NOMPER VARCHAR2 (90)  NOT NULL,
	APEPER VARCHAR2 (90) NOT NULL,
	DNIPER CHAR (8) UNIQUE NOT NULL,
	CELPER CHAR (9) UNIQUE NOT NULL,
	EMAPER  VARCHAR2(90) UNIQUE NOT NULL,
	CODUBI CHAR(6) NOT NULL,
    DOMPER varchar2(120) NOT NULL,
	SEXPER  CHAR (1) NOT NULL,
	CARPER   VARCHAR2 (15) NOT NULL,
	ESTPER char(1) NOT NULL,
	CONSTRAINT PERSONAL_pk PRIMARY KEY(IDPER)
);



--  Create table USUARIO
CREATE TABLE USUARIO (
    IDUSU integer,
    IDPER integer,
    USUUSU varchar2(8),
    PWDUSU varchar2(15),
    LEVUSU integer ,
    ESTUSU char (1),
    CONSTRAINT USUARIO_pk PRIMARY KEY (IDUSU)
);



-- RELACIONANDOLO 
-- Relacionar la tabla UBIGEO a PERSONAL 
ALTER TABLE PERSONAL
ADD CONSTRAINT FK_PERSONAL_UBIGEO
FOREIGN KEY (CODUBI) REFERENCES UBIGEO (CODUBI);

-- Relacionar la tabla Personal a Usuario 
ALTER TABLE Usuario
ADD CONSTRAINT FK_Usuario_PERSONAL
FOREIGN KEY (IDPER) REFERENCES PERSONAL (IDPER);


CREATE SEQUENCE IDPERSONAL
START WITH 1
INCREMENT BY 1
ORDER;


CREATE SEQUENCE IDUSUARIO
START WITH 1
INCREMENT BY 1
ORDER;


CREATE OR REPLACE TRIGGER TGR_IDPERSONAL
BEFORE INSERT ON PERSONAL
FOR EACH ROW
BEGIN
SELECT IDPERSONAL.NEXTVAL INTO :NEW.IDPER FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER TGR_IDUSUARIO
BEFORE INSERT ON USUARIO
FOR EACH ROW
BEGIN
SELECT IDUSUARIO.NEXTVAL INTO :NEW.IDUSU FROM DUAL;
END;
/


--Insertando registros en la tabla UBIGEO :)
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150501','LIMA','CA?ETE','SAN VICENTE');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150502','LIMA','CA?ETE','ASIA');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150503','LIMA','CA?ETE','CALANGO');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150504','LIMA','CA?ETE','CERRO AZUL');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150505','LIMA','CA?ETE','CHILCA');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150506','LIMA','CA?ETE','COAYLLO');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150507','LIMA','CA?ETE','IMPERIAL');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150508','LIMA','CA?ETE','LUNAHUANA');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150509','LIMA','CA?ETE','MALA');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150510','LIMA','CA?ETE','NUEVO IMPERIAL');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150511','LIMA','CA?ETE','PACARAN');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150512','LIMA','CA?ETE','QUILMANA');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150513','LIMA','CA?ETE','SAN ANTONIO');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150514','LIMA','CA?ETE','SAN LUIS');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150515','LIMA','CA?ETE','SANTA CRUZ DE FLORES');
INSERT INTO UBIGEO (CODUBI,DEPUBI,PROUBI,DISUBI) VALUES ('150516','LIMA','CA?ETE','ZU?IGA');



-- INSERTAR REGISTROS EN LA TABLA PERSONAL :)
INSERT INTO PERSONAL (NOMPER, APEPER, DNIPER, CELPER, EMAPER, CODUBI, DOMPER, SEXPER, CARPER, ESTPER)
VALUES ( 'Juan Marcos', 'Rodriguez Quispe', '74143340','961270878','juan.rodrigues@vallegrande.edu.pe','150501','Jiron La Uni?n Mz:D Lt:02','M','Monitor','A');
INSERT INTO PERSONAL (NOMPER, APEPER, DNIPER, CELPER, EMAPER, CODUBI, DOMPER, SEXPER, CARPER, ESTPER)
VALUES ( 'Jhianpol Maximilianol', 'Ramos Gil', '74153320','961243876','jhianpol.ramos@vallegrande.edu.pe', '150502','Benavides Mz:A Lt:09','M', 'Monitor','A');
INSERT INTO PERSONAL (NOMPER, APEPER, DNIPER, CELPER, EMAPER, CODUBI, DOMPER, SEXPER, CARPER, ESTPER)
VALUES ( 'Jean Carlos', 'Simon Rojas', '76213428','961457989','jean.simon@vallegrande.edu.pe','150503','Av. Coronel Mz:B Lt:01','M','Monitor','A');
INSERT INTO PERSONAL (NOMPER, APEPER, DNIPER, CELPER, EMAPER, CODUBI, DOMPER, SEXPER, CARPER, ESTPER)
VALUES ( 'Mateo Miklo', 'Vidal Burqu?z', '76520530','961245767','mateo.vidal@vallegrande.edu.pe','150504','Jiron Arteaga Mz:O Lt:03', 'M','Monitor','A');
INSERT INTO PERSONAL (NOMPER, APEPER, DNIPER, CELPER, EMAPER, CODUBI, DOMPER, SEXPER, CARPER, ESTPER)
VALUES ( 'Flavio Francisco', 'Huaman Zambrano', '76438332','961043530','flavio.huaman@vallegrande.edu.pe','150508','Av 9 de diciembre Mz:P Lt:08', 'M','Monitor','A');
INSERT INTO PERSONAL (NOMPER, APEPER, DNIPER, CELPER, EMAPER, CODUBI, DOMPER, SEXPER, CARPER, ESTPER)
VALUES ( 'Lenox Beltr?n', 'Zuriaga Barton', '74153027','961243870','lenox.zuriaga@vallegrande.edu.pe', '150509','Av. Los Laureles Mz:','M', 'Monitor','A');
INSERT INTO PERSONAL (NOMPER, APEPER, DNIPER, CELPER, EMAPER, CODUBI, DOMPER, SEXPER, CARPER, ESTPER)
VALUES ( 'Franklin Malla', 'Murieta Malc?n', '76210123','961457981','franklin.murieta@vallegrande.edu.pe','150510', 'Av. 2 de Mayo Mz:J Lt:02','M','Monitor','A');
INSERT INTO PERSONAL (NOMPER, APEPER, DNIPER, CELPER, EMAPER, CODUBI, DOMPER, SEXPER, CARPER, ESTPER)
VALUES ( 'Martin Chiklo', 'Mollo Cardenaz', '76038539','961245763','martin.mollo@vallegrande.edu.pe','150511', 'Jr. Laura Caller Mz:M Lt:04','M','Monitor','A');
INSERT INTO PERSONAL (NOMPER, APEPER, DNIPER, CELPER, EMAPER, CODUBI, DOMPER, SEXPER, CARPER, ESTPER)
VALUES ( 'Renato Mendives', 'Hurtado Lozano', '76430530','961043531','renato.hurtado@vallegrande.edu.pe','150513','Av. Molinares Mz:T Lt:04', 'M','Monitor','A');
INSERT INTO PERSONAL (NOMPER, APEPER, DNIPER, CELPER, EMAPER, CODUBI, DOMPER, SEXPER, CARPER, ESTPER)
VALUES (  'Miguel Magallanes',  'Manco Villalobos', '71149384','976283910','ruben.manco@vallegrande.edu.pe','150512','Jr. Laura Caller Mz:M Lt:03', 'M','Monitor','A');



-- Registro de USUARIO
INSERT INTO USUARIO (IDPER, USUUSU , PWDUSU, LEVUSU, ESTUSU)
VALUES ('1','PEPIT', 'grillo2020','1','A');
INSERT INTO USUARIO (IDPER, USUUSU , PWDUSU,LEVUSU, ESTUSU)
VALUES ('2','RAMOS', 'ramos2021','2','A');
INSERT INTO USUARIO (IDPER, USUUSU , PWDUSU,LEVUSU, ESTUSU)
VALUES ('3','PINTO', '12345','2','A');

