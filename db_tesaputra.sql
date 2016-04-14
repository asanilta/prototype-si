-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2016 at 02:09 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_tesaputra`
--

-- --------------------------------------------------------

--
-- Table structure for table `bidang_perusahaan`
--

CREATE TABLE IF NOT EXISTS `bidang_perusahaan` (
  `id_perusahaan` int(3) NOT NULL,
  `bidang_perusahaan` varchar(36) NOT NULL,
  PRIMARY KEY (`id_perusahaan`,`bidang_perusahaan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bidang_perusahaan`
--

INSERT INTO `bidang_perusahaan` (`id_perusahaan`, `bidang_perusahaan`) VALUES
(1, 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `bidang_tenaga_ahli`
--

CREATE TABLE IF NOT EXISTS `bidang_tenaga_ahli` (
  `id_ktp` int(11) NOT NULL,
  `bidang_keahlian` varchar(36) NOT NULL,
  PRIMARY KEY (`id_ktp`,`bidang_keahlian`)
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

CREATE TABLE IF NOT EXISTS `bidang_tender` (
  `id_tender` int(3) NOT NULL,
  `bidang_tender` varchar(16) NOT NULL,
  PRIMARY KEY (`id_tender`,`bidang_tender`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bidang_tender`
--

INSERT INTO `bidang_tender` (`id_tender`, `bidang_tender`) VALUES
(1, 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `dokumen`
--

CREATE TABLE IF NOT EXISTS `dokumen` (
  `id_dokumen` int(11) NOT NULL AUTO_INCREMENT,
  `nama_dokumen` varchar(36) NOT NULL,
  `letak_dokumen` text NOT NULL,
  `tanggal_buat` datetime NOT NULL,
  `tanggal_ubah` datetime NOT NULL,
  `jenis_dokumen` varchar(16) NOT NULL,
  `username` varchar(16) NOT NULL,
  PRIMARY KEY (`id_dokumen`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dokumen_perusahaan`
--

CREATE TABLE IF NOT EXISTS `dokumen_perusahaan` (
  `id_perusahaan` int(11) NOT NULL,
  `id_dokumen` int(11) NOT NULL,
  PRIMARY KEY (`id_perusahaan`,`id_dokumen`),
  KEY `id_dokumen` (`id_dokumen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dokumen_tenaga_ahli`
--

CREATE TABLE IF NOT EXISTS `dokumen_tenaga_ahli` (
  `id_dokumen` int(11) NOT NULL AUTO_INCREMENT,
  `nama_dokumen` varchar(36) NOT NULL,
  `letak_dokumen` text NOT NULL,
  `tanggal_buat` datetime NOT NULL,
  `tanggal_ubah` datetime NOT NULL,
  `jenis_dokumen` varchar(16) NOT NULL,
  `username` varchar(16) NOT NULL,
  `id_ktp` int(20) NOT NULL,
  PRIMARY KEY (`id_dokumen`),
  KEY `username` (`username`),
  KEY `id_ktp` (`id_ktp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dokumen_tender`
--

CREATE TABLE IF NOT EXISTS `dokumen_tender` (
  `id_tender` int(11) NOT NULL,
  `nama_persyaratan` varchar(16) NOT NULL,
  `id_dokumen` int(11) NOT NULL,
  PRIMARY KEY (`id_tender`,`nama_persyaratan`,`id_dokumen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `persyaratan_tender`
--

CREATE TABLE IF NOT EXISTS `persyaratan_tender` (
  `id_tender` int(3) NOT NULL,
  `nama_persyaratan` varchar(16) NOT NULL,
  `kategori_persyaratan` varchar(16) NOT NULL,
  `status` enum('todo','ongoing','done') NOT NULL,
  PRIMARY KEY (`id_tender`,`nama_persyaratan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE IF NOT EXISTS `perusahaan` (
  `id_perusahaan` int(3) NOT NULL AUTO_INCREMENT,
  `telp` varchar(100) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `alamat` text,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_perusahaan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`id_perusahaan`, `telp`, `nama_perusahaan`, `alamat`, `email`) VALUES
(1, '022 7212121', 'PT Tesaputra Adiguna', 'Jalan Citamiang No. 61', 'contact@tesaputra.com'),
(2, '081219705514', 'Tralalala', 'Trilili', 'asanilta@gmail.com'),
(3, 'C', 'A', 'B', 'D'),
(4, 'F', 'D', 'E', 'G');

-- --------------------------------------------------------

--
-- Table structure for table `tenaga_ahli`
--

CREATE TABLE IF NOT EXISTS `tenaga_ahli` (
  `id_ktp` int(20) NOT NULL,
  `nama_tenaga_ahli` varchar(100) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` text NOT NULL,
  `tanggal_habis_ktp` date NOT NULL,
  `telp` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_ktp`)
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

CREATE TABLE IF NOT EXISTS `tenaga_tender` (
  `id_tender` int(11) NOT NULL,
  `id_ktp` int(11) NOT NULL,
  PRIMARY KEY (`id_tender`,`id_ktp`),
  KEY `id_ktp` (`id_ktp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tender`
--

CREATE TABLE IF NOT EXISTS `tender` (
  `id_tender` int(3) NOT NULL AUTO_INCREMENT,
  `nama_tender` varchar(255) NOT NULL,
  `status` enum('todo','ongoing','done') NOT NULL,
  `instansi_pengada` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `tenggat_prakualifikasi` date NOT NULL,
  `tenggat_akhir` date NOT NULL,
  `id_perusahaan` int(3) DEFAULT NULL,
  PRIMARY KEY (`id_tender`),
  KEY `id_perusahaan` (`id_perusahaan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tender`
--

INSERT INTO `tender` (`id_tender`, `nama_tender`, `status`, `instansi_pengada`, `url`, `tenggat_prakualifikasi`, `tenggat_akhir`, `id_perusahaan`) VALUES
(1, 'Pekerjaan Penataan Kawasan Pusdiklat', 'ongoing', 'Kementerian Pekerjaan Umum dan Perumahan Rakyat', 'http://lpse.pu.go.id/eproc/lelang/view/17239064', '2016-04-30', '2016-05-30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tim`
--

CREATE TABLE IF NOT EXISTS `tim` (
  `username` varchar(16) NOT NULL,
  `id_tender` int(3) NOT NULL,
  PRIMARY KEY (`username`,`id_tender`),
  KEY `id_tender` (`id_tender`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tim`
--

INSERT INTO `tim` (`username`, `id_tender`) VALUES
('asanilta', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(36) NOT NULL,
  `password` varchar(36) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `role` enum('staf','pimpinan') NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `nama_lengkap`, `role`) VALUES
('asanilta', 'lalala', 'Asanilta Fahda', 'staf'),
('siswanda', 'lalala', 'Siswanda Harso Sumarto', 'pimpinan');

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
