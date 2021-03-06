create table ALMACEN (NUMERO_ALMACEN INTEGER, UBICACION_ALMACEN VARCHAR2(50),
constraint PK_ID_ALMACEN PRIMARY KEY(NUMERO_ALMACEN));

CREATE OR REPLACE PROCEDURE guardar_almacen (my_num_alm in integer, my_ubicacion in varchar2)
as
begin
insert into ALMACEN values (my_num_alm,my_ubicacion);
end;
/
select * from ALMACEN
--USAREMOS UN BLOQUE PLSQL QUE ETSA BIEN NUESTRO PROEEDIMIENTO

BEGIN
GUARDAR_ALMACEN (321,'ECATEPEC');
END;
/
--DROP TABLE CLIENTE

CREATE TABLE CLIENTE ( NUMERO_CLIENTE INTEGER,NUMERO_ALMACEN INTEGER, NOMBRE_CLIENTE VARCHAR2(80),
CONSTRAINT PK_N_C PRIMARY KEY (NUMERO_CLIENTE),
CONSTRAINT FK1_N_A FOREIGN KEY (NUMERO_ALMACEN) REFERENCES ALMACEN (NUMERO_ALMACEN) );

CREATE TABLE VENDEDOR (NUM_VENDEDOR INTEGER, NOM_VENDEDOR VARCHAR2(80),AREA_VENTAS VARCHAR(80),
CONSTRAINT PK_N_V PRIMARY KEY (NUM_VENDEDOR) );

CREATE TABLE VENTAS (ID_VENTAS INTEGER, 
NUMERO_CLIENTE INTEGER,
NUM_VENDEDOR INTEGER,
MONTO_VENTAS FLOAT,
CONSTRAINT PK_ID_V PRIMARY KEY (ID_VENTAS),
CONSTRAINT FK1_N_CL FOREIGN KEY(NUMERO_CLIENTE) REFERENCES CLIENTE (NUMERO_CLIENTE),
CONSTRAINT FK1_N_VEN FOREIGN KEY (NUM_VENDEDOR) REFERENCES VENDEDOR (NUM_VENDEDOR)
);






--EJEMPLITO DE UNA TABLA Y SU  PROCEDIMIENTO DE ALMACENADO PARA GUARDAR CON PRIMARY KEY IMPUESTO O ARTIFICIAL
CREATE TABLE CALIFICACIONES (
ID_CALIFICACION INTEGER,
MATERIA VARCHAR2(80),
VALOR FLOAT,
CONSTRAINT PK_ID_CAL PRIMARY KEY (ID_CALIFICACION)
); 

--GENERASMOS UNA SECUENCIA
--SOLO PARA PK IMPUESTOS
CREATE SEQUENCE SEC_CALIFICACIONES
START WITH 1
INCREMENT BY 1

--AQUI VA LO INTERESANTE OSEASE EL PROCEDIMIENTO
CREATE OR REPLACE PROCEDURE GUARDAR_CALIFICACIONES(
MY_ID_CALIFICACION OUT INTEGER,
MY_MATERIA IN VARCHAR2,
MY_VALOR IN FLOAT
)
AS
BEGIN
SELECT SEC_CALIFICACIONES.NEXTVAL INTO MY_ID_CALIFICACION FROM DUAL;--ESTE ES EL MAS IMPORTANTE 
INSERT INTO CALIFICACIONES VALUES (MY_ID_CALIFICACION,MY_MATERIA,MY_VALOR);
END; 
/

