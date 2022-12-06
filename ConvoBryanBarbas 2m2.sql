create database CineMrk
use CineMrk

create table Estado(
IdEstado int not null identity(1,1),
Dscrip varchar (50) not null,
constraint Fk_Estado primary key(IdEstado)
)

create table Sala(
IdSala int not null identity(1,1),
Dscrip varchar(50) not null,
Asientos int not null,
IdEstado int not null,
constraint fk_Sala primary key(IdSala),
constraint fk_Sala_Estado foreign key(IdEstado) references Estado(IdEstado)
)

create table Pelicula(
IdPelicula int not null identity(1,1),
Titulo varchar(50) not null,
Duracion time not null,
Genero varchar(50) not null,
Clasificacion varchar(50) not null,
Formato varchar(40) not null,
IdEstado int not null,
constraint fk_Pelicula primary key(IdPelicula),
constraint fk_Pelicula_Estado foreign key(IdEstado) references Estado(IdEstado)
)

create table Asiento(
IdAsiento int not null identity(1,1),
No_Asiento int not null,
IdSala int not null,
IdEstado int not null,
constraint fk_Asiento primary key(IdAsiento),
constraint fk_Asiento_Sala foreign key(IdSala) references Sala(IdSala),
constraint fk_Asiento_Estado foreign key(IdEstado) references Estado(IdEstado)
)

create table cliente(
IdCliente int not null identity(1,1),
Nombre varchar(50) not null,
Apellido varchar(50) not null,
Dni char(8) null,
constraint fk_Cliente primary key(IdCliente)
)

create table Cartelera(
IdCartelera int not null identity(1,1),
IdPelicula int not null,
IdSala int not null,
HorarioInicio time not null,
HorarioFin time not null,
Fecha date not null,
IdEstado int not null,
constraint fk_Cartelera primary key(IdCartelera),
constraint fk_Cartelera_Pelicula foreign key(IdPelicula) references Pelicula(IdPelicula),
constraint fk_Cartelera_Sala foreign key(IdSala) references Sala(IdSala),
constraint fk_Cartelera_Estado foreign key(IdEstado) references Estado(IdEstado),
)

create table RegistroAsiento(
IdRAsiento int not null identity(1,1),
Idcartelera int not null,
NroAsiento int not null,
constraint fk_RAsiento primary key(IdRAsiento),
constraint fk_RAsienot_Cartelera foreign key(IdCartelera) references Cartelera(idCartelera)
)

create table AsientoCliente(
IdAcliente int not null identity(1,1),
IdRAsiento int not null,
IdCliente int not null,
constraint fk_ACliente primary key(IdACliente),
constraint fk_ACliente_RCliente foreign key (IdRAsiento) references RegistroAsiento(IdRAsiento),
constraint fk_ACliente_Cliente foreign key(IdCliente) references Cliente(IdCliente)
)


create table Empleado(
IdEmpleado int not null identity(1,1),
Nombre varchar(50) not null,
Apellido varchar(50) not null,
IdEstado int not null,
constraint fk_Empleado primary key(IdEmpleado),
constraint fk_Empleado_Estado foreign key(IdEstado) references Estado(IdEstado)
)

create table Ticket(
IdTicket int not null identity(1,1),
Tipo varchar(80) not null,
Dscrip varchar(200) not null,
Precio decimal(10,2)not null,
IdEstado int not null,
constraint fk_Ticket primary key (IdTicket),
constraint fk_Ticket_Estado foreign key(IdEstado) references Estado(IdEstado)
)

create table Venta(
IdVenta int not null identity(1,1),
IdCliente int not null,
IdCartelera int not null,
IdEmpleado int not null,
Fecha date not null,
Asientos varchar(50) not null,
TPago varchar(50) not null,
Promocion varchar(80) not null,
Descuento decimal(10,2) not null,
IdEstado int not null,
constraint fk_Venta primary key(IdVenta),
constraint fk_Venta_Cliente foreign key(IdCliente) references Cliente(IdCliente),
constraint fk_Venta_Cartelera foreign key(IdCartelera) references Cartelera(IdCartelera),
constraint fk_Venta_Empleado foreign key (IdEmpleado) references Empleado(IdEmpleado),
constraint fk_Venta_Estado foreign key(IdEstado) references Estado(IdEstado)
)

