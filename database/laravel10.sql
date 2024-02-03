-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-02-2024 a las 04:09:39
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laravel10`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` text COLLATE utf8mb4_unicode_ci,
  `datos_nuevo` text COLLATE utf8mb4_unicode_ci,
  `modulo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial_accions`
--

INSERT INTO `historial_accions` (`id`, `user_id`, `accion`, `descripcion`, `datos_original`, `datos_nuevo`, `modulo`, `fecha`, `hora`, `created_at`, `updated_at`) VALUES
(1, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$6wYUWJ9SOTVMuDn.PN81PeMyjuaMqcyMJCJW8t6Czf2FjdYQoBPke<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 6666<br/>tipo: ADMINISTRADOR<br/>foto: 1706910047_JPERES.png<br/>acceso: 0<br/>fecha_registro: 2024-02-02 00:00:00<br/>created_at: 2024-02-02 16:51:56<br/>updated_at: 2024-02-02 19:29:18<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$6wYUWJ9SOTVMuDn.PN81PeMyjuaMqcyMJCJW8t6Czf2FjdYQoBPke<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 6666<br/>tipo: ADMINISTRADOR<br/>foto: 1706910047_JPERES.png<br/>acceso: 0<br/>fecha_registro: 2024-02-02 00:00:00<br/>created_at: 2024-02-02 16:51:56<br/>updated_at: 2024-02-02 19:29:18<br/>', 'USUARIOS', '2024-02-02', '20:58:17', '2024-02-03 00:58:17', '2024-02-03 00:58:17'),
(2, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$6wYUWJ9SOTVMuDn.PN81PeMyjuaMqcyMJCJW8t6Czf2FjdYQoBPke<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 6666<br/>tipo: ADMINISTRADOR<br/>foto: 1706910047_JPERES.png<br/>acceso: 0<br/>fecha_registro: 2024-02-02 00:00:00<br/>created_at: 2024-02-02 16:51:56<br/>updated_at: 2024-02-02 19:29:18<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$6wYUWJ9SOTVMuDn.PN81PeMyjuaMqcyMJCJW8t6Czf2FjdYQoBPke<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 6666<br/>tipo: ADMINISTRADOR<br/>foto: 1706910047_JPERES.png<br/>acceso: 1<br/>fecha_registro: 2024-02-02 00:00:00<br/>created_at: 2024-02-02 16:51:56<br/>updated_at: 2024-02-02 22:11:43<br/>', 'USUARIOS', '2024-02-02', '22:11:43', '2024-02-03 02:11:43', '2024-02-03 02:11:43'),
(3, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$6wYUWJ9SOTVMuDn.PN81PeMyjuaMqcyMJCJW8t6Czf2FjdYQoBPke<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 6666<br/>tipo: ADMINISTRADOR<br/>foto: 1706910047_JPERES.png<br/>acceso: 1<br/>fecha_registro: 2024-02-02 00:00:00<br/>created_at: 2024-02-02 16:51:56<br/>updated_at: 2024-02-02 22:11:43<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$6wYUWJ9SOTVMuDn.PN81PeMyjuaMqcyMJCJW8t6Czf2FjdYQoBPke<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 6666<br/>tipo: ADMINISTRADOR<br/>foto: 1706910047_JPERES.png<br/>acceso: 1<br/>fecha_registro: 2024-02-02 00:00:00<br/>created_at: 2024-02-02 16:51:56<br/>updated_at: 2024-02-02 22:11:43<br/>', 'USUARIOS', '2024-02-02', '22:17:09', '2024-02-03 02:17:09', '2024-02-03 02:17:09'),
(4, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$6wYUWJ9SOTVMuDn.PN81PeMyjuaMqcyMJCJW8t6Czf2FjdYQoBPke<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 6666<br/>tipo: ADMINISTRADOR<br/>foto: 1706910047_JPERES.png<br/>acceso: 1<br/>fecha_registro: 2024-02-02 00:00:00<br/>created_at: 2024-02-02 16:51:56<br/>updated_at: 2024-02-02 22:11:43<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$6wYUWJ9SOTVMuDn.PN81PeMyjuaMqcyMJCJW8t6Czf2FjdYQoBPke<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 6666<br/>tipo: ADMINISTRADOR<br/>foto: 1706910047_JPERES.png<br/>acceso: 0<br/>fecha_registro: 2024-02-02 00:00:00<br/>created_at: 2024-02-02 16:51:56<br/>updated_at: 2024-02-02 22:17:16<br/>', 'USUARIOS', '2024-02-02', '22:17:16', '2024-02-03 02:17:16', '2024-02-03 02:17:16'),
(5, 1, 'MODIFICACIÓN', 'EL USUARIO admin MODIFICÓ UN USUARIO', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$6wYUWJ9SOTVMuDn.PN81PeMyjuaMqcyMJCJW8t6Czf2FjdYQoBPke<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: <br/>fono: 6666<br/>tipo: ADMINISTRADOR<br/>foto: 1706910047_JPERES.png<br/>acceso: 0<br/>fecha_registro: 2024-02-02 00:00:00<br/>created_at: 2024-02-02 16:51:56<br/>updated_at: 2024-02-02 22:17:16<br/>', 'id: 2<br/>usuario: JPERES<br/>password: $2y$12$6wYUWJ9SOTVMuDn.PN81PeMyjuaMqcyMJCJW8t6Czf2FjdYQoBPke<br/>nombre: JUAN<br/>paterno: PERES<br/>materno: MAMANI<br/>ci: 1234<br/>ci_exp: LP<br/>dir: LOS OLIVOS<br/>email: JUAN@GMAIL.COM<br/>fono: 6666<br/>tipo: ADMINISTRADOR<br/>foto: 1706910047_JPERES.png<br/>acceso: 0<br/>fecha_registro: 2024-02-02 00:00:00<br/>created_at: 2024-02-02 16:51:56<br/>updated_at: 2024-02-02 23:49:55<br/>', 'USUARIOS', '2024-02-02', '23:49:55', '2024-02-03 03:49:55', '2024-02-03 03:49:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucions`
--

CREATE TABLE `institucions` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_sistema` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `historia` text COLLATE utf8mb4_unicode_ci,
  `mision` text COLLATE utf8mb4_unicode_ci,
  `vision` text COLLATE utf8mb4_unicode_ci,
  `objetivo` text COLLATE utf8mb4_unicode_ci,
  `nombre_director` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_director` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_subdirector` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_subdirector` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ubicacion_google` text COLLATE utf8mb4_unicode_ci,
  `img_organigrama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `institucions`
--

INSERT INTO `institucions` (`id`, `nombre`, `nombre_sistema`, `nit`, `historia`, `mision`, `vision`, `objetivo`, `nombre_director`, `foto_director`, `nombre_subdirector`, `foto_subdirector`, `fono1`, `fono2`, `correo1`, `correo2`, `facebook`, `youtube`, `twitter`, `dir`, `ubicacion_google`, `img_organigrama`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'INSTITUCIÓN S.A', 'NOMBRE SISTEMA', '111111111', 'LOREM IPSUM ES SIMPLEMENTE EL TEXTO DE RELLENO DE LAS IMPRENTAS Y ARCHIVOS DE TEXTO. LOREM IPSUM HA SIDO EL TEXTO DE RELLENO ESTÁNDAR DE LAS INDUSTRIAS DESDE EL AÑO 1500, CUANDO UN IMPRESOR (N. DEL T. PERSONA QUE SE DEDICA A LA IMPRENTA) DESCONOCIDO USÓ UNA GALERÍA DE TEXTOS Y LOS MEZCLÓ DE TAL MANERA QUE LOGRÓ HACER UN LIBRO DE TEXTOS ESPECIMEN. NO SÓLO SOBREVIVIÓ 500 AÑOS, SINO QUE TAMBIEN INGRESÓ COMO TEXTO DE RELLENO EN DOCUMENTOS ELECTRÓNICOS,', 'LOREM IPSUM ES SIMPLEMENTE EL TEXTO DE RELLENO DE LAS IMPRENTAS Y ARCHIVOS DE TEXTO. LOREM IPSUM HA SIDO EL TEXTO DE RELLENO ESTÁNDAR DE LAS INDUSTRIAS DESDE EL AÑO 1500, CUANDO UN IMPRESOR (N. DEL T. PERSONA QUE SE DEDICA A LA IMPRENTA) DESCONOCIDO USÓ UNA GALERÍA DE TEXTOS Y LOS MEZCLÓ DE TAL MANERA QUE LOGRÓ HACER UN LIBRO DE TEXTOS ESPECIMEN. NO SÓLO SOBREVIVIÓ 500 AÑOS, SINO QUE TAMBIEN INGRESÓ COMO TEXTO DE RELLENO EN DOCUMENTOS ELECTRÓNICOS', '', 'LOREM IPSUM ES SIMPLEMENTE EL TEXTO DE RELLENO DE LAS IMPRENTAS Y ARCHIVOS DE TEXTO. LOREM IPSUM HA SIDO EL TEXTO DE RELLENO ESTÁNDAR DE LAS INDUSTRIAS DESDE EL AÑO 1500, CUANDO UN IMPRESOR (N. DEL T. PERSONA QUE SE DEDICA A LA IMPRENTA) DESCONOCIDO USÓ UNA GALERÍA DE TEXTOS Y LOS MEZCLÓ DE TAL MANERA QUE LOGRÓ HACER UN LIBRO DE TEXTOS ESPECIMEN. NO SÓLO SOBREVIVIÓ 500 AÑOS, SINO QUE TAMBIEN INGRESÓ COMO TEXTO DE RELLENO EN DOCUMENTOS ELECTRÓNICOS', 'JUAN PERESSS', '1706834799_1.png', 'JOSE PAREDES', '1706834920_1.jpg', '777777', '666666', 'CORREO1@GMAIL.COM', 'CORREO2@GMAIL.COM', 'FACEBOOK', 'YOUTUBE', 'TWITTER', 'LOS OLIVOS', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m21!1m12!1m3!1d12143.389812786238!2d-68.08918332465664!3d-16.52975316867156!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m6!3e0!4m0!4m3!3m2!1d-16.527973505058714!2d-68.08870645756463!5e0!3m2!1ses-419!2sbo!4v1706929714970!5m2!1ses-419!2sbo\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '1706930367_1.WEBP', '1706888928_1.png', NULL, '2024-02-03 03:21:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2024_01_31_165641_create_institucions_table', 1),
(4, '2024_02_02_205431_create_historial_accions_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_exp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceso` int NOT NULL DEFAULT '1',
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `password`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `dir`, `email`, `fono`, `tipo`, `foto`, `acceso`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$12$65d4fgZsvBV5Lc/AxNKh4eoUdbGyaczQ4sSco20feSQANshNLuxSC', 'admin', NULL, NULL, '0', '', '', 'admin@gmail.com', '', 'ADMINISTRADOR', '1706931183_admin.jpg', 1, '2024-01-31', NULL, '2024-02-03 03:33:03'),
(2, 'JPERES', '$2y$12$6wYUWJ9SOTVMuDn.PN81PeMyjuaMqcyMJCJW8t6Czf2FjdYQoBPke', 'JUAN', 'PERES', 'MAMANI', '1234', 'LP', 'LOS OLIVOS', 'JUAN@GMAIL.COM', '6666', 'ADMINISTRADOR', '1706910047_JPERES.png', 0, '2024-02-02', '2024-02-02 20:51:56', '2024-02-03 03:49:55'),
(3, 'EMAMANI', '$2y$12$tx3RgFEDyjqaGFa885ID0OBMVTOJ8GlvknhP6crlbG4Nih96//7BK', 'EDUARDO', 'MAMANI', 'MAMANI', '2222', 'LP', 'LOS OLIVOS', '', '66666', 'ADMINISTRADOR', NULL, 1, '2024-02-02', '2024-02-02 20:58:32', '2024-02-02 20:58:33'),
(4, 'JCORTEZ', '$2y$12$p80rqkDf8Z7oifBVJj9Mq.Ak4w.3QJsa1KooaNLwzbEgn0cjZ2l.a', 'JUAN', 'CORTEZ', 'MAMANI', '3333', 'CB', 'LOS OLIVOS', '', '66666', 'AUXILIAR', NULL, 1, '2024-02-02', '2024-02-02 21:00:30', '2024-02-02 21:00:30'),
(5, 'MMAMANI', '$2y$12$.o2cMjR.fzbUlCItZkbHbOt1D/3.g52vI29IUgZnQkzO4kP3xebJ6', 'MARIA', 'MAMANI', 'MAMANI', '4444', 'LP', 'LOS OLIVOS', '', '666666', 'ADMINISTRADOR', '1706907681_MMAMANI.jpg', 1, '2024-02-02', '2024-02-02 21:01:21', '2024-02-02 21:01:21');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `institucions`
--
ALTER TABLE `institucions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `institucions`
--
ALTER TABLE `institucions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
