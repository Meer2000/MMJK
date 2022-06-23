-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: bx933v0pqjb7mhbw56gd-mysql.services.clever-cloud.com:3306
-- Generation Time: Jun 17, 2022 at 09:00 PM
-- Server version: 8.0.15-5
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bx933v0pqjb7mhbw56gd`
--

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

CREATE TABLE `balance` (
  `id` int(11) NOT NULL,
  `total` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'valor neto del pedido',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `balance`
--

INSERT INTO `balance` (`id`, `total`) VALUES
(1, '35000'),
(2, '20000');

-- --------------------------------------------------------

--
-- Table structure for table `cargo`
--

CREATE TABLE `cargo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'rol del usuario',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cargo`
--

INSERT INTO `cargo` (`id`, `nombre`) VALUES
(1, 'usuario'),
(2, 'administrador');

-- --------------------------------------------------------

--
-- Table structure for table `cargo_usuarios`
--

CREATE TABLE `cargo_usuarios` (
  `id` int(11) NOT NULL,
  `cargo_id` int(11) NOT NULL COMMENT 'id del cargo ',
  `usuarios_id` int(11) NOT NULL COMMENT 'id del usuario',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cargo_usuarios`
--

INSERT INTO `cargo_usuarios` (`id`, `cargo_id`, `usuarios_id`) VALUES
(1, 2, 4),
(2, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `detalle` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sugerencia adicional para el pedido',
  `usuario_id` int(11) NOT NULL COMMENT 'id del usuario que realiza la observación',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comentarios`
--

INSERT INTO `comentarios` (`id`, `detalle`, `usuario_id`) VALUES
(1, 'sin carne', 4),
(2, 'con mazorca', 3);

-- --------------------------------------------------------

--
-- Table structure for table `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `estado_pago` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'estado de pago (cancelado, pago, no pago)',
  `usuarios_id` int(11) NOT NULL COMMENT 'id del usuario',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `factura`
--

INSERT INTO `factura` (`id`, `estado_pago`, `usuarios_id`) VALUES
(1, 'finalizado', 4),
(2, 'en proceso', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `metodo_pago` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'elige el método de pago',
  `total_pagar` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'totalidad del pedido',
  `usuarios_id` int(11) NOT NULL COMMENT 'id del usuario',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pagos`
--

INSERT INTO `pagos` (`id`, `metodo_pago`, `total_pagar`, `usuarios_id`) VALUES
(1, 'efectivo', '35500', 4),
(2, 'nequi', '20000', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `numero_orden` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'numero de pedido',
  `fecha` date NOT NULL COMMENT 'fecha de la orden',
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'detalle de la orden a realizar',
  `pagos_id` int(11) NOT NULL COMMENT 'id del medio de pago',
  `comentarios_id` int(11) NOT NULL COMMENT 'id del comentario',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pedidos`
--

INSERT INTO `pedidos` (`id`, `numero_orden`, `fecha`, `descripcion`, `pagos_id`, `comentarios_id`) VALUES
(1, '12325', '2022-06-11', 'arro con pollo y carne', 1, 1),
(2, '25644', '2022-06-11', 'mazorcada con gran cantidad de queso', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pqr`
--

CREATE TABLE `pqr` (
  `id` int(11) NOT NULL,
  `mensaje` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'mensaje de la inquietud',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pqr`
--

INSERT INTO `pqr` (`id`, `mensaje`) VALUES
(1, 'no me gusto'),
(2, 'esta rico');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombres` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'nombre del producto',
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'descripción del producto',
  `precio` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'valor unitario del producto',
  `estado` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'estado del producto si esta disponible o agotado',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `nombres`, `descripcion`, `precio`, `estado`) VALUES
(1, 'mazorcada', 'carne desmechada pollo queso 300ml de crema de leche', '20000', 'disponible'),
(2, 'arroz con pollo', '400gr arroz\r\n200gr salchicha\r\n1lb pollo', '35500', 'disponible');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'nombres de los usuarios',
  `apellidos` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'apellidos de los usuarios',
  `tipo_documento` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'los usuarios eligen su tipo de documento',
  `numero_documento` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'los usuarios ingresan su numero de identificacion',
  `correo` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ingreso de correo personal',
  `contrasena` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'contraseña privada',
  `telefono` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'numero de contacto',
  `codigo_administrador` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'en caso de ser administrador colocar código asignado',
  `pqr_id` int(11) NOT NULL COMMENT 'reclamos respecto al pedido',
  `balance_id` int(11) NOT NULL COMMENT 'resumen de pedido',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `tipo_documento`, `numero_documento`, `correo`, `contrasena`, `telefono`, `codigo_administrador`, `pqr_id`, `balance_id`) VALUES
(3, 'esteban', 'escarraga', 'cc', '2525', 'esteban@gmail.com', '1234', '554464', '126', 2, 2),
(4, 'camilo', 'rodriguez', 'ti', '0000', 'camilo@gmail.com', '3221', '5465464564', '2525', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_pedidos`
--

CREATE TABLE `usuarios_pedidos` (
  `id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL COMMENT 'id del usuario',
  `pedidos_id` int(11) NOT NULL COMMENT 'id del pedido',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios_pedidos`
--

INSERT INTO `usuarios_pedidos` (`id`, `usuarios_id`, `pedidos_id`) VALUES
(1, 4, 1),
(2, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_productos`
--

CREATE TABLE `usuarios_productos` (
  `id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL COMMENT 'id del usuario',
  `productos_id` int(11) NOT NULL COMMENT 'id productos',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios_productos`
--

INSERT INTO `usuarios_productos` (`id`, `usuarios_id`, `productos_id`) VALUES
(1, 4, 1),
(2, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `verificar_pedido`
--

CREATE TABLE `verificar_pedido` (
  `id` int(11) NOT NULL,
  `estado` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'estado del pedido si esta en curso , entregado',
  `usuarios_id` int(11) NOT NULL COMMENT 'id del usuario',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `verificar_pedido`
--

INSERT INTO `verificar_pedido` (`id`, `estado`, `usuarios_id`) VALUES
(1, 'disponible', 4),
(2, 'disponible', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `balance`
--
ALTER TABLE `balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cargo_usuarios`
--
ALTER TABLE `cargo_usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cargo_id` (`cargo_id`),
  ADD KEY `usuarios_id` (`usuarios_id`);

--
-- Indexes for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_id` (`usuarios_id`);

--
-- Indexes for table `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_id` (`usuarios_id`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pagos_id` (`pagos_id`),
  ADD KEY `comentarios_id` (`comentarios_id`);

--
-- Indexes for table `pqr`
--
ALTER TABLE `pqr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `balance_id` (`balance_id`),
  ADD KEY `pqr_id` (`pqr_id`);

--
-- Indexes for table `usuarios_pedidos`
--
ALTER TABLE `usuarios_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_id` (`usuarios_id`),
  ADD KEY `pedidos_id` (`pedidos_id`);

--
-- Indexes for table `usuarios_productos`
--
ALTER TABLE `usuarios_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productos_id` (`productos_id`),
  ADD KEY `usuarios_id` (`usuarios_id`);

--
-- Indexes for table `verificar_pedido`
--
ALTER TABLE `verificar_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_id` (`usuarios_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `balance`
--
ALTER TABLE `balance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cargo_usuarios`
--
ALTER TABLE `cargo_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pqr`
--
ALTER TABLE `pqr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usuarios_pedidos`
--
ALTER TABLE `usuarios_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuarios_productos`
--
ALTER TABLE `usuarios_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `verificar_pedido`
--
ALTER TABLE `verificar_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cargo_usuarios`
--
ALTER TABLE `cargo_usuarios`
  ADD CONSTRAINT `cargo_usuarios_ibfk_1` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cargo_usuarios_ibfk_2` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`pagos_id`) REFERENCES `pagos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`comentarios_id`) REFERENCES `comentarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`pqr_id`) REFERENCES `pqr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`balance_id`) REFERENCES `balance` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `usuarios_pedidos`
--
ALTER TABLE `usuarios_pedidos`
  ADD CONSTRAINT `usuarios_pedidos_ibfk_1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `usuarios_pedidos_ibfk_2` FOREIGN KEY (`pedidos_id`) REFERENCES `pedidos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `usuarios_productos`
--
ALTER TABLE `usuarios_productos`
  ADD CONSTRAINT `usuarios_productos_ibfk_1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `usuarios_productos_ibfk_2` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `verificar_pedido`
--
ALTER TABLE `verificar_pedido`
  ADD CONSTRAINT `verificar_pedido_ibfk_1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
