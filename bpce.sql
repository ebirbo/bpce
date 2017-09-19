-- phpMyAdmin SQL Dump
-- version 4.6.0
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 19, 2017 at 05:58 PM
-- Server version: 5.7.11
-- PHP Version: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bpce`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `user_nom` varchar(256) NOT NULL,
  `user_prenom` varchar(256) NOT NULL,
  `user_email` varchar(256) NOT NULL,
  `user_password` varchar(256) NOT NULL,
  `age` int(11) NOT NULL,
  `conseiller` int(11) NOT NULL,
  `sexe` varchar(1) NOT NULL,
  `solde` int(11) NOT NULL,
  `decouverte` int(11) NOT NULL,
  `beneficiaires` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `user_nom`, `user_prenom`, `user_email`, `user_password`, `age`, `conseiller`, `sexe`, `solde`, `decouverte`, `beneficiaires`) VALUES
(1, 'birbo', 'ergent', 'ebirbo@gmail.com', '12345678', 25, 1, 'm', -400, 400, 0),
(2, 'petit', 'bertrand', 'bpetit@gmail.com', '12345678', 12, 2, 'm', 500, 300, 0),
(3, 'grand', 'alex', 'agrand@gmail.com', '12345678', 45, 3, 'm', 0, 1000, 0),
(4, 'petit', 'jacqueline', 'jpetit@gmail.com', '12345678', 85, 3, 'f', 100, 200, 0);

-- --------------------------------------------------------

--
-- Table structure for table `conseiller`
--

CREATE TABLE `conseiller` (
  `id` int(11) NOT NULL,
  `nom` varchar(256) NOT NULL,
  `prenom` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `conseiller`
--

INSERT INTO `conseiller` (`id`, `nom`, `prenom`, `email`) VALUES
(1, 'cornet', 'anne', 'acornet@bpce.fr'),
(2, 'jeanne', 'alexandre', 'jalexandre@bpce.fr\r\n'),
(3, 'mora-grenier', 'teresa', 'tmora@bpce.fr'),
(4, 'nicpon', 'claude', 'cnicpon@bpce.fr');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conseiller`
--
ALTER TABLE `conseiller`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `conseiller`
--
ALTER TABLE `conseiller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
