-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2017 at 08:46 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `allergies`
--

CREATE TABLE `allergies` (
  `allergy_id` int(11) NOT NULL,
  `allergy_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `diagnosis_id` int(11) NOT NULL,
  `diagnosis_notes` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL,
  `doc_type` varchar(255) NOT NULL,
  `specialization` varchar(255) NOT NULL,
  `emp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `sex` enum('M','F') NOT NULL,
  `address` text NOT NULL,
  `phone` int(11) NOT NULL,
  `dob` date NOT NULL,
  `employee_type` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_started` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fam_history`
--

CREATE TABLE `fam_history` (
  `fam_history_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `notes` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `get_allergy`
--

CREATE TABLE `get_allergy` (
  `get_allergy_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `allergy_id` int(11) NOT NULL,
  `notes` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `get_medication`
--

CREATE TABLE `get_medication` (
  `administer_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `nurse_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `notes` longtext NOT NULL,
  `medication_id` int(11) NOT NULL,
  `amt` int(11) NOT NULL,
  `date_administered` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `get_patient_diagnosis`
--

CREATE TABLE `get_patient_diagnosis` (
  `patient_diagnosis_id` int(11) NOT NULL,
  `diagnosis_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `notes` longtext NOT NULL,
  `date_of_diagnosis` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `get_procedure`
--

CREATE TABLE `get_procedure` (
  `get_procedure_id` int(11) NOT NULL,
  `procedure_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `procedure_notes` longtext NOT NULL,
  `date_of_procedure` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `get_tested`
--

CREATE TABLE `get_tested` (
  `gets_test_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `notes` longtext NOT NULL,
  `test_id` int(11) NOT NULL,
  `date_of_test` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `get_treatment`
--

CREATE TABLE `get_treatment` (
  `get_treatment_id` int(11) NOT NULL,
  `treatment_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `nurse_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `treatment_notes` longtext NOT NULL,
  `date_of_treatment` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `get_vital_signs`
--

CREATE TABLE `get_vital_signs` (
  `vital_signs_check_id` int(11) NOT NULL,
  `vital_signs_id` int(11) NOT NULL,
  `nurse_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `notes` longtext NOT NULL,
  `date_of_vitals` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medication`
--

CREATE TABLE `medication` (
  `medication_id` int(11) NOT NULL,
  `med_name` text NOT NULL,
  `med_amt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nurses`
--

CREATE TABLE `nurses` (
  `nurse_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `nurse_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `sex` enum('M','F') NOT NULL,
  `phone` int(11) NOT NULL,
  `age` int(3) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `procedure`
--

CREATE TABLE `procedure` (
  `procedure_id` int(11) NOT NULL,
  `type` longtext NOT NULL,
  `procedure_results` longtext NOT NULL,
  `procedure_notes` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `results_id` int(11) NOT NULL,
  `tests_id` int(11) NOT NULL,
  `result_notes` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `test_id` int(11) NOT NULL,
  `test_type` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `treatment_id` int(11) NOT NULL,
  `treatment_notes` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vital_signs`
--

CREATE TABLE `vital_signs` (
  `vital_signs_id` int(11) NOT NULL DEFAULT '0',
  `temperature_reading` float NOT NULL,
  `resporatory_rate` int(11) NOT NULL,
  `blood_pressure` varchar(255) NOT NULL,
  `pulse_rate` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `allergies`
--
ALTER TABLE `allergies`
  ADD PRIMARY KEY (`allergy_id`);

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`diagnosis_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `fam_history`
--
ALTER TABLE `fam_history`
  ADD PRIMARY KEY (`fam_history_id`,`patient_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `get_allergy`
--
ALTER TABLE `get_allergy`
  ADD PRIMARY KEY (`get_allergy_id`),
  ADD KEY `allergy_id` (`allergy_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `get_medication`
--
ALTER TABLE `get_medication`
  ADD PRIMARY KEY (`administer_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `nurse_id` (`nurse_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `medication_id` (`medication_id`);

--
-- Indexes for table `get_patient_diagnosis`
--
ALTER TABLE `get_patient_diagnosis`
  ADD PRIMARY KEY (`patient_diagnosis_id`),
  ADD KEY `diagnosis_id` (`diagnosis_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `get_procedure`
--
ALTER TABLE `get_procedure`
  ADD PRIMARY KEY (`get_procedure_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `procedure_id` (`procedure_id`);

--
-- Indexes for table `get_tested`
--
ALTER TABLE `get_tested`
  ADD PRIMARY KEY (`gets_test_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `test_id` (`test_id`);

--
-- Indexes for table `get_treatment`
--
ALTER TABLE `get_treatment`
  ADD PRIMARY KEY (`get_treatment_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `nurse_id` (`nurse_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `treatment_id` (`treatment_id`);

--
-- Indexes for table `get_vital_signs`
--
ALTER TABLE `get_vital_signs`
  ADD PRIMARY KEY (`vital_signs_check_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `nurse_id` (`nurse_id`),
  ADD KEY `vital_signs_id` (`vital_signs_id`);

--
-- Indexes for table `medication`
--
ALTER TABLE `medication`
  ADD PRIMARY KEY (`medication_id`);

--
-- Indexes for table `nurses`
--
ALTER TABLE `nurses`
  ADD PRIMARY KEY (`nurse_id`),
  ADD KEY `employee_id` (`employee_id`) USING BTREE;

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `procedure`
--
ALTER TABLE `procedure`
  ADD PRIMARY KEY (`procedure_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`results_id`,`tests_id`),
  ADD KEY `tests_id` (`tests_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `test_id` (`test_id`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`treatment_id`);

--
-- Indexes for table `vital_signs`
--
ALTER TABLE `vital_signs`
  ADD PRIMARY KEY (`vital_signs_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `allergies`
--
ALTER TABLE `allergies`
  MODIFY `allergy_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `diagnosis_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fam_history`
--
ALTER TABLE `fam_history`
  MODIFY `fam_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `get_allergy`
--
ALTER TABLE `get_allergy`
  MODIFY `get_allergy_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `get_medication`
--
ALTER TABLE `get_medication`
  MODIFY `administer_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `get_patient_diagnosis`
--
ALTER TABLE `get_patient_diagnosis`
  MODIFY `patient_diagnosis_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `get_procedure`
--
ALTER TABLE `get_procedure`
  MODIFY `get_procedure_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `get_tested`
--
ALTER TABLE `get_tested`
  MODIFY `gets_test_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `get_vital_signs`
--
ALTER TABLE `get_vital_signs`
  MODIFY `vital_signs_check_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `medication`
--
ALTER TABLE `medication`
  MODIFY `medication_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nurses`
--
ALTER TABLE `nurses`
  MODIFY `nurse_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `procedure`
--
ALTER TABLE `procedure`
  MODIFY `procedure_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `results_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `treatment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `fam_history`
--
ALTER TABLE `fam_history`
  ADD CONSTRAINT `fam_history_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`);

--
-- Constraints for table `get_allergy`
--
ALTER TABLE `get_allergy`
  ADD CONSTRAINT `allergy_id` FOREIGN KEY (`allergy_id`) REFERENCES `allergies` (`allergy_id`),
  ADD CONSTRAINT `get_allergy_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`);

--
-- Constraints for table `get_medication`
--
ALTER TABLE `get_medication`
  ADD CONSTRAINT `doctor_id` FOREIGN KEY (`doctor_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `medication_id` FOREIGN KEY (`medication_id`) REFERENCES `medication` (`medication_id`),
  ADD CONSTRAINT `nurse_id` FOREIGN KEY (`nurse_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `patient_id` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`);

--
-- Constraints for table `get_patient_diagnosis`
--
ALTER TABLE `get_patient_diagnosis`
  ADD CONSTRAINT `diagnosis_id` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnosis` (`diagnosis_id`),
  ADD CONSTRAINT `get_patient_diagnosis_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`);

--
-- Constraints for table `get_procedure`
--
ALTER TABLE `get_procedure`
  ADD CONSTRAINT `get_procedure_ibfk_1` FOREIGN KEY (`procedure_id`) REFERENCES `procedure` (`procedure_id`),
  ADD CONSTRAINT `get_procedure_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `get_procedure_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`);

--
-- Constraints for table `get_tested`
--
ALTER TABLE `get_tested`
  ADD CONSTRAINT `get_tested_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `get_tested_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `get_tested_ibfk_3` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`);

--
-- Constraints for table `get_treatment`
--
ALTER TABLE `get_treatment`
  ADD CONSTRAINT `get_treatment_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `get_treatment_ibfk_2` FOREIGN KEY (`nurse_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `get_treatment_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `get_treatment_ibfk_4` FOREIGN KEY (`treatment_id`) REFERENCES `treatment` (`treatment_id`);

--
-- Constraints for table `get_vital_signs`
--
ALTER TABLE `get_vital_signs`
  ADD CONSTRAINT `get_vital_signs_ibfk_1` FOREIGN KEY (`nurse_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `get_vital_signs_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `get_vital_signs_ibfk_3` FOREIGN KEY (`vital_signs_id`) REFERENCES `vital_signs` (`vital_signs_id`);

--
-- Constraints for table `nurses`
--
ALTER TABLE `nurses`
  ADD CONSTRAINT `employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`tests_id`) REFERENCES `tests` (`test_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
