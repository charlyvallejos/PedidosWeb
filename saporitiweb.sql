-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-06-2017 a las 15:12:33
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `Clien_Ma_Cons` ()  SELECT
  IFNULL(id,0) AS id,
  IFNULL(Codigo_Cliente,'') AS Codigo_Cliente,
  IFNULL(Razon_Social,'') AS Razon_Social,
  IFNULL(Nombre_Fantasia, '') AS Nombre_Fantasia,
  IFNULL(Domicilio, '') AS Domicilio,
  IFNULL(Codigo_Postal, '') AS Codigo_Postal,
  IFNULL(Localidad,'') AS Localidad,
  IFNULL(Provincia, 0) AS Provincia,
  IFNULL(Domicilio_Entrega, '') AS Domicilio_Entrega,
  IFNULL(Codigo_Postal_Entrega, 0) AS Codigo_Postal_Entrega,
  IFNULL(Localidad_Entrega,'') AS Localidad_Entrega,
  IFNULL(Provincia_Entrega, 0) AS Provincia_Entrega,
  IFNULL(Domicilio_Cobro, '') AS Domicilio_Cobro,
  IFNULL(Codigo_Postal_Cobro, 0) AS Codigo_Postal_Cobro,
  IFNULL(Localidad_Cobro,'') AS Localidad_Cobro,
  IFNULL(Provincia_Cobro, 0) AS Provincia_Cobro,
  IFNULL(Id_Reparto, 0) AS Id_Reparto,
  IFNULL(Id_Zona, 0) AS Id_Zona,
  IFNULL(Telefonos, '') AS Telefonos,
  IFNULL(Fax, '') AS Fax,
  IFNULL(Tipo_Iva, '') AS Tipo_Iva,
  IFNULL(Nro_Cuit, '') AS Nro_Cuit,
  IFNULL(Nro_Ing_Brutos, '') Nro_Ing_Brutos,
  IFNULL(Id_Categoria_Ing_Br, 0) AS Id_Categoria_Ing_Br,
  IFNULL(Comision, 0) AS Comision,
  IFNULL(Id_Lista_Precio, 0) AS Id_Lista_Precio,
  IFNULL(Estado, '') AS Estado,
  IFNULL(Id_Condicion_Vta, 0) AS Id_Condicion_Vta,
  IFNULL(Id_Agrupacion, 0) AS Id_Agrupacion,
  IFNULL(Codigo_Vendedor, 0) AS Codigo_Vendedor,
  IFNULL(Contacto, '') AS Contacto,
  IFNULL(Nivel_Habil, 0) AS Nivel_Habil,
  IFNULL(Id_Reparto_Entrega, 0) AS Id_Reparto_Entrega,
  IFNULL(Id_Reparto_Cobro, 0) AS Id_Reparto_Cobro,
  IFNULL(Dcto, 0) AS Dcto,
  IFNULL(Credito, 0) AS Credito,
  IFNULL(Protocolo, 0) AS Protocolo,
  IFNULL(Nro_Sedronar, '') AS Nro_Sedronar,
  IFNULL(DATE_FORMAT(Fecha_Vto_Sedro,'%d/%m/%Y'),'01/01/1990') AS Fecha_Vto_Sedro,
  IFNULL(DATE_FORMAT(Fecha_Alta, '%d/%m/%Y'),'01/01/1990') AS Fecha_Alta,
  IFNULL(Remito, 0) AS Remito ,
  IFNULL(Dcto_Pago_Ef, 0) AS Dcto_Pago_Ef,
  IFNULL(eMail, '') AS eMail,
  IFNULL(eMailProtocolos, '') AS eMailProtocolos,
  IFNULL(Id_Usuario, 0) AS Id_Usuario,
  IFNULL(DATE_FORMAT(Fecha_Operacion,'%d/%m/%Y'),'01/01/1990') AS Fecha_Operacion,
  IFNULL(Id_Grupo_Cliente,0) AS Id_Grupo_Cliente,
  IFNULL(Id_Transporte,0) AS Id_Transporte,
  IFNULL(Convenio,0) AS Convenio,
  IFNULL(Afip,'') AS Afip,
  IFNULL(Grupo_Cotiza,0) AS Grupo_Cotiza,
  IFNULL(Estado_Deudor,0) AS Estado_Deudor,
  IFNULL(DATE_FORMAT(Fecha_Estado_Deudor, '%d/%m/%Y'),'') AS Fecha_Estado_Deudor,
  IFNULL(DATE_FORMAT(Fecha_Facturar_Hasta,'%d/%m/%Y'),'') AS Fecha_Facturar_Hasta,
  IFNULL(Imprime_Nc_Dcto, 0) AS Imprime_Nc_Dcto,
  IFNULL(Id_Trans_Clien,0) AS Id_Trans_Clien,
  IFNULL(Motivo,'') AS Motivo,
  IFNULL(Id_Pais, 0) AS Id_Pais,
  IFNULL(DATE_FORMAT(Fecha_Vto_Psico,'%d/%m/%Y'),'') AS Fecha_Vto_Psico,
  IFNULL(Prefijo_Telefono_1,'') AS Prefijo_Telefono_1,
  IFNULL(Telefono_1, '') AS Telefono_1,
  IFNULL(Prefijo_Telefono_2,'') AS Prefijo_Telefono_2,
  IFNULL(Telefono_2, '') AS Telefono_2,
  IFNULL(Prefijo_Telefono_3,'') AS Prefijo_Telefono_3,
  IFNULL(Telefono_3, '') AS Telefono_3,
  IFNULL(Prefijo_Fax_1,'') AS Prefijo_Fax_1,
  IFNULL(Fax_1, '') AS Fax_1,
  IFNULL(Prefijo_Fax_2,'') AS Prefijo_Fax_2,
  IFNULL(Fax_2, '') AS Fax_2,
  IFNULL(Prefijo_Celular,'') AS Prefijo_Celular,
  IFNULL(Celular, '') AS Celular,
  IFNULL(Director_Tecnico, '') AS Director_Tecnico,
  IFNULL(Pasar_Importe, 0) AS Pasar_Importe,
  IFNULL(Grupo_Sedro, 0) AS Grupo_Sedro,
  IFNULL(Genera_Factura_PDF,0) AS Genera_Factura_PDF,
  IFNULL(Email_Factura_PDF,'') as Email_Factura_PDF
