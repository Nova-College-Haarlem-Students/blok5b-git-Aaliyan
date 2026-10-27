-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Oct 27, 2026 at 10:21 AM
-- Server version: 10.11.19-MariaDB-ubu2204
-- PHP Version: 8.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Escape-room`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `room_id`, `action`, `created_at`) VALUES
(1, 2, 1, 'Room aangemaakt', '2026-10-01 09:00:00'),
(2, 3, 2, 'Moeilijkheid aangepast', '2026-10-02 11:30:00'),
(3, 2, 3, 'Beschrijving aangepast', '2026-10-03 14:00:00'),
(4, 3, 7, 'Room tijdelijk uitgezet', '2026-10-04 10:15:00'),
(5, 1, 5, 'Prijs aangepast', '2026-10-05 15:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `player_count` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `escape_time` int(11) DEFAULT NULL,
  `hint_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `room_id`, `booking_date`, `booking_time`, `player_count`, `total_price`, `escape_time`, `hint_count`) VALUES
(1, 4, 1, '2026-10-10', '10:00:00', 4, 98.00, 48, 2),
(2, 5, 2, '2026-10-10', '12:00:00', 5, 147.50, 54, 3),
(3, 6, 3, '2026-10-11', '14:00:00', 3, 96.00, NULL, 4),
(4, 7, 4, '2026-10-11', '16:00:00', 6, 132.00, 39, NULL),
(5, 8, 5, '2026-10-12', '10:00:00', 4, 110.00, 58, 2),
(6, 4, 6, '2026-10-12', '12:00:00', 2, 50.00, 45, 1),
(7, 5, 1, '2026-10-13', '14:00:00', 3, 73.50, 51, NULL),
(8, 6, 2, '2026-10-13', '16:00:00', 4, 118.00, 59, 5),
(9, 7, 3, '2026-10-14', '10:00:00', 5, 160.00, 57, 3),
(10, 8, 4, '2026-10-14', '12:00:00', 2, 44.00, 42, NULL),
(11, 4, 5, '2026-11-05', '14:00:00', 6, 165.00, NULL, NULL),
(12, 5, 6, '2026-11-06', '16:00:00', 4, 100.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(3, 'admin'),
(1, 'klant'),
(2, 'medewerker');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `theme` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `story` text NOT NULL,
  `difficulty` int(11) NOT NULL,
  `min_players` int(11) NOT NULL,
  `max_players` int(11) NOT NULL,
  `price_per_person` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `theme`, `image`, `story`, `difficulty`, `min_players`, `max_players`, `price_per_person`, `is_active`) VALUES
(1, 'De Ontsnapping', 'Gevangenis', 'images/gevangenis.jpg', 'Ontsnap uit de gevangenis voordat de bewaker terugkomt.', 3, 2, 6, 24.50, 1),
(2, 'Virus X', 'Laboratorium', 'images/laboratorium.jpg', 'Vind het tegengif voordat de tijd op is.', 4, 3, 8, 29.50, 1),
(3, 'Het Spookhuis', 'Horror', 'images/spookhuis.jpg', 'Ontdek het geheim van het verlaten huis.', 5, 2, 6, 32.00, 1),
(4, 'De Schatkamer', 'Avontuur', 'images/schatkamer.jpg', 'Los de puzzels op en vind de verborgen schat.', 2, 2, 8, 22.00, 1),
(5, 'De Tijdmachine', 'Sciencefiction', 'images/tijdmachine.jpg', 'Repareer de tijdmachine en keer terug naar het heden.', 4, 3, 7, 27.50, 1),
(6, 'Het Verdwenen Dossier', 'Detective', 'images/detective.jpg', 'Zoek het dossier en ontmasker de dader.', 3, 2, 5, 25.00, 1),
(7, 'De Piratengrot', 'Avontuur', 'images/piraten.jpg', 'Vind de uitgang van een geheime piratengrot.', 2, 2, 8, 21.00, 0),
(8, 'Code Rood', 'Laboratorium', 'images/coderood.jpg', 'Stop het alarm in een verlaten onderzoekscentrum.', 5, 4, 8, 34.00, 0),
(9, 'De Oude Bibliotheek', 'Mysterie', 'images/bibliotheek.jpg', 'Ontcijfer een geheim dat eeuwen verborgen bleef.', 3, 2, 6, 23.50, 0),
(10, 'De Ruimtemissie', 'Sciencefiction', 'images/ruimte.jpg', 'Herstel het ruimteschip voordat de zuurstof opraakt.', 4, 3, 8, 30.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `firstname`, `lastname`, `email`, `password`) VALUES
(1, 3, 'Noor', 'Jansen', 'noor@lockedinn.test', '$2y$12$wbE3xS6.f7K0mGQRQQ/4u.uWzGk/NASw/x5nZt.liGNu8dqcTeDWK'),
(2, 2, 'Sam', 'Bakker', 'sam@lockedinn.test', '$2y$12$wbE3xS6.f7K0mGQRQQ/4u.uWzGk/NASw/x5nZt.liGNu8dqcTeDWK'),
(3, 2, 'Lina', 'Visser', 'lina@lockedinn.test', '$2y$12$wbE3xS6.f7K0mGQRQQ/4u.uWzGk/NASw/x5nZt.liGNu8dqcTeDWK'),
(4, 1, 'Adam', 'De Vries', 'adam@example.test', '$2y$12$wbE3xS6.f7K0mGQRQQ/4u.uWzGk/NASw/x5nZt.liGNu8dqcTeDWK'),
(5, 1, 'Sara', 'Smit', 'sara@example.test', '$2y$12$wbE3xS6.f7K0mGQRQQ/4u.uWzGk/NASw/x5nZt.liGNu8dqcTeDWK'),
(6, 1, 'Youssef', 'Bos', 'youssef@example.test', '$2y$12$wbE3xS6.f7K0mGQRQQ/4u.uWzGk/NASw/x5nZt.liGNu8dqcTeDWK'),
(7, 1, 'Mila', 'Meijer', 'mila@example.test', '$2y$12$wbE3xS6.f7K0mGQRQQ/4u.uWzGk/NASw/x5nZt.liGNu8dqcTeDWK'),
(8, 1, 'Jayden', 'Mulder', 'jayden@example.test', '$2y$12$wbE3xS6.f7K0mGQRQQ/4u.uWzGk/NASw/x5nZt.liGNu8dqcTeDWK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `activity_logs_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
