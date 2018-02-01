create table ALMACEN (ID_ALMACEN INTEGER, UBICACION_ALMACEN VARCHAR2(50),
constraint PK_ID_ALMACEN PRIMARY KEY(ID_ALMACEN));

CREATE OR REPLACE PROCEDURE guardar_almacen (my_num_alm in integer, my_ubicacion in varchar2)
as
begin
insert into ALMACEN values (my_num_alm,my_ubicacion);
end;
/

--USAREMOS UN BLOQUE PLSQL QUE ETSA BIEN NUESTRO PROEEDIMIENTO

BEGIN
GUARDAR_ALMACEN (321,'ECATEPEC');
END;
/

SELECT * FROM ALMACEN; 