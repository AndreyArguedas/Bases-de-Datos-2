-- start 2018-07-26-permisos8pm1.sql

-- Tarea Moral:  Instalar y correr este script!

-- Windows RUN:  services.msc, buscar: OracleServiceXE (tenerlo en forma MANUAL)
-- Controles de Seguridad de la Información.
-- Existen varios pilares en la Seguridad de la Información:

-- Un SGSI debe proveer de (CID):
-- Confidencialidad de la información
-- Integridad de la información
-- Disponibilidad de la información

--Confidencialidad.
-- El acceso a los datos al nivel adecuado de autorizacion.

-- Primero control de la confidencialidad...
-- Por ejemplo, que un usuario solo pueda hacer select
--  de ciertas tablas, o bien solo pueda insertar,
-- actualizar o borrar.

host cls
PROMPT Nos conectamos como system
conn system/root

PROMPT Dropeamos el usuario conta
drop user conta cascade;

PROMPT Creamos el usuario CONTA (Sistema de Contabilidad)
create user conta identified by conta123;