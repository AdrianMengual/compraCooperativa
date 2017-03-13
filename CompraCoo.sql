-- phpMyAdmin SQL Dump
-- version 4.8.0-dev
-- https://www.phpmyadmin.net/
--
-- Servidor: 192.168.30.23
-- Temps de generació: 13-03-2017 a les 13:22:01
-- Versió del servidor: 8.0.0-dmr
-- Versió de PHP: 7.0.16-3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `CompraCoo`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `Admin`
--

CREATE TABLE `Admin` (
  `ID_admin` int(5) NOT NULL,
  `user` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `Categorias`
--

CREATE TABLE `Categorias` (
  `ID_categoria` int(5) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcant dades de la taula `Categorias`
--

INSERT INTO `Categorias` (`ID_categoria`, `nombre`, `descripcion`) VALUES
(1, 'cajas', 'cajas grandes');

-- --------------------------------------------------------

--
-- Estructura de la taula `Pedidos`
--

CREATE TABLE `Pedidos` (
  `ID_pedido` int(5) NOT NULL,
  `ID_user` int(5) NOT NULL,
  `ID_producto` int(5) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` int(9) NOT NULL,
  `paga_señal` int(6) NOT NULL,
  `peso` int(5) NOT NULL,
  `estado` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcant dades de la taula `Pedidos`
--

INSERT INTO `Pedidos` (`ID_pedido`, `ID_user`, `ID_producto`, `fecha`, `cantidad`, `paga_señal`, `peso`, `estado`) VALUES
(1, 1, 1, '2017-03-09', 30, 100, 0, '');

-- --------------------------------------------------------

--
-- Estructura de la taula `Productos`
--

CREATE TABLE `Productos` (
  `ID_producto` int(5) NOT NULL,
  `ID_categoria` int(5) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` text NOT NULL,
  `tamano` varchar(10) NOT NULL,
  `stock` int(9) NOT NULL,
  `imagen` varchar(40) NOT NULL,
  `precio` int(9) NOT NULL,
  `formula` varchar(50) NOT NULL,
  `cantidad_total` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcant dades de la taula `Productos`
--

INSERT INTO `Productos` (`ID_producto`, `ID_categoria`, `nombre`, `descripcion`, `tamano`, `stock`, `imagen`, `precio`, `formula`, `cantidad_total`) VALUES
(1, 1, 'caja1', 'cajas bonitas y grandes', '13x55x21', 50, 'images/ruaf.jpg', 40, '2x+3', 40);

-- --------------------------------------------------------

--
-- Estructura de la taula `Productos_proveedor`
--

CREATE TABLE `Productos_proveedor` (
  `ID_proveedor` int(5) NOT NULL,
  `ID_producto` int(5) NOT NULL,
  `tarifa` varchar(20) NOT NULL,
  `formula` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `Proveedores`
--

CREATE TABLE `Proveedores` (
  `ID_proveedor` int(5) NOT NULL,
  `ID_transporte` int(5) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `empresa` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcant dades de la taula `Proveedores`
--

INSERT INTO `Proveedores` (`ID_proveedor`, `ID_transporte`, `nombre`, `empresa`) VALUES
(1, 1, 'cajonesion', 'cajonesion sa');

-- --------------------------------------------------------

--
-- Estructura de la taula `Tarifas_transporte`
--

CREATE TABLE `Tarifas_transporte` (
  `ID_tarifa` int(5) NOT NULL,
  `ID_transporte` int(5) NOT NULL,
  `intervalos_peso` int(20) NOT NULL,
  `precio` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de la taula `Transporte`
--

CREATE TABLE `Transporte` (
  `ID_transporte` int(5) NOT NULL,
  `empresa` varchar(40) NOT NULL,
  `tarifa` varchar(40) NOT NULL,
  `horarios` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcant dades de la taula `Transporte`
--

INSERT INTO `Transporte` (`ID_transporte`, `empresa`, `tarifa`, `horarios`) VALUES
(1, 'dhl', '5 - 2km', '14h-16h');

-- --------------------------------------------------------

--
-- Estructura de la taula `Usuarios`
--

CREATE TABLE `Usuarios` (
  `ID_user` int(5) NOT NULL,
  `user` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `empresa` varchar(40) NOT NULL,
  `nombre_contacto` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `telefono` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Bolcant dades de la taula `Usuarios`
--

INSERT INTO `Usuarios` (`ID_user`, `user`, `password`, `empresa`, `nombre_contacto`, `email`, `telefono`) VALUES
(1, 'pepecarlos', '1111', 'microxof', 'carlospepe', 'pepecarlos@gmail.com', 555555555),
(2, 'juancarlos', '1234', 'apple', 'carlosjuan', 'jc@gmail.com', 666666666);

--
-- Indexos per taules bolcades
--

--
-- Index de la taula `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`ID_admin`);

--
-- Index de la taula `Categorias`
--
ALTER TABLE `Categorias`
  ADD PRIMARY KEY (`ID_categoria`);

--
-- Index de la taula `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD PRIMARY KEY (`ID_pedido`),
  ADD KEY `ID_user` (`ID_user`),
  ADD KEY `ID_producto` (`ID_producto`);

--
-- Index de la taula `Productos`
--
ALTER TABLE `Productos`
  ADD PRIMARY KEY (`ID_producto`),
  ADD KEY `ID_categoria` (`ID_categoria`);

--
-- Index de la taula `Productos_proveedor`
--
ALTER TABLE `Productos_proveedor`
  ADD KEY `ID_producto` (`ID_producto`),
  ADD KEY `ID_proveedor` (`ID_proveedor`);

--
-- Index de la taula `Proveedores`
--
ALTER TABLE `Proveedores`
  ADD PRIMARY KEY (`ID_proveedor`),
  ADD KEY `ID_transporte` (`ID_transporte`);

--
-- Index de la taula `Tarifas_transporte`
--
ALTER TABLE `Tarifas_transporte`
  ADD PRIMARY KEY (`ID_tarifa`),
  ADD KEY `ID_transporte` (`ID_transporte`);

--
-- Index de la taula `Transporte`
--
ALTER TABLE `Transporte`
  ADD PRIMARY KEY (`ID_transporte`);

--
-- Index de la taula `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`ID_user`),
  ADD UNIQUE KEY `user` (`user`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `Admin`
--
ALTER TABLE `Admin`
  MODIFY `ID_admin` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la taula `Categorias`
--
ALTER TABLE `Categorias`
  MODIFY `ID_categoria` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la taula `Pedidos`
--
ALTER TABLE `Pedidos`
  MODIFY `ID_pedido` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la taula `Productos`
--
ALTER TABLE `Productos`
  MODIFY `ID_producto` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la taula `Proveedores`
--
ALTER TABLE `Proveedores`
  MODIFY `ID_proveedor` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la taula `Tarifas_transporte`
--
ALTER TABLE `Tarifas_transporte`
  MODIFY `ID_tarifa` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT per la taula `Transporte`
--
ALTER TABLE `Transporte`
  MODIFY `ID_transporte` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT per la taula `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `ID_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restriccions per taules bolcades
--

--
-- Restriccions per la taula `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD CONSTRAINT `Pedidos_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `Usuarios` (`ID_user`),
  ADD CONSTRAINT `Pedidos_ibfk_2` FOREIGN KEY (`ID_producto`) REFERENCES `Productos` (`ID_producto`);

--
-- Restriccions per la taula `Productos`
--
ALTER TABLE `Productos`
  ADD CONSTRAINT `Productos_ibfk_1` FOREIGN KEY (`ID_categoria`) REFERENCES `Categorias` (`ID_categoria`);

--
-- Restriccions per la taula `Productos_proveedor`
--
ALTER TABLE `Productos_proveedor`
  ADD CONSTRAINT `Productos_proveedor_ibfk_1` FOREIGN KEY (`ID_producto`) REFERENCES `Productos` (`ID_producto`),
  ADD CONSTRAINT `Productos_proveedor_ibfk_2` FOREIGN KEY (`ID_proveedor`) REFERENCES `Proveedores` (`ID_proveedor`);

--
-- Restriccions per la taula `Proveedores`
--
ALTER TABLE `Proveedores`
  ADD CONSTRAINT `Proveedores_ibfk_1` FOREIGN KEY (`ID_transporte`) REFERENCES `Transporte` (`ID_transporte`);

--
-- Restriccions per la taula `Tarifas_transporte`
--
ALTER TABLE `Tarifas_transporte`
  ADD CONSTRAINT `Tarifas_transporte_ibfk_1` FOREIGN KEY (`ID_transporte`) REFERENCES `Transporte` (`ID_transporte`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