create table DetalleVenta(
IdDVenta int not null identity(1,1),
IdVenta int not null,
Dscrip varchar(100) not null,
Cantidad int not null,
Precio decimal(10,2) not null,
constraint fk_DVenta primary key(IdDVEnta),
constraint fk_DVenta_Venta foreign key(IdVenta) references Venta(IdVenta)
)

create table Promocion(
IdPromocion int not null identity(1,1),
Nombre varchar(80) not null,
Descuento decimal(10,2) not null,
IdEstado int not null,
BaseTicket bit not null,
constraint fk_Promocion primary key(IdPromocion),
constraint fk_Promocion_Estado foreign key(IdEstado) references Estado(IdEstado)
)

CREATE TABLE PROGRPROMOCION
(
 IDPPROMOCION INT NOT NULL IDENTITY(1,1),
 FECHA DATE NOT NULL,
 PROMOCION VARCHAR(80) NOT NULL,
 IDESTADO INT NOT NULL,
 CONSTRAINT PK_PPROMOCION PRIMARY KEY (IDPPROMOCION),
 CONSTRAINT FK_PPROMOCION_ESTADO FOREIGN KEY (IDESTADO) REFERENCES ESTADO(IDESTADO)
)

insert into Estado values('Activo')
insert into Estado values('Inactivo')
insert into Estado values('Ocupado')
insert into Estado values('Libre')
insert into Estado values('Cancelado')

insert into Sala VALUES ('SALA 1',14,4);

INSERT INTO SALA VALUES ('SALA 2',14,4);


INSERT INTO PELICULA VALUES ('Cars2 1','01:30:00','ACCION','APTO PARA TODOS','3D',null,1);

INSERT INTO ASIENTO VALUES (1,1,1);
INSERT INTO ASIENTO VALUES (2,1,1);
INSERT INTO ASIENTO VALUES (3,1,1);
INSERT INTO ASIENTO VALUES (4,1,1);
INSERT INTO ASIENTO VALUES (5,1,1);
INSERT INTO ASIENTO VALUES (6,1,1);
INSERT INTO ASIENTO VALUES (7,1,1);
INSERT INTO ASIENTO VALUES (8,1,1);
INSERT INTO ASIENTO VALUES (9,1,1);
INSERT INTO ASIENTO VALUES (10,1,1);
INSERT INTO ASIENTO VALUES (11,1,1);
INSERT INTO ASIENTO VALUES (12,1,1);
INSERT INTO ASIENTO VALUES (13,1,1);

INSERT INTO ASIENTO VALUES (14,1,1);

INSERT INTO ASIENTO VALUES (1,2,1);
INSERT INTO ASIENTO VALUES (2,2,1);
INSERT INTO ASIENTO VALUES (3,2,1);
INSERT INTO ASIENTO VALUES (4,2,1);
INSERT INTO ASIENTO VALUES (5,2,1);
INSERT INTO ASIENTO VALUES (6,2,1);
INSERT INTO ASIENTO VALUES (7,2,1);
INSERT INTO ASIENTO VALUES (8,2,1);
INSERT INTO ASIENTO VALUES (9,2,1);
INSERT INTO ASIENTO VALUES (10,2,1);
INSERT INTO ASIENTO VALUES (11,2,1);
INSERT INTO ASIENTO VALUES (12,2,1);
INSERT INTO ASIENTO VALUES (13,2,1);
INSERT INTO ASIENTO VALUES (14,2,1);

INSERT INTO ASIENTO VALUES (1,3,1);
INSERT INTO ASIENTO VALUES (2,3,1);
INSERT INTO ASIENTO VALUES (3,3,1);
INSERT INTO ASIENTO VALUES (4,3,1);
INSERT INTO ASIENTO VALUES (5,3,1);
INSERT INTO ASIENTO VALUES (6,3,1);
INSERT INTO ASIENTO VALUES (7,3,1);
INSERT INTO ASIENTO VALUES (8,3,1);
INSERT INTO ASIENTO VALUES (9,3,1);
INSERT INTO ASIENTO VALUES (10,3,1);
INSERT INTO ASIENTO VALUES (11,3,1);
INSERT INTO ASIENTO VALUES (12,3,1);
INSERT INTO ASIENTO VALUES (13,3,1);
INSERT INTO ASIENTO VALUES (14,3,1);

INSERT INTO CLIENTE VALUES ('Evelyn','Perez','88888888');

INSERT INTO CARTELERA VALUES (1,1,'18:00:00','19:30:00',CURRENT_TIMESTAMP,1);