FROM Clien_Ma$$



CREATE DEFINER=`root`@`localhost` PROCEDURE `Clien_Ma_Igual_Id` (IN `_ID` INT)  SELECT
  IFNULL(id,0) AS id,
  IFNULL(Codigo_Cliente,'') AS Codigo_Cliente,
  IFNULL(Razon_Social,'') AS Razon_Social,
  IFNULL(Nombre_Fantasia, '') AS Nombre_Fantasia,
  IFNULL(Domicilio, '') AS Domicilio,
  IFNULL(Codigo_Postal, '') AS Codigo_Postal,
  IFNULL(Localidad,'') AS Localidad,
  IFNULL(Provincia, 0) AS Provincia,
  IFNULL(Domicilio_Entrega, '') AS Domicilio_Entrega,
  IFNULL(Codigo_Postal_Entrega, 0) AS Codigo_Postal_Entrega,
  IFNULL(Localidad_Entrega,'') AS Localidad_Entrega,
  IFNULL(Provincia_Entrega, 0) AS Provincia_Entrega,
  IFNULL(Domicilio_Cobro, '') AS Domicilio_Cobro,
  IFNULL(Codigo_Postal_Cobro, 0) AS Codigo_Postal_Cobro,
  IFNULL(Localidad_Cobro,'') AS Localidad_Cobro,
  IFNULL(Provincia_Cobro, 0) AS Provincia_Cobro,
  IFNULL(Id_Reparto, 0) AS Id_Reparto,
  IFNULL(Id_Zona, 0) AS Id_Zona,
  IFNULL(Telefonos, '') AS Telefonos,
  IFNULL(Fax, '') AS Fax,
  IFNULL(Tipo_Iva, '') AS Tipo_Iva,
  IFNULL(Nro_Cuit, '') AS Nro_Cuit,
  IFNULL(Nro_Ing_Brutos, '') Nro_Ing_Brutos,
  IFNULL(Id_Categoria_Ing_Br, 0) AS Id_Categoria_Ing_Br,
  IFNULL(Comision, 0) AS Comision,
  IFNULL(Id_Lista_Precio, 0) AS Id_Lista_Precio,
  IFNULL(Estado, '') AS Estado,
  IFNULL(Id_Condicion_Vta, 0) AS Id_Condicion_Vta,
  IFNULL(Id_Agrupacion, 0) AS Id_Agrupacion,
  IFNULL(Codigo_Vendedor, 0) AS Codigo_Vendedor,
  IFNULL(Contacto, '') AS Contacto,
  IFNULL(Nivel_Habil, 0) AS Nivel_Habil,
  IFNULL(Id_Reparto_Entrega, 0) AS Id_Reparto_Entrega,
  IFNULL(Id_Reparto_Cobro, 0) AS Id_Reparto_Cobro,
  IFNULL(Dcto, 0) AS Dcto,
  IFNULL(Credito, 0) AS Credito,
  IFNULL(Protocolo, 0) AS Protocolo,
  IFNULL(Nro_Sedronar, '') AS Nro_Sedronar,
  IFNULL(DATE_FORMAT(Fecha_Vto_Sedro,'%d/%m/%Y'),'01/01/1990') AS Fecha_Vto_Sedro,
  IFNULL(DATE_FORMAT(Fecha_Alta, '%d/%m/%Y'),'01/01/1990') AS Fecha_Alta,
  IFNULL(Remito, 0) AS Remito ,
  IFNULL(Dcto_Pago_Ef, 0) AS Dcto_Pago_Ef,
  IFNULL(eMail, '') AS eMail,
  IFNULL(eMailProtocolos, '') AS eMailProtocolos,
  IFNULL(Id_Usuario, 0) AS Id_Usuario,
  IFNULL(DATE_FORMAT(Fecha_Operacion,'%d/%m/%Y'),'01/01/1990') AS Fecha_Operacion,
  IFNULL(Id_Grupo_Cliente,0) AS Id_Grupo_Cliente,
  IFNULL(Id_Transporte,0) AS Id_Transporte,
  IFNULL(Convenio,0) AS Convenio,
  IFNULL(Afip,'') AS Afip,
  IFNULL(Grupo_Cotiza,0) AS Grupo_Cotiza,
  IFNULL(Estado_Deudor,0) AS Estado_Deudor,
  IFNULL(DATE_FORMAT(Fecha_Estado_Deudor, '%d/%m/%Y'),'') AS Fecha_Estado_Deudor,
  IFNULL(DATE_FORMAT(Fecha_Facturar_Hasta,'%d/%m/%Y'),'') AS Fecha_Facturar_Hasta,
  IFNULL(Imprime_Nc_Dcto, 0) AS Imprime_Nc_Dcto,
  IFNULL(Id_Trans_Clien,0) AS Id_Trans_Clien,
  IFNULL(Motivo,'') AS Motivo,
  IFNULL(Id_Pais, 0) AS Id_Pais,
  IFNULL(DATE_FORMAT(Fecha_Vto_Psico,'%d/%m/%Y'),'') AS Fecha_Vto_Psico,
  IFNULL(Prefijo_Telefono_1,'') AS Prefijo_Telefono_1,
  IFNULL(Telefono_1, '') AS Telefono_1,
  IFNULL(Prefijo_Telefono_2,'') AS Prefijo_Telefono_2,
  IFNULL(Telefono_2, '') AS Telefono_2,
  IFNULL(Prefijo_Telefono_3,'') AS Prefijo_Telefono_3,
  IFNULL(Telefono_3, '') AS Telefono_3,
  IFNULL(Prefijo_Fax_1,'') AS Prefijo_Fax_1,
  IFNULL(Fax_1, '') AS Fax_1,
  IFNULL(Prefijo_Fax_2,'') AS Prefijo_Fax_2,
  IFNULL(Fax_2, '') AS Fax_2,
  IFNULL(Prefijo_Celular,'') AS Prefijo_Celular,
  IFNULL(Celular, '') AS Celular,
  IFNULL(Director_Tecnico, '') AS Director_Tecnico,
  IFNULL(Pasar_Importe, 0) AS Pasar_Importe,
  IFNULL(Grupo_Sedro, 0) AS Grupo_Sedro,
  IFNULL(Genera_Factura_PDF,0) AS Genera_Factura_PDF,
  IFNULL(Email_Factura_PDF,'') as Email_Factura_PDF
