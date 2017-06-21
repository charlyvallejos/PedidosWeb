-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-06-2017 a las 22:30:32
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `saporitiweb`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Clien_Ma_Igual_Codigo` (IN `_CODIGO` CHAR(7))  SELECT
    IFNULL(clien_ma.id,0) AS id,
    IFNULL(clien_ma.Codigo_Cliente,'') AS Codigo_Cliente,
    IFNULL(clien_ma.Razon_Social,'') AS Razon_Social,
    IFNULL(clien_ma.Nombre_Fantasia, '') AS Nombre_Fantasia,
    IFNULL(clien_ma.Domicilio, '') AS Domicilio,
    IFNULL(clien_ma.Codigo_Postal, '') AS Codigo_Postal,
    IFNULL(clien_ma.Localidad,'') AS Localidad,
    IFNULL(clien_ma.Provincia, 0) AS Provincia,
    IFNULL(clien_ma.Domicilio_Entrega, '') AS Domicilio_Entrega,
    IFNULL(clien_ma.Codigo_Postal_Entrega, 0) AS Codigo_Postal_Entrega,
    IFNULL(clien_ma.Localidad_Entrega,'') AS Localidad_Entrega,
    IFNULL(clien_ma.Provincia_Entrega, 0) AS Provincia_Entrega,
    IFNULL(clien_ma.Domicilio_Cobro, '') AS Domicilio_Cobro,
    IFNULL(clien_ma.Codigo_Postal_Cobro, 0) AS Codigo_Postal_Cobro,
    IFNULL(clien_ma.Localidad_Cobro,'') AS Localidad_Cobro,
    IFNULL(clien_ma.Provincia_Cobro, 0) AS Provincia_Cobro,
    IFNULL(clien_ma.Id_Reparto, 0) AS Id_Reparto,
    IFNULL(clien_ma.Id_Zona, 0) AS Id_Zona,
    IFNULL(clien_ma.Telefonos, '') AS Telefonos,
    IFNULL(clien_ma.Fax, '') AS Fax,
    IFNULL(clien_ma.Tipo_Iva, '') AS Tipo_Iva,
    IFNULL(clien_ma.Nro_Cuit, '') AS Nro_Cuit,
    IFNULL(clien_ma.Nro_Ing_Brutos, '') Nro_Ing_Brutos,
    IFNULL(clien_ma.Id_Categoria_Ing_Br, 0) AS Id_Categoria_Ing_Br,
    IFNULL(clien_ma.Comision, 0) AS Comision,
    IFNULL(clien_ma.Id_Lista_Precio, 0) AS Id_Lista_Precio,
    IFNULL(clien_ma.Estado, '') AS Estado,
    IFNULL(clien_ma.Id_Condicion_Vta, 0) AS Id_Condicion_Vta,
    IFNULL(clien_ma.Id_Agrupacion, 0) AS Id_Agrupacion,
    IFNULL(clien_ma.Codigo_Vendedor, 0) AS Codigo_Vendedor,
    IFNULL(clien_ma.Contacto, '') AS Contacto,
    IFNULL(clien_ma.Nivel_Habil, 0) AS Nivel_Habil,
    IFNULL(clien_ma.Id_Reparto_Entrega, 0) AS Id_Reparto_Entrega,
    IFNULL(clien_ma.Id_Reparto_Cobro, 0) AS Id_Reparto_Cobro,
    IFNULL(clien_ma.Dcto, 0) AS Dcto,
    IFNULL(clien_ma.Credito, 0) AS Credito,
    IFNULL(clien_ma.Protocolo, 0) AS Protocolo,
    IFNULL(clien_ma.Nro_Sedronar, '') AS Nro_Sedronar,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Vto_Sedro,'%d/%m/%Y'),'01/01/1990') AS Fecha_Vto_Sedro,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Alta, '%d/%m/%Y'),'01/01/1990') AS Fecha_Alta,
    IFNULL(clien_ma.Remito, 0) AS Remito ,
    IFNULL(clien_ma.Dcto_Pago_Ef, 0) AS Dcto_Pago_Ef,
    IFNULL(clien_ma.eMail, '') AS eMail,
    IFNULL(clien_ma.eMailProtocolos, '') AS eMailProtocolos,
    IFNULL(clien_ma.Id_Usuario, 0) AS Id_Usuario,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Operacion,'%d/%m/%Y'),'01/01/1990') AS Fecha_Operacion,
    IFNULL(clien_ma.Id_Grupo_Cliente,0) AS Id_Grupo_Cliente,
    IFNULL(clien_ma.Id_Transporte,0) AS Id_Transporte,
    IFNULL(clien_ma.Convenio,0) AS Convenio,
    IFNULL(clien_ma.Afip,'') AS Afip,
    IFNULL(clien_ma.Grupo_Cotiza,0) AS Grupo_Cotiza,
    IFNULL(clien_ma.Estado_Deudor,0) AS Estado_Deudor,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Estado_Deudor, '%d/%m/%Y'),'') AS Fecha_Estado_Deudor,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Facturar_Hasta,'%d/%m/%Y'),'') AS Fecha_Facturar_Hasta,
    IFNULL(clien_ma.Imprime_Nc_Dcto, 0) AS Imprime_Nc_Dcto,
    IFNULL(clien_ma.Id_Trans_Clien,0) AS Id_Trans_Clien,
    IFNULL(clien_ma.Motivo,'') AS Motivo,
    IFNULL(clien_ma.Id_Pais, 0) AS Id_Pais,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Vto_Psico,'%d/%m/%Y'),'') AS Fecha_Vto_Psico,
    IFNULL(clien_ma.Prefijo_Telefono_1,'') AS Prefijo_Telefono_1,
    IFNULL(clien_ma.Telefono_1, '') AS Telefono_1,
    IFNULL(clien_ma.Prefijo_Telefono_2,'') AS Prefijo_Telefono_2,
    IFNULL(clien_ma.Telefono_2, '') AS Telefono_2,
    IFNULL(clien_ma.Prefijo_Telefono_3,'') AS Prefijo_Telefono_3,
    IFNULL(clien_ma.Telefono_3, '') AS Telefono_3,
    IFNULL(clien_ma.Prefijo_Fax_1,'') AS Prefijo_Fax_1,
    IFNULL(clien_ma.Fax_1, '') AS Fax_1,
    IFNULL(clien_ma.Prefijo_Fax_2,'') AS Prefijo_Fax_2,
    IFNULL(clien_ma.Fax_2, '') AS Fax_2,
    IFNULL(clien_ma.Prefijo_Celular,'') AS Prefijo_Celular,
    IFNULL(clien_ma.Celular, '') AS Celular,
    IFNULL(clien_ma.Director_Tecnico, '') AS Director_Tecnico,
    IFNULL(clien_ma.Pasar_Importe, 0) AS Pasar_Importe,
    IFNULL(clien_ma.Grupo_Sedro, 0) AS Grupo_Sedro,
    IFNULL(clien_ma.Genera_Factura_PDF,0) AS Genera_Factura_PDF,
    IFNULL(clien_ma.Email_Factura_PDF,'') as Email_Factura_PDF,
    IFNULL(convt_ma.Descripcion,'') as Condicion_Vta,
    IFNULL(repar_ma.Codigo,'') as Codigo_Reparto,
    IFNULL(trans_ma.Razon_Social,'') as Transporte,
    IFNULL(agcli_ma.Descripcion,'') as Agrupacion,
    ifnull(lista_ca.Descripcion,'') as Lista
  FROM Clien_Ma
    LEFT JOIN convt_ma ON clien_ma.Id_Condicion_Vta = convt_ma.Id
    LEFT JOIN repar_ma on clien_ma.Id_Reparto = repar_ma.Id
    LEFT JOIN trans_ma on clien_ma.Id_Transporte = trans_ma.Id
    left join agcli_ma on clien_ma.Id_Agrupacion = agcli_ma.Id
    left join lista_ca on clien_ma.Id_Lista_Precio = lista_ca.Id
  WHERE Clien_Ma.Codigo_Cliente = _CODIGO
  AND clien_ma.Provincia <> 23 and clien_ma.Provincia <> 25$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Clien_Ma_Igual_Descri` (IN `_DESCRIPCION` VARCHAR(50))  SELECT
    IFNULL(clien_ma.id,0) AS id,
    IFNULL(clien_ma.Codigo_Cliente,'') AS Codigo_Cliente,
    IFNULL(clien_ma.Razon_Social,'') AS Razon_Social,
    IFNULL(clien_ma.Nombre_Fantasia, '') AS Nombre_Fantasia,
    IFNULL(clien_ma.Domicilio, '') AS Domicilio,
    IFNULL(clien_ma.Codigo_Postal, '') AS Codigo_Postal,
    IFNULL(clien_ma.Localidad,'') AS Localidad,
    IFNULL(clien_ma.Provincia, 0) AS Provincia,
    IFNULL(clien_ma.Domicilio_Entrega, '') AS Domicilio_Entrega,
    IFNULL(clien_ma.Codigo_Postal_Entrega, 0) AS Codigo_Postal_Entrega,
    IFNULL(clien_ma.Localidad_Entrega,'') AS Localidad_Entrega,
    IFNULL(clien_ma.Provincia_Entrega, 0) AS Provincia_Entrega,
    IFNULL(clien_ma.Domicilio_Cobro, '') AS Domicilio_Cobro,
    IFNULL(clien_ma.Codigo_Postal_Cobro, 0) AS Codigo_Postal_Cobro,
    IFNULL(clien_ma.Localidad_Cobro,'') AS Localidad_Cobro,
    IFNULL(clien_ma.Provincia_Cobro, 0) AS Provincia_Cobro,
    IFNULL(clien_ma.Id_Reparto, 0) AS Id_Reparto,
    IFNULL(clien_ma.Id_Zona, 0) AS Id_Zona,
    IFNULL(clien_ma.Telefonos, '') AS Telefonos,
    IFNULL(clien_ma.Fax, '') AS Fax,
    IFNULL(clien_ma.Tipo_Iva, '') AS Tipo_Iva,
    IFNULL(clien_ma.Nro_Cuit, '') AS Nro_Cuit,
    IFNULL(clien_ma.Nro_Ing_Brutos, '') Nro_Ing_Brutos,
    IFNULL(clien_ma.Id_Categoria_Ing_Br, 0) AS Id_Categoria_Ing_Br,
    IFNULL(clien_ma.Comision, 0) AS Comision,
    IFNULL(clien_ma.Id_Lista_Precio, 0) AS Id_Lista_Precio,
    IFNULL(clien_ma.Estado, '') AS Estado,
    IFNULL(clien_ma.Id_Condicion_Vta, 0) AS Id_Condicion_Vta,
    IFNULL(clien_ma.Id_Agrupacion, 0) AS Id_Agrupacion,
    IFNULL(clien_ma.Codigo_Vendedor, 0) AS Codigo_Vendedor,
    IFNULL(clien_ma.Contacto, '') AS Contacto,
    IFNULL(clien_ma.Nivel_Habil, 0) AS Nivel_Habil,
    IFNULL(clien_ma.Id_Reparto_Entrega, 0) AS Id_Reparto_Entrega,
    IFNULL(clien_ma.Id_Reparto_Cobro, 0) AS Id_Reparto_Cobro,
    IFNULL(clien_ma.Dcto, 0) AS Dcto,
    IFNULL(clien_ma.Credito, 0) AS Credito,
    IFNULL(clien_ma.Protocolo, 0) AS Protocolo,
    IFNULL(clien_ma.Nro_Sedronar, '') AS Nro_Sedronar,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Vto_Sedro,'%d/%m/%Y'),'01/01/1990') AS Fecha_Vto_Sedro,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Alta, '%d/%m/%Y'),'01/01/1990') AS Fecha_Alta,
    IFNULL(clien_ma.Remito, 0) AS Remito ,
    IFNULL(clien_ma.Dcto_Pago_Ef, 0) AS Dcto_Pago_Ef,
    IFNULL(clien_ma.eMail, '') AS eMail,
    IFNULL(clien_ma.eMailProtocolos, '') AS eMailProtocolos,
    IFNULL(clien_ma.Id_Usuario, 0) AS Id_Usuario,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Operacion,'%d/%m/%Y'),'01/01/1990') AS Fecha_Operacion,
    IFNULL(clien_ma.Id_Grupo_Cliente,0) AS Id_Grupo_Cliente,
    IFNULL(clien_ma.Id_Transporte,0) AS Id_Transporte,
    IFNULL(clien_ma.Convenio,0) AS Convenio,
    IFNULL(clien_ma.Afip,'') AS Afip,
    IFNULL(clien_ma.Grupo_Cotiza,0) AS Grupo_Cotiza,
    IFNULL(clien_ma.Estado_Deudor,0) AS Estado_Deudor,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Estado_Deudor, '%d/%m/%Y'),'') AS Fecha_Estado_Deudor,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Facturar_Hasta,'%d/%m/%Y'),'') AS Fecha_Facturar_Hasta,
    IFNULL(clien_ma.Imprime_Nc_Dcto, 0) AS Imprime_Nc_Dcto,
    IFNULL(clien_ma.Id_Trans_Clien,0) AS Id_Trans_Clien,
    IFNULL(clien_ma.Motivo,'') AS Motivo,
    IFNULL(clien_ma.Id_Pais, 0) AS Id_Pais,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Vto_Psico,'%d/%m/%Y'),'') AS Fecha_Vto_Psico,
    IFNULL(clien_ma.Prefijo_Telefono_1,'') AS Prefijo_Telefono_1,
    IFNULL(clien_ma.Telefono_1, '') AS Telefono_1,
    IFNULL(clien_ma.Prefijo_Telefono_2,'') AS Prefijo_Telefono_2,
    IFNULL(clien_ma.Telefono_2, '') AS Telefono_2,
    IFNULL(clien_ma.Prefijo_Telefono_3,'') AS Prefijo_Telefono_3,
    IFNULL(clien_ma.Telefono_3, '') AS Telefono_3,
    IFNULL(clien_ma.Prefijo_Fax_1,'') AS Prefijo_Fax_1,
    IFNULL(clien_ma.Fax_1, '') AS Fax_1,
    IFNULL(clien_ma.Prefijo_Fax_2,'') AS Prefijo_Fax_2,
    IFNULL(clien_ma.Fax_2, '') AS Fax_2,
    IFNULL(clien_ma.Prefijo_Celular,'') AS Prefijo_Celular,
    IFNULL(clien_ma.Celular, '') AS Celular,
    IFNULL(clien_ma.Director_Tecnico, '') AS Director_Tecnico,
    IFNULL(clien_ma.Pasar_Importe, 0) AS Pasar_Importe,
    IFNULL(clien_ma.Grupo_Sedro, 0) AS Grupo_Sedro,
    IFNULL(clien_ma.Genera_Factura_PDF,0) AS Genera_Factura_PDF,
    IFNULL(clien_ma.Email_Factura_PDF,'') as Email_Factura_PDF,
    IFNULL(convt_ma.Descripcion,'') as Condicion_Vta,
    IFNULL(repar_ma.Codigo,'') as Codigo_Reparto,
    IFNULL(trans_ma.Razon_Social,'') as Transporte,
    IFNULL(agcli_ma.Descripcion,'') as Agrupacion,
    ifnull(lista_ca.Descripcion,'') as Lista
  FROM Clien_Ma
    LEFT JOIN convt_ma ON clien_ma.Id_Condicion_Vta = convt_ma.Id
    LEFT JOIN repar_ma on clien_ma.Id_Reparto = repar_ma.Id
    LEFT JOIN trans_ma on clien_ma.Id_Transporte = trans_ma.Id
    left join agcli_ma on clien_ma.Id_Agrupacion = agcli_ma.Id
    left join lista_ca on clien_ma.Id_Lista_Precio = lista_ca.Id
  WHERE Clien_Ma.Razon_Social like CONCAT('%',_DESCRIPCION,'%')
        AND clien_ma.Provincia <> 23 and clien_ma.Provincia <> 25$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Clien_Ma_Igual_Id` (IN `_ID` INT(11))  SELECT
    IFNULL(clien_ma.id,0) AS id,
    IFNULL(clien_ma.Codigo_Cliente,'') AS Codigo_Cliente,
    IFNULL(clien_ma.Razon_Social,'') AS Razon_Social,
    IFNULL(clien_ma.Nombre_Fantasia, '') AS Nombre_Fantasia,
    IFNULL(clien_ma.Domicilio, '') AS Domicilio,
    IFNULL(clien_ma.Codigo_Postal, '') AS Codigo_Postal,
    IFNULL(clien_ma.Localidad,'') AS Localidad,
    IFNULL(clien_ma.Provincia, 0) AS Provincia,
    IFNULL(clien_ma.Domicilio_Entrega, '') AS Domicilio_Entrega,
    IFNULL(clien_ma.Codigo_Postal_Entrega, 0) AS Codigo_Postal_Entrega,
    IFNULL(clien_ma.Localidad_Entrega,'') AS Localidad_Entrega,
    IFNULL(clien_ma.Provincia_Entrega, 0) AS Provincia_Entrega,
    IFNULL(clien_ma.Domicilio_Cobro, '') AS Domicilio_Cobro,
    IFNULL(clien_ma.Codigo_Postal_Cobro, 0) AS Codigo_Postal_Cobro,
    IFNULL(clien_ma.Localidad_Cobro,'') AS Localidad_Cobro,
    IFNULL(clien_ma.Provincia_Cobro, 0) AS Provincia_Cobro,
    IFNULL(clien_ma.Id_Reparto, 0) AS Id_Reparto,
    IFNULL(clien_ma.Id_Zona, 0) AS Id_Zona,
    IFNULL(clien_ma.Telefonos, '') AS Telefonos,
    IFNULL(clien_ma.Fax, '') AS Fax,
    IFNULL(clien_ma.Tipo_Iva, '') AS Tipo_Iva,
    IFNULL(clien_ma.Nro_Cuit, '') AS Nro_Cuit,
    IFNULL(clien_ma.Nro_Ing_Brutos, '') Nro_Ing_Brutos,
    IFNULL(clien_ma.Id_Categoria_Ing_Br, 0) AS Id_Categoria_Ing_Br,
    IFNULL(clien_ma.Comision, 0) AS Comision,
    IFNULL(clien_ma.Id_Lista_Precio, 0) AS Id_Lista_Precio,
    IFNULL(clien_ma.Estado, '') AS Estado,
    IFNULL(clien_ma.Id_Condicion_Vta, 0) AS Id_Condicion_Vta,
    IFNULL(clien_ma.Id_Agrupacion, 0) AS Id_Agrupacion,
    IFNULL(clien_ma.Codigo_Vendedor, 0) AS Codigo_Vendedor,
    IFNULL(clien_ma.Contacto, '') AS Contacto,
    IFNULL(clien_ma.Nivel_Habil, 0) AS Nivel_Habil,
    IFNULL(clien_ma.Id_Reparto_Entrega, 0) AS Id_Reparto_Entrega,
    IFNULL(clien_ma.Id_Reparto_Cobro, 0) AS Id_Reparto_Cobro,
    IFNULL(clien_ma.Dcto, 0) AS Dcto,
    IFNULL(clien_ma.Credito, 0) AS Credito,
    IFNULL(clien_ma.Protocolo, 0) AS Protocolo,
    IFNULL(clien_ma.Nro_Sedronar, '') AS Nro_Sedronar,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Vto_Sedro,'%d/%m/%Y'),'01/01/1990') AS Fecha_Vto_Sedro,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Alta, '%d/%m/%Y'),'01/01/1990') AS Fecha_Alta,
    IFNULL(clien_ma.Remito, 0) AS Remito ,
    IFNULL(clien_ma.Dcto_Pago_Ef, 0) AS Dcto_Pago_Ef,
    IFNULL(clien_ma.eMail, '') AS eMail,
    IFNULL(clien_ma.eMailProtocolos, '') AS eMailProtocolos,
    IFNULL(clien_ma.Id_Usuario, 0) AS Id_Usuario,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Operacion,'%d/%m/%Y'),'01/01/1990') AS Fecha_Operacion,
    IFNULL(clien_ma.Id_Grupo_Cliente,0) AS Id_Grupo_Cliente,
    IFNULL(clien_ma.Id_Transporte,0) AS Id_Transporte,
    IFNULL(clien_ma.Convenio,0) AS Convenio,
    IFNULL(clien_ma.Afip,'') AS Afip,
    IFNULL(clien_ma.Grupo_Cotiza,0) AS Grupo_Cotiza,
    IFNULL(clien_ma.Estado_Deudor,0) AS Estado_Deudor,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Estado_Deudor, '%d/%m/%Y'),'') AS Fecha_Estado_Deudor,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Facturar_Hasta,'%d/%m/%Y'),'') AS Fecha_Facturar_Hasta,
    IFNULL(clien_ma.Imprime_Nc_Dcto, 0) AS Imprime_Nc_Dcto,
    IFNULL(clien_ma.Id_Trans_Clien,0) AS Id_Trans_Clien,
    IFNULL(clien_ma.Motivo,'') AS Motivo,
    IFNULL(clien_ma.Id_Pais, 0) AS Id_Pais,
    IFNULL(DATE_FORMAT(clien_ma.Fecha_Vto_Psico,'%d/%m/%Y'),'') AS Fecha_Vto_Psico,
    IFNULL(clien_ma.Prefijo_Telefono_1,'') AS Prefijo_Telefono_1,
    IFNULL(clien_ma.Telefono_1, '') AS Telefono_1,
    IFNULL(clien_ma.Prefijo_Telefono_2,'') AS Prefijo_Telefono_2,
    IFNULL(clien_ma.Telefono_2, '') AS Telefono_2,
    IFNULL(clien_ma.Prefijo_Telefono_3,'') AS Prefijo_Telefono_3,
    IFNULL(clien_ma.Telefono_3, '') AS Telefono_3,
    IFNULL(clien_ma.Prefijo_Fax_1,'') AS Prefijo_Fax_1,
    IFNULL(clien_ma.Fax_1, '') AS Fax_1,
    IFNULL(clien_ma.Prefijo_Fax_2,'') AS Prefijo_Fax_2,
    IFNULL(clien_ma.Fax_2, '') AS Fax_2,
    IFNULL(clien_ma.Prefijo_Celular,'') AS Prefijo_Celular,
    IFNULL(clien_ma.Celular, '') AS Celular,
    IFNULL(clien_ma.Director_Tecnico, '') AS Director_Tecnico,
    IFNULL(clien_ma.Pasar_Importe, 0) AS Pasar_Importe,
    IFNULL(clien_ma.Grupo_Sedro, 0) AS Grupo_Sedro,
    IFNULL(clien_ma.Genera_Factura_PDF,0) AS Genera_Factura_PDF,
    IFNULL(clien_ma.Email_Factura_PDF,'') as Email_Factura_PDF,
    IFNULL(convt_ma.Descripcion,'') as Condicion_Vta,
    IFNULL(repar_ma.Codigo,'') as Codigo_Reparto,
    IFNULL(trans_ma.Razon_Social,'') as Transporte,
    IFNULL(agcli_ma.Descripcion,'') as Agrupacion,
    ifnull(clien_ma.Id_Lista_Precio,0) as Id_Lista_Precio,
    ifnull(lista_ca.Descripcion,'') as Lista
FROM Clien_Ma
  LEFT JOIN convt_ma ON clien_ma.Id_Condicion_Vta = convt_ma.Id
  LEFT JOIN repar_ma on clien_ma.Id_Reparto = repar_ma.Id
  LEFT JOIN trans_ma on clien_ma.Id_Transporte = trans_ma.Id
  left join agcli_ma on clien_ma.Id_Agrupacion = agcli_ma.Id
  left join lista_ca on clien_ma.Id_Lista_Precio = lista_ca.Id
  left join clien_obs on clien_ma.id = clien_obs.id_cliente
WHERE clien_ma.id = _ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Lista_De_Igual_Producto` (IN `_IdProd` INT(11), IN `_IdFrac` INT(11), IN `_IdLista` INT(11))  SELECT IFNULL(Id,0) AS Id,
         IFNULL(Id_Lista_Ca,0) AS Id_Lista_Ca,
         IFNULL(Codigo_Lista,'') AS Codigo_Lista,
         IFNULL(Id_Producto,0) AS Id_Producto,
         IFNULL(Id_Fraccio,0) AS Id_Fraccio,
         IFNULL(Codigo_Producto,'') AS Codigo_Producto,
         IFNULL(Porcentaje,0) AS Porcentaje,
         IFNULL(Precio,0) AS Precio_Lista,
         IFNULL(id_Usuario,0) AS id_Usuario,
         IFNULL(Fecha_Operacion,'') AS Fecha_Operacion
    FROM lista_de
  WHERE Id_Lista_Ca = _IdLista and Id_Producto = _IdProd and lista_de.Id_Fraccio = _IdFrac$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Pedid_Ca_Cons` ()  BEGIN
         SELECT IFNULL(Nro_Pedido,0) AS Nro_Pedido,
                IFNULL(Codigo_Cliente,0) AS Codigo_Cliente,
                IFNULL(id_Cliente,0) AS id_Cliente,
                IFNULL(Fecha_Pedido,'') AS Fecha_Pedido,
                IFNULL(Pedid_Ca.Codigo_Vendedor,0) AS Codigo_Vendedor,
                IFNULL(Nro_Cotizacion,0) AS Nro_Cotizacion,
                IFNULL(Nro_Presupuesto,0) AS Nro_Presupuesto,
                IFNULL(Id_Lista,0) AS Id_Lista,
                IFNULL(Id_Condicion,0) AS Id_Condicion,
                IFNULL(Id_Moneda,0) AS id_Moneda,
                IFNULL(Cotizacion_Moneda,0) AS Cotizacion_Moneda,
                IFNULL(Pedid_Ca.Estado,'') AS Estado,
                IFNULL(Pedid_Ca.Id_Reparto,0) AS Id_Reparto,
                IFNULL(Nro_Orden_Compra,'') AS Nro_Orden_Compra,
                IFNULL(Id_Tomado_Por,0) AS Id_Tomado_Por,
                IFNULL(Pedid_Ca.Id_Usuario,0) AS id_Usuario,
                IFNULL(Pedid_Ca.Fecha_Operacion,'') AS Fecha_Operacion,
                IFNULL(Pedid_Ca.Id_Grupo_Cliente,0) AS Id_Grupo_Cliente,
                IFNULL(Total_Gravado,0) AS Total_Gravado,
                IFNULL(Total_Exento,0) AS Total_Exento,
                IFNULL(Total_Producto_Ex,0) AS Total_Producto_Ex,
                IFNULL(Porc_Iva_Ins,0) AS Porc_Iva_Ins,
                IFNULL(Iva_Ins,0) AS Iva_Ins,
                IFNULL(Porc_Iva_NoIns,0) AS Porc_Iva_NoIns,
                IFNULL(Iva_NoIns,0) AS Iva_NoIns,
                IFNULL(Porc_IngBr_Cba,0) AS Porc_IngBr_Cba,
                IFNULL(IngBr_Pba,0) AS IngBr_Pba,
                IFNULL(Total_Neto,0) AS Total_Neto,
                IFNULL(Descuento,0) AS Descuento,
                IFNULL(Pedid_Ca.Id_Transporte,'') AS Id_Transporte,
                IFNULL(Generado_Por, 0) AS Generado_Por,
                IFNULL(Porc_IngBr_Mis,0) AS Porc_IngBr_Mis,
                IFNULL(IngBr_Mis,0) AS IngBr_Mis,
                IFNULL(Clien_Ma.Nombre_Fantasia,'') AS Nombre_Fantasia
         FROM Pedid_Ca
                LEFT JOIN Clien_Ma on Pedid_Ca.id_Cliente = clien_ma.Id
         ORDER BY Pedid_Ca.Id_Reparto;
  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Pedid_Ca_Cons_CodVend` (IN `_Codigo` INT(11))  BEGIN
    SELECT IFNULL(Nro_Pedido,0) AS Nro_Pedido,
           IFNULL(Codigo_Cliente,0) AS Codigo_Cliente,
           IFNULL(id_Cliente,0) AS id_Cliente,
           IFNULL(Fecha_Pedido,'') AS Fecha_Pedido,
           IFNULL(Pedid_Ca.Codigo_Vendedor,0) AS Codigo_Vendedor,
           IFNULL(Nro_Cotizacion,0) AS Nro_Cotizacion,
           IFNULL(Nro_Presupuesto,0) AS Nro_Presupuesto,
           IFNULL(Id_Lista,0) AS Id_Lista,
           IFNULL(Id_Condicion,0) AS Id_Condicion,
           IFNULL(Id_Moneda,0) AS id_Moneda,
           IFNULL(Cotizacion_Moneda,0) AS Cotizacion_Moneda,
           IFNULL(Pedid_Ca.Estado,'') AS Estado,
           IFNULL(Pedid_Ca.Id_Reparto,0) AS Id_Reparto,
           IFNULL(Nro_Orden_Compra,'') AS Nro_Orden_Compra,
           IFNULL(Id_Tomado_Por,0) AS Id_Tomado_Por,
           IFNULL(Pedid_Ca.Id_Usuario,0) AS id_Usuario,
           IFNULL(Pedid_Ca.Fecha_Operacion,'') AS Fecha_Operacion,
           IFNULL(Pedid_Ca.Id_Grupo_Cliente,0) AS Id_Grupo_Cliente,
           IFNULL(Total_Gravado,0) AS Total_Gravado,
           IFNULL(Total_Exento,0) AS Total_Exento,
           IFNULL(Total_Producto_Ex,0) AS Total_Producto_Ex,
           IFNULL(Porc_Iva_Ins,0) AS Porc_Iva_Ins,
           IFNULL(Iva_Ins,0) AS Iva_Ins,
           IFNULL(Porc_Iva_NoIns,0) AS Porc_Iva_NoIns,
           IFNULL(Iva_NoIns,0) AS Iva_NoIns,
           IFNULL(Porc_IngBr_Cba,0) AS Porc_IngBr_Cba,
           IFNULL(IngBr_Pba,0) AS IngBr_Pba,
           IFNULL(Total_Neto,0) AS Total_Neto,
           IFNULL(Descuento,0) AS Descuento,
           IFNULL(Pedid_Ca.Id_Transporte,'') AS Id_Transporte,
           IFNULL(Generado_Por, 0) AS Generado_Por,
           IFNULL(Porc_IngBr_Mis,0) AS Porc_IngBr_Mis,
           IFNULL(IngBr_Mis,0) AS IngBr_Mis,
           IFNULL(Clien_Ma.Nombre_Fantasia,'') AS Nombre_Fantasia
    FROM Pedid_Ca
      LEFT JOIN Clien_Ma on Pedid_Ca.id_Cliente = clien_ma.Id
    WHERE clien_ma.Codigo_Vendedor = `_Codigo`
    ORDER BY Pedid_Ca.Id_Reparto;
  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Pedid_Ca_Igual_Nro_Pedido` (IN `_Nro_Pedido` INT(11))  SELECT  IFNULL(Nro_Pedido, 0) AS Nro_Pedido,
                IFNULL(id_Cliente, 0) AS id_Cliente,
                IFNULL(Fecha_Pedido, '') AS Fecha_Pedido,
                IFNULL(Codigo_Vendedor, 0) AS Codigo_Vendedor,
                IFNULL(Nro_Cotizacion, 0) AS Nro_Cotizacion,
                IFNULL(Nro_Presupuesto, 0) AS Nro_Presupuesto,
                IFNULL(Id_Lista, 0) AS Id_Lista,
                IFNULL(Id_Condicion, 0) AS Id_Condicion,
                IFNULL(Id_Moneda, 0) AS Id_Moneda,
                IFNULL(Cotizacion_Moneda, 0) AS Cotizacion_Moneda,
                IFNULL(Estado, '') AS Estado,
                IFNULL(Id_Reparto, 0) AS Id_Reparto,
                IFNULL(Nro_Orden_Compra, '') AS Nro_Orden_Compra,
                IFNULL(Id_Tomado_Por, 0) AS Id_Tomado_Por,
                IFNULL(Id_Usuario, 0) AS Id_Usuario,
                IFNULL(Fecha_Operacion, '') AS Fecha_Operacion,
                IFNULL(Id_Grupo_Cliente, 0) AS Id_Grupo_Cliente,
                IFNULL(Total_Gravado, 0) AS Total_Gravado,
                IFNULL(Total_Exento, 0) AS Total_Exento,
                IFNULL(Total_Producto_Ex, 0) AS Total_Producto_Ex,
                IFNULL(Porc_Iva_Ins, 0) AS Porc_Iva_Ins,
                IFNULL(Iva_Ins, 0) AS Iva_Ins,
                IFNULL(Porc_Iva_NoIns, 0) AS Porc_Iva_NoIns,
                IFNULL(Iva_NoIns, 0) AS Iva_NoIns,
                IFNULL(Porc_IngBr_Cba, 0) AS Porc_IngBr_Cba,
                IFNULL(IngBr_Cba, 0) AS IngBr_Cba,
                IFNULL(Porc_IngBr_Pba, 0) AS Porc_IngBr_Pba,
                IFNULL(IngBr_Pba, 0) IngBr_Pba,
                IFNULL(Total_Neto, 0) AS Total_Neto,
                IFNULL(Descuento, 0) AS Descuento,
                IFNULL(Id_Transporte, 0) AS Id_Transporte,
                IFNULL(Generado_Por, 0) AS Generado_Por,
                IFNULL(Porc_IngBr_Mis, 0) AS Porc_IngBr_Mis,
                IFNULL(IngBr_Mis, 0) IngBr_Mis,
                sum(Porc_Iva_Ins + Porc_Iva_NoIns) as Porc_Iva,
                sum(Iva_Ins + Iva_NoIns) as Iva
        FROM Pedid_Ca
        WHERE Pedid_Ca.Nro_Pedido = _Nro_Pedido$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Pedid_Ca_Insert` (`_Nro_Pedido` INT, `_id_cliente` INT, `_Fecha_Pedido` DATETIME, `_Codigo_Vendedor` INT, `_Nro_Cotizacion` INT, `_Nro_Presupuesto` INT, `_id_Lista` INT, `_id_Condicion` INT, `_id_Moneda` INT, `_Cotizacion_Moneda` DECIMAL(13,4), `_Estado` CHAR(3), `_id_Reparto` INT, `_Nro_Orden_Compra` VARCHAR(20), `_Id_Tomado_Por` INT, `_id_Usuario` INT, `_Fecha_Operacion` DATETIME, `_Id_Grupo_Cliente` INT, `_Total_Gravado` DECIMAL(12,3), `_Total_Exento` DECIMAL(12,3), `_Total_Producto_Ex` DECIMAL(12,3), `_Porc_Iva_Ins` DECIMAL(12,3), `_Iva_Ins` DECIMAL(12,3), `_Porc_Iva_NoIns` DECIMAL(12,3), `_Iva_NoIns` DECIMAL(12,3), `_Porc_IngBr_Cba` DECIMAL(12,3), `_IngBr_Cba` DECIMAL(12,3), `_Porc_IngBr_Pba` DECIMAL(12,3), `_IngBr_Pba` DECIMAL(12,3), `_Total_Neto` DECIMAL(12,3), `_Descuento` DECIMAL(12,3), `_Id_Transporte` INT, `_Generado_Por` INT, `_Porc_IngBr_Mis` DECIMAL(12,3), `_IngBr_Mis` DECIMAL(12,3))  BEGIN