INSERT INTO EMPLEADO VALUES ('JOSE','HERNANDEZ',CURRENT_TIMESTAMP,1);

INSERT INTO TICKET VALUES ('ENTRADA GENERAL','ENTRADA PARA LAS PERSONAS MAYORES DE 18 ANIOS',10,1);

INSERT INTO TICKET VALUES ('ENTRADA NINOS','ENTRADA PARA LOS NINOS',5,1);

INSERT INTO PROMOCION VALUES ('PROMOCION 3X2',1.0,1,1);

INSERT INTO PROMOCION VALUES ('DESCUENTO 30%',0.3,0,1);

CREATE PROCEDURE SP_PROGRAMAR_PELICULA
(
 @IDPELICULA INT,
 @DURACION INT,
 @IDSALA INT,
 @HORAINICIO TIME,
 @HORAFIN TIME
)
 
AS
DECLARE @ULTIMODIA INT,
  @UDIA DATE,
  @DIAPROGRAMA DATE,
  @CONTADOR INT=1
BEGIN
 
 SET @ULTIMODIA=(SELECT 7-( DATEDIFF(day,0,GETDATE())%7+1));
 SET @UDIA=(SELECT DATEADD(day,@ULTIMODIA,GETDATE()))
 SET @DIAPROGRAMA=GETDATE();

 WHILE (@CONTADOR<=@DURACION)
 BEGIN  
   WHILE (@DIAPROGRAMA<=@UDIA)
  BEGIN  
   INSERT INTO CARTELERA VALUES (@IDPELICULA,@IDSALA,@HORAINICIO,@HORAFIN,@DIAPROGRAMA,1);
   SET @DIAPROGRAMA=(SELECT DATEADD(day,1,@DIAPROGRAMA));
     END
  SET @UDIA=(SELECT DATEADD(day,7,@UDIA));
    SET @CONTADOR=@CONTADOR+1; 
 END  

END

CREATE PROCEDURE [dbo].[SP_VENTA]
(
 @IDCLIENTE INT,
 @IDCARTELERA INT,
 @IDEMPLEADO INT,
 @TPAGO VARCHAR(50),
 @XMLDOC TEXT
)
 
AS
DECLARE @DOC INT,
  @IDVENTA INT,
  @IDRASIENTO INT,
  @DESCT DECIMAL(19,2)
BEGIN
 
 BEGIN TRY
    BEGIN TRANSACTION 
  
  EXEC sp_xml_preparedocument @DOC OUTPUT, @XMLDOC;

   DECLARE @promoTEMP TABLE
   (
    id int identity(1,1),
    descuento decimal(10,2) DEFAULT 0,
    baseticket bit DEFAULT 0
   );
    
    IF (SELECT COUNT(IDPPROMOCION) from PROGRPROMOCION where CONVERT(VARCHAR,FECHA,111)=CONVERT(VARCHAR,GETDATE(),111))>0
     INSERT INTO @promoTEMP SELECT p.DESCUENTO,p.BASETICKET 
     from PROGRPROMOCION pg inner join PROMOCION p 
     on p.IDPROMOCION=pg.IDPROMOCION WHERE pg.FECHA=CONVERT(VARCHAR,GETDATE(),111);
     
    SET @DESCT =(SELECT  descuento from @promoTEMP);
    INSERT INTO VENTA 
    SELECT @IDCLIENTE,@IDCARTELERA,@IDEMPLEADO,GETDATE(),ASIENTOS,@TPAGO,PROMOCION,@DESCT,1 FROM OPENXML(@DOC,N'/ROOT/VENTA') 
    WITH (ASIENTOS VARCHAR(20),TPAGO VARCHAR(50),PROMOCION VARCHAR(80)) 
    SELECT @IDVENTA=@@IDENTITY;

    IF @@ERROR<>0
     ROLLBACK
    ELSE

     INSERT INTO DETALLEVENTA 
     SELECT @IDVENTA,DESCRIPCION,CANTIDAD,PRECIO FROM OPENXML(@DOC,N'/ROOT/VENTA/ITEM')
     WITH (DESCRIPCION VARCHAR(100),CANTIDAD INT,PRECIO DECIMAL(10,2));

     IF @@ERROR<>0
     ROLLBACK
      ELSE
      
       INSERT INTO REGISTROASIENTO 
       SELECT @IDVENTA,@IDCARTELERA,NROASIENTO FROM OPENXML(@DOC,N'/ROOT/ASIENTO')
       WITH ( NROASIENTO INT);

    COMMIT
 END TRY
 BEGIN CATCH

  IF @@TRANCOUNT > 0
   ROLLBACK
 END CATCH

