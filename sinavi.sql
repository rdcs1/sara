-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2017 a las 04:40:35
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sinavi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `minuto` int(11) NOT NULL,
  `comentario` text COLLATE utf8_spanish2_ci NOT NULL,
  `id_narracion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'jugadores', 'General User');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `narraciones`
--

CREATE TABLE `narraciones` (
  `id` int(11) NOT NULL,
  `equipo1` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `equipo2` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `marcador1` int(11) NOT NULL,
  `marcador2` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `narraciones`
--

INSERT INTO `narraciones` (`id`, `equipo1`, `equipo2`, `marcador1`, `marcador2`, `estado`) VALUES
(1, 'tutu', 'zizi', 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1495246936, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(2, '::1', 'usuario1', '$2y$08$7.kp4aKJy259VLpOgrpvgun7.12k08/Z8XznHh/XxuKcwsXicbY3y', NULL, 'usuario1@la21a.game', NULL, NULL, NULL, NULL, 1493336808, 1495245456, 1, 'Fulano', '1', NULL, NULL),
(3, '::1', 'usuario2', '$2y$08$z0A6GJbv5R7sJ8TwEZ2oeu1LydLqp4ka/oeZgcZmHtlMm8SqFoRE6', NULL, 'usuario2@la21a.game', NULL, NULL, NULL, NULL, 1493336809, 1493359421, 1, 'Fulano', '2', NULL, NULL),
(4, '::1', 'usuario3', '$2y$08$xOo7TWkQNjvkUZZR2C.WOe7Y79yauuUEzNVLKXdW8H2SyQwLxlAES', NULL, 'usuario3@la21a.game', NULL, NULL, NULL, NULL, 1493336809, NULL, 1, 'Fulano', '3', NULL, NULL),
(5, '::1', 'usuario4', '$2y$08$zkARaOTcASQDbDQIZFeNgudpmnb0IQxKndpBnhs5vS6u7wA9gpiLy', NULL, 'usuario4@la21a.game', NULL, NULL, NULL, NULL, 1493336809, 1493419767, 1, 'Fulano', '4', NULL, NULL),
(6, '::1', 'usuario5', '$2y$08$6qjv5w6jyJsjIMXnNrHPyOe22gSlzoc/l51FIMoyZe6O2CMWkhPKm', NULL, 'usuario5@la21a.game', NULL, NULL, NULL, NULL, 1493336809, 1493360770, 1, 'Fulano', '5', NULL, NULL),
(7, '::1', 'usuario6', '$2y$08$0Qf4aurI6N72GWo6ch0QCe1GU05ThWgYONAG11TSSW0zbEjla4EFm', NULL, 'usuario6@la21a.game', NULL, NULL, NULL, NULL, 1493336809, NULL, 1, 'Fulano', '6', NULL, NULL),
(8, '::1', 'usuario7', '$2y$08$HGAsQe3nL4TyqsaKZ7YFIO0NKHYXsIkPxNMEhZ7.e.qGzdw2vEdme', NULL, 'usuario7@la21a.game', NULL, NULL, NULL, NULL, 1493336809, NULL, 1, 'Fulano', '7', NULL, NULL),
(9, '::1', 'usuario8', '$2y$08$O4IH7MKy5x1R4uAs9nsMgOul9Aa0drsAV.Jikdl2oc8SYqUT/6ftW', NULL, 'usuario8@la21a.game', NULL, NULL, NULL, NULL, 1493336809, NULL, 1, 'Fulano', '8', NULL, NULL),
(10, '::1', 'usuario9', '$2y$08$K73lTppWtB62AmIFGwE7Z.9544AZNRh9x7G.oiC0wVSQ6criz7Fbi', NULL, 'usuario9@la21a.game', NULL, NULL, NULL, NULL, 1493336810, NULL, 1, 'Fulano', '9', NULL, NULL),
(11, '::1', 'usuario10', '$2y$08$9jJe0yJvrO.7j7Jbzb44we8rkJgx/F2okaPxoR.Ohj7uvNAsR9oja', NULL, 'usuario10@la21a.game', NULL, NULL, NULL, NULL, 1493336810, NULL, 1, 'Fulano', '10', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 3, 2),
(5, 4, 2),
(6, 5, 2),
(7, 6, 2),
(8, 7, 2),
(9, 8, 2),
(10, 9, 2),
(11, 10, 2),
(12, 11, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `narraciones`
--
ALTER TABLE `narraciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `narraciones`
--
ALTER TABLE `narraciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