INSERT INTO Pedid_Ca
(Nro_Pedido, id_cliente, Fecha_Pedido, Codigo_Vendedor,
Nro_Cotizacion, Nro_Presupuesto, id_Lista, id_Condicion,
id_Moneda, Cotizacion_Moneda, Estado, id_Reparto,
Nro_Orden_Compra, Id_Tomado_Por, id_Usuario,
Fecha_Operacion, Id_Grupo_Cliente,
Total_Gravado, Total_Exento, Total_Producto_Ex,
Porc_Iva_Ins, Iva_Ins, Porc_Iva_NoIns, Iva_NoIns,
Porc_IngBr_Cba, IngBr_Cba, Porc_IngBr_Pba, IngBr_Pba,
Total_Neto, Descuento, Id_Transporte, Generado_Por,
Porc_IngBr_Mis,IngBr_Mis)
VALUES (_Nro_Pedido, _id_cliente, _Fecha_Pedido, _Codigo_Vendedor,
_Nro_Cotizacion, _Nro_Presupuesto, _id_Lista, _id_Condicion,
_id_Moneda, _Cotizacion_Moneda, _Estado, _id_Reparto,
_Nro_Orden_Compra, _Id_Tomado_Por, _id_Usuario,
_Fecha_Operacion, _Id_Grupo_Cliente,
_Total_Gravado, _Total_Exento, _Total_Producto_Ex,
_Porc_Iva_Ins, _Iva_Ins, _Porc_Iva_NoIns, _Iva_NoIns,
_Porc_IngBr_Cba, _IngBr_Cba, _Porc_IngBr_Pba, _IngBr_Pba,
_Total_Neto, _Descuento, _Id_Transporte, _Generado_Por,
_Porc_IngBr_Mis,_IngBr_Mis);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Pedid_De_Igual_Nro_Pedido` (IN `_Nro_Pedido` INT(11))  SELECT
    IFNULL(pedid_de.Nro_Pedido, 0) AS Nro_Pedido,
    IFNULL(pedid_de.Renglon, 0) AS Renglon,
    IFNULL(pedid_de.Id_Producto, 0) AS Id_Producto,
    IFNULL(pedid_de.Id_Fraccio, 0) AS Id_Fraccio,
    IFNULL(pedid_de.Codigo_Producto, 0) AS Codigo_Producto,
    IFNULL(pedid_de.Cantidad, 0) AS Cantidad,
    IFNULL(pedid_de.Precio, 0) AS Precio,
    IFNULL(pedid_de.Precio_Lista, 0) AS Precio_Lista,
    IFNULL(pedid_de.Estado, 0) AS Estado,
    IFNULL(pedid_de.Nro_Cotizacion,0) AS Nro_Cotizacion,
    IFNULL(pedid_de.Fecha_Cotizacion, '') AS Fecha_Cotizacion,
    IFNULL(pedid_de.Nro_Despacho,'') AS Nro_Despacho,
    IFNULL(pedid_de.Nro_Lote, '') AS Nro_Lote,
    IFNULL(pedid_de.Id_Origen, 0) AS Id_Origen,
    IFNull(Produ_Frac.Baja, 0)AS Baja,
    /*----------------------------------*/
    CONCAT(CONCAT(IFNULL(Produ_Ma.Descripcion, ''),' ',IFNULL(Fraccio_Ma.Detalle, '')),' ',IFNULL(produ_frac.Descripcion, ''))  AS Descripcion_Producto,
    IFNULL(TRIM(PRODU_MA.Rubro_Vta),'') AS Rubro_Vta,
    IFNULL(uni_med.Unidad,'') AS UmeVta,
    IFNULL(lista_ca.Descripcion,'') AS Lista_Desc,
    case produ_frac.baja when 1 then 'BAJ' else 'CAR' end as Estado_PF
    
  FROM Pedid_De INNER JOIN pedid_ca ON PEDID_DE.Nro_Pedido = PEDID_CA.Nro_Pedido
    left JOIN Produ_Ma on pedid_de.Id_Producto = produ_ma.id
    left join fraccio_ma on pedid_de.Id_Fraccio = fraccio_ma.id
    left join produ_frac on produ_ma.id = produ_frac.id_Producto and fraccio_ma.id = produ_frac.id_Fraccio
    LEFT JOIN LISTA_CA ON PEDID_CA.Id_Lista = lista_ca.Id
    left join uni_med on produ_ma.id_Ume_Vta = uni_med.id
  WHERE pedid_de.Nro_Pedido = `_Nro_Pedido`
  ORDER BY Pedid_De.Nro_Pedido, Pedid_De.Renglon$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Pedid_De_Insert` (`_Nro_Pedido` INT, `_Renglon` INT, `_Id_Producto` INT, `_Id_Fraccio` INT, `_Codigo_Producto` CHAR(9), `_Cantidad` DECIMAL(12,3), `_Precio` DECIMAL(12,2), `_Precio_Lista` DECIMAL(12,2), `_Estado` CHAR(3), `_Nro_Cotizacion` INT, `_Fecha_Cotizacion` DATETIME, `_Nro_Despacho` VARCHAR(30), `_Nro_Lote` VARCHAR(20), `_Id_Origen` INT)  INSERT INTO Pedid_De
(Nro_Pedido, Renglon, id_Producto, id_Fraccio,
  Codigo_Producto, Cantidad, Precio,
  Precio_Lista, Estado, Nro_Cotizacion, Fecha_Cotizacion, Nro_Despacho, Nro_Lote, Id_Origen)
VALUES (_Nro_Pedido, _Renglon, _id_Producto, _id_Fraccio,
  _Codigo_Producto, _Cantidad, _Precio,
  _Precio_Lista, _Estado, _Nro_Cotizacion, _Fecha_Cotizacion,_Nro_Despacho,_Nro_Lote,_Id_Origen)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Produ_Ma_Cons_Codigo` (IN `_Codigo_Producto` VARCHAR(9), IN `_Codigo_Fraccio` VARCHAR(3))  SELECT produ_ma.*,
    produ_frac.Id_Producto,
    produ_frac.Id_Fraccio,
    produ_frac.Ume_Vta,
    CONCAT(substring(produ_frac.Codigo_producto,1,6), produ_frac.Codigo_Fraccio) AS Codigo_Producto,
    CONCAT(CONCAT(IFNULL(trim(Produ_Ma.Descripcion), ''),' ',
                  IFNULL(trim(produ_frac.Descripcion), '')),' ',
           IFNULL(trim(fraccio_ma.Detalle), '')) AS Descripcion_Producto,
    produ_frac.Baja,
    /*--------------------------*/
    ifnull(rubro_ma.Descripcion,'') Rubro_Vta,
    ifnull(rubro_ma.Color,0) Rubro_Color,
    IFNULL(uni_med.Unidad,'') AS UmeVta,
    case produ_frac.baja when 1 then 'BAJ' else 'CAR' end as Estado_PF,
  /* aca tendria q traer tambien los datos de precio, precio lista y lo que falte para el control */
    /*--------------------------*/
    ifnull(Tipo_Iva,'') Tipo_Iva,
    ifnull(Tipo_Ing_Brutos,0) Tipo_Ing_Brutos

  FROM produ_ma inner join produ_frac on (produ_ma.id = produ_frac.id_Producto) INNER JOIN fraccio_ma on (produ_frac.id_Fraccio = fraccio_ma.id)
    left join uni_med on produ_ma.id_Ume_Vta = uni_med.id
    inner join rubro_ma on produ_ma.id_Rubro_Vta = rubro_ma.Id
  WHERE produ_frac.Codigo_producto = _Codigo_Producto
        AND produ_frac.Codigo_Fraccio = _Codigo_Fraccio$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Produ_Ma_Cons_Descri` (IN `_Descripcion` VARCHAR(50))  SELECT
    IFNull(Produ_Frac.Id_Producto, 0) AS Id_Producto,
    IFNull(Produ_Frac.Id_Fraccio, 0) AS Id_Fraccio,
    CONCAT(substring(produ_frac.Codigo_producto,1,6), produ_frac.Codigo_Fraccio) AS Codigo_Producto,
    CONCAT(ltrim(rtrim(IfNull(Produ_Ma.Descripcion,''))),' ',ltrim(rtrim(IfNull(Produ_Frac.Descripcion,''))),ltrim(rtrim((IFNull(Fraccio_Ma.Detalle,'')))))  AS Descripcion_Producto,
    IFNull(Produ_Frac.Baja, 0)AS Baja,
    /*--------------------------*/
    IFNULL(uni_med.Unidad,'') AS UmeVta,
    case produ_frac.baja when 1 then 'BAJ' else 'CAR' end as Estado_PF,
  /* aca tendria q traer tambien los datos de precio, precio lista y lo que falte para el control */
    /*--------------------------*/
    ifnull(rubro_ma.Descripcion,'') Rubro_Vta,
    ifnull(rubro_ma.Color,0) Rubro_Color,
    ifnull(Tipo_Iva,'') Tipo_Iva,
    ifnull(Tipo_Ing_Brutos,0) Tipo_Ing_Brutos
  FROM produ_ma
    inner join produ_frac on (produ_ma.id = produ_frac.id_Producto)
    INNER JOIN fraccio_ma on (produ_frac.id_Fraccio = fraccio_ma.id)
    left join uni_med on produ_ma.id_Ume_Vta = uni_med.id
    inner join rubro_ma on produ_ma.id_Rubro_Vta = rubro_ma.Id
  WHERE produ_ma.descripcion like CONCAT('%',_Descripcion,'%')$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agcli_ma`
--

CREATE TABLE `agcli_ma` (
  `Id` int(11) NOT NULL,
  `Codigo` varchar(4) DEFAULT NULL,
  `Descripcion` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `agcli_ma`
--

INSERT INTO `agcli_ma` (`Id`, `Codigo`, `Descripcion`) VALUES
(0, '0000', '..................................................'),
(1, '0001', 'FARMACIA'),
(2, '0002', 'LABORATORIO DE ESPECIALIDADES MEDICINALES'),
(3, '0003', 'LABORATORIO DE ESPECIALIDADES COSMETICAS'),
(4, '0004', 'LABORATORIO DE ESPECIALIDADES VETERINARIAS'),
(5, '0005', 'HOSPITAL - ASOCIACION COOPERADORA - CLINICA - SANATORIO'),
(6, '0006', 'PAÑALERA - PERFUMERIA - ARTICULOS DE LIMPIEZA'),
(7, '0007', 'VETERINARIA'),
(8, '0008', 'DROGUERIA - DISTRIBUIDORA DROGAS'),
(9, '0009', 'QUIMICA / INDUSTRIA PROD QUIMICOS'),
(10, '0010', 'CASA DE CIRUGIA - ODONTOLOGIA'),
(11, '0011', 'CURTIEMBRE'),
(12, '0012', 'INDUSTRIA AGROPECUARIA'),
(13, '0013', 'OPTICA - ORTOPEDIA'),
(14, '0014', 'PROVEEDOR DE MAQUINARIAS PARA INDUSTRIA FARMACEUTICA'),
(15, '0015', 'DIETETICA - COMERCIO MINORISTA DE ALIMENTOS Y BEBIDAS'),
(16, '0016', 'OTROS'),
(17, '0017', 'MUNICIPALIDAD'),
(18, '0018', 'HERBORISTERIA'),
(19, '0019', 'INSTITUTO DE INVESTIGACIONES - FACULTAD - UNIVERSIDAD - FUNDACION'),
(20, '0020', 'CONSULTORIO:MEDICO-ODONTOLOGICO-CENTRO MEDICO-'),
(21, '0021', 'LABORATORIO DE SUPLEMENTOS DIETARIOS'),
(22, '0022', 'COOPERATIVA FARMACEUTICA'),
(23, '0023', 'SUPERMERCADO'),
(24, '0024', 'EXTERIOR'),
(25, '0025', 'LABORATORIO DE ANALISIS'),
(26, '0026', 'CONSULTORIO COSMETICO - INSTITUTO DE BELLEZA - PELUQUERIA - PODOLOGO'),
(27, '0027', 'DADA DE BAJA CENTRO MEDICO - CENTRO DE SALUD'),
(28, '0028', 'ELABORADOR DE PRODUCTOS DOMI-SANITARIOS'),
(29, '0029', 'INDUSTRIA ALIMENTICIA Y COMERCIOS ASOCIADOS'),
(30, '0030', 'DISTRIBUIDORA ACCESORIOS Y OTROS'),
(31, '9999', 'A DEFINIR'),
(32, '0100', 'CLIENTES DE MOSTRADOR'),
(33, '0200', 'DEUDORES EN GESTION'),
(34, '0032', 'DISTRIBUIDORA  DE PCTOS MEDICOS Y RVOS DE DIAGNOSTICO'),
(35, '0033', 'INDUSTRIA TEXTIL'),
(36, '0034', 'LABORATORIO ELABORADOR DE PRODUCTOS MEDICOS y/o REACTIVOS DE DIAGNOSTICO'),
(37, '0035', 'DADA DE BAJA LABORATORIO ELABORADOR DE REACTIVOS DE DIAGNOSTICO'),
(38, '0036', 'LABORATORIO ELABORADOR DE PRODUCTOS DE FARMACOPEA'),
(39, '0037', 'FARMACIA OFICINAL SIN LABORATORIO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clien_ma`
--

