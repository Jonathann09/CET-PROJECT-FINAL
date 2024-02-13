-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2024 at 03:17 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loginsystemtut`
--

-- --------------------------------------------------------

--
-- Table structure for table `finishedlessons`
--

CREATE TABLE `finishedlessons` (
  `FinishedID` int(2) NOT NULL,
  `UserID` int(2) DEFAULT NULL,
  `LessonID` int(2) DEFAULT NULL,
  `DateCompleted` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imgupload`
--

CREATE TABLE `imgupload` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `imgupload`
--

INSERT INTO `imgupload` (`id`, `userid`, `status`) VALUES
(1, 2, 1),
(2, 4, 1),
(3, 5, 1),
(4, 6, 1),
(5, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `LessonID` int(2) NOT NULL,
  `LessonTitle` varchar(100) NOT NULL,
  `LessonContent` text NOT NULL,
  `LevelOfDifficulty` varchar(20) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `QuizID` int(2) NOT NULL,
  `LessonID` int(2) DEFAULT NULL,
  `QuizQuestion` text DEFAULT NULL,
  `CorrectAnswer` varchar(30) DEFAULT NULL,
  `Option1` varchar(30) DEFAULT NULL,
  `Option2` varchar(30) DEFAULT NULL,
  `Option3` varchar(30) DEFAULT NULL,
  `Option4` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`QuizID`, `LessonID`, `QuizQuestion`, `CorrectAnswer`, `Option1`, `Option2`, `Option3`, `Option4`) VALUES
(1, NULL, 'Which of the following letters correspond to the symbol?', 'A', 'E', 'A', 'O', 'I'),
(2, NULL, 'What syllable is present in the word \"abakada\" and also present in the word \"Bata\"??', 'Ba', 'Ba', 'Ka', 'Da', 'Ta'),
(3, NULL, 'Which word is formed by combining \"Pa\", \"Ni\", and \"G\"?', 'Panig', 'Pangi', 'Panga', 'Panig', 'Pagpa'),
(4, NULL, 'Which sentence is correctly formed in Tagalog using \"Ma\", \"Sa\", \"Ka\"?', 'kasama', 'makasa', 'kasama', 'maaksa', 'samaka');

-- --------------------------------------------------------

--
-- Table structure for table `userprofiles`
--

CREATE TABLE `userprofiles` (
  `ProfileID` int(2) NOT NULL,
  `UserID` int(2) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Avatar` varchar(255) DEFAULT NULL,
  `Bio` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userprofiles`
--

INSERT INTO `userprofiles` (`ProfileID`, `UserID`, `FirstName`, `LastName`, `DateOfBirth`, `Avatar`, `Bio`) VALUES
(0, 4, 'jonathan', 'urrete', '2003-01-24', '', 'awitized'),
(0, 7, 'awaw', 'awaw', '0000-00-00', '', 'edi wow');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idUsers` int(11) NOT NULL,
  `uidUsers` tinytext NOT NULL,
  `emailUsers` tinytext NOT NULL,
  `pwdUsers` longtext NOT NULL,
  `RegistrationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `Role` enum('Teacher','NormalUser','Student') NOT NULL DEFAULT 'NormalUser'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idUsers`, `uidUsers`, `emailUsers`, `pwdUsers`, `RegistrationDate`, `Role`) VALUES
(1, 'nudi', 'nudi@gmail.com', '$2y$10$UD1sOWHyHugDIlgf0eEqbOxrK7rhpfbJgbSLp4betuaG/85fZNxNa', '2024-02-12 23:25:44', 'NormalUser'),
(2, 'awit', 'awit@gmail.com', '$2y$10$yTrbmDsZY0AEVooNVEBaUulAhgxOVvo3Eslmqn01QdyBThz2c9FiG', '2024-02-12 23:25:44', 'NormalUser'),
(3, 'nthnsmol', 'christiannathanielsimple@gmail.com', '$2y$10$orUZOEKfixN/.yXnQvXeNe/A4xt7B9JBt2iSI1HkPAsJzFDmBeHIy', '2024-02-08 17:59:57', 'NormalUser'),
(4, 'natnat', 'natnat@gmail.com', '$2y$10$Gqv16IZ71hSFgMSzp0Q6BOrtIKeRYCCQwX7/iNmeMRumJ7r.v7AEO', '2024-02-13 00:08:08', 'NormalUser'),
(5, 'hazel', 'nudi@gmail.com', '$2y$10$l3rNCcJW1TF62K9.PTdkxO61xM77Irwz9Q4r4vpyEPhtFm71dSyYi', '2024-02-13 01:13:31', 'NormalUser'),
(6, 'noods', 'noods@gmail.com', '$2y$10$0ShTYeLvm3Q/25RJ1nhoeOiywhJY9zrsjMfcUNXwIubVF1oJB61cG', '2024-02-13 01:43:57', 'NormalUser'),
(7, 'ed', 'ed@gmail.com', '$2y$10$0y.ZekhdrP7m2DzOADxdK.y4JFwVmD62dvm.gKay4ZwP1tbCF2.oe', '2024-02-13 02:01:14', 'NormalUser');

-- --------------------------------------------------------

--
-- Table structure for table `userscores`
--

CREATE TABLE `userscores` (
  `ScoreID` int(2) NOT NULL,
  `UserID` int(2) DEFAULT NULL,
  `QuizID` int(2) DEFAULT NULL,
  `Score` int(2) DEFAULT NULL,
  `DateCompleted` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `finishedlessons`
--
ALTER TABLE `finishedlessons`
  ADD PRIMARY KEY (`FinishedID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `LessonID` (`LessonID`);

--
-- Indexes for table `imgupload`
--
ALTER TABLE `imgupload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`LessonID`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`QuizID`),
  ADD KEY `LessonID` (`LessonID`);

--
-- Indexes for table `userprofiles`
--
ALTER TABLE `userprofiles`
  ADD KEY `userprofiles_ibfk_1` (`UserID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUsers`);

--
-- Indexes for table `userscores`
--
ALTER TABLE `userscores`
  ADD PRIMARY KEY (`ScoreID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `QuizID` (`QuizID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `imgupload`
--
ALTER TABLE `imgupload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUsers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `finishedlessons`
--
ALTER TABLE `finishedlessons`
  ADD CONSTRAINT `finishedlessons_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`idUsers`),
  ADD CONSTRAINT `finishedlessons_ibfk_2` FOREIGN KEY (`LessonID`) REFERENCES `lessons` (`LessonID`);

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`LessonID`) REFERENCES `lessons` (`LessonID`);

--
-- Constraints for table `userprofiles`
--
ALTER TABLE `userprofiles`
  ADD CONSTRAINT `userprofiles_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`idUsers`);

--
-- Constraints for table `userscores`
--
ALTER TABLE `userscores`
  ADD CONSTRAINT `userscores_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`idUsers`),
  ADD CONSTRAINT `userscores_ibfk_2` FOREIGN KEY (`QuizID`) REFERENCES `quizzes` (`QuizID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