END

CREATE PROCEDURE SP_PROGRAMAR_PROMO

(

@DURACION INT,

@NOMPROMOCION VARCHAR(80),

@IDPROMOCION INT

)

AS

DECLARE @ULTIMODIA INT,

@UDIA DATE,

@DIAPROGRAMA DATE,

@CONTADOR INT=1

BEGIN


SET @ULTIMODIA=(SELECT 7-( DATEDIFF(day,0,GETDATE())%7+1));

SET @UDIA=(SELECT DATEADD(day,@ULTIMODIA,GETDATE()))

SET @DIAPROGRAMA=GETDATE();


WHILE (@CONTADOR<=@DURACION)

BEGIN

WHILE (@DIAPROGRAMA<=@UDIA)

BEGIN

INSERT INTO PROGRPROMOCION VALUES (GETDATE(),@NOMPROMOCION,@IDPROMOCION,1);

SET @DIAPROGRAMA=(SELECT DATEADD(day,1,@DIAPROGRAMA));

END

SET @UDIA=(SELECT DATEADD(day,7,@UDIA));

SET @CONTADOR=@CONTADOR+1;

END
END

CREATE PROCEDURE SP_PROGRAMACION_XFECHA

(@FECHAINI DATE,@FECHAFIN DATE)

AS

BEGIN

SELECT c.IDCARTELERA,p.TITULO,s.DESCRIPCION,c.HORAINICIO,c.HORAFIN,c.FECHA,e.DESCRIPCION as 'estado' from CARTELERA c inner join PELICULA p on p.IDPELICULA=c.IDPELICULA

inner join sala s on s.IDSALA=c.IDSALA inner join ESTADO e on e.IDESTADO=c.IDESTADO

where c.FECHA Between @FECHAINI and @FECHAFIN;

END

CREATE PROCEDURE SP_REPORTE_VCLIENTE

(@CODCLIENTE INT)

AS

BEGIN

SELECT V.IDVENTA,V.FECHA,C.NOMBRE+' '+C.APELLIDO AS CLIENTE,R.HORAINICIO,R.HORAFIN,P.TITULO AS PELICULA,D.NOMBRE+' '+D.APELLIDO as 'empleado',v.FECHA,v.ASIENTOS,v.TPAGO,v.PROMOCION,v.DESCUENTO,E.DESCRIPCION FROM VENTA V

INNER JOIN CARTELERA R

ON R.IDCARTELERA = V.IDCARTELERA

INNER JOIN ESTADO E

ON E.IDESTADO=R.IDESTADO

INNER JOIN CLIENTE C

ON C.IDCLIENTE=V.IDCLIENTE

INNER JOIN PELICULA P ON

P.IDPELICULA = R.IDPELICULA

INNER JOIN EMPLEADO D ON

D.IDEMPLEADO=V.IDEMPLEADO

WHERE V.IDCLIENTE=@CODCLIENTE;

END

CREATE PROCEDURE SP_REPORTE_CARTELERA

(@DURACION INT)

AS

DECLARE @SEMANAS INT=@DURACION*7;

DECLARE @SPELICULA DATE=GETDATE()+@SEMANAS;

BEGIN

SELECT F.IDCARTELERA,F.FECHA,F.HORAINICIO,F.HORAFIN,P.TITULO,S.DESCRIPCION

FROM CARTELERA F

INNER JOIN PELICULA P ON

P.IDPELICULA=F.IDPELICULA

INNER JOIN SALA S ON

S.IDSALA=F.IDSALA

WHERE F.FECHA BETWEEN GETDATE() AND @SPELICULA;

END

CREATE TRIGGER T_VENTAASIENTO 
  ON REGISTROASIENTO
  AFTER INSERT 
  as
BEGIN
 INSERT INTO ASIENTOCLIENTE select i.IDRASIENTO,v.IDCLIENTE from inserted i inner 
 join VENTA v on v.IDVENTA=i.IDVENTA;

 UPDATE ASIENTO SET IDESTADO=3  FROM inserted i where ASIENTO.IDASIENTO =i.NROASIENTO;
 

END