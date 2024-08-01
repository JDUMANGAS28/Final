-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2024 at 11:16 PM
-- Server version: 10.4.32-MariaDBphp
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `consultation_record`
--

CREATE TABLE `consultation_record` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `complaint` varchar(255) NOT NULL,
  `blood_pressure` varchar(20) DEFAULT NULL,
  `pulse_rate` varchar(20) DEFAULT NULL,
  `oxygen_sat` varchar(20) DEFAULT NULL,
  `temp` varchar(20) DEFAULT NULL,
  `treatment` varchar(255) NOT NULL,
  `medicine_id` int(11) DEFAULT NULL,
  `time_in` datetime DEFAULT current_timestamp(),
  `time_out` datetime DEFAULT NULL,
  `is_timeout` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consultation_record`
--

INSERT INTO `consultation_record` (`id`, `student_id`, `complaint`, `blood_pressure`, `pulse_rate`, `oxygen_sat`, `temp`, `treatment`, `medicine_id`, `time_in`, `time_out`, `is_timeout`) VALUES
(1, 202110878, 'Menstruational Cramps', '120/80', '67', '98', '36.7', 'Napkin Chariz', NULL, '2024-05-03 21:47:47', NULL, 0),
(2, 202110878, 'Heartburn', '120/80', '67', '98', '36.7', 'Pagkain Lang', NULL, '2024-05-03 21:47:47', '2024-05-04 05:09:29', 1);

--
-- Triggers `consultation_record`
--
DELIMITER $$
CREATE TRIGGER `populate_time_out` BEFORE UPDATE ON `consultation_record` FOR EACH ROW BEGIN
    IF NEW.is_timeout = 1 THEN
        SET NEW.time_out = NOW();
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_medicine_quantity` AFTER INSERT ON `consultation_record` FOR EACH ROW BEGIN
    DECLARE medicine_quantity INT;
    SELECT quantity INTO medicine_quantity FROM medicine WHERE medicine_id = NEW.medicine_id;
    IF medicine_quantity IS NOT NULL THEN
        UPDATE medicine SET quantity = quantity - 1 WHERE medicine_id = NEW.medicine_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicine_id` int(11) NOT NULL,
  `medicine_name` varchar(255) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `size` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `expiration_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`medicine_id`, `medicine_name`, `unit`, `size`, `quantity`, `expiration_date`) VALUES
(1, 'Paracetamol', 'Tablet', '500 mg', 50, '2030-04-04'),
(2, 'Advil', 'Capsule', '100 mg', 60, '2030-04-04');

-- --------------------------------------------------------

--
-- Table structure for table `student_profile`
--

CREATE TABLE `student_profile` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `student_lrn` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  `sex_at_birth` varchar(10) NOT NULL,
  `grade_level` int(11) NOT NULL,
  `section` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_profile`
--

INSERT INTO `student_profile` (`student_id`, `first_name`, `middle_name`, `last_name`, `extension`, `student_lrn`, `birth_date`, `sex_at_birth`, `grade_level`, `section`) VALUES
(202110878, 'Gericho', 'Jollibee', 'Delos Reyes', NULL, 1069080045, '2003-04-30', 'Male', 7, 'Topaz');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `consultation_record`
--
ALTER TABLE `consultation_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `medicine_id` (`medicine_id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicine_id`);

--
-- Indexes for table `student_profile`
--
ALTER TABLE `student_profile`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `student_lrn` (`student_lrn`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `consultation_record`
--
ALTER TABLE `consultation_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medicine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_profile`
--
ALTER TABLE `student_profile`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202110879;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `consultation_record`
--
ALTER TABLE `consultation_record`
  ADD CONSTRAINT `consultation_record_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_profile` (`student_id`),
  ADD CONSTRAINT `consultation_record_ibfk_2` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`medicine_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
