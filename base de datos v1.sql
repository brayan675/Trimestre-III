-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-08-2026 a las 00:49:15
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `controlate`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_calidad`
--

CREATE TABLE `control_calidad` (
  `id_control` int(11) NOT NULL,
  `fecha_revision` date NOT NULL,
  `cantidad_revisada` int(11) NOT NULL,
  `cantidad_rechazada` int(11) NOT NULL,
  `observaciones` text DEFAULT NULL,
  `id_lote` int(11) NOT NULL,
  `id_operacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `defecto`
--

CREATE TABLE `defecto` (
  `id_defecto` int(11) NOT NULL,
  `nombre_defecto` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo_defecto` varchar(50) NOT NULL,
  `arreglo` varchar(100) NOT NULL,
  `id_control` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `id_supervisor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_contratante`
--

CREATE TABLE `empresa_contratante` (
  `id_empresa` varchar(50) NOT NULL,
  `nombre_empresa` varchar(100) NOT NULL,
  `nit` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote_produccion`
--

CREATE TABLE `lote_produccion` (
  `id_lote` int(11) NOT NULL,
  `codigo_referencia` varchar(50) NOT NULL,
  `fecha_recepcion` date NOT NULL,
  `fecha_entrega` date NOT NULL,
  `cantidad_prendas` int(11) NOT NULL,
  `estado_lote` varchar(50) NOT NULL,
  `observaciones` text DEFAULT NULL,
  `id_referencia` int(11) NOT NULL,
  `id_empresa` varchar(50) NOT NULL,
  `id_supervisor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maquina`
--

CREATE TABLE `maquina` (
  `id_maquina` int(11) NOT NULL,
  `codigo_maquina` varchar(50) NOT NULL,
  `tipo_maquina` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `condiciones` text DEFAULT NULL,
  `id_modulo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `id_modulo` int(11) NOT NULL,
  `codigo_maquina` varchar(50) NOT NULL,
  `nombre_modulo` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `id_supervisor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operacion`
--

CREATE TABLE `operacion` (
  `id_operacion` int(11) NOT NULL,
  `nombre_operacion` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `id_maquina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operario`
--

CREATE TABLE `operario` (
  `id_operario` varchar(50) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_salida` date DEFAULT NULL,
  `documento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `metodo` varchar(50) NOT NULL,
  `rendimiento` decimal(10,2) NOT NULL,
  `id_operario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `documento` varchar(50) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `genero` varchar(50) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `id_produccion` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `cantidad_realizada` int(11) NOT NULL,
  `cantidad_rechazada` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `pago_calculated` decimal(10,2) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `id_operario` varchar(50) NOT NULL,
  `id_operacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recepcion`
--

CREATE TABLE `recepcion` (
  `id_recepcion` int(11) NOT NULL,
  `id_personas` varchar(50) NOT NULL,
  `telefonos` varchar(50) NOT NULL,
  `nit` varchar(50) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `observaciones` text DEFAULT NULL,
  `id_empresa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referencia_pantalon`
--

CREATE TABLE `referencia_pantalon` (
  `id_referencia` int(11) NOT NULL,
  `codigo_referencia` varchar(50) NOT NULL,
  `nombre_referencia` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rendimiento`
--

CREATE TABLE `rendimiento` (
  `id_rendimiento` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `cantidad_realizada` int(11) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `descripcion` text DEFAULT NULL,
  `cantidad_rechazada` int(11) NOT NULL,
  `id_maquina` int(11) NOT NULL,
  `id_operario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte_maquinaria`
--

CREATE TABLE `reporte_maquinaria` (
  `id_reporte` int(11) NOT NULL,
  `id_maquina` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `observaciones` text DEFAULT NULL,
  `nombre_maquina` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `control_calidad`
--
ALTER TABLE `control_calidad`
  ADD PRIMARY KEY (`id_control`),
  ADD KEY `id_lote` (`id_lote`),
  ADD KEY `id_operacion` (`id_operacion`);

--
-- Indices de la tabla `defecto`
--
ALTER TABLE `defecto`
  ADD PRIMARY KEY (`id_defecto`),
  ADD KEY `id_control` (`id_control`),
  ADD KEY `id_lote` (`id_lote`),
  ADD KEY `id_supervisor` (`id_supervisor`);

--
-- Indices de la tabla `empresa_contratante`
--
ALTER TABLE `empresa_contratante`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `lote_produccion`
--
ALTER TABLE `lote_produccion`
  ADD PRIMARY KEY (`id_lote`),
  ADD KEY `id_referencia` (`id_referencia`),
  ADD KEY `id_empresa` (`id_empresa`),
  ADD KEY `id_supervisor` (`id_supervisor`);

--
-- Indices de la tabla `maquina`
--
ALTER TABLE `maquina`
  ADD PRIMARY KEY (`id_maquina`),
  ADD KEY `id_modulo` (`id_modulo`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id_modulo`),
  ADD KEY `id_supervisor` (`id_supervisor`);

--
-- Indices de la tabla `operacion`
--
ALTER TABLE `operacion`
  ADD PRIMARY KEY (`id_operacion`),
  ADD KEY `id_maquina` (`id_maquina`);

--
-- Indices de la tabla `operario`
--
ALTER TABLE `operario`
  ADD PRIMARY KEY (`id_operario`),
  ADD KEY `documento` (`documento`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_operario` (`id_operario`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`documento`),
  ADD KEY `id_rol` (`id_rol`);

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`id_produccion`),
  ADD KEY `id_lote` (`id_lote`),
  ADD KEY `id_operario` (`id_operario`),
  ADD KEY `id_operacion` (`id_operacion`);

--
-- Indices de la tabla `recepcion`
--
ALTER TABLE `recepcion`
  ADD PRIMARY KEY (`id_recepcion`),
  ADD KEY `id_personas` (`id_personas`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- Indices de la tabla `referencia_pantalon`
--
ALTER TABLE `referencia_pantalon`
  ADD PRIMARY KEY (`id_referencia`);

--
-- Indices de la tabla `rendimiento`
--
ALTER TABLE `rendimiento`
  ADD PRIMARY KEY (`id_rendimiento`),
  ADD KEY `id_maquina` (`id_maquina`),
  ADD KEY `id_operario` (`id_operario`);

--
-- Indices de la tabla `reporte_maquinaria`
--
ALTER TABLE `reporte_maquinaria`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `id_maquina` (`id_maquina`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `control_calidad`
--
ALTER TABLE `control_calidad`
  MODIFY `id_control` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `defecto`
--
ALTER TABLE `defecto`
  MODIFY `id_defecto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lote_produccion`
--
ALTER TABLE `lote_produccion`
  MODIFY `id_lote` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `maquina`
--
ALTER TABLE `maquina`
  MODIFY `id_maquina` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id_modulo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `operacion`
--
ALTER TABLE `operacion`
  MODIFY `id_operacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `id_produccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recepcion`
--
ALTER TABLE `recepcion`
  MODIFY `id_recepcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `referencia_pantalon`
--
ALTER TABLE `referencia_pantalon`
  MODIFY `id_referencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rendimiento`
--
ALTER TABLE `rendimiento`
  MODIFY `id_rendimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reporte_maquinaria`
--
ALTER TABLE `reporte_maquinaria`
  MODIFY `id_reporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `control_calidad`
--
ALTER TABLE `control_calidad`
  ADD CONSTRAINT `control_calidad_ibfk_1` FOREIGN KEY (`id_lote`) REFERENCES `lote_produccion` (`id_lote`),
  ADD CONSTRAINT `control_calidad_ibfk_2` FOREIGN KEY (`id_operacion`) REFERENCES `operacion` (`id_operacion`);

--
-- Filtros para la tabla `defecto`
--
ALTER TABLE `defecto`
  ADD CONSTRAINT `defecto_ibfk_1` FOREIGN KEY (`id_control`) REFERENCES `control_calidad` (`id_control`),
  ADD CONSTRAINT `defecto_ibfk_2` FOREIGN KEY (`id_lote`) REFERENCES `lote_produccion` (`id_lote`),
  ADD CONSTRAINT `defecto_ibfk_3` FOREIGN KEY (`id_supervisor`) REFERENCES `personas` (`documento`);

--
-- Filtros para la tabla `lote_produccion`
--
ALTER TABLE `lote_produccion`
  ADD CONSTRAINT `lote_produccion_ibfk_1` FOREIGN KEY (`id_referencia`) REFERENCES `referencia_pantalon` (`id_referencia`),
  ADD CONSTRAINT `lote_produccion_ibfk_2` FOREIGN KEY (`id_empresa`) REFERENCES `empresa_contratante` (`id_empresa`),
  ADD CONSTRAINT `lote_produccion_ibfk_3` FOREIGN KEY (`id_supervisor`) REFERENCES `personas` (`documento`);

--
-- Filtros para la tabla `maquina`
--
ALTER TABLE `maquina`
  ADD CONSTRAINT `maquina_ibfk_1` FOREIGN KEY (`id_modulo`) REFERENCES `modulo` (`id_modulo`);

--
-- Filtros para la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD CONSTRAINT `modulo_ibfk_1` FOREIGN KEY (`id_supervisor`) REFERENCES `personas` (`documento`);

--
-- Filtros para la tabla `operacion`
--
ALTER TABLE `operacion`
  ADD CONSTRAINT `operacion_ibfk_1` FOREIGN KEY (`id_maquina`) REFERENCES `maquina` (`id_maquina`);

--
-- Filtros para la tabla `operario`
--
ALTER TABLE `operario`
  ADD CONSTRAINT `operario_ibfk_1` FOREIGN KEY (`documento`) REFERENCES `personas` (`documento`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_operario`) REFERENCES `operario` (`id_operario`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD CONSTRAINT `produccion_ibfk_1` FOREIGN KEY (`id_lote`) REFERENCES `lote_produccion` (`id_lote`),
  ADD CONSTRAINT `produccion_ibfk_2` FOREIGN KEY (`id_operario`) REFERENCES `operario` (`id_operario`),
  ADD CONSTRAINT `produccion_ibfk_3` FOREIGN KEY (`id_operacion`) REFERENCES `operacion` (`id_operacion`);

--
-- Filtros para la tabla `recepcion`
--
ALTER TABLE `recepcion`
  ADD CONSTRAINT `recepcion_ibfk_1` FOREIGN KEY (`id_personas`) REFERENCES `personas` (`documento`),
  ADD CONSTRAINT `recepcion_ibfk_2` FOREIGN KEY (`id_empresa`) REFERENCES `empresa_contratante` (`id_empresa`);

--
-- Filtros para la tabla `rendimiento`
--
ALTER TABLE `rendimiento`
  ADD CONSTRAINT `rendimiento_ibfk_1` FOREIGN KEY (`id_maquina`) REFERENCES `maquina` (`id_maquina`),
  ADD CONSTRAINT `rendimiento_ibfk_2` FOREIGN KEY (`id_operario`) REFERENCES `operario` (`id_operario`);

--
-- Filtros para la tabla `reporte_maquinaria`
--
ALTER TABLE `reporte_maquinaria`
  ADD CONSTRAINT `reporte_maquinaria_ibfk_1` FOREIGN KEY (`id_maquina`) REFERENCES `maquina` (`id_maquina`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
