-- phpMyAdmin SQL Dump
-- version 4.8.0-dev
-- https://www.phpmyadmin.net/
--
-- Servidor: 192.168.30.23
-- Tiempo de generación: 15-03-2017 a las 15:49:44
-- Versión del servidor: 8.0.0-dmr
-- Versión de PHP: 7.0.16-3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `CompraCooperativa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Admin`
--

CREATE TABLE `Admin` (
  `ID_admin` int(5) NOT NULL,
  `user` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Admin`
--

INSERT INTO `Admin` (`ID_admin`, `user`, `password`, `email`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categorias`
--

CREATE TABLE `Categorias` (
  `ID_categoria` int(5) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Categorias`
--

INSERT INTO `Categorias` (`ID_categoria`, `nombre`, `descripcion`) VALUES
(1, 'Cajas_carton', ''),
(2, 'Guantes', ''),
(3, 'Etiquetas', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pedidos`
--

CREATE TABLE `Pedidos` (
  `ID_pedido` int(5) NOT NULL,
  `ID_user` int(5) NOT NULL,
  `ID_producto` int(5) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` int(9) NOT NULL,
  `paga_se` int(6) NOT NULL,
  `peso` int(5) NOT NULL,
  `estado` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Pedidos`
--

INSERT INTO `Pedidos` (`ID_pedido`, `ID_user`, `ID_producto`, `fecha`, `cantidad`, `paga_se`, `peso`, `estado`) VALUES
(1, 3, 1, '2017-03-17', 20, 2, 2, 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos`
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
-- Volcado de datos para la tabla `Productos`
--

INSERT INTO `Productos` (`ID_producto`, `ID_categoria`, `nombre`, `descripcion`, `tamano`, `stock`, `imagen`, `precio`, `formula`, `cantidad_total`) VALUES
(1, 1, 'Caja_carton_22x100', 'Cajas de cartón de 22x100 cm', '22x100', 100, 'caja.jpg', 1, '', 50),
(2, 2, 'Guantes_latex', 'Guantes de latex', '', 100, 'guantes.jpg', 2, '', 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Productos_proveedor`
--

CREATE TABLE `Productos_proveedor` (
  `ID_proveedor` int(5) NOT NULL,
  `ID_producto` int(5) NOT NULL,
  `tarifa` varchar(20) NOT NULL,
  `formula` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Productos_proveedor`
--

INSERT INTO `Productos_proveedor` (`ID_proveedor`, `ID_producto`, `tarifa`, `formula`) VALUES
(1, 1, '2', '2x+2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Proveedores`
--

CREATE TABLE `Proveedores` (
  `ID_proveedor` int(5) NOT NULL,
  `ID_transporte` int(5) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `empresa` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Proveedores`
--

INSERT INTO `Proveedores` (`ID_proveedor`, `ID_transporte`, `nombre`, `empresa`) VALUES
(1, 1, 'Jesús Chapado', 'Cajas Jesús');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tarifas_transporte`
--

CREATE TABLE `Tarifas_transporte` (
  `ID_tarifa` int(5) NOT NULL,
  `ID_transporte` int(5) NOT NULL,
  `intervalos_peso` int(20) NOT NULL,
  `precio` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Transporte`
--

CREATE TABLE `Transporte` (
  `ID_transporte` int(5) NOT NULL,
  `empresa` varchar(40) NOT NULL,
  `tarifa` varchar(40) NOT NULL,
  `horarios` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Transporte`
--

INSERT INTO `Transporte` (`ID_transporte`, `empresa`, `tarifa`, `horarios`) VALUES
(1, 'DHL', '2', '12:00 -18:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
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
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`ID_user`, `user`, `password`, `empresa`, `nombre_contacto`, `email`, `telefono`) VALUES
(1, 'Albert', '1234', 'Plásticos S.L.', 'Albert Vélez Martín', 'albertvelez@gmail.com', 666666666),
(2, 'Carlos', '1234', 'QuimicaCarlos S.A.', 'Carlos Marchante ', 'carlosmarchante@gmail.com', 666555444),
(3, 'Judith', '6666', 'Poligono120', 'Judith Rodriguez', 'judithrod@gmail.com', 644444222);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`ID_admin`);

--
-- Indices de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  ADD PRIMARY KEY (`ID_categoria`);

--
-- Indices de la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD PRIMARY KEY (`ID_pedido`),
  ADD KEY `ID_user` (`ID_user`),
  ADD KEY `ID_producto` (`ID_producto`);

--
-- Indices de la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD PRIMARY KEY (`ID_producto`),
  ADD KEY `ID_categoria` (`ID_categoria`);

--
-- Indices de la tabla `Productos_proveedor`
--
ALTER TABLE `Productos_proveedor`
  ADD KEY `ID_producto` (`ID_producto`),
  ADD KEY `ID_proveedor` (`ID_proveedor`);

--
-- Indices de la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  ADD PRIMARY KEY (`ID_proveedor`),
  ADD KEY `ID_transporte` (`ID_transporte`);

--
-- Indices de la tabla `Tarifas_transporte`
--
ALTER TABLE `Tarifas_transporte`
  ADD PRIMARY KEY (`ID_tarifa`),
  ADD KEY `ID_transporte` (`ID_transporte`);

--
-- Indices de la tabla `Transporte`
--
ALTER TABLE `Transporte`
  ADD PRIMARY KEY (`ID_transporte`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`ID_user`),
  ADD UNIQUE KEY `user` (`user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Admin`
--
ALTER TABLE `Admin`
  MODIFY `ID_admin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `Categorias`
--
ALTER TABLE `Categorias`
  MODIFY `ID_categoria` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  MODIFY `ID_pedido` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `Productos`
--
ALTER TABLE `Productos`
  MODIFY `ID_producto` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  MODIFY `ID_proveedor` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `Tarifas_transporte`
--
ALTER TABLE `Tarifas_transporte`
  MODIFY `ID_tarifa` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `Transporte`
--
ALTER TABLE `Transporte`
  MODIFY `ID_transporte` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `ID_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Pedidos`
--
ALTER TABLE `Pedidos`
  ADD CONSTRAINT `Pedidos_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `Usuarios` (`ID_user`),
  ADD CONSTRAINT `Pedidos_ibfk_2` FOREIGN KEY (`ID_producto`) REFERENCES `Productos` (`ID_producto`);

--
-- Filtros para la tabla `Productos`
--
ALTER TABLE `Productos`
  ADD CONSTRAINT `Productos_ibfk_1` FOREIGN KEY (`ID_categoria`) REFERENCES `Categorias` (`ID_categoria`);

--
-- Filtros para la tabla `Productos_proveedor`
--
ALTER TABLE `Productos_proveedor`
  ADD CONSTRAINT `Productos_proveedor_ibfk_1` FOREIGN KEY (`ID_producto`) REFERENCES `Productos` (`ID_producto`),
  ADD CONSTRAINT `Productos_proveedor_ibfk_2` FOREIGN KEY (`ID_proveedor`) REFERENCES `Proveedores` (`ID_proveedor`);

--
-- Filtros para la tabla `Proveedores`
--
ALTER TABLE `Proveedores`
  ADD CONSTRAINT `Proveedores_ibfk_1` FOREIGN KEY (`ID_transporte`) REFERENCES `Transporte` (`ID_transporte`);

--
-- Filtros para la tabla `Tarifas_transporte`
--
ALTER TABLE `Tarifas_transporte`
  ADD CONSTRAINT `Tarifas_transporte_ibfk_1` FOREIGN KEY (`ID_transporte`) REFERENCES `Transporte` (`ID_transporte`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