FROM Clien_Ma
WHERE id = _ID$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Clien_Ma_Igual_Descri` (IN `_DESCRIPCION` VARCHAR(50))  SELECT
  IFNULL(id,0) AS id,
  IFNULL(Codigo_Cliente,'') AS Codigo_Cliente,
  IFNULL(Razon_Social,'') AS Razon_Social,
  IFNULL(Nombre_Fantasia, '') AS Nombre_Fantasia,
  IFNULL(Domicilio, '') AS Domicilio,
  IFNULL(Codigo_Postal, '') AS Codigo_Postal,
  IFNULL(Localidad,'') AS Localidad,
  IFNULL(Provincia, 0) AS Provincia,
  IFNULL(Domicilio_Entrega, '') AS Domicilio_Entrega,
  IFNULL(Codigo_Postal_Entrega, 0) AS Codigo_Postal_Entrega,
  IFNULL(Localidad_Entrega,'') AS Localidad_Entrega,
  IFNULL(Provincia_Entrega, 0) AS Provincia_Entrega,
  IFNULL(Domicilio_Cobro, '') AS Domicilio_Cobro,
  IFNULL(Codigo_Postal_Cobro, 0) AS Codigo_Postal_Cobro,
  IFNULL(Localidad_Cobro,'') AS Localidad_Cobro,
  IFNULL(Provincia_Cobro, 0) AS Provincia_Cobro,
  IFNULL(Id_Reparto, 0) AS Id_Reparto,
  IFNULL(Id_Zona, 0) AS Id_Zona,
  IFNULL(Telefonos, '') AS Telefonos,
  IFNULL(Fax, '') AS Fax,
  IFNULL(Tipo_Iva, '') AS Tipo_Iva,
  IFNULL(Nro_Cuit, '') AS Nro_Cuit,
  IFNULL(Nro_Ing_Brutos, '') Nro_Ing_Brutos,
  IFNULL(Id_Categoria_Ing_Br, 0) AS Id_Categoria_Ing_Br,
  IFNULL(Comision, 0) AS Comision,
  IFNULL(Id_Lista_Precio, 0) AS Id_Lista_Precio,
  IFNULL(Estado, '') AS Estado,
  IFNULL(Id_Condicion_Vta, 0) AS Id_Condicion_Vta,
  IFNULL(Id_Agrupacion, 0) AS Id_Agrupacion,
  IFNULL(Codigo_Vendedor, 0) AS Codigo_Vendedor,
  IFNULL(Contacto, '') AS Contacto,
  IFNULL(Nivel_Habil, 0) AS Nivel_Habil,
  IFNULL(Id_Reparto_Entrega, 0) AS Id_Reparto_Entrega,
  IFNULL(Id_Reparto_Cobro, 0) AS Id_Reparto_Cobro,
  IFNULL(Dcto, 0) AS Dcto,
  IFNULL(Credito, 0) AS Credito,
  IFNULL(Protocolo, 0) AS Protocolo,
  IFNULL(Nro_Sedronar, '') AS Nro_Sedronar,
  IFNULL(DATE_FORMAT(Fecha_Vto_Sedro,'%d/%m/%Y'),'01/01/1990') AS Fecha_Vto_Sedro,
  IFNULL(DATE_FORMAT(Fecha_Alta, '%d/%m/%Y'),'01/01/1990') AS Fecha_Alta,
  IFNULL(Remito, 0) AS Remito ,
  IFNULL(Dcto_Pago_Ef, 0) AS Dcto_Pago_Ef,
  IFNULL(eMail, '') AS eMail,
  IFNULL(eMailProtocolos, '') AS eMailProtocolos,
  IFNULL(Id_Usuario, 0) AS Id_Usuario,
  IFNULL(DATE_FORMAT(Fecha_Operacion,'%d/%m/%Y'),'01/01/1990') AS Fecha_Operacion,
  IFNULL(Id_Grupo_Cliente,0) AS Id_Grupo_Cliente,
  IFNULL(Id_Transporte,0) AS Id_Transporte,
  IFNULL(Convenio,0) AS Convenio,
  IFNULL(Afip,'') AS Afip,
  IFNULL(Grupo_Cotiza,0) AS Grupo_Cotiza,
  IFNULL(Estado_Deudor,0) AS Estado_Deudor,
  IFNULL(DATE_FORMAT(Fecha_Estado_Deudor, '%d/%m/%Y'),'') AS Fecha_Estado_Deudor,
  IFNULL(DATE_FORMAT(Fecha_Facturar_Hasta,'%d/%m/%Y'),'') AS Fecha_Facturar_Hasta,
  IFNULL(Imprime_Nc_Dcto, 0) AS Imprime_Nc_Dcto,
  IFNULL(Id_Trans_Clien,0) AS Id_Trans_Clien,
  IFNULL(Motivo,'') AS Motivo,
  IFNULL(Id_Pais, 0) AS Id_Pais,
  IFNULL(DATE_FORMAT(Fecha_Vto_Psico,'%d/%m/%Y'),'') AS Fecha_Vto_Psico,
  IFNULL(Prefijo_Telefono_1,'') AS Prefijo_Telefono_1,
  IFNULL(Telefono_1, '') AS Telefono_1,
  IFNULL(Prefijo_Telefono_2,'') AS Prefijo_Telefono_2,
  IFNULL(Telefono_2, '') AS Telefono_2,
  IFNULL(Prefijo_Telefono_3,'') AS Prefijo_Telefono_3,
  IFNULL(Telefono_3, '') AS Telefono_3,
  IFNULL(Prefijo_Fax_1,'') AS Prefijo_Fax_1,
  IFNULL(Fax_1, '') AS Fax_1,
  IFNULL(Prefijo_Fax_2,'') AS Prefijo_Fax_2,
  IFNULL(Fax_2, '') AS Fax_2,
  IFNULL(Prefijo_Celular,'') AS Prefijo_Celular,
  IFNULL(Celular, '') AS Celular,
  IFNULL(Director_Tecnico, '') AS Director_Tecnico,
  IFNULL(Pasar_Importe, 0) AS Pasar_Importe,
  IFNULL(Grupo_Sedro, 0) AS Grupo_Sedro,
  IFNULL(Genera_Factura_PDF,0) AS Genera_Factura_PDF,
  IFNULL(Email_Factura_PDF,'') as Email_Factura_PDF
FROM Clien_Ma
WHERE Razon_Social like '%_DESCRIPCION%'$$

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
                IFNULL(IngBr_Mis,0) AS IngBr_Mis
         FROM Pedid_Ca
                INNER JOIN Clien_Ma on Pedid_Ca.id_Cliente = clien_ma.Id
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
                IFNULL(IngBr_Mis, 0) IngBr_Mis
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
    IFNULL(Nro_Pedido, 0) AS Nro_Pedido,
    IFNULL(Renglon, 0) AS Renglon,
    IFNULL(Id_Producto, 0) AS Id_Producto,
    IFNULL(Id_Fraccio, 0) AS Id_Fraccio,
    IFNULL(Codigo_Producto, 0) AS Codigo_Producto,
    IFNULL(Cantidad, 0) AS Cantidad,
    IFNULL(Precio, 0) AS Precio,
    IFNULL(Precio_Lista, 0) AS Precio_Lista,
    IFNULL(Estado, 0) AS Estado,
    IFNULL(Nro_Cotizacion,0) AS Nro_Cotizacion,
    IFNULL(Fecha_Cotizacion, '') AS Fecha_Cotizacion,
    IFNULL(Nro_Despacho,'') AS Nro_Despacho,
    IFNULL(Nro_Lote, '') AS Nro_Lote,
    IFNULL(Id_Origen, 0) AS Id_Origen
  FROM Pedid_De
  WHERE Nro_Pedido = `_Nro_Pedido`
  ORDER BY Nro_Pedido, Renglon$$

DELIMITER ;

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
(1, '00002', 'Noelia', 'Noelia', 'Pepe 23', '5', 'Disney', 1, 'Blabla', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '0003', 'Beto', 'Betin', 'Loyola 1045', '6', 'Hamaka', 2, 'asd', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '0005', 'Blabla', 'Blibli', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '00006', 'asd', 'asd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
(1, 1, '2017-05-29 13:17:17', 1, 1, 1, 1, 1, 1, '1.0000', 'CAR', 1, '1', 1, 1, '2017-05-29 13:17:33', 1, '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', 1, 1, '1.000', '1.000'),
(2, 2, '2017-05-29 13:17:58', 2, 2, 2, 2, 2, 2, '2.0000', 'CAR', 1, '1', 1, 1, '2017-05-29 13:18:08', 1, '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', 1, 1, '1.000', '1.000'),
(3, 3, '2017-05-29 13:18:39', 3, 3, 3, 3, 3, 3, '1.0000', 'CAR', 1, '1', 1, 1, '2017-05-29 13:18:53', 1, '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', 1, 1, '1.000', '1.000'),
(5555, 4, '2017-06-07 09:27:08', 10, 1, 1, 1, 1, 1, '1.0000', 'car', 1, '1', 1, 1, '2017-06-07 09:27:26', 1, '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', '1.000', 1, 1, '1.000', '1.000');

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
(5555, 1, 1, 2, '0001/000', '3.000', '2.00', '1.00', 'car', 1, '2017-06-07 14:01:11', '0', '0', 1),
(5555, 2, 2, 3, '0005', '1.000', '2.00', '5.00', 'car', NULL, NULL, NULL, NULL, NULL);

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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clien_ma`
--
ALTER TABLE `clien_ma`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `pedid_numer`
--
ALTER TABLE `pedid_numer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Pedid_Numer_id_uindex` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clien_ma`
--
ALTER TABLE `clien_ma`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `pedid_numer`
--
ALTER TABLE `pedid_numer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
