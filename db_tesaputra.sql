-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 11, 2016 at 06:12 
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tesaputra`
--
CREATE DATABASE IF NOT EXISTS `db_tesaputra` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_tesaputra`;

-- --------------------------------------------------------

--
-- Table structure for table `bidang_perusahaan`
--

DROP TABLE IF EXISTS `bidang_perusahaan`;
CREATE TABLE `bidang_perusahaan` (
  `id_perusahaan` int(3) NOT NULL,
  `bidang_perusahaan` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bidang_tenaga_ahli`
--

DROP TABLE IF EXISTS `bidang_tenaga_ahli`;
CREATE TABLE `bidang_tenaga_ahli` (
  `id_ktp` int(11) NOT NULL,
  `bidang_keahlian` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bidang_tenaga_ahli`
--

INSERT INTO `bidang_tenaga_ahli` (`id_ktp`, `bidang_keahlian`) VALUES
(1, 'Agrikultur'),
(1, 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `bidang_tender`
--

DROP TABLE IF EXISTS `bidang_tender`;
CREATE TABLE `bidang_tender` (
  `id_tender` int(3) NOT NULL,
  `bidang_tender` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dokumen`
--

DROP TABLE IF EXISTS `dokumen`;
CREATE TABLE `dokumen` (
  `id_dokumen` int(11) NOT NULL,
  `nama_dokumen` varchar(36) NOT NULL,
  `letak_dokumen` text NOT NULL,
  `tanggal_buat` datetime NOT NULL,
  `tanggal_ubah` datetime NOT NULL,
  `jenis_dokumen` varchar(16) NOT NULL,
  `username` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dokumen_perusahaan`
--

DROP TABLE IF EXISTS `dokumen_perusahaan`;
CREATE TABLE `dokumen_perusahaan` (
  `id_perusahaan` int(11) NOT NULL,
  `id_dokumen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dokumen_tenaga_ahli`
--

DROP TABLE IF EXISTS `dokumen_tenaga_ahli`;
CREATE TABLE `dokumen_tenaga_ahli` (
  `id_dokumen` int(11) NOT NULL,
  `nama_dokumen` varchar(36) NOT NULL,
  `letak_dokumen` text NOT NULL,
  `tanggal_buat` datetime NOT NULL,
  `tanggal_ubah` datetime NOT NULL,
  `jenis_dokumen` varchar(16) NOT NULL,
  `username` varchar(16) NOT NULL,
  `id_ktp` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dokumen_tender`
--

DROP TABLE IF EXISTS `dokumen_tender`;
CREATE TABLE `dokumen_tender` (
  `id_tender` int(11) NOT NULL,
  `nama_persyaratan` varchar(16) NOT NULL,
  `id_dokumen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `persyaratan_tender`
--

DROP TABLE IF EXISTS `persyaratan_tender`;
CREATE TABLE `persyaratan_tender` (
  `id_tender` int(3) NOT NULL,
  `nama_persyaratan` varchar(16) NOT NULL,
  `kategori_persyaratan` varchar(16) NOT NULL,
  `status` enum('todo','ongoing','done') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

DROP TABLE IF EXISTS `perusahaan`;
CREATE TABLE `perusahaan` (
  `id_perusahaan` int(3) NOT NULL,
  `kontak` int(36) NOT NULL,
  `nama_perusahaan` varchar(36) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tenaga_ahli`
--

DROP TABLE IF EXISTS `tenaga_ahli`;
CREATE TABLE `tenaga_ahli` (
  `id_ktp` int(20) NOT NULL,
  `nama_tenaga_ahli` varchar(36) NOT NULL,
  `tempat_lahir` varchar(16) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` text NOT NULL,
  `tanggal_habis_ktp` date NOT NULL,
  `telp` varchar(25) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenaga_ahli`
--

INSERT INTO `tenaga_ahli` (`id_ktp`, `nama_tenaga_ahli`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `tanggal_habis_ktp`, `telp`, `updated_at`, `email`) VALUES
(1, 'Asanilta Kece', 'Bandung', '2015-11-25', 'P', 'Jalan Kenangan', '2017-11-25', '12345', '2016-04-10 17:11:39', 'asanilta@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tenaga_tender`
--

DROP TABLE IF EXISTS `tenaga_tender`;
CREATE TABLE `tenaga_tender` (
  `id_tender` int(11) NOT NULL,
  `id_ktp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tender`
--

DROP TABLE IF EXISTS `tender`;
CREATE TABLE `tender` (
  `id_tender` int(3) NOT NULL,
  `nama_tender` varchar(36) NOT NULL,
  `status` enum('todo','ongoing','done') NOT NULL,
  `instansi_pengada` varchar(36) NOT NULL,
  `url` text NOT NULL,
  `tenggat_prakualifikasi` date NOT NULL,
  `tenggat_akhir` date NOT NULL,
  `id_perusahaan` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tim`
--

DROP TABLE IF EXISTS `tim`;
CREATE TABLE `tim` (
  `username` varchar(16) NOT NULL,
  `id_tender` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(36) NOT NULL,
  `password` varchar(36) NOT NULL,
  `nama_lengkap` int(36) NOT NULL,
  `role` enum('staf','pimpinan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bidang_perusahaan`
--
ALTER TABLE `bidang_perusahaan`
  ADD PRIMARY KEY (`id_perusahaan`,`bidang_perusahaan`);

--
-- Indexes for table `bidang_tenaga_ahli`
--
ALTER TABLE `bidang_tenaga_ahli`
  ADD PRIMARY KEY (`id_ktp`,`bidang_keahlian`);

--
-- Indexes for table `bidang_tender`
--
ALTER TABLE `bidang_tender`
  ADD PRIMARY KEY (`id_tender`,`bidang_tender`);

--
-- Indexes for table `dokumen`
--
ALTER TABLE `dokumen`
  ADD PRIMARY KEY (`id_dokumen`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `dokumen_perusahaan`
--
ALTER TABLE `dokumen_perusahaan`
  ADD PRIMARY KEY (`id_perusahaan`,`id_dokumen`),
  ADD KEY `id_dokumen` (`id_dokumen`);

--
-- Indexes for table `dokumen_tenaga_ahli`
--
ALTER TABLE `dokumen_tenaga_ahli`
  ADD PRIMARY KEY (`id_dokumen`),
  ADD KEY `username` (`username`),
  ADD KEY `id_ktp` (`id_ktp`);

--
-- Indexes for table `dokumen_tender`
--
ALTER TABLE `dokumen_tender`
  ADD PRIMARY KEY (`id_tender`,`nama_persyaratan`,`id_dokumen`);

--
-- Indexes for table `persyaratan_tender`
--
ALTER TABLE `persyaratan_tender`
  ADD PRIMARY KEY (`id_tender`,`nama_persyaratan`);

--
-- Indexes for table `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`id_perusahaan`);

--
-- Indexes for table `tenaga_ahli`
--
ALTER TABLE `tenaga_ahli`
  ADD PRIMARY KEY (`id_ktp`);

--
-- Indexes for table `tenaga_tender`
--
ALTER TABLE `tenaga_tender`
  ADD PRIMARY KEY (`id_tender`,`id_ktp`),
  ADD KEY `id_ktp` (`id_ktp`);

--
-- Indexes for table `tender`
--
ALTER TABLE `tender`
  ADD PRIMARY KEY (`id_tender`),
  ADD KEY `id_perusahaan` (`id_perusahaan`);

--
-- Indexes for table `tim`
--
ALTER TABLE `tim`
  ADD PRIMARY KEY (`username`,`id_tender`),
  ADD KEY `id_tender` (`id_tender`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokumen`
--
ALTER TABLE `dokumen`
  MODIFY `id_dokumen` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dokumen_tenaga_ahli`
--
ALTER TABLE `dokumen_tenaga_ahli`
  MODIFY `id_dokumen` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `perusahaan`
--
ALTER TABLE `perusahaan`
  MODIFY `id_perusahaan` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tender`
--
ALTER TABLE `tender`
  MODIFY `id_tender` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bidang_perusahaan`
--
ALTER TABLE `bidang_perusahaan`
  ADD CONSTRAINT `bidang_perusahaan_ibfk_1` FOREIGN KEY (`id_perusahaan`) REFERENCES `perusahaan` (`id_perusahaan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bidang_tenaga_ahli`
--
ALTER TABLE `bidang_tenaga_ahli`
  ADD CONSTRAINT `bidang_tenaga_ahli_ibfk_1` FOREIGN KEY (`id_ktp`) REFERENCES `tenaga_ahli` (`id_ktp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bidang_tender`
--
ALTER TABLE `bidang_tender`
  ADD CONSTRAINT `bidang_tender_ibfk_1` FOREIGN KEY (`id_tender`) REFERENCES `tender` (`id_tender`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dokumen`
--
ALTER TABLE `dokumen`
  ADD CONSTRAINT `dokumen_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `dokumen_perusahaan`
--
ALTER TABLE `dokumen_perusahaan`
  ADD CONSTRAINT `dokumen_perusahaan_ibfk_1` FOREIGN KEY (`id_perusahaan`) REFERENCES `perusahaan` (`id_perusahaan`),
  ADD CONSTRAINT `dokumen_perusahaan_ibfk_2` FOREIGN KEY (`id_dokumen`) REFERENCES `dokumen` (`id_dokumen`);

--
-- Constraints for table `dokumen_tenaga_ahli`
--
ALTER TABLE `dokumen_tenaga_ahli`
  ADD CONSTRAINT `dokumen_tenaga_ahli_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `dokumen_tenaga_ahli_ibfk_2` FOREIGN KEY (`id_ktp`) REFERENCES `tenaga_ahli` (`id_ktp`);

--
-- Constraints for table `persyaratan_tender`
--
ALTER TABLE `persyaratan_tender`
  ADD CONSTRAINT `persyaratan_tender_ibfk_1` FOREIGN KEY (`id_tender`) REFERENCES `tender` (`id_tender`);

--
-- Constraints for table `tenaga_tender`
--
ALTER TABLE `tenaga_tender`
  ADD CONSTRAINT `tenaga_tender_ibfk_1` FOREIGN KEY (`id_tender`) REFERENCES `tender` (`id_tender`),
  ADD CONSTRAINT `tenaga_tender_ibfk_2` FOREIGN KEY (`id_ktp`) REFERENCES `tenaga_ahli` (`id_ktp`);

--
-- Constraints for table `tender`
--
ALTER TABLE `tender`
  ADD CONSTRAINT `tender_ibfk_1` FOREIGN KEY (`id_perusahaan`) REFERENCES `perusahaan` (`id_perusahaan`);

--
-- Constraints for table `tim`
--
ALTER TABLE `tim`
  ADD CONSTRAINT `tim_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `tim_ibfk_2` FOREIGN KEY (`id_tender`) REFERENCES `tender` (`id_tender`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
