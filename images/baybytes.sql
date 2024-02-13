-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2024 at 01:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baybytes`
--

-- --------------------------------------------------------

--
-- Table structure for table `finishedlessons`
--

CREATE TABLE `finishedlessons` (
  `FinishedID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `LessonID` int(11) DEFAULT NULL,
  `DateCompleted` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `LessonID` int(11) NOT NULL,
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
  `ProfileID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Avatar` varchar(255) DEFAULT NULL,
  `Bio` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `RegistrationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `Role` enum('Teacher','NormalUser','Student') NOT NULL DEFAULT 'NormalUser'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Email`, `Password`, `RegistrationDate`, `Role`) VALUES
(1, 'nthnsmol', 'christiannathanielsimple@gmail.com', '$2y$10$orUZOEKfixN/.yXnQvXeNe/A4xt7B9JBt2iSI1HkPAsJzFDmBeHIy', '2024-02-09 01:59:57', 'NormalUser');

-- --------------------------------------------------------

--
-- Table structure for table `userscores`
--

CREATE TABLE `userscores` (
  `ScoreID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `QuizID` int(11) DEFAULT NULL,
  `Score` int(11) DEFAULT NULL,
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
  ADD PRIMARY KEY (`ProfileID`),
  ADD UNIQUE KEY `UserID` (`UserID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD UNIQUE KEY `Email` (`Email`);

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
-- AUTO_INCREMENT for table `finishedlessons`
--
ALTER TABLE `finishedlessons`
  MODIFY `FinishedID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `LessonID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `QuizID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `userprofiles`
--
ALTER TABLE `userprofiles`
  MODIFY `ProfileID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userscores`
--
ALTER TABLE `userscores`
  MODIFY `ScoreID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `finishedlessons`
--
ALTER TABLE `finishedlessons`
  ADD CONSTRAINT `finishedlessons_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
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
  ADD CONSTRAINT `userprofiles_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `userscores`
--
ALTER TABLE `userscores`
  ADD CONSTRAINT `userscores_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `userscores_ibfk_2` FOREIGN KEY (`QuizID`) REFERENCES `quizzes` (`QuizID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