CREATE TABLE `clien_ma` (
  `Id` int(11) NOT NULL,
  `Codigo_Cliente` char(7) NOT NULL,
  `Razon_Social` varchar(50) DEFAULT NULL,
  `Nombre_Fantasia` varchar(50) DEFAULT NULL,
  `Domicilio` varchar(50) DEFAULT NULL,
  `Codigo_Postal` varchar(8) DEFAULT NULL,
  `Localidad` varchar(50) DEFAULT NULL,
  `Provincia` int(11) DEFAULT NULL,
  `Domicilio_Entrega` varchar(50) DEFAULT NULL,
  `Codigo_Postal_Entrega` varchar(8) DEFAULT NULL,
  `Localidad_Entrega` varchar(50) DEFAULT NULL,
  `Provincia_Entrega` int(11) DEFAULT NULL,
  `Domicilio_Cobro` varchar(50) DEFAULT NULL,
  `Codigo_Postal_Cobro` varchar(8) DEFAULT NULL,
  `Localidad_Cobro` varchar(50) DEFAULT NULL,
  `Provincia_Cobro` int(11) DEFAULT NULL,
  `Id_Reparto` int(11) DEFAULT NULL,
  `Id_Zona` int(11) DEFAULT NULL,
  `Telefonos` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `Tipo_Iva` char(2) DEFAULT NULL,
  `Nro_Cuit` varchar(15) DEFAULT NULL,
  `Nro_Ing_Brutos` varchar(15) DEFAULT NULL,
  `Id_Categoria_Ing_Br` int(11) DEFAULT NULL,
  `Comision` decimal(12,3) DEFAULT NULL,
  `Id_Lista_Precio` int(11) DEFAULT NULL,
  `Estado` char(1) DEFAULT NULL,
  `Id_Condicion_Vta` int(11) DEFAULT NULL,
  `Id_Agrupacion` int(11) DEFAULT NULL,
  `Codigo_Vendedor` int(11) DEFAULT NULL,
  `Contacto` varchar(50) DEFAULT NULL,
  `Nivel_Habil` smallint(6) DEFAULT NULL,
  `Id_Reparto_Entrega` int(11) DEFAULT NULL,
  `Id_Reparto_Cobro` int(11) DEFAULT NULL,
  `Dcto` decimal(12,3) DEFAULT NULL,
  `Credito` decimal(12,3) DEFAULT NULL,
  `Protocolo` bit(1) DEFAULT NULL,
  `Nro_Sedronar` varchar(10) DEFAULT NULL,
  `Fecha_Vto_Sedro` datetime DEFAULT NULL,
  `Fecha_Alta` datetime DEFAULT NULL,
  `Remito` bit(1) DEFAULT NULL,
  `Dcto_Pago_Ef` decimal(12,3) DEFAULT NULL,
  `eMail` varchar(250) DEFAULT NULL,
  `eMailProtocolos` varchar(250) DEFAULT NULL,
  `Id_Usuario` int(11) DEFAULT NULL,
  `Fecha_Operacion` datetime DEFAULT NULL,
  `Id_Grupo_Cliente` int(11) DEFAULT NULL,
  `Id_Transporte` int(11) DEFAULT NULL,
  `Convenio` bit(1) DEFAULT NULL,
  `Afip` char(1) DEFAULT NULL,
  `Grupo_Cotiza` smallint(6) DEFAULT NULL,
  `Estado_Deudor` smallint(6) DEFAULT NULL,
  `Fecha_Estado_Deudor` datetime DEFAULT NULL,
  `Fecha_Facturar_Hasta` datetime DEFAULT NULL,
  `Imprime_Nc_Dcto` bit(1) DEFAULT NULL,
  `Id_Trans_Clien` int(11) DEFAULT NULL,
  `Motivo` varchar(100) DEFAULT NULL,
  `Id_Pais` int(11) DEFAULT NULL,
  `Fecha_Vto_Psico` datetime DEFAULT NULL,
  `Prefijo_Telefono_1` varchar(5) DEFAULT NULL,
  `Telefono_1` varchar(10) DEFAULT NULL,
  `Prefijo_Telefono_2` varchar(5) DEFAULT NULL,
  `Telefono_2` varchar(10) DEFAULT NULL,
  `Prefijo_Telefono_3` char(5) DEFAULT NULL,
  `Telefono_3` varchar(10) DEFAULT NULL,
  `Prefijo_Fax_1` varchar(5) DEFAULT NULL,
  `Fax_1` varchar(10) DEFAULT NULL,
  `Prefijo_Fax_2` varchar(5) DEFAULT NULL,
  `Fax_2` varchar(10) DEFAULT NULL,
  `Prefijo_Celular` varchar(5) DEFAULT NULL,
  `Celular` varchar(10) DEFAULT NULL,
  `Director_Tecnico` varchar(50) DEFAULT NULL,
  `Pasar_Importe` bit(1) DEFAULT NULL,
  `Grupo_Sedro` int(11) DEFAULT NULL,
  `Genera_Factura_PDF` bit(1) DEFAULT NULL,
  `Email_Factura_PDF` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clien_ma`
--

INSERT INTO `clien_ma` (`Id`, `Codigo_Cliente`, `Razon_Social`, `Nombre_Fantasia`, `Domicilio`, `Codigo_Postal`, `Localidad`, `Provincia`, `Domicilio_Entrega`, `Codigo_Postal_Entrega`, `Localidad_Entrega`, `Provincia_Entrega`, `Domicilio_Cobro`, `Codigo_Postal_Cobro`, `Localidad_Cobro`, `Provincia_Cobro`, `Id_Reparto`, `Id_Zona`, `Telefonos`, `Fax`, `Tipo_Iva`, `Nro_Cuit`, `Nro_Ing_Brutos`, `Id_Categoria_Ing_Br`, `Comision`, `Id_Lista_Precio`, `Estado`, `Id_Condicion_Vta`, `Id_Agrupacion`, `Codigo_Vendedor`, `Contacto`, `Nivel_Habil`, `Id_Reparto_Entrega`, `Id_Reparto_Cobro`, `Dcto`, `Credito`, `Protocolo`, `Nro_Sedronar`, `Fecha_Vto_Sedro`, `Fecha_Alta`, `Remito`, `Dcto_Pago_Ef`, `eMail`, `eMailProtocolos`, `Id_Usuario`, `Fecha_Operacion`, `Id_Grupo_Cliente`, `Id_Transporte`, `Convenio`, `Afip`, `Grupo_Cotiza`, `Estado_Deudor`, `Fecha_Estado_Deudor`, `Fecha_Facturar_Hasta`, `Imprime_Nc_Dcto`, `Id_Trans_Clien`, `Motivo`, `Id_Pais`, `Fecha_Vto_Psico`, `Prefijo_Telefono_1`, `Telefono_1`, `Prefijo_Telefono_2`, `Telefono_2`, `Prefijo_Telefono_3`, `Telefono_3`, `Prefijo_Fax_1`, `Fax_1`, `Prefijo_Fax_2`, `Fax_2`, `Prefijo_Celular`, `Celular`, `Director_Tecnico`, `Pasar_Importe`, `Grupo_Sedro`, `Genera_Factura_PDF`, `Email_Factura_PDF`) VALUES
(4580, '0012033', 'ZZJAVIER OSCAR BESCOS', 'ZZFARMACIA SANTA MAGDALENA', 'SANTA MAGDALENA 668/70', '1277', 'CIUDAD DE BUENOS AIRES', 2, 'SANTA MAGDALENA 668/70-DE 8:00 A 15:00', '1277', 'CIUDAD DE BUENOS AIRES', 2, 'DEPOSITA', '1277', 'CIUDAD DE BUENOS AIRES', 2, 1, 3011, '4301-8461', '', 'RI', '20249142817    ', '106425208      ', 11, '0.000', 15, 'B', 16, 1, 12, 'JAVIER', 1, 1, 1, '0.000', '1000.000', b'1111111111111111111111111111111', '          ', '1990-01-01 00:00:00', '2001-10-26 00:00:00', b'1111111111111111111111111111111', '3.000', 'farmaciasantamagdalena@hotmail.com', 'farmaciasantamagdalena@hotmail.com', 215, '2015-11-30 15:49:27', 4580, 576, b'1111111111111111111111111111111', 'A', 1, 1, '2003-04-16 00:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 00:00:00', '     ', '43026607  ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', '                                                  ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(5957, '0008390', 'ZZNOEMI B GAMBOA', 'ZZFARMACIA SAN RAMON II', 'SANTO DOMINGO 2425', '1293', 'CIUDAD DE BUENOS AIRES', 2, 'SANTO DOMINGO 2425 DE 8:00 A 12.00 HRS', '1293', 'CIUDAD DE BUENOS AIRES', 2, 'DEPOSITA', '1293', 'CIUDAD DE BUENOS AIRES', 2, 1, 3011, '4302-6607', '4302-6607', 'RI', '27104966468    ', '928978-10      ', 11, '0.000', 15, 'B', 31, 1, 12, 'PABLO', 1, 1, 1, '0.000', '1000.000', b'1111111111111111111111111111111', '          ', '1990-01-01 00:00:00', '1993-12-21 00:00:00', b'1111111111111111111111111111111', '3.000', 'farmaciasanramonii@hotmail.com', 'farmaciasanramonii@hotmail.com', 86, '2016-08-25 15:56:01', 5957, 576, b'1111111111111111111111111111111', 'A', 1, 1, '2003-04-16 00:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 00:00:00', '     ', '          ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', '                                                  ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(7760, '0013111', 'MARIELA INES CAMILETTI', 'FARMACIA MOPELLA', 'GAONA 1953', '1706', 'HAEDO', 1, 'PTE.PERON (EX GAONA) 1953 H: 9 A 13 Y 16.3 A 20 ', '1706', 'HAEDO', 1, 'PTE.PERON (EX GAONA) 1953--8:30 A 13 / 16:30 A 19', '1706', 'HAEDO', 1, 148, 106900, '4659-3209', '', 'RI', '27231290538    ', '27231290538    ', 7, '0.000', 2, 'I', 10, 1, 10, 'MARIELA', 1, 148, 148, '0.000', '300.000', b'1111111111111111111111111111111', '          ', '2012-01-24 00:00:00', '2003-09-18 00:00:00', b'1111111111111111111111111111111', '3.000', 'farmaciamopella@yahoo.com.ar', 'farmaciamopella@yahoo.com.ar', 215, '2015-10-09 11:50:17', 7760, 620, b'1111111111111111111111111111111', 'A', 2, 1, '2003-09-18 00:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 00:00:00', '     ', '          ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', '                                                  ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(8498, '0000665', 'FARMACIA SUR S.R.L.', 'FARMACIA SUR', 'AV SAENZ 1181', '1437', 'CIUDAD DE BUENOS AIRES', 2, 'AV SAENZ 1181 H: 10.00 A 15.00', '1437', 'CIUDAD DE BUENOS AIRES', 2, 'AV SAENZ 1181', '1437', 'CIUDAD DE BUENOS AIRES', 2, 179, 3400, '4919-0509', '4919-0509', 'RI', '30564319593    ', '283821-04      ', 11, '0.000', 2, 'A', 14, 1, 12, 'NOEMI', 1, 179, 179, '0.000', '0.000', b'1111111111111111111111111111111', '          ', '1990-01-01 12:00:00', '1993-12-09 12:00:00', b'1111111111111111111111111111111', '3.000', '', '', 96, '2015-10-26 17:20:50', 8498, 576, b'1111111111111111111111111111111', 'A', 1, 1, '2003-04-16 12:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 12:00:00', '     ', '49199683  ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', 'MARIA MARTA GUERRI                                ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(9967, '0010403', 'FARMACIA HAEDO S.C.S.', 'FARMACIA HAEDO', 'CASEROS 2', '1706', 'HAEDO   ***', 1, 'CASEROS 2 H: 9 A 20', '1706', 'HAEDO   ***', 1, 'DEPOSITA', '1706', 'HAEDO   ***', 1, 148, 106900, '4650-7031/4659-0580/4460-1444', '', 'RI', '30690132210    ', '30690132210    ', 7, '0.000', 18, 'I', 16, 1, 10, 'CARLOS', 1, 148, 148, '0.000', '500.000', b'1111111111111111111111111111111', '          ', '2011-01-06 00:00:00', '1999-01-18 00:00:00', b'1111111111111111111111111111111', '3.000', '', 'mariana.currarello@centraloeste.com.ar', 0, '2016-08-12 17:09:10', 15245, 620, b'1111111111111111111111111111111', 'A', 2, 1, '2003-04-16 00:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 00:00:00', '     ', '          ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', '                                                  ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(10173, '0009875', 'MODERNA FARMACIA S.C.S.', 'FARMACIA MODERNA', '25 DE MAYO 139', '1708', 'MORON', 1, '25 DE MAYO 139 H: 9 A 20 ', '1708', 'MORON', 1, 'DEPOSITA', '1708', 'MORON', 1, 148, 107100, '4629-8598/4489-0951', '', 'RI', '30697049017    ', '30697049017    ', 7, '0.000', 18, 'I', 16, 1, 10, 'PATRICIA', 1, 148, 148, '0.000', '500.000', b'1111111111111111111111111111111', '          ', '2011-03-02 00:00:00', '1998-06-03 00:00:00', b'1111111111111111111111111111111', '3.000', '', 'laura.aveni@centraloeste.com.ar', 0, '2016-08-12 17:09:10', 15245, 620, b'1111111111111111111111111111111', 'A', 2, 1, '2003-04-16 00:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 00:00:00', '     ', '          ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', '                                                  ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(10664, '0012919', 'CENTRAL OESTE RAMOS EN FORMACION', 'FARMACIA CENTRAL OESTE RAMOS', 'AVDA DE MAYO 889', '1704', 'RAMOS MEJIA', 1, 'AVDA DE MAYO 889 H: 9 A 20 ', '1704', 'RAMOS MEJIA', 1, 'DEPOSITA', '1704', 'RAMOS MEJIA', 1, 148, 106900, '4654-5793', '', 'RI', '30708277920    ', '30708277920    ', 7, '0.000', 18, 'I', 16, 1, 10, 'MARIANO', 1, 148, 148, '0.000', '0.000', b'1111111111111111111111111111111', '          ', '2011-01-06 00:00:00', '2003-05-29 00:00:00', b'1111111111111111111111111111111', '3.000', '', '', 0, '2016-07-12 14:56:55', 15245, 620, b'1111111111111111111111111111111', 'A', 2, 1, '2003-05-29 00:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 00:00:00', '     ', '          ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', '                                                  ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(10797, '0013671', 'CENTRAL OESTE ITUZAINGO S.C.S', 'CENTRAL OESTE ITUZAINGO', 'LAS HERAS 381', '1714', 'ITUZAINGO', 1, 'LAS HERAS 381', '1714', 'ITUZAINGO', 1, 'DEPOSITA', '1714', 'ITUZAINGO', 1, 183, 107700, '4624-4774/5522', '', 'RI', '30708787058    ', '30708787058    ', 7, '0.000', 18, 'I', 16, 1, 13, 'ANALIA', 1, 183, 183, '0.000', '1000.000', b'1111111111111111111111111111111', '          ', '2011-03-02 00:00:00', '2004-10-12 00:00:00', b'1111111111111111111111111111111', '3.000', '', 'dario.aguilera@centraloeste.com.ar', 0, '2016-08-12 17:09:10', 15245, 620, b'1111111111111111111111111111111', 'A', 1, 1, '2004-10-12 00:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 00:00:00', '     ', '          ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', '                                                  ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(13276, '0002097', 'UNION OBRERA METALURGICA DE LA REPUB ARG', 'FARMACIA SINDICAL', 'ADOLFO ALSINA 477', '1702', 'CIUDADELA', 1, 'SAAVEDRA 3845', '1702', 'CIUDADELA', 1, 'SAAVEDRA 3845--9 A 12 / 17 A 19', '1702', 'CIUDADELA', 1, 148, 106500, '4653-8704/1854', '4653-8704/1854', 'EX', '30503220047    ', '0              ', 8, '0.000', 2, 'A', 14, 1, 4, 'ARIEL CRUCES', 1, 148, 148, '0.000', '500.000', b'1111111111111111111111111111111', '          ', '1990-01-01 00:00:00', '1993-12-16 00:00:00', b'1111111111111111111111111111111', '3.000', '', '', 96, '2016-11-11 10:15:05', 13276, 620, b'1111111111111111111111111111111', 'A', 2, 1, '2003-04-16 00:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 00:00:00', '     ', '46471564  ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', 'CRISTIAN ANGEL SPRITZ                             ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(13694, '0014679', 'FARMACIA CALDARELLI S.C.S', 'FARMACIA CALDARELLI', 'AV SAN MARTIN 1631', '1704', 'RAMOS MEJIA', 1, 'AV SAN MARTIN 1631 H: 9 A 12 Y 16.3 A 20', '1704', 'RAMOS MEJIA', 1, 'AV SAN MARTIN 1631', '1704', 'RAMOS MEJIA', 1, 148, 106700, '4654-3802', '', 'RI', '30709957933    ', '30709957933    ', 7, '0.000', 2, 'A', 10, 1, 10, 'JUAN', 1, 148, 148, '0.000', '0.000', b'1111111111111111111111111111111', '          ', '2012-05-15 00:00:00', '2007-05-21 00:00:00', b'1111111111111111111111111111111', '3.000', '', 'nikjua@hotmail.com', 215, '2015-10-09 11:56:40', 13694, 620, b'1111111111111111111111111111111', 'A', 2, 1, '2007-05-21 00:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 00:00:00', '     ', '          ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', '                                                  ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(14764, '0016071', 'FARMACIA TOMKINSOM 2995 SCS', 'FARMACIA TOMKINSOM 2995 SCS', 'INTENDENTE TOMKISOM 2995', '1643', 'BECCAR', 1, 'INTENDENTE TOMKISOM 2995', '1643', 'BECCAR', 1, 'GRAL.URQUIZA 1757', '1642', 'FLORIDA', 1, 185, 100700, '', '', 'RI', '30710866038    ', '30710866038    ', 7, '0.000', 2, 'I', 20, 1, 13, 'SERGIO', 1, 185, 185, '0.000', '500.000', b'1111111111111111111111111111111', '          ', '2012-04-12 00:00:00', '2012-04-12 00:00:00', b'1111111111111111111111111111111', '3.000', '', '', 86, '2016-09-29 10:15:54', 3236, 620, b'1111111111111111111111111111111', 'A', 1, 1, '2012-04-12 00:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', 621, '', 200, '1900-01-01 00:00:00', '011  ', '47230319  ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', '                                                  ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(14765, '0016072', 'MONTIEL GUMERCINDO', 'FARMACIA MONTY', 'GOBERNADOR BARREYRO 826', '3360', 'OBERA', 14, 'GOBERNADOR BARREYRO 826', '3360', 'OBERA', 14, 'GOBERNADOR BARREYRO 826', '3360', 'OBERA', 14, 202, 410200, '', '', 'RI', '23075566999    ', '23075566999-24 ', 7, '0.000', 2, 'I', 21, 1, 34, 'X', 1, 202, 202, '0.000', '0.000', b'1111111111111111111111111111111', '          ', '2012-04-16 00:00:00', '2012-04-16 00:00:00', b'1111111111111111111111111111111', '3.000', 'x', 'x', 86, '2013-09-16 11:40:13', 14765, 668, b'1111111111111111111111111111111', 'A', 3, 1, '2012-04-16 00:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 00:00:00', '03755', '405029    ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', 'carlos horacio zalazar                            ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(14766, '0016073', 'FIOTEK MARIA JULIETA SOFIA', 'FARMACIA FIOTEK', '46 978 E/14 Y 15', '1900', 'LA PLATA', 1, 'JUAN DE MANUEL DE ROSAS 325', '1864', 'ALEJANDRO KORN/SAN VICENTE', 1, 'JUAN DE MANUEL DE ROSAS 325', '1864', 'ALEJANDRO KORN/SAN VICENTE', 1, 172, 120300, '', '', 'RI', '27282121633    ', '27282121633    ', 7, '0.000', 2, 'I', 10, 1, 10, 'JULIETA', 1, 172, 172, '0.000', '0.000', b'1111111111111111111111111111111', '          ', '2012-04-16 00:00:00', '2012-04-16 00:00:00', b'1111111111111111111111111111111', '3.000', 'x', 'x', 215, '2012-11-07 15:07:32', 14766, 620, b'1111111111111111111111111111111', 'A', 2, 1, '2012-04-16 00:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 00:00:00', '02225', '422543    ', '0221 ', '5719553   ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', 'maria julieta sofia fiotek                        ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(14767, '0016074', 'MODELO HURLINGHAM S.C.S.', 'FARMACIA MODELO HURLINGHAM S.C.S.', 'VILLEGAS 2317', '1686', 'WILLIAMS MORRIS', 1, 'VILLEGAS 2317/19', '1686', 'WILLIAMS MORRIS', 1, 'VILLEGAS 2317/19', '1686', 'WILLIAMS MORRIS', 1, 147, 105700, '', '', 'RI', '30710534175    ', '30710534175    ', 7, '0.000', 2, 'I', 10, 1, 10, 'NORMA', 1, 147, 147, '0.000', '0.000', b'1111111111111111111111111111111', '          ', '2012-04-16 12:00:00', '2012-04-16 12:00:00', b'1111111111111111111111111111111', '3.000', 'X', 'X', 215, '2012-05-14 09:55:47', 14767, 620, b'1111111111111111111111111111111', 'A', 2, 1, '2012-04-16 12:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 12:00:00', '011  ', '46621459  ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', 'NORMA ISABEL FERRANDO                             ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(14768, '0016075', 'BLIPACK S.A.', 'BLIPACK S.A.', 'DIAZ VELEZ 733', '1704', 'RAMOS MEJIA', 1, 'TRES ARROYOS 329 UF 43', '1706', 'PQUE INDUSTRIAL LA CANTABRICA-HAEDO', 1, 'TRES ARROYOS 329 UF 43', '1706', 'PQUE INDUSTRIAL LA CANTABRICA-HAEDO', 1, 43, 106900, '', '', 'RI', '30559823666    ', '9028699236     ', 5, '0.000', 2, 'I', 3, 2, 43, 'RUBEN BARRIONUEVO', 0, 43, 43, '0.000', '0.000', b'1111111111111111111111111111111', '          ', '2012-04-20 12:00:00', '2012-04-20 12:00:00', b'1111111111111111111111111111111', '3.000', 'NCHAMORRO@BLIPACK.COM.AR', 'NCHAMORRO@BLIPACK.COM.AR', 96, '2015-11-05 16:36:46', 14768, 620, b'1111111111111111111111111111111', 'A', 2, 1, '2012-04-20 12:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 00:00:00', '     ', '41367225  ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', 'MARTIN ALEJANDRO MICELI                           ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(14769, '0016076', 'DIANCECH S.C.S.', 'FARMACIA LAPRIDA', 'LAPRIDA 19', '1870', 'AVELLANEDA', 1, 'AVENIDA MITRE 1002 H: 8 A 21', '1870', 'AVELLANEDA', 1, 'AVENIDA MITRE 1002', '1870', 'AVELLANEDA', 1, 180, 112900, '(011)42229907', '', 'RI', '30711672210    ', '30711672210    ', 7, '0.000', 2, 'I', 10, 1, 12, 'LUCIA', 1, 180, 180, '0.000', '0.000', b'1111111111111111111111111111111', '          ', '2012-04-20 00:00:00', '2012-04-20 00:00:00', b'1111111111111111111111111111111', '3.000', 'florenciamartinich@fibertel.com.ar', 'marielacuraba@fibertel.com.ar', 0, '2016-10-21 11:22:12', 14769, 620, b'1111111111111111111111111111111', 'A', 1, 1, '2012-04-20 00:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 00:00:00', '011  ', '42229907  ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', 'MONICA MABEL GARABAL                              ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(14770, '0016077', 'PORRECA BEATRIZ ISABEL', 'PAÑALERA CASTY', 'HIPOLITO IRIGOYEN 368', '1640', 'MARTINEZ', 1, 'HIPOLITO IRIGOYEN 368 H: 9.3 A 13.3 Y 15.3 A 19.3', '1640', 'MARTINEZ', 1, 'HIPOLITO IRIGOYEN 368', '1640', 'MARTINEZ', 1, 186, 100500, '', '', 'MT', '27245513238    ', '27245513238    ', 7, '0.000', 2, 'I', 10, 6, 13, 'FERNANDO', 0, 186, 186, '0.000', '0.000', b'1111111111111111111111111111111', '          ', '2012-04-20 00:00:00', '2012-04-20 00:00:00', b'1111111111111111111111111111111', '3.000', 'COMPRAS@CASTY.COM.AR', 'COMPRAS@CASTY.COM.AR', 0, '2016-09-12 12:54:17', 14770, 620, b'1111111111111111111111111111111', 'A', 1, 1, '2012-04-20 00:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 00:00:00', '011  ', '56485755  ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', '                                                  ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(14771, '0016078', 'LABORATORIO BIOTEC S.A.', 'LABORATORIOS BIOTEC S.A.', 'CAVIA 3080 6TO A', '1425', 'CIUDAD DE BUENOS AIRES', 2, 'CALLE CAVIA 3080 6TO OF A', '1425', 'CIUDAD DE BUENOS AIRES', 2, 'CAVIA 3080 6TO OF A', '1425', 'CIUDAD DE BUENOS AIRES', 2, 176, 2300, '', '', 'RI', '30712023135    ', '901-582626-1   ', 1, '0.000', 2, 'I', 10, 12, 11, 'CARLOS CHAMULA', 0, 176, 176, '0.000', '0.000', b'1111111111111111111111111111111', '          ', '2012-04-20 00:00:00', '2012-04-20 00:00:00', b'1111111111111111111111111111111', '3.000', 'CARLOSCHAMULA@ARNET.COM.AR', 'CARLOSCHAMULA@ARNET.COM.AR', 86, '2013-10-08 14:00:40', 14771, 304, b'1111111111111111111111111111111', 'A', 1, 1, '2012-04-20 00:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 00:00:00', '     ', '48573991  ', '     ', '48571535  ', '', '          ', '     ', '          ', '     ', '          ', '     ', '1544454014', 'X                                                 ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(14772, '0016079', 'ZZMAGA LEONARDO JAVIER', 'ZZFARMACIA CORTIZAS', 'ZAPIOLA 510', '1876', 'BERNAL', 1, 'ZAPIOLA 510', '1876', 'BERNAL', 1, 'ZAPIOLA 510', '1876', 'BERNAL', 1, 139, 113500, '', '', 'RI', '20237879849    ', '20237879849    ', 7, '0.000', 2, 'B', 10, 1, 3, 'X', 1, 139, 139, '0.000', '0.000', b'1111111111111111111111111111111', '          ', '2012-04-24 00:00:00', '2012-04-24 00:00:00', b'1111111111111111111111111111111', '0.000', 'leonardojaviermaga@yahoo.com.ar', 'leonardojaviermaga@yahoo.com.ar', 86, '2014-09-26 17:08:47', 14772, 620, b'1111111111111111111111111111111', 'A', 2, 1, '2012-04-24 00:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '2012-06-24 00:00:00', '011  ', '42510775  ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '          ', 'LEONARDO JAVIER MAGA                              ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', ''),
(15016, '0016322', 'GONZALEZ ERIC', 'FARMACIA ERIC GONZALEZ', 'CALLE 809 Nº 1895', '1879', 'QUILMES OESTE', 1, 'CALLE 809 Nº 1895', '1879', 'QUILMES OESTE', 1, 'CALLE 809 Nº 1895', '1879', 'QUILMES OESTE', 1, 171, 118900, '', '', 'RI', '20284638531    ', '20284638531    ', 7, '0.000', 2, 'I', 10, 1, 10, 'ERIC', 1, 171, 171, '0.000', '0.000', b'1111111111111111111111111111111', '          ', '1990-01-01 00:00:00', '2013-03-21 00:00:00', b'1111111111111111111111111111111', '3.000', 'ERCGONZALEZ180@GMAIL.COM', 'ERCGONZALEZ180@GMAIL.COM', 215, '2014-06-27 11:57:59', 15016, 620, b'1111111111111111111111111111111', 'A', 2, 1, '2013-03-21 00:00:00', '1900-01-01 00:00:00', b'1111111111111111111111111111111', -1, '', 200, '1900-01-01 00:00:00', '     ', '42130987  ', '     ', '          ', '', '          ', '     ', '          ', '     ', '          ', '     ', '1534861892', 'ERIC GONZALEZ                                     ', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `convt_ma`
--

CREATE TABLE `convt_ma` (
  `Id` int(11) NOT NULL,
  `Codigo` varchar(4) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Dcto_Efvo` decimal(12,3) DEFAULT NULL,
  `Dcto_Adelantado` decimal(12,3) DEFAULT NULL,
  `Interes` decimal(12,3) DEFAULT NULL,
  `Dia_1` smallint(6) DEFAULT NULL,
  `Porc_1` decimal(12,3) DEFAULT NULL,
  `Dia_2` smallint(6) DEFAULT NULL,
  `Porc_2` decimal(12,3) DEFAULT NULL,
  `Dia_3` smallint(6) DEFAULT NULL,
  `Porc_3` decimal(12,3) DEFAULT NULL,
  `Dia_4` smallint(6) DEFAULT NULL,
  `Porc_4` decimal(12,3) DEFAULT NULL,
  `Habilitado` smallint(6) DEFAULT NULL,
  `Nro_Leyenda` smallint(6) DEFAULT NULL,
  `Vendedor` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `convt_ma`
--

INSERT INTO `convt_ma` (`Id`, `Codigo`, `Descripcion`, `Dcto_Efvo`, `Dcto_Adelantado`, `Interes`, `Dia_1`, `Porc_1`, `Dia_2`, `Porc_2`, `Dia_3`, `Porc_3`, `Dia_4`, `Porc_4`, `Habilitado`, `Nro_Leyenda`, `Vendedor`) VALUES
(0, 'Codi', 'Descripcion', '0.000', '0.000', '0.000', 0, '0.000', 0, '0.000', 0, '0.000', 0, '0.000', 0, 0, b'1111111111111111111111111111111'),
(1, '47', 'CTA CTE 30 DIAS CHEQ.DIF. 60 DIAS F.F', '0.000', '0.000', '0.000', 30, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(2, '50', 'CONTRA ENTREGA EFECTIVO (L)', '0.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(3, '51', 'CONTRA ENTREGA CHEQUE AL DIA (L)', '0.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(4, '52', 'VENTA AL CONTADO (L)', '0.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(5, '54', '15 DIAS CHEQ.DIF. 60/90 F.F.(L)', '0.000', '0.000', '0.000', 15, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(6, '57', 'VALOR ANTICIPADO/ACREDITAR (L)', '0.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(7, '61', 'C/E 50% CDO 50% CHEQUE DIF 7 DIAS F.F(L)', '0.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(8, '64', 'C/E 50% CDO-50% CHEQ DIF 15 DIAS F.F(L)', '0.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(9, '66', 'CONTRA ENTREGA CHEQ.DIF 7/15 DIAS F.F(L)', '0.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(10, '01', 'CONTRAENTREGA EFECTIVO', '2.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(11, '02', 'CONTRA ENTREGA CHEQUE AL DIA', '2.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(12, '03', 'CONTRA ENTREGA CHEQUE 7 DIAS F.F.', '2.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(13, '04', 'CONTRA ENTREGA VALOR 14 DIAS F.F.', '2.000', '0.000', '0.000', 14, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(14, '05', 'CONTRA ENTREGA VALOR 28 DIAS F.F.', '2.000', '0.000', '0.000', 28, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(15, '10', 'REPARTO VALOR 14 DIAS F.F.', '2.000', '0.000', '0.000', 14, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(16, '11', 'REPARTO VALOR 28 DIAS F.F.', '2.000', '0.000', '0.000', 28, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(17, '20', 'VENDEDOR 14 DIAS F.F.', '2.000', '0.000', '0.000', 14, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(18, '21', 'VENDEDOR 28 DIAS F.F.', '2.000', '0.000', '0.000', 28, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(19, '30', 'CTA CTE 14 DIAS F.F.', '2.000', '0.000', '0.000', 14, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(20, '31', 'CTA CTE 28 DIAS F.F.', '2.000', '0.000', '0.000', 28, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(21, '40', 'ANTICIPADO', '2.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(22, '43', 'CTA CTE 28 DIAS F.F. (L)', '2.000', '0.000', '0.000', 28, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(23, '44', 'CTA CTE 14 DIAS F.F.', '2.000', '0.000', '0.000', 14, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(24, '12', 'REPARTO 7 DIAS CHEQUE DIF.28 DIAS F.F', '2.000', '0.000', '0.000', 28, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(25, '41', 'ANTICIPADO VALOR 14 DIAS', '2.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(26, '42', 'ANTICIPADO VALOR 28 DIAS', '2.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(27, '45', 'VENTA AL CONTADO', '2.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(28, '13', 'REPARTO 14 DIAS CHEQUE DIF. 60 DIAS F.F.', '2.000', '0.000', '0.000', 60, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(29, '32', 'CTA CTE 7 DIAS CHEQ.DIF.45/60 DIAS FF', '2.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(30, '33', 'CTA CTE 7 DIAS CHEQUE DIF.28 DIAS F.F', '2.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(31, '14', 'REPARTO CTA. CTE. 7 DIAS F.F', '2.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(32, '34', 'CTA. CTE. 7 DIAS F.F', '2.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(33, '46', 'CTA CTE 7 DIAS F.F.', '2.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(34, '06', 'VENTA AL CONTADO', '2.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(35, '35', 'CTA CTE 21 DIAS F.F.', '2.000', '0.000', '0.000', 21, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(36, '15', 'REPARTO VALOR 7 DIAS F.F.', '2.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(37, '07', 'CONTRA ENTREGA CHEQ.DIF.21 DIAS F.F', '2.000', '0.000', '0.000', 21, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(38, '22', 'VENDEDOR 7 DIAS F.F.', '2.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(39, '23', 'VENDEDOR 7 DIAS CHEQ.DIF.28 DIAS F.F.', '2.000', '0.000', '0.000', 28, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(40, '08', 'CONTRAENTREGA CHEQ DIFERIDO 60 DIAS F.F.', '2.000', '0.000', '0.000', 60, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(41, '16', 'REPARTO VALOR 21 DIAS F.F.', '2.000', '0.000', '0.000', 21, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(42, '17', 'REPARTO 7 DIAS CHEQUE DIF.45 DIAS F.F', '2.000', '0.000', '0.000', 45, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(43, '24', 'VENDEDOR 7 DIAS CHEQ. DIF. 45 DIAS F.F.', '2.000', '0.000', '0.000', 45, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(44, '36', 'CTA CTE 28 DIAS CHEQ.DIF. 45 DIAS F.F.', '2.000', '0.000', '0.000', 45, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(45, '18', 'REPARTO 28 DIAS CHEQUE DIF.45 DIAS F.F.', '2.000', '0.000', '0.000', 45, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(46, '09', 'CONTRA ENTREGA CHEQUE DIF.45 DIAS F.F.', '2.000', '0.000', '0.000', 45, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(47, '48', 'ENTREGA 7 DIAS CHEQUE DIF. 28 DIAS F.F.', '2.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(48, '25', 'VENDEDOR 7 DIAS CHEQUE DIF. 14 DIAS F.F.', '2.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(49, '53', 'CONTRA ENTREGA CHEQUE DIF.7 DIAS F.F.(L)', '0.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(50, '55', 'CTA CTE 7 DIAS F.F. (L)', '0.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(51, '56', 'CTA CTE 14 DIAS F.F.(L)', '0.000', '0.000', '0.000', 14, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(52, '58', 'CONTRA ENTREGA CHEQUE DIF.15 DIAS F.F(L)', '0.000', '0.000', '0.000', 15, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(53, '59', 'CTA CTE 30 DIAS F.F.(L)', '0.000', '0.000', '0.000', 30, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(54, '60', 'ENTREGA 7 DIAS CHEQUE DIF. 15 F.F.(L)', '0.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(55, '62', 'CONTRA ENTREGA CHEQUE DIF.30 DIAS FF(L)', '0.000', '0.000', '0.000', 30, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(56, '63', 'CONTRA ENTREGA CHEQ.DIF 15/30 DIAS FF(L)', '0.000', '0.000', '0.000', 15, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(57, '67', 'CTRA ENTREGA CHEQUE DIF. 21 DIAS F.F.(L)', '0.000', '0.000', '0.000', 21, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(58, '68', 'CTA CTE 21 DIAS F.F.(L)', '0.000', '0.000', '0.000', 21, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(59, '69', 'ENTREGA 7 DIAS CHEQ.DIF.30 F.F.(L)', '0.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(60, '70', 'ENTREGA 15 DIAS CHEQUE DIF. 30 DIAS (L)', '0.000', '0.000', '0.000', 15, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(61, '49', 'CTA CTE 30 DIAS CHEQ. DIF.30/60 DIAS F.F', '0.000', '0.000', '0.000', 30, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(62, '71', 'CONTRA ENTREGA CHEQ DIF 30/45 DIAS F.(L)', '0.000', '0.000', '0.000', 30, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(63, '65', '7 DIAS CHEQUE DIF. 15/30 DIAS F.F. (L)', '0.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(64, '72', '15 DIAS CHEQUE DIF.30 Y 45 DIAS F.F.(L)', '0.000', '0.000', '0.000', 15, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(65, '73', 'ENTREGA 15 DIAS CHEQ.DIF.45 DIAS F.F(L)', '0.000', '0.000', '0.000', 15, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(66, '19', 'REPARTO 14 DIAS-CHEQUE DIF.45 DIAS F.F.', '2.000', '0.000', '0.000', 45, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(67, '74', 'ENTREGA 7 DIAS CHEQ.DIF.21F.F.(L)', '0.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(68, '75', 'CTRA ENTREGA CHEQ.DIF.30/60 DIAS F.F.(L)', '0.000', '0.000', '0.000', 30, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(69, '76', 'ENTREGA 15 DIAS CHEQ.DIF.60 DIAS F.F.(L)', '0.000', '0.000', '0.000', 15, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(70, '77', 'ENTREGA 7 DIAS CHEQ.DIF.45/60 DIAS FF(L)', '0.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(71, '78', 'CONTRA ENTREGA CHEQUE DIF.45 DIAS F.F(L)', '0.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(72, '26', 'VENDEDOR 14 DIAS F.F.', '2.000', '0.000', '0.000', 14, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(73, '79', 'CTRA ENTREGA CHEQ DIF 30/60/90 DIAS F.F. (L)', '0.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(74, '80', 'CONTRA ENTREGA CHEQ DIF.60 DIAS F.F. (L)', '0.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(75, '81', 'CTACTE 30DIAS CHEQ DIF 90/120 DIAS FF(L)', '0.000', '0.000', '0.000', 90, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(76, '82', 'CTACTE 30DIAS CHEQ DIF. 120 DIAS F.F.(L)', '0.000', '0.000', '0.000', 120, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(77, '37', 'CTA CTE 7 DIAS CHEQ. DIF. 60 DIAS F.F.', '2.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(78, '83', 'REP 7 DS CHEQ DIF 30/45/75 DS F.F.-(L)', '0.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(79, '84', '*****CONTRAENTREGA VALOR*****', '2.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(80, '38', 'CTA CTE 60 DIAS F.F.', '2.000', '0.000', '0.000', 60, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(90, '85', 'CTACTE 60 dias F.F.(L)', '0.000', '0.000', '0.000', 60, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(96, '86', 'ANTICIPADO VALOR 28 DIAS FF(L)', '0.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(97, '87', 'ENTREGA 15 DIAS CHEQUE DIF 30/45/60 DIAS F.F.(L)', '0.000', '0.000', '0.000', 15, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 0, b'1111111111111111111111111111111'),
(98, '88', '7 DIAS ENTREGA CHEQUE DIF.30/60 DIAS', '0.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(99, '27', 'DEPOSITO BANCARIO', '0.000', '0.000', '0.000', 7, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 0, b'1111111111111111111111111111111'),
(100, '89', 'CONTRA ENTREGA CHEQ DIF.90 DIAS F.F. (L)', '0.000', '0.000', '0.000', 90, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(101, '90', '30 dias f.f. ( L )', '0.000', '0.000', '0.000', 30, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 3, b'1111111111111111111111111111111'),
(102, '91', '45 dias-cheque dif 45/60/75 dias ff.(L)', '0.000', '0.000', '0.000', 45, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(103, '92', 'CTRA ENTREGA CHEQUE DIF 45/60/75 DIAS FF(L)', '0.000', '0.000', '0.000', 45, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(104, '93', 'ENTREGA 15 DIAS CHEQ.DIF.75 DIAS F.F.(L)', '0.000', '0.000', '0.000', 15, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111'),
(105, '94', 'CTA CTE 30 DIAS FF CHEQUE DIF 30/60/75 (L)', '0.000', '0.000', '0.000', 30, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 2, b'1111111111111111111111111111111'),
(106, '95', 'C/E 50% CDO 50% CHEQUE DIF 30 DIAS F.F(L)', '0.000', '0.000', '0.000', 0, '100.000', 0, '0.000', 0, '0.000', 0, '0.000', -1, 6, b'1111111111111111111111111111111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fraccio_ma`
--

CREATE TABLE `fraccio_ma` (
  `id` int(11) NOT NULL,
  `Codigo` char(3) DEFAULT NULL,
  `Detalle` varchar(50) DEFAULT NULL,
  `Minimo` decimal(12,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fraccio_ma`
--

INSERT INTO `fraccio_ma` (`id`, `Codigo`, `Detalle`, `Minimo`) VALUES
(1, '000', '                    ', '0.001'),
(4, '003', 'X 0.010             ', '0.010'),
(5, '004', 'X 0.025             ', '0.025'),
(6, '005', 'X 0.050             ', '0.050'),
(7, '006', 'X 0.100             ', '0.100'),
(9, '008', 'X 0.250             ', '0.250'),
(10, '009', 'X 0.500             ', '0.500'),
(11, '010', 'X 1                 ', '1.000'),
(13, '012', 'X 5                 ', '5.000'),
(15, '014', 'X 10                ', '10.000'),
(17, '016', 'X 20                ', '20.000'),
(18, '017', 'X 25                ', '25.000'),
(20, '019', 'X 40                ', '40.000'),
(27, '027', 'X 0.030             ', '0.030'),
(60, '063', 'X 210               ', '210.000'),
(83, '210', 'X 1                 ', '1.000'),
(84, '303', 'X 0.010             ', '0.010'),
(86, '306', 'X 0.100             ', '0.100'),
(88, '308', 'X 0.250             ', '0.250'),
(89, '309', 'X 0.500             ', '0.500'),
(90, '310', 'X 1                 ', '1.000'),
(93, '330', 'X 0.080             ', '0.080'),
(101, '407', 'X 0.125             ', '0.125'),
(102, '408', 'X 0.250             ', '0.250'),
(103, '409', 'X 0.500             ', '0.500'),
(104, '410', 'X 1                 ', '1.000'),
(107, '425', 'X 0.200             ', '0.200'),
(115, '505', 'X 0.050             ', '0.050'),
(121, '525', 'X 0.200             ', '0.200'),
(124, '530', 'X 0.080             ', '0.080'),
(129, '606', 'X 0.100             ', '0.100'),
(130, '608', 'X 0.250             ', '0.250'),
(131, '723', 'X 0.120             ', '0.120'),
(134, '806', 'X 0.025             ', '0.025');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_ca`
--

CREATE TABLE `lista_ca` (
  `Id` int(11) NOT NULL,
  `Codigo_Lista` varchar(10) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Id_Moneda` int(11) DEFAULT NULL,
  `Codigo_Moneda` char(3) DEFAULT NULL,
  `Fecha_Desde` datetime DEFAULT NULL,
  `Fecha_Hasta` datetime DEFAULT NULL,
  `Id_Usuario` int(11) DEFAULT NULL,
  `Fecha_Operacion` datetime DEFAULT NULL,
  `Porcentaje_Comisiones` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lista_ca`
--

INSERT INTO `lista_ca` (`Id`, `Codigo_Lista`, `Descripcion`, `Id_Moneda`, `Codigo_Moneda`, `Fecha_Desde`, `Fecha_Hasta`, `Id_Usuario`, `Fecha_Operacion`, `Porcentaje_Comisiones`) VALUES
(1, 'VENTAS', 'DROGAS E INSUMOS FARMACEUTICOS', 1, '$', '1993-10-22 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '2.00'),
(2, 'CATALOGO', 'DROGAS E INSUMOS FARMACEUTICOS', 1, '$', '1993-11-29 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '5.00'),
(3, 'TER', 'PRODUCTOS TERMINADOS', 1, '$', '1994-09-21 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '3.00'),
(4, 'FAR', 'ENVASES, EQUIP Y ELEM USO FARM', 1, '$', '1994-09-21 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '3.00'),
(5, 'SICOTROP', 'SICOTROPICOS Y ESTUPEFACIENTES', 1, '$', '1993-11-29 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '1.00'),
(6, 'HIERMED', 'HIERBAS MEDICINALES', 1, '$', '1993-10-22 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '4.00'),
(7, 'MICROGRA', 'MICROGRANULOS DROGAS', 1, '$', '1993-10-22 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '2.00'),
(8, 'MICROEST', 'MICROGRANULOS SICORT.Y EST.', 1, '$', '1993-10-22 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '1.00'),
(9, 'COSMET', 'Cosmetica', 1, '$', '1995-08-01 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '1.00'),
(10, 'ACCES', 'ACCESORIOS Y EQUIPOS', 1, '$', '1994-09-14 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '3.00'),
(11, 'MEDIC', 'ESP MEDIC COSMET Y COMP ALIM', 1, '$', '1994-06-23 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '2.00'),
(12, 'SUPER', 'SUPERMERCADOS', 1, '$', '1994-04-26 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '2.00'),
(13, 'OFERTA', 'PRODUCTOS DE OFERTA', 1, '$', '1994-08-12 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '3.00'),
(14, '2', 'LISTA 2', 1, '$', '1993-10-22 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '2.00'),
(15, '3', 'LISTA 3', 1, '$', '1993-10-22 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '3.00'),
(16, '4', 'LISTA 4', 1, '$', '1993-10-22 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '4.00'),
(17, '5', 'LISTA 5', 1, '$', '1993-10-22 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '1.00'),
(18, 'DIST', 'DISTRIBUIDORES', 1, '$', '1996-07-18 00:00:00', '2017-06-12 11:13:47', 0, '2010-07-30 19:00:16', '1.00'),
(19, 'DOLAR', 'VENTA EN DOLARES', 2, 'U$S', '2011-10-01 00:00:00', '2017-06-12 11:13:47', 0, '2011-09-26 10:00:00', '1.00'),
(21, 'CADENA', 'CLIENTES CADENA', 1, '$', '2014-04-24 00:00:00', '2017-06-12 11:13:47', 0, '2014-04-24 00:00:00', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_de`
--

CREATE TABLE `lista_de` (
  `Id` int(11) NOT NULL,
  `Id_Lista_Ca` int(11) DEFAULT NULL,
  `Codigo_Lista` char(11) DEFAULT NULL,
  `Id_Producto` int(11) DEFAULT NULL,
  `Id_Fraccio` int(11) DEFAULT NULL,
  `Codigo_Producto` char(9) DEFAULT NULL,
  `Porcentaje` decimal(12,3) DEFAULT NULL,
  `Id_Usuario` int(11) DEFAULT NULL,
  `Fecha_Operacion` datetime DEFAULT NULL,
  `Precio` decimal(12,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lista_de`
--

INSERT INTO `lista_de` (`Id`, `Id_Lista_Ca`, `Codigo_Lista`, `Id_Producto`, `Id_Fraccio`, `Codigo_Producto`, `Porcentaje`, `Id_Usuario`, `Fecha_Operacion`, `Precio`) VALUES
(109468, 2, 'CATALOGO', 4734, 86, '815', '1.000', 228, '2013-03-25 00:00:00', '0.900'),
(109469, 13, 'OFERTA', 4734, 86, '815', '1.000', 228, '2013-03-25 00:00:00', '0.900'),
(112507, 2, 'CATALOGO', 2942, 115, '909', '2.500', 228, '2013-05-15 00:00:00', '11.500'),
(112508, 13, 'OFERTA', 2942, 115, '909', '2.500', 228, '2013-05-15 00:00:00', '11.500'),
(236756, 1, 'VENTAS', 5877, 1, '000', '5.000', 228, '2015-08-20 00:00:00', '369.050'),
(236757, 2, 'CATALOGO', 5877, 1, '000', '5.000', 228, '2015-08-20 00:00:00', '369.050'),
(236758, 14, '2', 5877, 1, '000', '4.500', 228, '2015-08-20 00:00:00', '332.145'),
(236759, 15, '3', 5877, 1, '000', '4.500', 228, '2015-08-20 00:00:00', '332.145'),
(236760, 18, 'DIST', 5877, 1, '000', '4.500', 228, '2015-08-20 00:00:00', '332.145'),
(236761, 21, 'CADENA', 5877, 1, '000', '4.500', 228, '2015-08-20 00:00:00', '332.145'),
(242314, 2, 'CATALOGO', 4840, 129, '915', '2.300', 228, '2015-11-09 00:00:00', '17.807'),
(242315, 13, 'OFERTA', 4840, 129, '915', '2.300', 228, '2015-11-09 00:00:00', '17.807'),
(242316, 21, 'CADENA', 4840, 129, '915', '2.300', 228, '2015-11-09 00:00:00', '17.807'),
(252394, 2, 'CATALOGO', 5672, 1, '920', '2.000', 228, '2016-03-09 00:00:00', '85.500'),
(252395, 13, 'OFERTA', 5672, 1, '920', '2.000', 228, '2016-03-09 00:00:00', '85.500'),
(252396, 21, 'CADENA', 5672, 1, '920', '2.000', 228, '2016-03-09 00:00:00', '85.500'),
(254621, 2, 'CATALOGO', 3972, 1, '012', '7.000', 228, '2016-04-22 00:00:00', '376.908'),
(254622, 14, '2', 3972, 1, '012', '6.300', 228, '2016-04-22 00:00:00', '339.217'),
(254623, 15, '3', 3972, 1, '012', '6.000', 228, '2016-04-22 00:00:00', '323.064'),
(254624, 18, 'DIST', 3972, 1, '012', '6.300', 228, '2016-04-22 00:00:00', '339.217'),
(254625, 1, 'VENTAS', 3972, 11, '012', '7.000', 228, '2016-04-22 00:00:00', '376.908'),
(254626, 2, 'CATALOGO', 3972, 11, '012', '7.000', 228, '2016-04-22 00:00:00', '376.908'),
(254627, 14, '2', 3972, 11, '012', '6.300', 228, '2016-04-22 00:00:00', '339.217'),
(254628, 15, '3', 3972, 11, '012', '6.000', 228, '2016-04-22 00:00:00', '323.064'),
(254629, 18, 'DIST', 3972, 11, '012', '6.300', 228, '2016-04-22 00:00:00', '339.217'),
(254630, 2, 'CATALOGO', 3972, 15, '012', '7.000', 228, '2016-04-22 00:00:00', '360.626'),
(254631, 14, '2', 3972, 15, '012', '6.300', 228, '2016-04-22 00:00:00', '324.563'),
(254632, 15, '3', 3972, 15, '012', '6.000', 228, '2016-04-22 00:00:00', '309.108'),
(254633, 18, 'DIST', 3972, 15, '012', '6.300', 228, '2016-04-22 00:00:00', '324.563'),
(257387, 2, 'CATALOGO', 1837, 1, '035', '3.000', 228, '2016-06-02 00:00:00', '10.680'),
(257388, 4, 'FAR', 1837, 1, '035', '3.000', 228, '2016-06-02 00:00:00', '10.680'),
(257595, 2, 'CATALOGO', 3116, 1, '810', '2.200', 228, '2016-06-06 00:00:00', '188.298'),
(257596, 13, 'OFERTA', 3116, 1, '810', '2.200', 228, '2016-06-06 00:00:00', '188.298'),
(263814, 2, 'CATALOGO', 4662, 102, '914', '2.300', 228, '2016-09-12 00:00:00', '17.397'),
(263815, 13, 'OFERTA', 4662, 102, '914', '2.300', 228, '2016-09-12 00:00:00', '17.397'),
(263816, 21, 'CADENA', 4662, 102, '914', '2.300', 228, '2016-09-12 00:00:00', '17.397'),
(263817, 2, 'CATALOGO', 4662, 129, '914', '2.500', 228, '2016-09-12 00:00:00', '9.672'),
(263818, 13, 'OFERTA', 4662, 129, '914', '2.500', 228, '2016-09-12 00:00:00', '9.672'),
(263819, 21, 'CADENA', 4662, 129, '914', '2.500', 228, '2016-09-12 00:00:00', '9.672'),
(263820, 2, 'CATALOGO', 4662, 130, '914', '2.500', 228, '2016-09-12 00:00:00', '15.595'),
(263821, 13, 'OFERTA', 4662, 130, '914', '2.500', 228, '2016-09-12 00:00:00', '15.595'),
(263822, 21, 'CADENA', 4662, 130, '914', '2.500', 228, '2016-09-12 00:00:00', '15.595'),
(267574, 2, 'CATALOGO', 5255, 101, '916', '3.000', 228, '2016-12-07 00:00:00', '18.323'),
(267575, 13, 'OFERTA', 5255, 101, '916', '3.000', 228, '2016-12-07 00:00:00', '18.323'),
(267576, 21, 'CADENA', 5255, 101, '916', '3.000', 228, '2016-12-07 00:00:00', '18.323'),
(267577, 2, 'CATALOGO', 5255, 102, '916', '3.000', 228, '2016-12-07 00:00:00', '33.320'),
(267578, 13, 'OFERTA', 5255, 102, '916', '3.000', 228, '2016-12-07 00:00:00', '33.320'),
(267579, 21, 'CADENA', 5255, 102, '916', '3.000', 228, '2016-12-07 00:00:00', '33.320'),
(267580, 2, 'CATALOGO', 5255, 103, '916', '3.000', 228, '2016-12-07 00:00:00', '63.510'),
(267581, 13, 'OFERTA', 5255, 103, '916', '3.000', 228, '2016-12-07 00:00:00', '63.510'),
(267582, 21, 'CADENA', 5255, 103, '916', '3.000', 228, '2016-12-07 00:00:00', '63.510'),
(267583, 2, 'CATALOGO', 5255, 104, '916', '3.000', 228, '2016-12-07 00:00:00', '113.000'),
(267584, 13, 'OFERTA', 5255, 104, '916', '3.000', 228, '2016-12-07 00:00:00', '113.000'),
(267585, 21, 'CADENA', 5255, 104, '916', '3.000', 228, '2016-12-07 00:00:00', '113.000'),
(267799, 2, 'CATALOGO', 5923, 1, '922', '1.600', 228, '2016-12-14 00:00:00', '30.269'),
(267800, 13, 'OFERTA', 5923, 1, '922', '1.600', 228, '2016-12-14 00:00:00', '30.269'),
(268421, 2, 'CATALOGO', 1050, 1, '004', '4.500', 228, '2017-01-06 00:00:00', '114.615'),
(268422, 14, '2', 1050, 1, '004', '4.050', 228, '2017-01-06 00:00:00', '103.154'),
(268423, 15, '3', 1050, 1, '004', '4.050', 228, '2017-01-06 00:00:00', '103.154'),
(268424, 18, 'DIST', 1050, 1, '004', '4.050', 228, '2017-01-06 00:00:00', '103.154'),
(268425, 1, 'VENTAS', 1050, 11, '004', '4.500', 228, '2017-01-06 00:00:00', '118.080'),
(268426, 2, 'CATALOGO', 1050, 11, '004', '4.500', 228, '2017-01-06 00:00:00', '118.080'),
(268427, 14, '2', 1050, 11, '004', '4.050', 228, '2017-01-06 00:00:00', '106.272'),
(268428, 15, '3', 1050, 11, '004', '4.050', 228, '2017-01-06 00:00:00', '106.272'),
(268429, 18, 'DIST', 1050, 11, '004', '4.050', 228, '2017-01-06 00:00:00', '106.272'),
(268430, 21, 'CADENA', 1050, 11, '004', '4.050', 228, '2017-01-06 00:00:00', '106.272'),
(268431, 1, 'VENTAS', 1050, 15, '004', '4.500', 228, '2017-01-06 00:00:00', '95.162'),
(268432, 2, 'CATALOGO', 1050, 15, '004', '4.500', 228, '2017-01-06 00:00:00', '95.162'),
(268433, 14, '2', 1050, 15, '004', '4.050', 228, '2017-01-06 00:00:00', '85.645'),
(268434, 15, '3', 1050, 15, '004', '4.050', 228, '2017-01-06 00:00:00', '85.645'),
(268435, 18, 'DIST', 1050, 15, '004', '4.050', 228, '2017-01-06 00:00:00', '85.645'),
(269741, 2, 'CATALOGO', 99, 88, '900', '3.300', 228, '2017-01-16 00:00:00', '9.933'),
(269742, 13, 'OFERTA', 99, 88, '900', '3.300', 228, '2017-01-16 00:00:00', '9.933'),
(269743, 21, 'CADENA', 99, 88, '900', '3.300', 228, '2017-01-16 00:00:00', '9.933'),
(269796, 2, 'CATALOGO', 41, 1, '008', '6.200', 228, '2017-01-16 00:00:00', '1120.504'),
(269797, 14, '2', 41, 1, '008', '6.200', 228, '2017-01-16 00:00:00', '1120.504'),
(269798, 15, '3', 41, 1, '008', '6.200', 228, '2017-01-16 00:00:00', '1120.504'),
(269799, 18, 'DIST', 41, 1, '008', '5.580', 228, '2017-01-16 00:00:00', '1008.454'),
(269800, 2, 'CATALOGO', 41, 9, '008', '6.200', 228, '2017-01-16 00:00:00', '297.274'),
(269801, 3, 'TER', 41, 9, '008', '6.200', 228, '2017-01-16 00:00:00', '297.274'),
(269802, 14, '2', 41, 9, '008', '6.200', 228, '2017-01-16 00:00:00', '297.274'),
(269803, 15, '3', 41, 9, '008', '6.200', 228, '2017-01-16 00:00:00', '297.274'),
(269804, 18, 'DIST', 41, 9, '008', '5.580', 228, '2017-01-16 00:00:00', '267.547'),
(269805, 21, 'CADENA', 41, 9, '008', '5.580', 228, '2017-01-16 00:00:00', '267.547'),
(269806, 2, 'CATALOGO', 41, 10, '008', '6.200', 228, '2017-01-16 00:00:00', '581.611'),
(269807, 14, '2', 41, 10, '008', '6.200', 228, '2017-01-16 00:00:00', '581.611'),
(269808, 15, '3', 41, 10, '008', '6.200', 228, '2017-01-16 00:00:00', '581.611'),
(269809, 18, 'DIST', 41, 10, '008', '5.580', 228, '2017-01-16 00:00:00', '523.450'),
(269810, 1, 'VENTAS', 41, 11, '008', '6.200', 228, '2017-01-16 00:00:00', '1120.504'),
(269811, 2, 'CATALOGO', 41, 11, '008', '6.200', 228, '2017-01-16 00:00:00', '1120.504'),
(269812, 14, '2', 41, 11, '008', '6.200', 228, '2017-01-16 00:00:00', '1120.504'),
(269813, 15, '3', 41, 11, '008', '6.200', 228, '2017-01-16 00:00:00', '1120.504'),
(269814, 18, 'DIST', 41, 11, '008', '5.580', 228, '2017-01-16 00:00:00', '1008.454'),
(269815, 2, 'CATALOGO', 41, 13, '008', '6.200', 228, '2017-01-16 00:00:00', '1097.191'),
(269816, 14, '2', 41, 13, '008', '6.200', 228, '2017-01-16 00:00:00', '1097.191'),
(269817, 15, '3', 41, 13, '008', '6.200', 228, '2017-01-16 00:00:00', '1097.191'),
(269818, 18, 'DIST', 41, 13, '008', '5.580', 228, '2017-01-16 00:00:00', '987.472'),
(269819, 2, 'CATALOGO', 41, 15, '008', '6.200', 228, '2017-01-16 00:00:00', '1092.610'),
(269820, 14, '2', 41, 15, '008', '6.200', 228, '2017-01-16 00:00:00', '1092.610'),
(269821, 15, '3', 41, 15, '008', '6.200', 228, '2017-01-16 00:00:00', '1092.610'),
(269822, 18, 'DIST', 41, 15, '008', '5.580', 228, '2017-01-16 00:00:00', '983.349'),
(269943, 2, 'CATALOGO', 146, 86, '919', '2.600', 228, '2017-01-16 00:00:00', '13.260'),
(269944, 13, 'OFERTA', 146, 86, '919', '2.600', 228, '2017-01-16 00:00:00', '13.260'),
(269945, 21, 'CADENA', 146, 86, '919', '2.600', 228, '2017-01-16 00:00:00', '13.260'),
(275536, 2, 'CATALOGO', 2095, 1, '008', '3.800', 228, '2017-01-25 00:00:00', '8803.753'),
(275537, 14, '2', 2095, 1, '008', '3.420', 228, '2017-01-25 00:00:00', '7923.377'),
(275538, 15, '3', 2095, 1, '008', '2.900', 228, '2017-01-25 00:00:00', '6718.653'),
(275539, 18, 'DIST', 2095, 1, '008', '3.420', 228, '2017-01-25 00:00:00', '7923.377'),
(275540, 1, 'VENTAS', 2095, 6, '008', '3.800', 228, '2017-01-25 00:00:00', '9634.900'),
(275541, 2, 'CATALOGO', 2095, 6, '008', '3.800', 228, '2017-01-25 00:00:00', '9634.900'),
(275542, 14, '2', 2095, 6, '008', '3.420', 228, '2017-01-25 00:00:00', '8671.410'),
(275543, 15, '3', 2095, 6, '008', '2.900', 228, '2017-01-25 00:00:00', '7352.950'),
(275544, 18, 'DIST', 2095, 6, '008', '3.420', 228, '2017-01-25 00:00:00', '8671.410'),
(275545, 2, 'CATALOGO', 2095, 7, '008', '3.800', 228, '2017-01-25 00:00:00', '9455.388'),
(275546, 14, '2', 2095, 7, '008', '3.420', 228, '2017-01-25 00:00:00', '8509.849'),
(275547, 15, '3', 2095, 7, '008', '2.800', 228, '2017-01-25 00:00:00', '6967.128'),
(275548, 18, 'DIST', 2095, 7, '008', '3.420', 228, '2017-01-25 00:00:00', '8509.849'),
(275549, 2, 'CATALOGO', 2095, 9, '008', '3.800', 228, '2017-01-25 00:00:00', '9353.548'),
(275550, 14, '2', 2095, 9, '008', '3.420', 228, '2017-01-25 00:00:00', '8418.193'),
(275551, 15, '3', 2095, 9, '008', '2.800', 228, '2017-01-25 00:00:00', '6892.088'),
(275552, 18, 'DIST', 2095, 9, '008', '3.420', 228, '2017-01-25 00:00:00', '8418.193'),
(276831, 2, 'CATALOGO', 2461, 1, '021', '4.500', 228, '2017-01-26 00:00:00', '67.230'),
(276832, 14, '2', 2461, 1, '021', '4.050', 228, '2017-01-26 00:00:00', '60.507'),
(276833, 15, '3', 2461, 1, '021', '4.050', 228, '2017-01-26 00:00:00', '60.507'),
(276834, 18, 'DIST', 2461, 1, '021', '4.050', 228, '2017-01-26 00:00:00', '60.507'),
(276835, 1, 'VENTAS', 2461, 11, '021', '4.500', 228, '2017-01-26 00:00:00', '67.230'),
(276836, 2, 'CATALOGO', 2461, 11, '021', '4.500', 228, '2017-01-26 00:00:00', '67.230'),
(276837, 14, '2', 2461, 11, '021', '4.050', 228, '2017-01-26 00:00:00', '60.507'),
(276838, 15, '3', 2461, 11, '021', '4.050', 228, '2017-01-26 00:00:00', '60.507'),
(276839, 18, 'DIST', 2461, 11, '021', '4.050', 228, '2017-01-26 00:00:00', '60.507'),
(276840, 2, 'CATALOGO', 2461, 15, '021', '4.500', 228, '2017-01-26 00:00:00', '48.870'),
(276841, 14, '2', 2461, 15, '021', '4.050', 228, '2017-01-26 00:00:00', '43.983'),
(276842, 15, '3', 2461, 15, '021', '4.050', 228, '2017-01-26 00:00:00', '43.983'),
(276843, 18, 'DIST', 2461, 15, '021', '4.050', 228, '2017-01-26 00:00:00', '43.983'),
(278920, 2, 'CATALOGO', 3052, 1, '009', '4.200', 228, '2017-01-30 00:00:00', '169.107'),
(278921, 14, '2', 3052, 1, '009', '3.780', 228, '2017-01-30 00:00:00', '152.196'),
(278922, 15, '3', 3052, 1, '009', '3.500', 228, '2017-01-30 00:00:00', '140.922'),
(278923, 18, 'DIST', 3052, 1, '009', '3.780', 228, '2017-01-30 00:00:00', '152.196'),
(278924, 1, 'VENTAS', 3052, 11, '009', '4.200', 228, '2017-01-30 00:00:00', '182.402'),
(278925, 2, 'CATALOGO', 3052, 11, '009', '4.200', 228, '2017-01-30 00:00:00', '182.402'),
(278926, 14, '2', 3052, 11, '009', '3.780', 228, '2017-01-30 00:00:00', '164.161'),
(278927, 15, '3', 3052, 11, '009', '3.500', 228, '2017-01-30 00:00:00', '152.001'),
(278928, 18, 'DIST', 3052, 11, '009', '3.780', 228, '2017-01-30 00:00:00', '164.161'),
(278929, 2, 'CATALOGO', 3052, 13, '009', '4.200', 228, '2017-01-30 00:00:00', '160.492'),
(278930, 14, '2', 3052, 13, '009', '3.780', 228, '2017-01-30 00:00:00', '144.443'),
(278931, 15, '3', 3052, 13, '009', '3.500', 228, '2017-01-30 00:00:00', '133.743'),
(278932, 18, 'DIST', 3052, 13, '009', '3.780', 228, '2017-01-30 00:00:00', '144.443'),
(278933, 2, 'CATALOGO', 3052, 18, '009', '4.200', 228, '2017-01-30 00:00:00', '120.183'),
(278934, 14, '2', 3052, 18, '009', '3.780', 228, '2017-01-30 00:00:00', '108.165'),
(278935, 15, '3', 3052, 18, '009', '3.500', 228, '2017-01-30 00:00:00', '100.152'),
(278936, 18, 'DIST', 3052, 18, '009', '3.780', 228, '2017-01-30 00:00:00', '108.165'),
(280156, 2, 'CATALOGO', 3115, 1, '910', '2.400', 228, '2017-02-01 00:00:00', '219.816'),
(280157, 13, 'OFERTA', 3115, 1, '910', '2.400', 228, '2017-02-01 00:00:00', '219.816'),
(280158, 21, 'CADENA', 3115, 1, '910', '2.400', 228, '2017-02-01 00:00:00', '219.816'),
(281437, 2, 'CATALOGO', 3423, 1, '011', '4.100', 228, '2017-03-09 00:00:00', '15551.464'),
(281438, 14, '2', 3423, 1, '011', '3.690', 228, '2017-03-09 00:00:00', '13996.318'),
(281439, 15, '3', 3423, 1, '011', '3.300', 228, '2017-03-09 00:00:00', '12517.032'),
(281440, 18, 'DIST', 3423, 1, '011', '3.690', 228, '2017-03-09 00:00:00', '13996.318'),
(281441, 2, 'CATALOGO', 3423, 4, '011', '4.100', 228, '2017-03-09 00:00:00', '16827.837'),
(281442, 5, 'SICOTROP', 3423, 4, '011', '4.100', 228, '2017-03-09 00:00:00', '16827.837'),
(281443, 14, '2', 3423, 4, '011', '3.690', 228, '2017-03-09 00:00:00', '15145.053'),
(281444, 15, '3', 3423, 4, '011', '3.300', 228, '2017-03-09 00:00:00', '13544.357'),
(281445, 18, 'DIST', 3423, 4, '011', '3.690', 228, '2017-03-09 00:00:00', '15145.053'),
(281446, 2, 'CATALOGO', 3423, 5, '011', '4.100', 228, '2017-03-09 00:00:00', '15419.487'),
(281447, 14, '2', 3423, 5, '011', '3.690', 228, '2017-03-09 00:00:00', '13877.538'),
(281448, 15, '3', 3423, 5, '011', '3.300', 228, '2017-03-09 00:00:00', '12410.807'),
(281449, 18, 'DIST', 3423, 5, '011', '3.690', 228, '2017-03-09 00:00:00', '13877.538'),
(281450, 2, 'CATALOGO', 3423, 6, '011', '4.100', 228, '2017-03-09 00:00:00', '14900.223'),
(281451, 14, '2', 3423, 6, '011', '3.690', 228, '2017-03-09 00:00:00', '13410.200'),
(281452, 15, '3', 3423, 6, '011', '3.300', 228, '2017-03-09 00:00:00', '11992.862'),
(281453, 18, 'DIST', 3423, 6, '011', '3.690', 228, '2017-03-09 00:00:00', '13410.200'),
(281454, 2, 'CATALOGO', 3423, 7, '011', '4.100', 228, '2017-03-09 00:00:00', '14597.861'),
(281455, 14, '2', 3423, 7, '011', '3.690', 228, '2017-03-09 00:00:00', '13138.075'),
(281456, 15, '3', 3423, 7, '011', '3.300', 228, '2017-03-09 00:00:00', '11749.498'),
(281457, 18, 'DIST', 3423, 7, '011', '3.690', 228, '2017-03-09 00:00:00', '13138.075'),
(282122, 2, 'CATALOGO', 3950, 1, '012', '3.600', 228, '2017-03-09 00:00:00', '4575.435'),
(282123, 14, '2', 3950, 1, '012', '3.240', 228, '2017-03-09 00:00:00', '4117.891'),
(282124, 15, '3', 3950, 1, '012', '2.800', 228, '2017-03-09 00:00:00', '3558.672'),
(282125, 18, 'DIST', 3950, 1, '012', '3.240', 228, '2017-03-09 00:00:00', '4117.891'),
(282126, 1, 'VENTAS', 3950, 6, '012', '3.600', 228, '2017-03-09 00:00:00', '5012.517'),
(282127, 2, 'CATALOGO', 3950, 6, '012', '3.600', 228, '2017-03-09 00:00:00', '5012.517'),
(282128, 14, '2', 3950, 6, '012', '3.240', 228, '2017-03-09 00:00:00', '4511.265'),
(282129, 15, '3', 3950, 6, '012', '2.800', 228, '2017-03-09 00:00:00', '3898.624'),
(282130, 18, 'DIST', 3950, 6, '012', '3.240', 228, '2017-03-09 00:00:00', '4511.265'),
(282131, 2, 'CATALOGO', 3950, 7, '012', '3.600', 228, '2017-03-09 00:00:00', '4836.698'),
(282132, 14, '2', 3950, 7, '012', '3.240', 228, '2017-03-09 00:00:00', '4353.028'),
(282133, 15, '3', 3950, 7, '012', '2.800', 228, '2017-03-09 00:00:00', '3761.876'),
(282134, 18, 'DIST', 3950, 7, '012', '3.240', 228, '2017-03-09 00:00:00', '4353.028'),
(282135, 2, 'CATALOGO', 3950, 9, '012', '3.600', 228, '2017-03-09 00:00:00', '4702.428'),
(282136, 14, '2', 3950, 9, '012', '3.240', 228, '2017-03-09 00:00:00', '4232.185'),
(282137, 15, '3', 3950, 9, '012', '2.800', 228, '2017-03-09 00:00:00', '3657.444'),
(282138, 18, 'DIST', 3950, 9, '012', '3.240', 228, '2017-03-09 00:00:00', '4232.185'),
(282139, 2, 'CATALOGO', 3950, 18, '012', '3.300', 228, '2017-03-09 00:00:00', '3643.655'),
(282140, 14, '2', 3950, 18, '012', '3.000', 228, '2017-03-09 00:00:00', '3312.414'),
(282141, 15, '3', 3950, 18, '012', '2.700', 228, '2017-03-09 00:00:00', '2981.173'),
(282142, 18, 'DIST', 3950, 18, '012', '3.000', 228, '2017-03-09 00:00:00', '3312.414'),
(283015, 2, 'CATALOGO', 4435, 1, '014', '6.000', 228, '2017-03-13 00:00:00', '4050.404'),
(283016, 14, '2', 4435, 1, '014', '5.400', 228, '2017-03-13 00:00:00', '3645.364'),
(283017, 15, '3', 4435, 1, '014', '4.800', 228, '2017-03-13 00:00:00', '3240.323'),
(283018, 18, 'DIST', 4435, 1, '014', '5.400', 228, '2017-03-13 00:00:00', '3645.364'),
(283019, 1, 'VENTAS', 4435, 7, '014', '6.000', 228, '2017-03-13 00:00:00', '4414.770'),
(283020, 2, 'CATALOGO', 4435, 7, '014', '6.000', 228, '2017-03-13 00:00:00', '4414.770'),
(283021, 14, '2', 4435, 7, '014', '5.400', 228, '2017-03-13 00:00:00', '3973.293'),
(283022, 15, '3', 4435, 7, '014', '4.800', 228, '2017-03-13 00:00:00', '3531.816'),
(283023, 18, 'DIST', 4435, 7, '014', '5.400', 228, '2017-03-13 00:00:00', '3973.293'),
(283024, 2, 'CATALOGO', 4435, 9, '014', '6.000', 228, '2017-03-13 00:00:00', '4225.023'),
(283025, 14, '2', 4435, 9, '014', '5.400', 228, '2017-03-13 00:00:00', '3802.521'),
(283026, 15, '3', 4435, 9, '014', '4.800', 228, '2017-03-13 00:00:00', '3380.019'),
(283027, 18, 'DIST', 4435, 9, '014', '5.400', 228, '2017-03-13 00:00:00', '3802.521'),
(283028, 2, 'CATALOGO', 4435, 10, '014', '6.000', 228, '2017-03-13 00:00:00', '4152.906'),
(283029, 14, '2', 4435, 10, '014', '5.400', 228, '2017-03-13 00:00:00', '3737.616'),
(283030, 15, '3', 4435, 10, '014', '4.800', 228, '2017-03-13 00:00:00', '3322.325'),
(283031, 18, 'DIST', 4435, 10, '014', '5.400', 228, '2017-03-13 00:00:00', '3737.616'),
(283032, 2, 'CATALOGO', 4435, 18, '014', '5.000', 228, '2017-03-13 00:00:00', '2937.485'),
(283033, 14, '2', 4435, 18, '014', '4.500', 228, '2017-03-13 00:00:00', '2643.737'),
(283034, 15, '3', 4435, 18, '014', '3.800', 228, '2017-03-13 00:00:00', '2232.489'),
(283035, 18, 'DIST', 4435, 18, '014', '4.500', 228, '2017-03-13 00:00:00', '2643.737'),
(286365, 2, 'CATALOGO', 116, 1, '011', '3.000', 228, '2017-03-29 00:00:00', '26.610'),
(286366, 14, '2', 116, 1, '011', '3.000', 228, '2017-03-29 00:00:00', '26.610'),
(286367, 15, '3', 116, 1, '011', '3.000', 228, '2017-03-29 00:00:00', '26.610'),
(286368, 18, 'DIST', 116, 1, '011', '2.700', 228, '2017-03-29 00:00:00', '23.949'),
(286369, 1, 'VENTAS', 116, 15, '011', '3.000', 228, '2017-03-29 00:00:00', '16.320'),
(286370, 2, 'CATALOGO', 116, 15, '011', '3.000', 228, '2017-03-29 00:00:00', '16.320'),
(286371, 3, 'TER', 116, 15, '011', '3.000', 228, '2017-03-29 00:00:00', '16.320'),
(286372, 14, '2', 116, 15, '011', '3.000', 228, '2017-03-29 00:00:00', '16.320'),
(286373, 15, '3', 116, 15, '011', '3.000', 228, '2017-03-29 00:00:00', '16.320'),
(286374, 18, 'DIST', 116, 15, '011', '3.000', 228, '2017-03-29 00:00:00', '16.320'),
(286375, 2, 'CATALOGO', 116, 86, '011', '3.200', 228, '2017-03-29 00:00:00', '6.176'),
(286376, 3, 'TER', 116, 86, '011', '3.200', 228, '2017-03-29 00:00:00', '6.176'),
(286377, 14, '2', 116, 86, '011', '3.200', 228, '2017-03-29 00:00:00', '6.176'),
(286378, 15, '3', 116, 86, '011', '3.200', 228, '2017-03-29 00:00:00', '6.176'),
(286379, 18, 'DIST', 116, 86, '011', '2.880', 228, '2017-03-29 00:00:00', '5.558'),
(286380, 2, 'CATALOGO', 116, 88, '011', '3.500', 228, '2017-03-29 00:00:00', '14.875'),
(286381, 3, 'TER', 116, 88, '011', '3.500', 228, '2017-03-29 00:00:00', '14.875'),
(286382, 14, '2', 116, 88, '011', '3.500', 228, '2017-03-29 00:00:00', '14.875'),
(286383, 15, '3', 116, 88, '011', '3.500', 228, '2017-03-29 00:00:00', '14.875'),
(286384, 18, 'DIST', 116, 88, '011', '3.150', 228, '2017-03-29 00:00:00', '13.388'),
(286385, 2, 'CATALOGO', 116, 89, '011', '3.500', 228, '2017-03-29 00:00:00', '21.035'),
(286386, 3, 'TER', 116, 89, '011', '3.500', 228, '2017-03-29 00:00:00', '21.035'),
(286387, 14, '2', 116, 89, '011', '3.500', 228, '2017-03-29 00:00:00', '21.035'),
(286388, 15, '3', 116, 89, '011', '3.500', 228, '2017-03-29 00:00:00', '21.035'),
(286389, 18, 'DIST', 116, 89, '011', '3.150', 228, '2017-03-29 00:00:00', '18.932'),
(286390, 2, 'CATALOGO', 116, 90, '011', '3.000', 228, '2017-03-29 00:00:00', '27.210'),
(286391, 3, 'TER', 116, 90, '011', '3.000', 228, '2017-03-29 00:00:00', '27.210'),
(286392, 14, '2', 116, 90, '011', '3.000', 228, '2017-03-29 00:00:00', '27.210'),
(286393, 15, '3', 116, 90, '011', '3.000', 228, '2017-03-29 00:00:00', '27.210'),
(286394, 18, 'DIST', 116, 90, '011', '2.700', 228, '2017-03-29 00:00:00', '24.489'),
(286395, 21, 'CADENA', 116, 90, '011', '2.700', 228, '2017-03-29 00:00:00', '24.489'),
(286396, 2, 'CATALOGO', 5722, 86, '911', '2.900', 228, '2017-03-29 00:00:00', '5.597'),
(286397, 13, 'OFERTA', 5722, 86, '911', '2.900', 228, '2017-03-29 00:00:00', '5.597'),
(286398, 21, 'CADENA', 5722, 86, '911', '2.900', 228, '2017-03-29 00:00:00', '5.597'),
(286399, 2, 'CATALOGO', 5722, 88, '911', '2.900', 228, '2017-03-29 00:00:00', '12.325'),
(286400, 13, 'OFERTA', 5722, 88, '911', '2.900', 228, '2017-03-29 00:00:00', '12.325'),
(286401, 21, 'CADENA', 5722, 88, '911', '2.900', 228, '2017-03-29 00:00:00', '12.325'),
(286402, 2, 'CATALOGO', 5722, 89, '911', '2.700', 228, '2017-03-29 00:00:00', '16.227'),
(286403, 13, 'OFERTA', 5722, 89, '911', '2.700', 228, '2017-03-29 00:00:00', '16.227'),
(286404, 21, 'CADENA', 5722, 89, '911', '2.700', 228, '2017-03-29 00:00:00', '16.227'),
(286515, 2, 'CATALOGO', 2960, 88, '909', '3.000', 228, '2017-03-29 00:00:00', '20.610'),
(286516, 13, 'OFERTA', 2960, 88, '909', '3.000', 228, '2017-03-29 00:00:00', '20.610'),
(286517, 21, 'CADENA', 2960, 88, '909', '3.000', 228, '2017-03-29 00:00:00', '20.610'),
(286518, 2, 'CATALOGO', 2960, 89, '909', '3.200', 228, '2017-03-29 00:00:00', '35.296'),
(286519, 13, 'OFERTA', 2960, 89, '909', '3.200', 228, '2017-03-29 00:00:00', '35.296'),
(286520, 21, 'CADENA', 2960, 89, '909', '3.200', 228, '2017-03-29 00:00:00', '35.296'),
(286521, 2, 'CATALOGO', 2960, 90, '909', '3.900', 228, '2017-03-29 00:00:00', '68.406'),
(286522, 13, 'OFERTA', 2960, 90, '909', '3.900', 228, '2017-03-29 00:00:00', '68.406'),
(286523, 21, 'CADENA', 2960, 90, '909', '3.900', 228, '2017-03-29 00:00:00', '68.406'),
(286588, 2, 'CATALOGO', 3814, 1, '012', '5.000', 228, '2017-03-29 00:00:00', '290.975'),
(286589, 14, '2', 3814, 1, '012', '4.500', 228, '2017-03-29 00:00:00', '261.878'),
(286590, 15, '3', 3814, 1, '012', '4.500', 228, '2017-03-29 00:00:00', '261.878'),
(286591, 18, 'DIST', 3814, 1, '012', '4.500', 228, '2017-03-29 00:00:00', '261.878'),
(286592, 1, 'VENTAS', 3814, 11, '012', '5.000', 228, '2017-03-29 00:00:00', '290.975'),
(286593, 2, 'CATALOGO', 3814, 11, '012', '5.000', 228, '2017-03-29 00:00:00', '290.975'),
(286594, 14, '2', 3814, 11, '012', '4.500', 228, '2017-03-29 00:00:00', '261.878'),
(286595, 15, '3', 3814, 11, '012', '4.500', 228, '2017-03-29 00:00:00', '261.878'),
(286596, 18, 'DIST', 3814, 11, '012', '4.500', 228, '2017-03-29 00:00:00', '261.878'),
(286597, 2, 'CATALOGO', 3814, 93, '012', '5.000', 228, '2017-03-29 00:00:00', '41.100'),
(286598, 14, '2', 3814, 93, '012', '4.500', 228, '2017-03-29 00:00:00', '36.990'),
(286599, 15, '3', 3814, 93, '012', '4.500', 228, '2017-03-29 00:00:00', '36.990'),
(286600, 18, 'DIST', 3814, 93, '012', '4.500', 228, '2017-03-29 00:00:00', '36.990'),
(286601, 21, 'CADENA', 3814, 93, '012', '4.500', 228, '2017-03-29 00:00:00', '36.990'),
(286721, 2, 'CATALOGO', 5770, 1, '000', '4.000', 228, '2017-03-31 00:00:00', '141.460'),
(286722, 14, '2', 5770, 1, '000', '3.600', 228, '2017-03-31 00:00:00', '127.314'),
(286723, 15, '3', 5770, 1, '000', '3.200', 228, '2017-03-31 00:00:00', '113.168'),
(286724, 18, 'DIST', 5770, 1, '000', '3.600', 228, '2017-03-31 00:00:00', '127.314'),
(286725, 1, 'VENTAS', 5770, 11, '000', '4.000', 228, '2017-03-31 00:00:00', '141.460'),
(286726, 2, 'CATALOGO', 5770, 11, '000', '4.000', 228, '2017-03-31 00:00:00', '141.460'),
(286727, 14, '2', 5770, 11, '000', '3.600', 228, '2017-03-31 00:00:00', '127.314'),
(286728, 15, '3', 5770, 11, '000', '3.200', 228, '2017-03-31 00:00:00', '113.168'),
(286729, 18, 'DIST', 5770, 11, '000', '3.600', 228, '2017-03-31 00:00:00', '127.314'),
(286730, 2, 'CATALOGO', 5770, 13, '000', '4.000', 228, '2017-03-31 00:00:00', '94.308'),
(286731, 14, '2', 5770, 13, '000', '3.600', 228, '2017-03-31 00:00:00', '84.877'),
(286732, 15, '3', 5770, 13, '000', '3.200', 228, '2017-03-31 00:00:00', '75.446'),
(286733, 18, 'DIST', 5770, 13, '000', '3.600', 228, '2017-03-31 00:00:00', '84.877'),
(286734, 2, 'CATALOGO', 5770, 18, '000', '3.000', 228, '2017-03-31 00:00:00', '56.400'),
(286735, 14, '2', 5770, 18, '000', '2.700', 228, '2017-03-31 00:00:00', '50.760'),
(286736, 15, '3', 5770, 18, '000', '2.500', 228, '2017-03-31 00:00:00', '47.000'),
(286737, 18, 'DIST', 5770, 18, '000', '2.700', 228, '2017-03-31 00:00:00', '50.760'),
(287427, 2, 'CATALOGO', 5358, 1, '017', '4.000', 228, '2017-04-10 00:00:00', '878.268'),
(287428, 14, '2', 5358, 1, '017', '3.600', 228, '2017-04-10 00:00:00', '790.441'),
(287429, 15, '3', 5358, 1, '017', '3.200', 228, '2017-04-10 00:00:00', '702.614'),
(287430, 18, 'DIST', 5358, 1, '017', '3.600', 228, '2017-04-10 00:00:00', '790.441'),
(287431, 1, 'VENTAS', 5358, 9, '017', '4.000', 228, '2017-04-10 00:00:00', '878.268'),
(287432, 2, 'CATALOGO', 5358, 9, '017', '4.000', 228, '2017-04-10 00:00:00', '878.268'),
(287433, 14, '2', 5358, 9, '017', '3.600', 228, '2017-04-10 00:00:00', '790.441'),
(287434, 15, '3', 5358, 9, '017', '3.200', 228, '2017-04-10 00:00:00', '702.614'),
(287435, 18, 'DIST', 5358, 9, '017', '3.600', 228, '2017-04-10 00:00:00', '790.441'),
(287436, 2, 'CATALOGO', 5358, 10, '017', '4.000', 228, '2017-04-10 00:00:00', '830.973'),
(287437, 14, '2', 5358, 10, '017', '3.600', 228, '2017-04-10 00:00:00', '747.875'),
(287438, 15, '3', 5358, 10, '017', '3.200', 228, '2017-04-10 00:00:00', '664.778'),
(287439, 18, 'DIST', 5358, 10, '017', '3.600', 228, '2017-04-10 00:00:00', '747.875'),
(287440, 2, 'CATALOGO', 5358, 11, '017', '4.000', 228, '2017-04-10 00:00:00', '809.151'),
(287441, 14, '2', 5358, 11, '017', '3.600', 228, '2017-04-10 00:00:00', '728.236'),
(287442, 15, '3', 5358, 11, '017', '3.200', 228, '2017-04-10 00:00:00', '647.320'),
(287443, 18, 'DIST', 5358, 11, '017', '3.600', 228, '2017-04-10 00:00:00', '728.236'),
(287444, 2, 'CATALOGO', 5358, 13, '017', '4.000', 228, '2017-04-10 00:00:00', '815.758'),
(287445, 14, '2', 5358, 13, '017', '3.600', 228, '2017-04-10 00:00:00', '734.182'),
(287446, 15, '3', 5358, 13, '017', '3.200', 228, '2017-04-10 00:00:00', '652.606'),
(287447, 18, 'DIST', 5358, 13, '017', '3.600', 228, '2017-04-10 00:00:00', '734.182'),
(287448, 2, 'CATALOGO', 5358, 18, '017', '3.600', 228, '2017-04-10 00:00:00', '605.624'),
(287449, 14, '2', 5358, 18, '017', '3.240', 228, '2017-04-10 00:00:00', '545.062'),
(287450, 15, '3', 5358, 18, '017', '2.800', 228, '2017-04-10 00:00:00', '471.041'),
(287451, 18, 'DIST', 5358, 18, '017', '3.240', 228, '2017-04-10 00:00:00', '545.062'),
(288308, 2, 'CATALOGO', 4669, 1, '014', '5.400', 228, '2017-04-26 00:00:00', '381.801'),
(288309, 14, '2', 4669, 1, '014', '4.860', 228, '2017-04-26 00:00:00', '343.621'),
(288310, 15, '3', 4669, 1, '014', '4.200', 228, '2017-04-26 00:00:00', '296.957'),
(288311, 18, 'DIST', 4669, 1, '014', '4.860', 228, '2017-04-26 00:00:00', '343.621'),
(288312, 1, 'VENTAS', 4669, 11, '014', '5.400', 228, '2017-04-26 00:00:00', '332.154'),
(288313, 2, 'CATALOGO', 4669, 11, '014', '5.400', 228, '2017-04-26 00:00:00', '332.154'),
(288314, 14, '2', 4669, 11, '014', '4.860', 228, '2017-04-26 00:00:00', '298.939'),
(288315, 15, '3', 4669, 11, '014', '4.200', 228, '2017-04-26 00:00:00', '258.342'),
(288316, 18, 'DIST', 4669, 11, '014', '4.860', 228, '2017-04-26 00:00:00', '298.939'),
(288317, 2, 'CATALOGO', 4669, 20, '014', '5.400', 228, '2017-04-26 00:00:00', '239.433'),
(288318, 14, '2', 4669, 20, '014', '4.860', 228, '2017-04-26 00:00:00', '215.489'),
(288319, 15, '3', 4669, 20, '014', '4.200', 228, '2017-04-26 00:00:00', '186.225'),
(288320, 18, 'DIST', 4669, 20, '014', '4.860', 228, '2017-04-26 00:00:00', '215.489'),
(288321, 2, 'CATALOGO', 4669, 134, '014', '5.000', 228, '2017-04-26 00:00:00', '389.709'),
(288322, 3, 'TER', 4669, 134, '014', '5.000', 228, '2017-04-26 00:00:00', '389.709'),
(288323, 14, '2', 4669, 134, '014', '5.000', 228, '2017-04-26 00:00:00', '389.709'),
(288324, 15, '3', 4669, 134, '014', '5.000', 228, '2017-04-26 00:00:00', '389.709'),
(288325, 18, 'DIST', 4669, 134, '014', '4.500', 228, '2017-04-26 00:00:00', '350.738'),
(288326, 21, 'CADENA', 4669, 134, '014', '4.500', 228, '2017-04-26 00:00:00', '350.738'),
(290227, 2, 'CATALOGO', 5745, 86, '915', '2.900', 228, '2017-05-24 00:00:00', '8.758'),
(290228, 13, 'OFERTA', 5745, 86, '915', '2.900', 228, '2017-05-24 00:00:00', '8.758'),
(290229, 21, 'CADENA', 5745, 86, '915', '2.900', 228, '2017-05-24 00:00:00', '8.758'),
(290230, 2, 'CATALOGO', 2363, 1, '007', '5.000', 228, '2017-05-24 00:00:00', '220.936'),
(290231, 14, '2', 2363, 1, '007', '5.000', 228, '2017-05-24 00:00:00', '220.936'),
(290232, 15, '3', 2363, 1, '007', '5.000', 228, '2017-05-24 00:00:00', '220.936'),
(290233, 18, 'DIST', 2363, 1, '007', '4.500', 228, '2017-05-24 00:00:00', '198.843'),
(290234, 1, 'VENTAS', 2363, 11, '007', '5.000', 228, '2017-05-24 00:00:00', '220.936'),
(290235, 2, 'CATALOGO', 2363, 11, '007', '5.000', 228, '2017-05-24 00:00:00', '220.936'),
(290236, 14, '2', 2363, 11, '007', '5.000', 228, '2017-05-24 00:00:00', '220.936'),
(290237, 15, '3', 2363, 11, '007', '5.000', 228, '2017-05-24 00:00:00', '220.936'),
(290238, 18, 'DIST', 2363, 11, '007', '4.500', 228, '2017-05-24 00:00:00', '198.843'),
(290239, 21, 'CADENA', 2363, 11, '007', '4.500', 228, '2017-05-24 00:00:00', '198.843'),
(290240, 2, 'CATALOGO', 2363, 13, '007', '5.000', 228, '2017-05-24 00:00:00', '203.440'),
(290241, 14, '2', 2363, 13, '007', '5.000', 228, '2017-05-24 00:00:00', '203.440'),
(290242, 15, '3', 2363, 13, '007', '5.000', 228, '2017-05-24 00:00:00', '203.440'),
(290243, 18, 'DIST', 2363, 13, '007', '4.500', 228, '2017-05-24 00:00:00', '183.096'),
(290244, 1, 'VENTAS', 2363, 15, '007', '5.000', 228, '2017-05-24 00:00:00', '197.680'),
(290245, 2, 'CATALOGO', 2363, 15, '007', '5.000', 228, '2017-05-24 00:00:00', '197.680'),
(290246, 14, '2', 2363, 15, '007', '5.000', 228, '2017-05-24 00:00:00', '197.680'),
(290247, 15, '3', 2363, 15, '007', '5.000', 228, '2017-05-24 00:00:00', '197.680'),
(290248, 18, 'DIST', 2363, 15, '007', '4.500', 228, '2017-05-24 00:00:00', '177.912'),
(290249, 2, 'CATALOGO', 2363, 60, '007', '5.000', 228, '2017-05-24 00:00:00', '127.150'),
(290250, 14, '2', 2363, 60, '007', '5.000', 228, '2017-05-24 00:00:00', '127.150'),
(290251, 15, '3', 2363, 60, '007', '5.000', 228, '2017-05-24 00:00:00', '127.150'),
(290252, 18, 'DIST', 2363, 60, '007', '4.500', 228, '2017-05-24 00:00:00', '114.435'),
(290634, 2, 'CATALOGO', 5802, 1, '000', '5.000', 228, '2017-06-05 00:00:00', '454.262'),
(290635, 14, '2', 5802, 1, '000', '4.500', 228, '2017-06-05 00:00:00', '408.835'),
(290636, 15, '3', 5802, 1, '000', '4.000', 228, '2017-06-05 00:00:00', '363.409'),
(290637, 18, 'DIST', 5802, 1, '000', '4.500', 228, '2017-06-05 00:00:00', '408.835'),
(290638, 1, 'VENTAS', 5802, 11, '000', '5.000', 228, '2017-06-05 00:00:00', '617.165'),
(290639, 2, 'CATALOGO', 5802, 11, '000', '5.000', 228, '2017-06-05 00:00:00', '617.165'),
(290640, 14, '2', 5802, 11, '000', '4.500', 228, '2017-06-05 00:00:00', '555.449'),
(290641, 15, '3', 5802, 11, '000', '4.000', 228, '2017-06-05 00:00:00', '493.732'),
(290642, 18, 'DIST', 5802, 11, '000', '4.500', 228, '2017-06-05 00:00:00', '555.449'),
(290643, 2, 'CATALOGO', 5802, 13, '000', '5.000', 228, '2017-06-05 00:00:00', '546.201'),
(290644, 14, '2', 5802, 13, '000', '4.500', 228, '2017-06-05 00:00:00', '491.580'),
(290645, 15, '3', 5802, 13, '000', '4.000', 228, '2017-06-05 00:00:00', '436.960'),
(290646, 18, 'DIST', 5802, 13, '000', '4.500', 228, '2017-06-05 00:00:00', '491.580'),
(290647, 2, 'CATALOGO', 5802, 18, '000', '4.500', 228, '2017-06-05 00:00:00', '417.247'),
(290648, 14, '2', 5802, 18, '000', '4.050', 228, '2017-06-05 00:00:00', '375.522'),
(290649, 15, '3', 5802, 18, '000', '3.600', 228, '2017-06-05 00:00:00', '333.797'),
(290650, 18, 'DIST', 5802, 18, '000', '4.050', 228, '2017-06-05 00:00:00', '375.522');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedid_ca`
--

CREATE TABLE `pedid_ca` (
  `Nro_Pedido` int(11) NOT NULL,
  `id_Cliente` int(11) DEFAULT NULL,
  `Fecha_Pedido` datetime DEFAULT NULL,
  `Codigo_Vendedor` smallint(6) DEFAULT NULL,
  `Nro_Cotizacion` int(11) DEFAULT NULL,
  `Nro_Presupuesto` int(11) DEFAULT NULL,
  `Id_Lista` int(11) DEFAULT NULL,
  `Id_Condicion` int(11) DEFAULT NULL,
  `Id_Moneda` int(11) DEFAULT NULL,
  `Cotizacion_Moneda` decimal(13,4) DEFAULT NULL,
  `Estado` char(3) DEFAULT NULL,
  `Id_Reparto` int(11) DEFAULT NULL,
  `Nro_orden_compra` varchar(20) DEFAULT NULL,
  `Id_Tomado_Por` int(11) DEFAULT NULL,
  `Id_Usuario` int(11) DEFAULT NULL,
  `Fecha_Operacion` datetime DEFAULT NULL,
  `Id_Grupo_Cliente` int(11) DEFAULT NULL,
  `Total_Gravado` decimal(12,3) DEFAULT NULL,
  `Total_Exento` decimal(12,3) DEFAULT NULL,
  `Total_Producto_Ex` decimal(12,3) DEFAULT NULL,
  `Porc_Iva_Ins` decimal(12,3) DEFAULT NULL,
  `Iva_Ins` decimal(12,3) DEFAULT NULL,
  `Porc_Iva_NoIns` decimal(12,3) DEFAULT NULL,
  `Iva_NoIns` decimal(12,3) DEFAULT NULL,
  `Porc_IngBr_Cba` decimal(12,3) DEFAULT NULL,
  `IngBr_Cba` decimal(12,3) DEFAULT NULL,
  `Porc_IngBr_Pba` decimal(12,3) DEFAULT NULL,
  `IngBr_Pba` decimal(12,3) DEFAULT NULL,
  `Total_Neto` decimal(12,3) DEFAULT NULL,
  `Descuento` decimal(12,3) DEFAULT NULL,
  `Id_Transporte` int(11) DEFAULT NULL,
  `Generado_Por` int(11) DEFAULT NULL,
  `Porc_IngBr_Mis` decimal(12,3) DEFAULT NULL,
  `IngBr_Mis` decimal(12,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedid_ca`
--

INSERT INTO `pedid_ca` (`Nro_Pedido`, `id_Cliente`, `Fecha_Pedido`, `Codigo_Vendedor`, `Nro_Cotizacion`, `Nro_Presupuesto`, `Id_Lista`, `Id_Condicion`, `Id_Moneda`, `Cotizacion_Moneda`, `Estado`, `Id_Reparto`, `Nro_orden_compra`, `Id_Tomado_Por`, `Id_Usuario`, `Fecha_Operacion`, `Id_Grupo_Cliente`, `Total_Gravado`, `Total_Exento`, `Total_Producto_Ex`, `Porc_Iva_Ins`, `Iva_Ins`, `Porc_Iva_NoIns`, `Iva_NoIns`, `Porc_IngBr_Cba`, `IngBr_Cba`, `Porc_IngBr_Pba`, `IngBr_Pba`, `Total_Neto`, `Descuento`, `Id_Transporte`, `Generado_Por`, `Porc_IngBr_Mis`, `IngBr_Mis`) VALUES
(1252246, 10797, '2013-03-12 07:47:19', 13, 0, 0, 2, 16, 1, '0.0000', 'FAC', 183, '', 0, 262, '2013-03-12 08:58:21', 13719, '1020.168', '0.000', '0.000', '21.000', '214.235', '0.000', '0.000', '0.000', '0.000', '3.000', '30.610', '1265.013', '0.000', 621, 0, '0.000', '0.000'),
(1252247, 4580, '2013-03-12 07:48:27', 12, 0, 0, 15, 79, 1, '0.0000', 'FAC', 1, '', 0, 262, '2013-03-12 07:48:27', 4580, '778.000', '0.000', '0.000', '21.000', '163.380', '0.000', '0.000', '3.000', '23.340', '0.000', '0.000', '964.720', '0.000', 576, 0, '0.000', '0.000'),
(1252248, 5957, '2013-03-12 07:48:28', 12, 0, 0, 15, 79, 1, '0.0000', 'FAC', 1, '', 0, 262, '2013-03-12 07:48:28', 4580, '778.000', '0.000', '0.000', '21.000', '163.380', '0.000', '0.000', '3.000', '23.340', '0.000', '0.000', '964.720', '0.000', 576, 0, '0.000', '0.000'),
(1252249, 8498, '2013-03-12 07:48:30', 12, 0, 0, 2, 14, 1, '0.0000', 'FAC', 179, '', 0, 95, '2013-03-12 10:26:19', 8498, '687.850', '0.000', '0.000', '21.000', '144.450', '0.000', '0.000', '3.000', '20.640', '0.000', '0.000', '852.930', '0.000', 576, 0, '0.000', '0.000'),
(1252250, 10173, '2013-03-12 07:49:58', 5, 0, 0, 18, 16, 1, '0.0000', 'FAC', 148, '', 0, 81, '2013-03-12 10:18:29', 13719, '474.550', '0.000', '0.000', '21.000', '99.660', '0.000', '0.000', '0.000', '0.000', '3.000', '13.510', '587.720', '0.000', 621, 0, '0.000', '0.000'),
(1252251, 13276, '2013-03-12 07:50:00', 5, 0, 0, 2, 14, 1, '0.0000', 'FAC', 148, '', 0, 262, '2013-03-12 08:58:21', 13276, '0.000', '726.411', '0.000', '21.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '726.411', '0.000', 621, 0, '0.000', '0.000'),
(1252252, 13694, '2013-03-12 07:50:01', 5, 0, 0, 2, 10, 1, '0.0000', 'FAC', 148, '', 0, 262, '2013-03-12 07:50:01', 13694, '563.535', '0.000', '0.000', '21.000', '118.342', '0.000', '0.000', '0.000', '0.000', '3.000', '16.910', '698.787', '0.000', 621, 0, '0.000', '0.000'),
(1252253, 7760, '2013-03-12 07:50:04', 5, 0, 0, 2, 10, 1, '0.0000', 'FAC', 148, '', 0, 262, '2013-03-12 08:58:21', 7760, '1217.310', '0.000', '0.000', '21.000', '255.635', '0.000', '0.000', '0.000', '0.000', '3.000', '35.870', '1508.815', '0.000', 621, 0, '0.000', '0.000'),
(1252254, 9967, '2013-03-12 07:50:05', 5, 0, 0, 18, 16, 1, '0.0000', 'FAC', 148, '', 0, 81, '2013-03-12 14:16:48', 13719, '1024.290', '0.000', '0.000', '21.000', '215.100', '0.000', '0.000', '0.000', '0.000', '3.000', '30.730', '1270.120', '0.000', 621, 0, '0.000', '0.000'),
(1252255, 10664, '2013-03-12 07:50:07', 5, 0, 0, 18, 16, 1, '0.0000', 'FAC', 148, '', 0, 81, '2013-03-12 10:20:36', 13719, '773.880', '0.000', '0.000', '21.000', '162.510', '0.000', '0.000', '0.000', '0.000', '3.000', '23.220', '959.610', '0.000', 621, 0, '0.000', '0.000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedid_de`
--

CREATE TABLE `pedid_de` (
  `Nro_Pedido` int(11) DEFAULT NULL,
  `Renglon` int(11) DEFAULT NULL,
  `Id_Producto` int(11) DEFAULT NULL,
  `Id_Fraccio` int(11) DEFAULT NULL,
  `Codigo_Producto` char(9) DEFAULT NULL,
  `Cantidad` decimal(12,3) DEFAULT NULL,
  `Precio` decimal(12,2) DEFAULT NULL,
  `Precio_Lista` decimal(12,2) DEFAULT NULL,
  `Estado` char(3) DEFAULT NULL,
  `Nro_Cotizacion` int(11) DEFAULT NULL,
  `Fecha_Cotizacion` datetime DEFAULT NULL,
  `Nro_Despacho` varchar(30) DEFAULT NULL,
  `Nro_Lote` varchar(20) DEFAULT NULL,
  `Id_Origen` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedid_de`
--

INSERT INTO `pedid_de` (`Nro_Pedido`, `Renglon`, `Id_Producto`, `Id_Fraccio`, `Codigo_Producto`, `Cantidad`, `Precio`, `Precio_Lista`, `Estado`, `Nro_Cotizacion`, `Fecha_Cotizacion`, `Nro_Despacho`, `Nro_Lote`, `Id_Origen`) VALUES
(1252246, 1, 41, 9, '00856/008', '2.000', '63.24', '63.24', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252246, 2, 99, 88, '90049/308', '12.000', '3.59', '3.59', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252246, 3, 5722, 88, '91180/308', '12.000', '3.42', '3.42', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252246, 4, 5722, 89, '91180/309', '12.000', '4.70', '4.70', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252246, 5, 146, 86, '91992/306', '12.000', '4.37', '4.37', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252246, 6, 5745, 86, '91514/306', '96.000', '2.70', '2.70', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252246, 7, 4662, 130, '91453/608', '36.000', '4.26', '4.26', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252246, 8, 3115, 1, '91006/000', '1.000', '73.26', '73.26', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252246, 9, 4840, 129, '91546/606', '12.000', '7.28', '7.28', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252246, 10, 2960, 89, '90963/309', '12.000', '10.65', '10.65', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252247, 1, 5802, 11, '00072/010', '3.000', '58.00', '97.20', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252247, 2, 3423, 7, '01138/006', '0.100', '1650.00', '2564.14', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252247, 3, 3950, 9, '01272/008', '0.250', '500.00', '634.20', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252247, 4, 4435, 7, '01414/006', '0.200', '570.00', '921.71', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252247, 5, 5770, 18, '00054/017', '25.000', '8.00', '13.25', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252248, 1, 5802, 11, '00072/010', '3.000', '58.00', '97.20', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252248, 2, 3423, 7, '01138/006', '0.100', '1650.00', '2564.14', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252248, 3, 3950, 9, '01272/008', '0.250', '500.00', '634.20', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252248, 4, 4435, 7, '01414/006', '0.200', '570.00', '921.71', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252248, 5, 5770, 18, '00054/017', '25.000', '8.00', '13.25', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252249, 1, 5358, 9, '01704/008', '0.500', '98.28', '98.28', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252249, 2, 2461, 11, '02160/010', '1.000', '30.83', '30.83', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252249, 3, 1050, 15, '00494/014', '10.000', '32.18', '32.18', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252249, 4, 2095, 7, '00819/006', '0.100', '2860.80', '2860.80', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252250, 1, 99, 88, '90049/308', '12.000', '3.59', '3.59', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252250, 2, 5877, 1, '00041/000', '1.000', '147.01', '147.01', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252250, 3, 4662, 130, '91453/608', '24.000', '4.26', '4.26', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252250, 4, 3115, 1, '91006/000', '1.000', '73.26', '73.26', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252250, 5, 5745, 86, '91514/306', '48.000', '2.27', '2.70', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252251, 1, 2363, 11, '00741/010', '1.000', '46.00', '46.00', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252251, 2, 1050, 11, '00494/010', '4.000', '40.50', '40.50', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252251, 3, 3116, 1, '81006/000', '3.000', '66.60', '66.60', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252251, 4, 3972, 11, '01285/010', '1.000', '115.50', '115.50', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252251, 5, 1837, 1, '03521/000', '24.000', '3.21', '3.21', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252252, 1, 5722, 86, '91180/306', '12.000', '1.56', '1.56', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252252, 2, 5722, 88, '91180/308', '24.000', '3.42', '3.42', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252252, 3, 5722, 89, '91180/309', '12.000', '4.70', '4.70', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252252, 4, 116, 90, '01180/310', '1.000', '8.51', '8.51', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252252, 5, 2942, 115, '90962/505', '12.000', '11.50', '11.50', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252252, 6, 3052, 11, '00988/010', '2.000', '30.03', '30.03', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252252, 7, 3116, 1, '81006/000', '3.000', '66.60', '66.60', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252253, 1, 5722, 86, '91180/306', '12.000', '1.56', '1.56', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252253, 2, 5722, 88, '91180/308', '12.000', '3.42', '3.42', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252253, 3, 5722, 89, '91180/309', '12.000', '4.70', '4.70', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252253, 4, 2960, 88, '90963/308', '12.000', '6.16', '6.16', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252253, 5, 2960, 89, '90963/309', '12.000', '10.65', '10.65', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252253, 6, 3116, 1, '81006/000', '3.000', '66.60', '66.60', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252253, 7, 5255, 101, '91656/407', '12.000', '5.94', '5.94', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252253, 8, 5255, 102, '91656/408', '12.000', '9.90', '9.90', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252253, 9, 5255, 103, '91656/409', '12.000', '18.12', '18.12', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252253, 10, 5745, 86, '91514/306', '60.000', '2.70', '2.70', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252253, 11, 4734, 86, '81514/306', '12.000', '0.10', '0.10', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252253, 12, 5672, 1, '92090/000', '2.000', '40.32', '40.32', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252253, 13, 5923, 1, '92212/000', '6.000', '8.05', '8.05', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252254, 1, 5722, 86, '91180/306', '24.000', '1.56', '1.56', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252254, 2, 5722, 88, '91180/308', '24.000', '3.42', '3.42', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252254, 3, 4669, 134, '01460/806', '1.000', '78.75', '78.75', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252254, 4, 3116, 1, '81006/000', '3.000', '66.60', '66.60', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252254, 5, 3814, 124, '01219/530', '6.000', '13.57', '13.57', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252254, 6, 5745, 86, '91514/306', '240.000', '2.27', '2.70', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252255, 1, 5722, 86, '91180/306', '12.000', '1.56', '1.56', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252255, 2, 3115, 1, '91006/000', '1.000', '73.26', '73.26', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252255, 3, 3814, 124, '01219/530', '6.000', '13.57', '13.57', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252255, 4, 5745, 86, '91514/306', '24.000', '2.27', '2.70', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252255, 5, 4840, 129, '91546/606', '12.000', '7.28', '7.28', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252255, 6, 5255, 101, '91656/407', '12.000', '5.94', '5.94', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252255, 7, 5255, 102, '91656/408', '12.000', '9.90', '9.90', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252255, 8, 5255, 103, '91656/409', '12.000', '18.12', '18.12', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0),
(1252255, 9, 4662, 130, '91453/608', '12.000', '4.26', '4.26', 'GEN', 0, '1900-01-01 00:00:00', '', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedid_numer`
--

CREATE TABLE `pedid_numer` (
  `id` int(11) NOT NULL,
  `Codigo` varchar(10) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Numero` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produ_frac`
--

CREATE TABLE `produ_frac` (
  `id_Producto` int(11) DEFAULT NULL,
  `id_Fraccio` int(11) DEFAULT NULL,
  `Codigo_producto` varchar(9) DEFAULT NULL,
  `Codigo_Fraccio` varchar(3) DEFAULT NULL,
  `cruz` bit(1) DEFAULT NULL,
  `Minimo` decimal(12,3) DEFAULT NULL,
  `Costo` decimal(12,3) DEFAULT NULL,
  `id_Ume_Vta` int(11) DEFAULT NULL,
  `Ume_Vta` varchar(3) DEFAULT NULL,
  `Ubicacion` varchar(4) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `id_Ume_Frac` int(11) DEFAULT NULL,
  `Ume_Frac` varchar(3) DEFAULT NULL,
  `Agrupa` varchar(9) DEFAULT NULL,
  `Factor` decimal(12,3) DEFAULT NULL,
  `Baja` bit(1) DEFAULT NULL,
  `Habil_Cot` bit(1) DEFAULT NULL,
  `Habil_Pre` bit(1) DEFAULT NULL,
  `Habil_Ped` bit(1) DEFAULT NULL,
  `Indice` decimal(12,3) DEFAULT NULL,
  `Cantidad_Pack` decimal(12,3) DEFAULT NULL,
  `Porc_Minimo` decimal(12,3) DEFAULT NULL,
  `EnWeb` bit(1) DEFAULT NULL,
  `Id_Ubicacion` int(11) DEFAULT NULL,
  `Permitir_Vendedores` bit(1) DEFAULT NULL,
  `Costo_MP` decimal(12,3) DEFAULT NULL,
  `Trazabilidad` bit(1) DEFAULT NULL,
  `Controla_Envase` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produ_frac`
--

INSERT INTO `produ_frac` (`id_Producto`, `id_Fraccio`, `Codigo_producto`, `Codigo_Fraccio`, `cruz`, `Minimo`, `Costo`, `id_Ume_Vta`, `Ume_Vta`, `Ubicacion`, `Descripcion`, `id_Ume_Frac`, `Ume_Frac`, `Agrupa`, `Factor`, `Baja`, `Habil_Cot`, `Habil_Pre`, `Habil_Ped`, `Indice`, `Cantidad_Pack`, `Porc_Minimo`, `EnWeb`, `Id_Ubicacion`, `Permitir_Vendedores`, `Costo_MP`, `Trazabilidad`, `Controla_Envase`) VALUES
(5802, 11, '00072/000', '010', b'1111111111111111111111111111111', '1.000', '5.679', 4, 'Kg ', '21BI', '          ', 4, 'Kg ', '00072/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '3.929', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5745, 86, '91514/000', '306', b'1111111111111111111111111111111', '12.000', '3.020', 1, 'UN ', '2OPB', 'Gotero    ', 5, 'L  ', 'S FISIOL ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2.069', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2960, 88, '90963/000', '308', b'1111111111111111111111111111111', '12.000', '6.870', 1, 'UN ', '2OPB', '          ', 5, 'L  ', 'OLEO     ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '9.300', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3814, 1, '01219/000', '000', b'1111111111111111111111111111111', '0.001', '58.195', 4, 'Kg ', '1a  ', '          ', 4, 'Kg ', '01219/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '47.100', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3814, 11, '01219/000', '010', b'1111111111111111111111111111111', '1.000', '58.195', 4, 'Kg ', '21A ', '          ', 4, 'Kg ', '01219/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '58.195', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3814, 93, '01219/000', '330', b'1111111111111111111111111111111', '12.000', '8.220', 1, 'UN ', '22D ', 'Pote      ', 4, 'Kg ', '01219/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '8.134', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4669, 11, '01460/000', '010', b'1111111111111111111111111111111', '1.000', '2.830', 4, 'Kg ', '22BE', '          ', 4, 'Kg ', '01460/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2.601', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4669, 13, '01460/000', '012', b'1111111111111111111111111111111', '5.000', '2.110', 4, 'Kg ', '1A  ', 'BAJA      ', 4, 'Kg ', '01460/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2.040', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4669, 15, '01460/000', '014', b'1111111111111111111111111111111', '10.000', '3.140', 4, 'Kg ', '1A  ', 'BAJA      ', 4, 'Kg ', '01460/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2.040', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4669, 121, '01460/000', '525', b'1111111111111111111111111111111', '6.000', '0.860', 1, 'UN ', '2J  ', 'BAJA      ', 4, 'Kg ', '01460/000', '0.200', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2.040', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4669, 134, '01460/000', '806', b'1111111111111111111111111111111', '1.000', '3.586', 3, 'CJ ', '22E ', 'x 25 unid ', 4, 'Kg ', 'SOBRES   ', '0.025', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '3.028', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2942, 115, '90962/000', '505', b'1111111111111111111111111111111', '12.000', '4.600', 1, 'UN ', '22D ', 'BAJA      ', 4, 'Kg ', '00962/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '4.600', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3972, 15, '01285/000', '014', b'1111111111111111111111111111111', '10.000', '53.186', 4, 'Kg ', '5A  ', 'Bidon     ', 4, 'Kg ', '01285/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '53.186', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4662, 102, '91453/000', '408', b'1111111111111111111111111111111', '12.000', '0.348', 1, 'UN ', '2OPB', 'Pote      ', 5, 'L  ', 'SOD BICAR', '0.250', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '0.348', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4734, 1, '81514/000', '000', b'1111111111111111111111111111111', '12.000', '0.900', 5, 'L  ', '7A  ', 'BAJA      ', 5, 'L  ', 'S FISIOL ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '0.900', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4669, 1, '01460/000', '000', b'1111111111111111111111111111111', '0.001', '3.253', 4, 'Kg ', '1A  ', '          ', 4, 'Kg ', '01460/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2.040', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2363, 13, '00741/000', '012', b'1111111111111111111111111111111', '5.000', '25.017', 4, 'Kg ', '5A  ', 'Bidon     ', 4, 'Kg ', '00741/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '0.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '25.017', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3972, 1, '01285/000', '000', b'1111111111111111111111111111111', '0.001', '55.423', 4, 'Kg ', '1a', '          ', 4, 'Kg ', '01285/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '46.900', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2960, 90, '90963/000', '310', b'1111111111111111111111111111111', '6.000', '17.540', 5, 'L  ', '2OPB', '          ', 5, 'L  ', 'OLEO     ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '9.300', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3115, 1, '91006/000', '000', b'1111111111111111111111111111111', '1.000', '91.590', 1, 'UN ', '1c2 ', 'Disp x 20u', 1, 'UN ', 'MCACAO   ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '4.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '91.590', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3950, 10, '01272/000', '009', b'1111111111111111111111111111111', '0.500', '50.800', 4, 'Kg ', '2GI ', 'BAJA      ', 4, 'Kg ', '01272/000', '0.500', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '50.800', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(99, 1, '90049/000', '000', b'1111111111111111111111111111111', '0.001', '3.010', 5, 'L  ', '    ', 'BAJA      ', 5, 'L  ', 'AGUA D AL', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '4.330', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5802, 13, '00072/000', '012', b'1111111111111111111111111111111', '5.000', '5.026', 4, 'Kg ', '21BI', '          ', 4, 'Kg ', '00072/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '3.341', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4435, 11, '01414/000', '010', b'1111111111111111111111111111111', '1.000', '52.360', 4, 'Kg ', '2GI ', 'BAJA      ', 4, 'Kg ', '01414/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '52.360', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4435, 18, '01414/000', '017', b'1111111111111111111111111111111', '25.000', '27.030', 4, 'Kg ', '1A  ', 'Cu?ete    ', 4, 'Kg ', '01414/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '27.030', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4435, 1, '01414/000', '000', b'1111111111111111111111111111111', '0.001', '33.853', 4, 'Kg ', '1A  ', '          ', 4, 'Kg ', '01414/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '27.030', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4435, 7, '01414/000', '006', b'1111111111111111111111111111111', '0.100', '33.853', 4, 'Kg ', '23GI', '          ', 4, 'Kg ', '01414/000', '0.100', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '31.059', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4435, 9, '01414/000', '008', b'1111111111111111111111111111111', '0.250', '32.398', 4, 'Kg ', '23GI', '          ', 4, 'Kg ', '01414/000', '0.250', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '29.654', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(116, 90, '01180/000', '310', b'1111111111111111111111111111111', '1.000', '9.070', 5, 'L  ', '22CE', '          ', 5, 'L  ', 'OXIGENADA', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '17.738', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(146, 86, '91992/000', '306', b'1111111111111111111111111111111', '12.000', '5.100', 1, 'UN ', '22D ', '          ', 5, 'L  ', 'ALC BORIC', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '19.600', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3052, 1, '00988/000', '000', b'1111111111111111111111111111111', '0.001', '1.715', 4, 'Kg ', '1A  ', '          ', 4, 'Kg ', 'MAGCLOR  ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '1.130', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3052, 11, '00988/000', '010', b'1111111111111111111111111111111', '1.000', '1.715', 4, 'Kg ', '21BI', '          ', 4, 'Kg ', 'MAGCLOR  ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '1.590', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3052, 13, '00988/000', '012', b'1111111111111111111111111111111', '5.000', '1.509', 4, 'Kg ', '21BI', '          ', 4, 'Kg ', 'MAGCLOR  ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '1.396', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3052, 18, '00988/000', '017', b'1111111111111111111111111111111', '25.000', '1.130', 4, 'Kg ', '1A  ', 'Bolsa     ', 4, 'Kg ', 'MAGCLOR  ', '25.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '1.130', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3052, 27, '00988/000', '027', b'1111111111111111111111111111111', '12.000', '0.164', 1, 'UN ', '22D ', 'BAJA      ', 1, 'UN ', 'MAGCLOR  ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '0.164', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2461, 11, '02160/000', '010', b'1111111111111111111111111111111', '1.000', '14.940', 4, 'Kg ', '21A ', '          ', 4, 'Kg ', '02160/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '14.940', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2461, 15, '02160/000', '014', b'1111111111111111111111111111111', '10.000', '11.302', 4, 'Kg ', '5A  ', 'Balde     ', 4, 'Kg ', '02160/000', '10.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '11.302', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4435, 10, '01414/000', '009', b'1111111111111111111111111111111', '0.500', '31.845', 4, 'Kg ', '23GI', '          ', 4, 'Kg ', '01414/000', '0.500', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '29.117', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5802, 9, '00072/000', '008', b'1111111111111111111111111111111', '0.250', '4.100', 4, 'Kg ', 'VS  ', 'BAJA      ', 4, 'Kg ', '00072/000', '0.250', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2.900', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3950, 7, '01272/000', '006', b'1111111111111111111111111111111', '0.100', '61.814', 4, 'Kg ', '23GI', '          ', 4, 'Kg ', '01272/000', '0.100', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '56.535', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3423, 5, '01138/000', '004', b'1111111111111111111111111111111', '0.025', '173.032', 4, 'Kg ', '3B  ', '          ', 4, 'Kg ', '01138/000', '0.025', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '158.708', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2363, 15, '00741/000', '014', b'1111111111111111111111111111111', '10.000', '23.877', 4, 'Kg ', '5A  ', 'Bidon     ', 4, 'Kg ', '00741/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '0.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '23.877', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2363, 60, '00741/000', '063', b'1111111111111111111111111111111', '210.000', '14.240', 4, 'Kg ', '1A  ', 'Tambor    ', 4, 'Kg ', '00741/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '0.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '14.240', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(99, 88, '90049/000', '308', b'1111111111111111111111111111111', '12.000', '3.010', 1, 'UN ', '2OPB', '          ', 5, 'L  ', 'AGUA D AL', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '4.330', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5802, 1, '00072/000', '000', b'1111111111111111111111111111111', '0.001', '5.679', 4, 'Kg ', '1A  ', '          ', 4, 'Kg ', '00072/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2.900', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2942, 1, '90962/000', '000', b'1111111111111111111111111111111', '0.001', '1.500', 4, 'Kg ', '    ', 'BAJA      ', 4, 'Kg ', '00962/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '1.500', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5802, 15, '00072/000', '014', b'1111111111111111111111111111111', '10.000', '4.100', 4, 'Kg ', '1A  ', 'BAJA      ', 4, 'Kg ', '00072/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2.900', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5802, 17, '00072/000', '016', b'1111111111111111111111111111111', '20.000', '4.100', 4, 'Kg ', '1C2 ', 'BAJA      ', 4, 'Kg ', '00072/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2.900', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5923, 1, '92212/000', '000', b'1111111111111111111111111111111', '6.000', '18.918', 1, 'UN ', '7A  ', '          ', 1, 'UN ', 'TELA ADH ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '6.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '18.918', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5802, 18, '00072/000', '017', b'1111111111111111111111111111111', '25.000', '4.266', 4, 'Kg ', '1A  ', 'Bolsa     ', 4, 'Kg ', '00072/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2.900', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2095, 1, '00819/000', '000', b'1111111111111111111111111111111', '0.001', '2535.500', 4, 'Kg ', '1A  ', '          ', 4, 'Kg ', 'EXTRACTOS', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2110.710', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2095, 6, '00819/000', '005', b'1111111111111111111111111111111', '0.050', '2535.500', 4, 'Kg ', '23HI', '          ', 4, 'Kg ', 'EXTRACTOS', '0.050', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2316.777', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2095, 7, '00819/000', '006', b'1111111111111111111111111111111', '0.100', '2488.260', 4, 'Kg ', '23HI', '          ', 4, 'Kg ', 'EXTRACTOS', '0.100', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2272.798', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2095, 9, '00819/000', '008', b'1111111111111111111111111111111', '0.250', '2461.460', 4, 'Kg ', '23HI', '          ', 4, 'Kg ', 'EXTRACTOS', '0.250', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2248.055', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5358, 1, '01704/000', '000', b'1111111111111111111111111111111', '0.001', '14.956', 4, 'Kg ', 'A1  ', '          ', 4, 'Kg ', '01704/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '11.860', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5358, 7, '01704/000', '006', b'1111111111111111111111111111111', '0.100', '4.000', 4, 'Kg ', 'A1  ', 'BAJA      ', 4, 'Kg ', '01704/000', '0.100', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '11.860', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2363, 11, '00741/000', '010', b'1111111111111111111111111111111', '1.000', '28.519', 4, 'Kg ', '22CE', '          ', 4, 'Kg ', '00741/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '0.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '28.519', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4734, 84, '81514/000', '303', b'1111111111111111111111111111111', '10.000', '0.270', 1, 'UN ', '2OPB', 'BAJA      ', 5, 'L  ', 'S FISIOL ', '0.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '0.270', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5358, 10, '01704/000', '009', b'1111111111111111111111111111111', '0.500', '14.366', 4, 'Kg ', 'A1  ', '          ', 4, 'Kg ', '01704/000', '0.500', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '14.366', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(116, 1, '01180/000', '000', b'1111111111111111111111111111111', '0.001', '9.070', 5, 'L  ', '1a  ', '          ', 5, 'L  ', 'OXIGENADA', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '1.770', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(116, 15, '01180/000', '014', b'1111111111111111111111111111111', '10.000', '5.440', 5, 'L  ', '5A  ', 'Bidon     ', 5, 'L  ', 'OXIGENADA', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '10.879', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(116, 86, '01180/000', '306', b'1111111111111111111111111111111', '12.000', '1.930', 1, 'UN ', '2OPB', 'Gotero    ', 5, 'L  ', 'OXIGENADA', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '3.630', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(116, 88, '01180/000', '308', b'1111111111111111111111111111111', '12.000', '4.250', 1, 'UN ', '2OPB', '          ', 5, 'L  ', 'OXIGENADA', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '8.234', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3814, 124, '01219/000', '530', b'1111111111111111111111111111111', '6.000', '8.134', 1, 'UN ', '22D ', 'BAJA      ', 4, 'Kg ', '01219/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '8.134', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(1050, 1, '00494/000', '000', b'1111111111111111111111111111111', '0.001', '26.240', 4, 'Kg ', '1a  ', '          ', 4, 'Kg ', 'CREMA    ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '15.920', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(1050, 11, '00494/000', '010', b'1111111111111111111111111111111', '1.000', '26.240', 4, 'Kg ', '21A ', '          ', 4, 'Kg ', 'CREMA    ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '24.864', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(1050, 15, '00494/000', '014', b'1111111111111111111111111111111', '10.000', '21.247', 4, 'Kg ', '5A  ', 'Balde     ', 4, 'Kg ', 'CREMA    ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '21.247', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4840, 1, '91546/000', '000', b'1111111111111111111111111111111', '0.001', '9.336', 4, 'Kg ', '    ', 'BAJA      ', 4, 'Kg ', '91546/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '30.300', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4840, 129, '91546/000', '606', b'1111111111111111111111111111111', '12.000', '9.336', 1, 'UN ', '2OPB', 'TALQUERA  ', 4, 'Kg ', '01546/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '9.336', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4840, 131, '91546/000', '723', b'1111111111111111111111111111111', '12.000', '1.300', 1, 'UN ', '2OPB', 'BAJA      ', 4, 'Kg ', '01546/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '30.300', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3950, 11, '01272/000', '010', b'1111111111111111111111111111111', '1.000', '50.800', 4, 'Kg ', '2GI ', 'BAJA      ', 4, 'Kg ', '01272/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '50.800', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3950, 18, '01272/000', '017', b'1111111111111111111111111111111', '25.000', '50.800', 4, 'Kg ', '1A  ', 'Cu?ete    ', 4, 'Kg ', '01272/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '50.800', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(116, 89, '01180/000', '309', b'1111111111111111111111111111111', '12.000', '6.010', 1, 'UN ', '2OPB', '          ', 5, 'L  ', 'OXIGENADA', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '11.756', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(1837, 1, '03521/000', '000', b'1111111111111111111111111111111', '12.000', '3.560', 1, 'UN ', '2N  ', '          ', 1, 'UN ', '03521/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '12.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '3.560', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5358, 18, '01704/000', '017', b'1111111111111111111111111111111', '25.000', '11.860', 4, 'Kg ', 'C5/5', 'Caja      ', 4, 'Kg ', '01704/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '11.860', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3950, 1, '01272/000', '000', b'1111111111111111111111111111111', '0.001', '64.061', 4, 'Kg ', '1A  ', '          ', 4, 'Kg ', '01272/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '50.800', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2960, 89, '90963/000', '309', b'1111111111111111111111111111111', '12.000', '11.030', 1, 'UN ', '2OPB', '          ', 5, 'L  ', 'OLEO     ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '9.300', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5255, 83, '91656/000', '210', b'1111111111111111111111111111111', '1.000', '6.460', 5, 'L  ', '2OPB', 'BAJA      ', 5, 'L  ', 'VASE 180 ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '1.850', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5255, 101, '91656/000', '407', b'1111111111111111111111111111111', '12.000', '0.281', 1, 'UN ', '2OPB', 'Pet       ', 5, 'L  ', 'VASE 180 ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '0.281', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5255, 102, '91656/000', '408', b'1111111111111111111111111111111', '12.000', '0.511', 1, 'UN ', '2OPB', 'Pet       ', 5, 'L  ', 'VASE 180 ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '0.511', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5255, 103, '91656/000', '409', b'1111111111111111111111111111111', '12.000', '0.974', 1, 'UN ', '2OPB', 'Pet       ', 5, 'L  ', 'VASE 180 ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '0.974', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5255, 104, '91656/000', '410', b'1111111111111111111111111111111', '1.000', '1.733', 5, 'L  ', '22D ', 'Pet       ', 5, 'L  ', 'VASE 180 ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '1.220', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2461, 1, '02160/000', '000', b'1111111111111111111111111111111', '0.001', '14.940', 4, 'Kg ', '1A  ', '          ', 4, 'Kg ', '02160/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '5.950', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5722, 89, '91180/000', '309', b'1111111111111111111111111111111', '12.000', '6.010', 1, 'UN ', '2OPB', '          ', 5, 'L  ', 'OXIGENADA', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '1.780', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5358, 11, '01704/000', '010', b'1111111111111111111111111111111', '1.000', '14.092', 4, 'Kg ', 'A1  ', '          ', 4, 'Kg ', '01704/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '14.092', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3972, 11, '01285/000', '010', b'1111111111111111111111111111111', '1.000', '55.423', 4, 'Kg ', '22CE', '          ', 4, 'Kg ', '01285/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '55.423', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4734, 86, '81514/000', '306', b'1111111111111111111111111111111', '12.000', '0.900', 1, 'UN ', '2OPB', 'BAJA      ', 5, 'L  ', 'S FISIOL ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '0.900', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3423, 1, '01138/000', '000', b'1111111111111111111111111111111', '0.001', '188.836', 4, 'Kg ', '3B  ', '          ', 4, 'Kg ', '01138/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '143.230', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3423, 4, '01138/000', '003', b'1111111111111111111111111111111', '0.010', '188.836', 4, 'Kg ', '3B  ', '          ', 4, 'Kg ', '01138/000', '0.010', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '174.513', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2363, 1, '00741/000', '000', b'1111111111111111111111111111111', '0.001', '28.519', 4, 'Kg ', '1A  ', '          ', 4, 'Kg ', '00741/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '0.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '14.240', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5358, 9, '01704/000', '008', b'1111111111111111111111111111111', '0.250', '14.956', 4, 'Kg ', 'A1  ', '          ', 4, 'Kg ', '01704/000', '0.250', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '14.956', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3423, 6, '01138/000', '005', b'1111111111111111111111111111111', '0.050', '167.205', 4, 'Kg ', '3B  ', '          ', 4, 'Kg ', '01138/000', '0.050', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '152.882', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5802, 10, '00072/000', '009', b'1111111111111111111111111111111', '0.500', '4.100', 4, 'Kg ', '2DI ', 'BAJA      ', 4, 'Kg ', '00072/000', '0.500', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2.900', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4662, 130, '91453/000', '608', b'1111111111111111111111111111111', '12.000', '0.287', 1, 'UN ', '2OPB', 'Caja      ', 5, 'L  ', 'SOD BICAR', '0.250', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '0.285', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5770, 1, '00054/000', '000', b'1111111111111111111111111111111', '0.001', '37.986', 4, 'Kg ', 'A1  ', '          ', 4, 'Kg ', '00054/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '19.900', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5770, 11, '00054/000', '010', b'1111111111111111111111111111111', '1.000', '37.986', 4, 'Kg ', 'A1  ', '          ', 4, 'Kg ', '00054/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '37.986', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5770, 13, '00054/000', '012', b'1111111111111111111111111111111', '5.000', '24.896', 4, 'Kg ', 'A1  ', '          ', 4, 'Kg ', '00054/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '24.896', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5770, 18, '00054/000', '017', b'1111111111111111111111111111111', '25.000', '19.900', 4, 'Kg ', 'F3/1', 'Bolsa     ', 4, 'Kg ', '00054/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '19.900', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3950, 6, '01272/000', '005', b'1111111111111111111111111111111', '0.050', '64.061', 4, 'Kg ', '23GI', '          ', 4, 'Kg ', '01272/000', '0.050', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '58.475', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3423, 7, '01138/000', '006', b'1111111111111111111111111111111', '0.100', '163.812', 4, 'Kg ', '3B  ', '          ', 4, 'Kg ', '01138/000', '0.100', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '149.488', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4669, 18, '01460/000', '017', b'1111111111111111111111111111111', '25.000', '2.040', 4, 'Kg ', '1A  ', 'BAJA      ', 4, 'Kg ', '01460/000', '25.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2.040', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3950, 5, '01272/000', '004', b'1111111111111111111111111111111', '0.025', '50.800', 4, 'Kg ', '2GI ', 'BAJA      ', 4, 'Kg ', '01272/000', '0.025', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '50.800', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3116, 1, '81006/000', '000', b'1111111111111111111111111111111', '3.000', '85.590', 1, 'UN ', '1c2', '          ', 1, 'UN ', 'MCACAO   ', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '1.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '85.590', b'1111111111111111111111111111111', b'1111111111111111111111111111111');
INSERT INTO `produ_frac` (`id_Producto`, `id_Fraccio`, `Codigo_producto`, `Codigo_Fraccio`, `cruz`, `Minimo`, `Costo`, `id_Ume_Vta`, `Ume_Vta`, `Ubicacion`, `Descripcion`, `id_Ume_Frac`, `Ume_Frac`, `Agrupa`, `Factor`, `Baja`, `Habil_Cot`, `Habil_Pre`, `Habil_Ped`, `Indice`, `Cantidad_Pack`, `Porc_Minimo`, `EnWeb`, `Id_Ubicacion`, `Permitir_Vendedores`, `Costo_MP`, `Trazabilidad`, `Controla_Envase`) VALUES
(3950, 9, '01272/000', '008', b'1111111111111111111111111111111', '0.250', '60.098', 4, 'Kg ', '23GI', '          ', 4, 'Kg ', '01272/000', '0.250', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '54.958', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5358, 13, '01704/000', '012', b'1111111111111111111111111111111', '5.000', '14.121', 4, 'Kg ', 'A1  ', '          ', 4, 'Kg ', '01704/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '14.121', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5722, 86, '91180/000', '306', b'1111111111111111111111111111111', '12.000', '1.930', 1, 'UN ', '2OPB', 'Gotero    ', 5, 'L  ', 'OXIGENADA', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '1.780', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5722, 88, '91180/000', '308', b'1111111111111111111111111111111', '12.000', '4.250', 1, 'UN ', '2OPB', '          ', 5, 'L  ', 'OXIGENADA', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '1.780', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4669, 20, '01460/000', '019', b'1111111111111111111111111111111', '40.000', '2.040', 4, 'Kg ', '1A  ', 'Cu?ete    ', 4, 'Kg ', '01460/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.001', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2.040', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5877, 1, '00041/000', '000', b'1111111111111111111111111111111', '1.000', '6.050', 3, 'CJ ', '22D ', 'BAJA      ', 3, 'CJ ', '00041/000', '1.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '1.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '6.050', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3423, 9, '01138/000', '008', b'1111111111111111111111111111111', '0.250', '142.600', 4, 'Kg ', '3B  ', 'BAJA      ', 4, 'Kg ', '01138/000', '0.250', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '143.230', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4669, 107, '01460/000', '425', b'1111111111111111111111111111111', '12.000', '0.860', 1, 'UN ', '2J  ', 'BAJA      ', 4, 'Kg ', '01460/000', '0.200', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '2.040', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4662, 129, '91453/000', '606', b'1111111111111111111111111111111', '12.000', '0.178', 1, 'UN ', '2OPB', 'Caja      ', 5, 'L  ', 'SOD BICAR', '0.100', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '0.176', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5672, 1, '92090/000', '000', b'1111111111111111111111111111111', '1.000', '42.750', 1, 'UN ', '7A  ', '          ', 1, 'UN ', '02090/000', '0.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', '0.000', '0.000', '20.000', b'1111111111111111111111111111111', 0, b'1111111111111111111111111111111', '42.750', b'1111111111111111111111111111111', b'1111111111111111111111111111111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produ_ma`
--

CREATE TABLE `produ_ma` (
  `id` int(11) NOT NULL,
  `Codigo_Producto` char(9) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `id_Ume_Cpra` int(11) DEFAULT NULL,
  `Ume_Cpra` varchar(3) DEFAULT NULL,
  `id_Ume_Vta` int(11) DEFAULT NULL,
  `Ume_Vta` varchar(3) DEFAULT NULL,
  `Factor_Conver` decimal(12,3) DEFAULT NULL,
  `id_Rubro_Cpra` int(11) DEFAULT NULL,
  `Rubro_Cpra` varchar(11) DEFAULT NULL,
  `id_Rubro_Vta` int(11) DEFAULT NULL,
  `Rubro_Vta` varchar(11) DEFAULT NULL,
  `Costo` decimal(12,3) DEFAULT NULL,
  `Ubicacion` varchar(4) DEFAULT NULL,
  `id_Moneda` int(11) DEFAULT NULL,
  `Codigo_Moneda` varchar(3) DEFAULT NULL,
  `Minimo` decimal(12,3) DEFAULT NULL,
  `Tipo_Iva` char(1) DEFAULT NULL,
  `Id_Tipo` int(11) DEFAULT NULL,
  `Tipo` char(1) DEFAULT NULL,
  `senal` char(1) DEFAULT NULL,
  `Residuo` bit(1) DEFAULT NULL,
  `Tipo_Ing_Brutos` smallint(6) DEFAULT NULL,
  `Nadi` varchar(20) DEFAULT NULL,
  `Porc_Minimo` decimal(12,3) DEFAULT NULL,
  `Baja` bit(1) DEFAULT NULL,
  `Sedronar` bit(1) DEFAULT NULL,
  `Refrigerado` bit(1) DEFAULT NULL,
  `Id_Marca` int(11) DEFAULT NULL,
  `Id_Especialidad` int(11) DEFAULT NULL,
  `Parafarm` bit(1) DEFAULT NULL,
  `Costo_MP` decimal(12,3) DEFAULT NULL,
  `Trazabilidad` bit(1) DEFAULT NULL,
  `Imprime_Envase` bit(1) DEFAULT NULL,
  `Imprime_Etiq_Cliente` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `produ_ma`
--

INSERT INTO `produ_ma` (`id`, `Codigo_Producto`, `Descripcion`, `id_Ume_Cpra`, `Ume_Cpra`, `id_Ume_Vta`, `Ume_Vta`, `Factor_Conver`, `id_Rubro_Cpra`, `Rubro_Cpra`, `id_Rubro_Vta`, `Rubro_Vta`, `Costo`, `Ubicacion`, `id_Moneda`, `Codigo_Moneda`, `Minimo`, `Tipo_Iva`, `Id_Tipo`, `Tipo`, `senal`, `Residuo`, `Tipo_Ing_Brutos`, `Nadi`, `Porc_Minimo`, `Baja`, `Sedronar`, `Refrigerado`, `Id_Marca`, `Id_Especialidad`, `Parafarm`, `Costo_MP`, `Trazabilidad`, `Imprime_Envase`, `Imprime_Etiq_Cliente`) VALUES
(41, '00856/000', 'ACEITE DE HIGADO DE BACALAO                       ', 5, 'L  ', 5, 'L  ', '1.000', 0, '', 19, '030600', '50.350', '    ', 2, 'U$S', '0.001', 'G', 3, 'F', '', b'1111111111111111111111111111111', 3, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '6.873', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(99, '90049/000', 'AGUA D ALIBOUR FNA VI                             ', 5, 'L  ', 5, 'L  ', '1.000', 0, '', 83, '100000', '1.600', '    ', 1, '$  ', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 4, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '4.330', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(116, '01180/000', 'AGUA OXIGENADA  10 VOL FNA VI                     ', 5, 'L  ', 5, 'L  ', '1.000', 0, '', 83, '100000', '4.950', '    ', 1, '$  ', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 4, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '1.770', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(146, '91992/000', 'ALCOHOL BORICADO                                  ', 5, 'L  ', 5, 'L  ', '1.000', 0, '', 83, '100000', '0.400', '    ', 1, '$  ', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 3, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '19.600', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(1050, '00494/000', 'CREMA BASE HIDROSOLUBLE                           ', 4, 'Kg ', 4, 'Kg ', '1.000', 0, '', 80, '110000', '12.300', '    ', 1, '$  ', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 3, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '15.920', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(1837, '03521/000', 'ENV VIDRIO GOTERO X 30 C/PIPETA VD                ', 1, 'UN ', 1, 'UN ', '1.000', 3, 'PTENV01', 31, '080200', '3.560', '    ', 1, '$  ', '0.001', 'G', 4, 'R', '', b'1111111111111111111111111111111', 0, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '3.560', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2095, '00819/000', 'EXTRACTO SECO DE HAMAMELIS                        ', 4, 'Kg ', 4, 'Kg ', '1.000', 0, '', 23, '030703', '1132.230', '    ', 1, '$  ', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 3, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '2110.710', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2363, '00741/000', 'FORMOL AL 37 %                                    ', 4, 'Kg ', 4, 'Kg ', '1.000', 0, '', 14, '030100', '12.800', '    ', 1, '$  ', '0.001', 'G', 3, 'F', '', b'1111111111111111111111111111111', 3, '                    ', '0.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '14.240', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2461, '02160/000', 'GEL BASE INCOLORO                                 ', 4, 'Kg ', 4, 'Kg ', '1.000', 0, '', 80, '110000', '9.150', '    ', 1, '$  ', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 3, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '5.950', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2942, '90962/000', 'LIMONADA ROGE                                     ', 4, 'Kg ', 4, 'Kg ', '1.000', 0, '           ', 83, '100000     ', '0.620', '    ', 1, '$  ', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 4, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '0.620', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2960, '90963/000', 'LINIMENTO OLEO CALCAREO                           ', 5, 'L  ', 5, 'L  ', '1.000', 0, '', 83, '100000', '8.450', '    ', 1, '$  ', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 4, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '9.300', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3052, '00988/000', 'MAGNESIO CLORURO 6H2O                             ', 4, 'Kg ', 4, 'Kg ', '1.000', 0, '', 14, '030100', '1.163', '    ', 11, 'EUR', '0.001', 'G', 3, 'F', '', b'1111111111111111111111111111111', 2, '0                   ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '1.130', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3115, '91006/000', 'MANTECA DE CACAO LAPICES                          ', 3, 'CJ ', 3, 'CJ ', '1.000', 0, '', 83, '100000', '91.590', '    ', 1, '$  ', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 4, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '91.590', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3116, '81006/000', 'MANTECA DE CACAO LAPICES                          ', 3, 'CJ ', 3, 'CJ ', '1.000', 0, '', 83, '100000', '85.590', '    ', 1, '$  ', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 4, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '85.590', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3423, '01138/000', 'NORTRIPTILINA CLORHIDRATO  Sicotrop L4            ', 4, 'Kg ', 4, 'Kg ', '1.000', 0, '', 57, '010400', '142.600', '    ', 2, 'U$S', '0.001', 'G', 3, 'F', '', b'1111111111111111111111111111111', 2, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '143.230', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3814, '01219/000', 'PASTA LASSAR FNA VI                               ', 4, 'Kg ', 4, 'Kg ', '1.000', 0, '', 80, '110000', '22.650', '    ', 1, '$  ', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 4, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '47.100', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3950, '01272/000', 'PIROXICAM                                         ', 4, 'Kg ', 4, 'Kg ', '1.000', 0, '', 12, '010100', '50.800', '    ', 2, 'U$S', '0.001', 'G', 3, 'F', '', b'1111111111111111111111111111111', 2, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '50.800', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3972, '01285/000', 'PLOMO SUBACETATO SOLUCION                         ', 4, 'Kg ', 4, 'Kg ', '1.000', 0, '', 80, '110000', '22.350', '    ', 1, '$  ', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 3, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '46.900', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4435, '01414/000', 'RUTIN                                             ', 4, 'Kg ', 4, 'Kg ', '1.000', 0, '', 12, '010100', '52.360', '    ', 2, 'U$S', '0.001', 'G', 3, 'F', '', b'1111111111111111111111111111111', 2, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '27.030', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4662, '91453/000', 'SODIO BICARBONATO USP                             ', 4, 'Kg ', 4, 'Kg ', '1.000', 0, '', 52, '180000', '0.410', '    ', 2, 'U$S', '0.001', 'G', 3, 'F', '', b'1111111111111111111111111111111', 3, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '0.690', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4669, '01460/000', 'SODIO BORATO PURO                                 ', 4, 'Kg ', 4, 'Kg ', '1.000', 0, '', 14, '030100', '3.260', '    ', 2, 'U$S', '0.001', 'G', 3, 'F', '', b'1111111111111111111111111111111', 3, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '2.040', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4734, '81514/000', 'SOLUCION FISIOLOGICA                              ', 5, 'L  ', 5, 'L  ', '1.000', 0, '           ', 83, '100000     ', '0.200', '    ', 1, '$  ', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 3, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '0.200', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4840, '91546/000', 'TALCO MENTOLADO                                   ', 4, 'Kg ', 4, 'Kg ', '1.000', 0, '', 83, '100000', '1.510', '    ', 1, '$  ', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 3, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '30.300', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5255, '91656/000', 'VASELINA LIQ PURA 180 FNA VI                      ', 5, 'L  ', 5, 'L  ', '1.000', 0, '', 83, '100000', '2.520', '    ', 2, 'U$S', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 3, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '1.220', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5358, '01704/000', 'VITAMINA C (ACIDO ASCORBICO)                      ', 4, 'Kg ', 4, 'Kg ', '1.000', 0, '', 26, '030900', '4.000', '    ', 2, 'U$S', '0.001', 'G', 3, 'F', '', b'1111111111111111111111111111111', 2, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '11.860', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5672, '92090/000', 'BOTIQUIN PRACTIBOLSO C/10 ELEMENTOS               ', 1, 'UN ', 1, 'UN ', '1.000', 0, '', 74, '090700', '42.750', '    ', 1, '$  ', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 0, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '42.750', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5722, '91180/000', 'AGUA OXIGENADA  10 VOL FNA VI                     ', 5, 'L  ', 5, 'L  ', '1.000', 0, '', 83, '100000', '3.250', '    ', 1, '$  ', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 4, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '1.780', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5745, '91514/000', 'SOLUCION FISIOLOGICA                              ', 5, 'L  ', 5, 'L  ', '1.000', 0, '', 83, '100000', '0.440', '    ', 1, '$  ', '0.001', 'G', 5, 'P', '', b'1111111111111111111111111111111', 3, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '0.770', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5770, '00054/000', 'ALMIDON DE MAIZ                                   ', 4, 'Kg ', 4, 'Kg ', '1.000', 0, '', 25, '030800', '15.803', '    ', 1, '$  ', '0.001', 'G', 3, 'F', '', b'1111111111111111111111111111111', 3, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '19.900', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5802, '00072/000', 'ALUMINIO HIDROXIDO GEL DESECADO                   ', 4, 'Kg ', 4, 'Kg ', '1.000', 0, '', 14, '030100', '5.059', '    ', 2, 'U$S', '0.001', 'G', 3, 'F', '', b'1111111111111111111111111111111', 2, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '2.900', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5877, '00041/000', 'ALCANFOR PANCITOS 1/8 X 128 U                     ', 3, 'CJ ', 3, 'CJ ', '1.000', 0, '', 14, '030100', '6.050', '    ', 2, 'U$S', '0.001', 'G', 1, 'V', '', b'1111111111111111111111111111111', 0, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '6.050', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5923, '92212/000', 'CINTA ADHESIVA MICROPOR HIP 5.00CMX4.5M           ', 1, 'UN ', 1, 'UN ', '1.000', 0, '', 70, '090200', '18.918', '    ', 1, '$  ', '0.001', 'G', 4, 'R', '', b'1111111111111111111111111111111', 0, '                    ', '20.000', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111', 0, 0, b'1111111111111111111111111111111', '18.918', b'1111111111111111111111111111111', b'1111111111111111111111111111111', b'1111111111111111111111111111111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repar_ma`
--

CREATE TABLE `repar_ma` (
  `Id` int(11) NOT NULL,
  `Codigo` varchar(4) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Id_Transporte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `repar_ma`
--

INSERT INTO `repar_ma` (`Id`, `Codigo`, `Descripcion`, `Id_Transporte`) VALUES
(1, 'A1', 'CLIENTES SELECCIONADOS', 0),
(2, 'A2', '1009/29/31/33/45/1225/26/27', 0),
(3, 'A3', '1131/1133/1135', 0),
(4, 'A4', '1101/1230/31/32/2341/2571/2591', 0),
(5, 'A5', '1019/1063', 0),
(6, 'A6', '0041/0047/0066', 0),
(7, 'A7', '0010/0011/0071', 0),
(8, 'A8', '1065/1070/1071/1073', 0),
(9, 'A9', '1182/1183/1187', 0),
(10, 'B1', '0012/0013', 0),
(11, 'B2', '1001', 0),
(12, 'B3', '0017/0053/0054/0055/0056/0058', 0),
(13, 'B4', '1153/55/57/58/59/60/62/66/68', 0),
(14, 'B5', '0025/0031/0067', 0),
(15, 'B6', '1061/1067/1069/1077/1079/1081', 0),
(16, 'B7', '1177/1178/1179/1181', 0),
(17, 'B8', '1137/1139/1189', 0),
(18, 'B9', '0039/0049/0065/0069', 0),
(19, 'C1', '0001/0002', 0),
(20, 'C2', '1161/1163/1164/1165/1167/1169', 0),
(21, 'C3', '1005/1017/1021', 0),
(22, 'C4', '1055/1057/1060', 0),
(23, 'C5', '1083/1085/1087/1103/05/07/09', 0),
(24, 'C6', '0044', 0),
(25, 'C7', '0015/0019/0022/0046', 0),
(26, 'C8', '1185/1215/1217', 0),
(27, 'C9', '1072/1075/1089/91/93/95/97/99', 0),
(28, 'D1', '0004/0024/0026/0028/0030/0070', 0),
(29, 'D2', '0043/0050', 0),
(30, 'E1', 'COFARQUIL', 0),
(31, 'E2', 'ASOPROFARMA/PLATAFARM', 0),
(32, 'E3', 'COFALU/COFASA/COFALOZA/MACOFAR', 0),
(33, 'E4', 'DROGUERIA AMERICANA', 0),
(34, 'E5', 'COFALU/COFARQUIL', 0),
(35, 'F1', 'F1', 0),
(36, 'I1', 'INTERIOR 1', 0),
(37, 'I2', 'INTERIOR 2', 0),
(38, 'I3', 'INTERIOR 3', 0),
(39, 'I4', 'INTERIOR 4', 0),
(40, 'I5', 'INTERIOR DIRECTOS', 0),
(41, 'S1', 'ZONA 1175 VALENTIN ALSINA', 0),
(42, 'S2', 'OTROS SUPERMERCADOS', 0),
(43, 'L1', 'LABORATORIOS Y SIM SELECCION', 0),
(44, 'I6', 'INTERIOR COOP Y DISTRIB', 0),
(45, 'FR', 'CLIENTES FUERA DE REPARTO', 0),
(46, 'D3', '0006/0014/0016', 0),
(47, 'D4', '1022/1059', 0),
(48, 'D5', '0018/0020/0032/0034', 0),
(49, 'D6', '1003', 0),
(50, 'D7', '0021/0057', 0),
(51, 'D8', '0035/0059/0060', 0),
(52, 'D9', '1129/1173', 0),
(53, 'Z2', '1035/37/38/39/41/43/1228', 0),
(54, 'Z3', '1143/1145', 0),
(55, 'Z5', '1047/1049/1051/1053', 0),
(56, 'Z7', '0029/0051/0061/0062/0063', 0),
(57, 'Z8', '1111/13/15/17/19/21/23/25/26/7', 0),
(58, 'Z9', '1191/93/95/97/99/1201/3/5/7/9', 0),
(59, 'Y2', '1007/1015/1016', 0),
(60, 'Y5', '0033/0037', 0),
(61, 'Y8', '1147/1149/1151', 0),
(62, 'Y9', '0009/0027', 0),
(63, 'W5', '0038/0042', 0),
(64, 'Z6', '1013/1023', 0),
(65, 'W2', '1138/1141', 0),
(66, 'Y3', '1011/1025/1027', 0),
(67, 'Y6', '0045', 0),
(68, 'Y7', '0003/0005/0007', 0),
(69, 'W8', '1211/1213/1219/1221/1223', 0),
(70, 'Z1', '0036/0040/0048/0064', 0),
(71, 'X2', '0068', 0),
(72, 'W7', '0008', 0),
(73, 'W9', '1175', 0),
(74, 'X5', '0023', 0),
(75, 'M2', '', 0),
(76, 'M3', '', 0),
(77, 'M4', '', 0),
(78, 'M5', '', 0),
(79, 'R1', '', 0),
(80, 'R2', '', 0),
(81, 'R4', '', 0),
(82, 'R3', '', 0),
(83, 'T1', '', 0),
(84, 'T2', '', 0),
(85, 'T3', '', 0),
(86, 'T4', '', 0),
(87, 'T5', '', 0),
(88, 'T6', '', 0),
(89, 'R5', '', 0),
(90, 'R6', '', 0),
(91, 'R7', '', 0),
(92, 'R8', '', 0),
(93, 'I11', '.', 0),
(94, 'M1', '', 0),
(95, 'I7', 'INTERIOR', 0),
(96, 'I8', 'INTERIOR', 0),
(97, 'I9', 'INTERIOR', 0),
(98, 'R9', 'CAPITAL FEDERAL', 0),
(99, 'T7', '1177/1181', 0),
(100, 'N5', 'ZONA 37', 0),
(101, 'N6', 'ZONA 31', 0),
(102, 'E6', 'AMERICANA', 0),
(103, 'F2', '.', 0),
(104, 'I12', '.', 0),
(105, 'I13', '.', 0),
(106, 'I14', '.', 0),
(107, 'I15', '.', 0),
(108, 'I10', '.', 0),
(109, 'I16', '.', 0),
(110, 'I17', '.', 0),
(111, 'AG', 'AGREGADOS', 0),
(112, 'F3', 'JURISDICCIONES 10 Y 70', 0),
(113, 'F4', 'JURISDICCION 1053', 0),
(114, 'F5', 'JURISDICCIONES 40 Y 66', 0),
(115, 'I18', '.', 0),
(116, 'M6', ' ', 0),
(117, 'M7', ' ', 0),
(118, 'I0', 'INTERIOR DIRECTOS', 0),
(119, 'F6', ' ', 0),
(120, 'N1', ' ', 0),
(121, 'N2', ' ', 0),
(122, 'W1', '0036', 0),
(123, 'RM', 'REPARTO MOSTRADOR', 0),
(124, 'W3', '1069/70/71/72/73', 0),
(125, 'W4', '1177/78', 0),
(126, 'VD', 'VENDEDORES', 0),
(127, '011', '', 0),
(128, '012', '', 0),
(129, '013', '', 0),
(130, '014', '', 0),
(131, '015', '', 0),
(132, '021', '', 0),
(133, '022', '', 0),
(134, '023', '', 0),
(135, '024', '', 0),
(136, '025', '', 0),
(137, '031', '', 0),
(138, '032', '', 0),
(139, '033', '', 0),
(140, '034', '', 0),
(141, '035', '', 0),
(142, '041', '', 0),
(143, '042', '', 0),
(144, '043', '', 0),
(145, '044', '', 0),
(146, '045', '', 0),
(147, '051', '', 0),
(148, '052', '', 0),
(149, '053', '', 0),
(150, '054', '', 0),
(151, '055', '', 0),
(152, '061', '', 0),
(153, '062', '', 0),
(154, '063', '', 0),
(155, '065', '', 0),
(156, '071', '', 0),
(157, '072', '', 0),
(158, '073', '', 0),
(159, '074', '', 0),
(160, '075', '', 0),
(161, '081', '', 0),
(162, '082', '', 0),
(163, '083', '', 0),
(164, '084', '', 0),
(165, '085', '', 0),
(166, '091', '', 0),
(167, '093', '', 0),
(168, '094', '', 0),
(169, '095', '', 0),
(170, '102', '', 0),
(171, '104', '', 0),
(172, '105', '', 0),
(173, '111', '', 0),
(174, '112', '', 0),
(175, '113', '', 0),
(176, '114', '', 0),
(177, '115', '', 0),
(178, '121', '', 0),
(179, '122', '', 0),
(180, '123', '', 0),
(181, '124', '', 0),
(182, '125', '', 0),
(183, '132', '', 0),
(184, '133', '', 0),
(185, '134', '', 0),
(186, '135', '', 0),
(187, '141', '', 0),
(188, '142', '', 0),
(189, '143', '', 0),
(190, '144', '', 0),
(191, '145', '', 0),
(192, '161', '', 0),
(193, '162', '', 0),
(194, '163', '', 0),
(195, '165', '', 0),
(196, '001', '', 0),
(197, '002', '', 0),
(198, '003', '', 0),
(199, '004', '', 0),
(200, '005', '', 0),
(201, '131', '', 0),
(202, 'I34', 'INTERIOR 34', 0),
(203, 'IAG', 'AGREGADOS DE INTERIOR', 0),
(204, 'TS', 'TRANSPORTE SAPORITI', 0),
(205, 'I35', 'INTERIOR 35', 0),
(206, 'CAIZ', 'CAIZ', 0),
(207, '103', '', 0),
(208, 'ROCA', 'ROCA', 0),
(209, 'DT', 'DT', 0),
(210, 'EP', 'ENCOPRESS', 0),
(211, 'TRL', 'EXPRESO TROLE SA', 0),
(212, 'VIA1', 'VIA1', 0),
(213, 'RCT', 'RCT', 0),
(214, 'RC', 'Agregado de roca', 0),
(215, 'MACH', 'MACH5', 0),
(216, 'LPT', 'LA PLATA', 0),
(217, '171', '', 0),
(218, '172', '', 0),
(219, '173', '', 0),
(220, '174', '', 0),
(221, '175', '', 0),
(222, 'ZZZZ', 'FACTURACION MANUAL', 0),
(223, 'ZZ', 'FACTURACION MANUAL EXC', 0),
(224, 'FE', 'Factura de exportacion', 0),
(225, 'FEX', 'Factura electronica de exportacion', 0),
(226, 'DOL', 'Facturacion en Dolares', 0),
(227, 'SF', 'SOLO FACTURAR', 0),
(228, 'VA', 'Vales', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubro_ma`
--

CREATE TABLE `rubro_ma` (
  `Id` int(11) NOT NULL,
  `Rubro` char(11) DEFAULT NULL,
  `SubRubro` char(4) DEFAULT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Clase` char(1) DEFAULT NULL,
  `Tipo_Factura` smallint(6) DEFAULT NULL,
  `Nivel_Habil` smallint(6) DEFAULT NULL,
  `Leyenda` varchar(250) DEFAULT NULL,
  `Especialidad` smallint(6) DEFAULT NULL,
  `Color` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rubro_ma`
--

INSERT INTO `rubro_ma` (`Id`, `Rubro`, `SubRubro`, `Descripcion`, `Clase`, `Tipo_Factura`, `Nivel_Habil`, `Leyenda`, `Especialidad`, `Color`) VALUES
(1, 'PTACC01', '12', 'ACCESORIOS                              ', 'C', 0, 1, '                                                                                                                        ', 0, 0),
(2, 'PROTEO000', '', 'PROTEOLIZADOS                           ', 'C', 0, 1, 'ENVASES ORIGINAL-ESTERILIZ                                                                                              ', 0, 0),
(3, 'PTENV01', '', 'ENV. COSMETICOS, PIPETAS                ', 'C', 1, 0, '                                                                                                                        ', 0, 0),
(4, 'PTCREM01', '', 'BIO EXEL: CREMAS, GELES Y BRONCEADORES  ', 'C', 0, 1, '                                                                                                                        ', 0, 0),
(5, 'PTACSUP01', '', 'AMPOLLAS                                ', 'C', 0, 1, '                                                                                                                        ', 0, 0),
(6, 'PTBACH01', '', 'FLORES DE BACH                          ', 'C', 0, 1, '                                                                                                                        ', 0, 0),
(7, 'PTACSUP02', '', 'COMPRIMIDOS                             ', 'C', 0, 1, '                                                                                                                        ', 0, 0),
(8, 'PTACSUP03', '', 'SUPLEMENTOS DIETARIOS                   ', 'C', 0, 1, '                                                                                                                        ', 0, 0),
(9, 'PTACSUP04', '', 'VARIOS                                  ', 'C', 0, 1, '                                                                                                                        ', 0, 0),
(10, 'PTDESC01', '', 'AGUJAS, JERINGAS                        ', 'C', 0, 1, '                                                                                                                        ', 0, 0),
(11, '000000', '', 'VARIOS                                  ', 'T', 1, 0, '', 0, 0),
(12, '010100', '', 'DROGAS MEDICINALES GENERALES            ', 'T', 1, 0, '', 0, 0),
(13, '010700', '', 'MICROGRANULOS                           ', 'T', 1, 0, '', 0, 0),
(14, '030100', '', 'PRODUCTOS VARIOS                        ', 'T', 1, 0, '', 0, 0),
(15, '030200', '', 'ESENCIAS                                ', 'T', 1, 0, '', 0, 0),
(16, '030300', '', 'OPOTERAPICOS                            ', 'T', 1, 0, '', 0, 0),
(17, '030400', '', 'PROTEOLIZADOS                           ', 'T', 1, 0, '', 0, 0),
(18, '030500', '', 'TINTURAS                                ', 'T', 1, 0, '', 0, 0),
(19, '030600', '', 'ACEITES                                 ', 'T', 1, 0, '', 0, 0),
(20, '030700', '', 'EXTRACTOS                               ', 'T', 1, 0, '', 0, 0),
(21, '030701', '', 'BLANDOS                                 ', 'T', 1, 0, '', 0, 0),
(22, '030702', '', 'FLUIDOS                                 ', 'T', 1, 0, '', 0, 0),
(23, '030703', '', 'SECOS                                   ', 'T', 1, 0, '', 0, 0),
(24, '030704', '', 'GLICOLICOS                              ', 'T', 1, 0, '', 0, 0),
(25, '030800', '', 'EXCIPIENTES                             ', 'T', 1, 0, '', 0, 0),
(26, '030900', '', 'VITAMINAS                               ', 'T', 1, 0, '', 0, 0),
(27, '031000', '', 'AMINOACIDOS                             ', 'T', 1, 0, '', 0, 0),
(28, '040000', '', 'PRODUCTOS COSMETICOS                    ', 'T', 1, 0, '', 0, 0),
(29, '070000', '', 'ACCESORIOS Y EQUIPOS PARA LA FARMACIA   ', 'T', 1, 0, '', 0, 0),
(30, '080100', '', 'PLASTICO                                ', 'T', 1, 0, '', 0, 0),
(31, '080200', '', 'VIDRIO                                  ', 'T', 1, 0, '', 0, 0),
(32, '080300', '', 'PVC                                     ', 'T', 1, 0, '', 0, 0),
(33, '080400', '', 'PET                                     ', 'T', 1, 0, '', 0, 0),
(34, '080500', '', 'BOLSAS DE POLIETILENO                   ', 'T', 1, 0, '', 0, 0),
(35, '080600', '', 'CAJAS DE CARTON                         ', 'T', 1, 0, '', 0, 0),
(36, '080700', '', 'TUBOS POLISTOR                          ', 'T', 1, 0, '', 0, 0),
(37, '080800', '', 'BANDAS DE SEGURIDAD - FAJAS DE GARANTIA ', 'T', 1, 0, '', 0, 0),
(38, '080900', '', 'ESTUCHES                                ', 'T', 1, 0, '', 0, 0),
(39, '081000', '', 'TAMBORES                                ', 'T', 1, 0, '', 0, 0),
(40, '081100', '', 'ACCESORIOS PARA ENVASES                 ', 'T', 1, 0, '', 0, 0),
(41, '081200', '', 'BIDONES Y BALDES                        ', 'T', 1, 0, '', 0, 0),
(42, '081300', '', 'ETIQUETAS                               ', 'T', 1, 0, '', 0, 0),
(43, '081400', '', 'ENVASES COSMETICOS                      ', 'T', 1, 0, '', 0, 0),
(44, '081500', '', 'BOBINAS                                 ', 'T', 1, 0, '', 0, 0),
(45, '089000', '', 'OTROS                                   ', 'T', 1, 0, '', 0, 0),
(46, '120000', '', 'HIERBAS MEDICINALES                     ', 'T', 1, 0, '', 0, 0),
(47, '130000', '', 'MUEBLES PARA OFICINA                    ', 'T', 1, 0, '', 0, 0),
(48, '140000', '', 'COMPUTACION                             ', 'T', 1, 0, '', 0, 0),
(49, '150000', '', 'MAQUINARIAS                             ', 'T', 1, 0, '', 0, 0),
(50, '160000', '', 'LIBRERIA                                ', 'T', 1, 0, '', 0, 0),
(51, '170000', '', 'INSUMOS                                 ', 'T', 1, 0, '', 0, 0),
(52, '180000', '', 'OFERTAS                                 ', 'T', 1, 0, '', 0, 0),
(53, '190000', '', 'LIMPIEZA                                ', 'T', 1, 0, '', 0, 0),
(54, '010600', '', 'PRECURSORES                             ', 'T', 14, 0, '', 0, 1),
(55, '010200', '', 'SICOTROPICOS LISTA II                   ', 'T', 2, 1, '', 0, 2),
(56, '010300', '', 'SICOTROPICOS LISTA III                  ', 'T', 3, 1, '', 0, 2),
(57, '010400', '', 'SICOTROPICOS LISTA IV                   ', 'T', 4, 1, '', 0, 2),
(58, '010500', '', 'ESTUPEFACIENTES                         ', 'T', 5, 1, '', 0, 2),
(59, '020100', '', 'LABORATORIOS OTEMEN                     ', 'T', 1, 0, '', -1, 0),
(60, '020200', '', 'LABORATORIO ENA                         ', 'T', 1, 0, '', -1, 0),
(61, '020300', '', 'LABORATORIO SCHERER                     ', 'T', 1, 0, '', -1, 0),
(62, '020400', '', 'LABORATORIO MADAUS                      ', 'T', 1, 0, '', -1, 0),
(63, '020500', '', 'LABORATORIO FADA                        ', 'T', 1, 0, '', -1, 0),
(64, '020600', '', 'LABORATORIO BIOQUIM                     ', 'T', 1, 0, '', -1, 0),
(65, '020700', '', 'LABORATORIO DULKRE                      ', 'T', 1, 0, '', -1, 0),
(66, '020800', '', 'LABORATORIO CELINA                      ', 'T', 1, 0, '', -1, 0),
(67, '020900', '', 'LABORATORIO ECOPHARMA                   ', 'T', 1, 0, '', -1, 0),
(68, '050300', '', 'AROMATERAPIA                            ', 'T', 1, 0, '', -1, 0),
(69, '060000', '', 'LIBROS                                  ', 'T', 1, 0, '', -1, 0),
(70, '090200', '', 'TELAS ADHESIVAS Y APOSITOS              ', 'T', 1, 0, '', -1, 0),
(71, '090300', '', 'PRESERVATIVOS                           ', 'T', 1, 0, '', -1, 0),
(72, '090400', '', 'VENDAS Y GASAS                          ', 'T', 1, 0, '', -1, 0),
(73, '090600', '', 'ARTICULOS PARA HIGIENE PERSONAL         ', 'T', 1, 0, '', -1, 0),
(74, '090700', '', 'ARTICULOS PARA MEDICINA                 ', 'T', 1, 0, '', -1, 0),
(75, '090900', '', 'TEST PARA DIAGNOSTICO                   ', 'T', 1, 0, '', -1, 0),
(76, '091000', '', 'ARTICULOS PARA ORTOPEDIA                ', 'T', 1, 0, '', -1, 0),
(77, '099000', '', 'VARIOS                                  ', 'T', 1, 0, '', -1, 0),
(78, '050400', '', 'FLORES DE BUSH                          ', 'T', 1, 1, '', -1, 0),
(79, '010800', '', 'RECETA ARCHIVADA                        ', 'T', 6, 0, '                                                                                                                        ', 0, 0),
(80, '110000', '', 'PRODUCTOS DE NUESTRA ELABORACION        ', 'T', 1, 0, '', 0, 0),
(81, '029000', '', 'OTROS                                   ', 'T', 1, 0, '', -1, 0),
(82, '021000', '', 'REACTIVOS DE DIAGNOSTICOS               ', 'T', 1, 0, 'null                                                                                                                    ', 0, 0),
(83, '100000', '', 'PRODUCTOS MEDICINALES TERMINADOS        ', 'T', 1, 0, '', 0, 0),
(84, '090100', '', 'JERINGAS Y AGUJAS                       ', 'T', 1, 0, '', -1, 0),
(85, '090500', '', 'ARTICULOS PARA BEBES                    ', 'T', 1, 0, '', -1, 0),
(86, '090800', '', 'RECIPIENTES ESTERILES                   ', 'T', 1, 0, '', -1, 0),
(87, '010900', '', 'PRODUCTOS CON CONTROL                   ', 'T', 8, 0, '                                                                                                                        ', 0, 0),
(88, '050100', '', 'FLORES DE BACH                          ', 'T', 1, 0, '', -1, 0),
(89, '050200', '', 'FLORES DE CALIFORNIA                    ', 'T', 1, 0, '', -1, 0),
(90, 'RO', '', 'RUBRO OFERTA                            ', 'T', 9, 0, '', 0, 0),
(91, 'PSICO', '', 'SICOTROPICOS MENORES L3                 ', 'T', 10, 0, '                                                                                                                        ', 0, 2),
(92, 'LISTA5', '', 'MENORES L5                              ', 'T', 11, 0, '                                                                                                                        ', 0, 0),
(93, 'PSICO5', '', 'SICOTROPICOS MENORES L5                 ', 'T', 12, 0, '                                                                                                                        ', 0, 2),
(94, 'SEDRO', '', 'PRECURSORES CON RESTRICCION             ', 'T', 14, 0, '', 0, 1),
(95, 'REFRI', '', 'PRODUCTOS REFRIGERADOS                  ', 'T', 13, 0, '                                                                                                                        ', 0, 0),
(96, 'PROSUSTCOR', '', 'PRODUCTOS SUSTANCIA DE CORTE', 'T', 14, 0, '', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trans_ma`
--

CREATE TABLE `trans_ma` (
  `Id` int(11) NOT NULL,
  `Codigo_Transporte` char(4) DEFAULT NULL,
  `Razon_Social` varchar(50) DEFAULT NULL,
  `Domicilio` varchar(50) DEFAULT NULL,
  `Localidad` varchar(50) DEFAULT NULL,
  `Codigo_Postal` varchar(10) DEFAULT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  `Activo` bit(1) DEFAULT NULL,
  `Inmediato` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trans_ma`
--

INSERT INTO `trans_ma` (`Id`, `Codigo_Transporte`, `Razon_Social`, `Domicilio`, `Localidad`, `Codigo_Postal`, `Telefono`, `Fax`, `Activo`, `Inmediato`) VALUES
(1, '0300', 'NEXTRA              ', '                                        ', 'CAPITAL FEDERAL     ', '0         ', '                    ', '0                   ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(2, '0001', 'A.B.C.              ', 'SAN BLAS 1747                           ', 'CAPITAL FEDERAL     ', '1416      ', '581-3774            ', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(3, '0002', 'A.L.A.              ', 'VIRREY LINIERS 1350                     ', 'CAPITAL FEDERAL     ', '1241      ', '936899/7553         ', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(4, '0003', 'ALASIA SAC          ', 'LUNA 358                                ', 'CAPITAL FEDERAL     ', '1437      ', '942-1920/0291       ', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(5, '0004', 'ALVANO S.A          ', 'AMANCIO ALCORTA 3207                    ', 'PQUE PATRICIOS BS.AS', '          ', '303-1920            ', 'HOR: 8 A 16:30      ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(6, '0006', 'ANGELICCA           ', 'ALM FRANCISCO J SEGUI 292               ', 'CAPITAL FEDERAL     ', '1406      ', '632-0027            ', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(7, '0007', 'GALT S.A.', 'PORTELA 3479                            ', 'CAP FED.            ', '1437      ', '4919-0991', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(8, '0008', 'BEN-HUR             ', 'GALICIA 367                             ', 'CAPITAL FEDERAL     ', '1414      ', '854-9557/855-1267   ', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(9, '0009', 'BENOZA              ', 'CACHIMAYO 1836                          ', 'CAPITAL FEDERAL     ', '1424      ', '920102              ', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(10, '0010', 'BISONTE             ', 'PERGAMINO 3751 ', 'VILLA SOLDATI  ', '1406      ', '4912-0261           ', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(11, '0011', 'CAPEBOL             ', 'COLONIA 225                             ', 'CAPITAL FEDERAL     ', '1437      ', '                    ', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(12, '0012', 'CARGAS FORMOSENAS   ', 'AV MANUEL GARCIA 466                    ', 'CAPITAL FEDERAL     ', '1268      ', '942-0261/942-2803   ', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(13, '0013', 'CAROLO              ', 'RIO IV  2738', 'CAPITAL FEDERAL     ', '1292      ', '4303-4055           ', 'Alejandra           ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(14, '0014', 'CASTELLANO          ', 'B. QUINQUELA MARTIN 981                 ', 'CAPITAL FEDERAL     ', '1288      ', '303-1120            ', '303-1120            ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(15, '0015', 'CIARLANTINI         ', 'INCLAN 3527                             ', 'CAPITAL FEDERAL     ', '1258      ', '4923-2998           ', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(16, '0016', 'CONTE               ', 'PARACAS 261                             ', 'CAPITAL FEDERAL     ', '1416      ', '4304-9969/9123/9125 ', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(17, '0017', 'COR-BA              ', 'AV AMANCIO ALCORTA 2505                 ', 'CAPITAL FEDERAL     ', '1437      ', '942-4025            ', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(18, '0018', 'COUTO               ', 'CARLOS CALVO 3102                       ', 'CAPITAL FEDERAL     ', '1230      ', '936111              ', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(19, '0019', 'CRITICA             ', 'TRAFUL 3436                             ', 'CAPITAL FEDERAL     ', '1437      ', '913681              ', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(20, '0021', 'CHAP & CIA          ', 'DIOGENES TABORDA 742                    ', 'CAPITAL FEDERAL     ', '1437      ', '915865/2790         ', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(576, '0805', 'VIA1                ', 'Venezuela 3155                          ', 'CAPITAL FEDERAL     ', '          ', '4760-5066           ', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111'),
(620, '0806', 'SPA', 'virrey liniers 820                      ', 'CAPITAL FEDERAL     ', '          ', '4956-1435           ', '                    ', b'1111111111111111111111111111111', b'1111111111111111111111111111111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uni_med`
--

CREATE TABLE `uni_med` (
  `id` int(11) NOT NULL,
  `Unidad` char(2) DEFAULT NULL,
  `Descripcion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `uni_med`
--

INSERT INTO `uni_med` (`id`, `Unidad`, `Descripcion`) VALUES
(0, '--', '----------'),
(1, 'UN', 'UNIDADES  '),
(2, '%', 'PORCENTAJE'),
(3, 'CJ', 'CAJA      '),
(4, 'Kg', 'KILOGRAMO '),
(5, 'L', 'LITRO     '),
(6, 'Mi', 'MILLAR    '),
(7, 'G', 'GRAMO     '),
(8, 'SN', 'SIN U.ME.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Id_Usuario` int(11) NOT NULL,
  `Usuario_Login` varchar(30) NOT NULL,
  `Clave` varchar(300) NOT NULL,
  `Nombre_Vendedor` varchar(50) NOT NULL,
  `Codigo_Vendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Id_Usuario`, `Usuario_Login`, `Clave`, `Nombre_Vendedor`, `Codigo_Vendedor`) VALUES
(1, 'noenoe', 'blabla', 'Noe', 12);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agcli_ma`
--
ALTER TABLE `agcli_ma`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `clien_ma`
--
ALTER TABLE `clien_ma`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `convt_ma`
--
ALTER TABLE `convt_ma`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `fraccio_ma`
--
ALTER TABLE `fraccio_ma`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lista_ca`
--
ALTER TABLE `lista_ca`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `lista_de`
--
ALTER TABLE `lista_de`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `pedid_numer`
--
ALTER TABLE `pedid_numer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Pedid_Numer_id_uindex` (`id`);

--
-- Indices de la tabla `produ_ma`
--
ALTER TABLE `produ_ma`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rubro_ma`
--
ALTER TABLE `rubro_ma`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `trans_ma`
--
ALTER TABLE `trans_ma`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `uni_med`
--
ALTER TABLE `uni_med`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id_Usuario`),
  ADD UNIQUE KEY `usuarios_Id_Usuario_uindex` (`Id_Usuario`),
  ADD UNIQUE KEY `usuarios_Usuario_Login_uindex` (`Usuario_Login`),
  ADD UNIQUE KEY `usuarios_Nombre_Vendedor_uindex` (`Nombre_Vendedor`),
  ADD UNIQUE KEY `usuarios_Codigo_Vendedor_uindex` (`Codigo_Vendedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clien_ma`
--
ALTER TABLE `clien_ma`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15017;
--
-- AUTO_INCREMENT de la tabla `pedid_numer`
--
ALTER TABLE `pedid_numer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
