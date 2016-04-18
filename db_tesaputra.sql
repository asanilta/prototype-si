-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 19, 2016 at 12:17 
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

--
-- Dumping data for table `bidang_perusahaan`
--

INSERT INTO `bidang_perusahaan` (`id_perusahaan`, `bidang_perusahaan`) VALUES
(6, 'Keuangan'),
(6, 'Telematika'),
(6, 'Transportasi'),
(7, 'Ekonomi'),
(7, 'Konsultasi'),
(8, 'Agrikultur'),
(8, 'IT'),
(10, 'Konstruksi');

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
(1, 'IT'),
(1, 'Konsultasi'),
(111, 'Konstruksi'),
(222222, 'Agrikultur'),
(222222, 'IT'),
(222222, 'Tata Kota'),
(1111111, 'Konstruksi'),
(1111111, 'Tata Kota'),
(13513035, 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `bidang_tender`
--

DROP TABLE IF EXISTS `bidang_tender`;
CREATE TABLE `bidang_tender` (
  `id_tender` int(3) NOT NULL,
  `bidang_tender` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bidang_tender`
--

INSERT INTO `bidang_tender` (`id_tender`, `bidang_tender`) VALUES
(2, 'Konsultansi'),
(3, 'Konstruksi'),
(4, 'Konstruksi'),
(5, 'Konsultansi');

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
  `deskripsi` text,
  `status` enum('todo','ongoing','done') NOT NULL DEFAULT 'todo'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `persyaratan_tender`
--

INSERT INTO `persyaratan_tender` (`id_tender`, `nama_persyaratan`, `kategori_persyaratan`, `deskripsi`, `status`) VALUES
(2, 'SBUK', 'Ijin Usaha', 'Kualifikasi Non Kecil , Klasifikasi Bangunan Gedung, Sub Klasifikasi Jasa Pelaksana Untuk Konstruksi Bangunan Gedung Lainnya (BG009) yang masih berlaku', 'todo'),
(3, 'IUJK', 'Ijin Usaha', 'Klasifikasi Non Kecil bidang sesuai dengan Pekerjaan, yang masih berlaku', 'todo'),
(3, 'SPT/PPh', 'Dokumen Pajak', 'Telah melunasi kewajiban pajak tahun terakhir (SPT/PPh) SPT tahunan tahun terakhir', 'todo'),
(4, 'SBU', 'Ijin Usaha', 'Memiliki surat izin usaha jasa konstruksi (IUJK) Klasifikasi Non Kecil, Klasifikasi bangunan gedung yang masih berlaku.', 'todo'),
(4, 'SIUJK', 'Ijin Usaha', 'Memiliki Sertifikat Badan Usaha (SBU) Kualifikasi Non Kecil Klasifikasi Bangunan Gedung, Sub Klasifikasi Jasa Pelaksana Konstruksi Bangunan Komersial (BG004) yang masih berlaku', 'todo'),
(5, 'NPWP', 'Dokumen', 'Telah melunasi kewajiban pajak tahun terakhir (SPT/PPh). Memiliki NPWP dan telah memenuhi kewajiban perpajakan tahun pajak terakhir (SPT Tahunan). Persyarataan perpajakan ini dikecualikan untuk penyedia asing (khusus untuk International Competitive Bidding). SPT Tahunan yang diminta untuk tahun 2015.', 'todo'),
(5, 'SIUJK', 'Ijin Usaha', 'SIUJK Jasa Konsultansi yang sesuai dan masih berlaku', 'todo');

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

DROP TABLE IF EXISTS `perusahaan`;
CREATE TABLE `perusahaan` (
  `id_perusahaan` int(3) NOT NULL,
  `telp` varchar(100) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `alamat` text,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`id_perusahaan`, `telp`, `nama_perusahaan`, `alamat`, `email`) VALUES
(6, '+62 22 7275270', 'PT Tesaputra Adiguna', 'Jalan Citamiang nomor 61, Bandung', 'tesaputra@gmail.com'),
(7, '0254 385742', 'PT Krakatau Steel', 'Jalan Sumatra nomor 56, Kota Cilegon', 'admin@krakatausteel.com'),
(8, '(022) 61595921', 'PT Coffindo', 'Jalan Siliwangi nomor 6, Dago, Jawa Barat', 'admin@coffindo.com'),
(9, '(022) 2535033', 'PT QWORDS', 'Jl. Cisitu Lama, Dago, Coblong, Kota Bandung, Jawa Barat', 'admin@qwords.com'),
(10, '(022) 2531004', 'PT Urbane Indonesia', 'Jl. Cigadung Raya Barat No. 5, RT 05/02, Cipaheut, Jawa Barat', 'urbane@indonesia.com'),
(11, '(022) 2516910', 'PT Prima Riau Holiday', 'Jl. Ir. H.Juanda No.185, Dago, Coblong, Bandung, Jawa Barat', 'primariau@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tenaga_ahli`
--

DROP TABLE IF EXISTS `tenaga_ahli`;
CREATE TABLE `tenaga_ahli` (
  `id_ktp` int(20) NOT NULL,
  `nama_tenaga_ahli` varchar(100) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `alamat` text NOT NULL,
  `tanggal_habis_ktp` date NOT NULL,
  `telp` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenaga_ahli`
--

INSERT INTO `tenaga_ahli` (`id_ktp`, `nama_tenaga_ahli`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `tanggal_habis_ktp`, `telp`, `updated_at`, `email`) VALUES
(1, 'Asanilta Fahda', 'Bandung', '2013-11-25', 'P', 'Jalan Kenangan', '2017-11-25', '12345', '2016-04-10 17:11:39', 'asanilta@gmail.com'),
(111, 'Raissa Callista Anyndya', 'Serang', '2000-12-22', 'P', 'Jalan Freesia I no 12 B', '2017-11-25', '087882961624', '2016-04-15 09:08:23', 'raissaca@gmail.com'),
(222222, 'Ali Munif', 'Blitar', '1967-11-22', 'L', 'Jalan', '2018-11-22', '08128038263', '2016-04-17 15:54:13', 'alimunif@gmail.com'),
(1111111, 'Dwi Handayanti', 'Ponorogo', '1971-10-19', 'P', 'Jalan', '2017-11-25', '081316526941', '2016-04-17 15:26:47', 'dwi@gmail.com'),
(13513035, 'Vanya Deasy Safrina', 'Serang', '1996-12-19', 'P', 'Jalan Cisitu Baru 57', '2017-11-30', '087882961624', '2016-04-15 04:48:39', 'vany@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tenaga_tender`
--

DROP TABLE IF EXISTS `tenaga_tender`;
CREATE TABLE `tenaga_tender` (
  `id_tender` int(11) NOT NULL,
  `id_ktp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tenaga_tender`
--

INSERT INTO `tenaga_tender` (`id_tender`, `id_ktp`) VALUES
(2, 13513035),
(3, 1),
(3, 111);

-- --------------------------------------------------------

--
-- Table structure for table `tender`
--

DROP TABLE IF EXISTS `tender`;
CREATE TABLE `tender` (
  `id_tender` int(3) NOT NULL,
  `nama_tender` varchar(255) NOT NULL,
  `status` enum('todo','ongoing','done') NOT NULL,
  `instansi_pengada` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `tenggat_prakualifikasi` date NOT NULL,
  `tenggat_akhir` date NOT NULL,
  `id_perusahaan` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tender`
--

INSERT INTO `tender` (`id_tender`, `nama_tender`, `status`, `instansi_pengada`, `url`, `tenggat_prakualifikasi`, `tenggat_akhir`, `id_perusahaan`) VALUES
(2, 'Belanja Jasa Konsultasi DED Penataan Lingkungan Kawasan Taman Budaya', 'todo', 'DINAS PARIWISATA DAN KEBUDAYAAN PROVINSI JAWA BARAT', 'https://lpse.jabarprov.go.id/eproc/lelang/view/29893014', '2016-04-28', '2016-04-18', NULL),
(3, 'Pembangunan masjid Jawa Barat di Plumbon Kabupaten Cirebon (Tahap II)', 'todo', 'DINAS PERMUKIMAN DAN PERUMAHAN PROVINSI JAWA BARAT', 'https://lpse.jabarprov.go.id/eproc/lelang/view/29888014', '2016-05-27', '2016-08-12', NULL),
(4, 'PEMBANGUNAN GEDUNG KANTOR TAHAP 1', 'todo', 'DINAS PENDAPATAN DAERAH PROVINSI JAWA BARAT', 'https://lpse.jabarprov.go.id/eproc/lelang/view/29902014', '2016-04-20', '2016-04-30', NULL),
(5, 'Kajian Analisis Pemetaan Industri Manufaktur di Jawa Barat', 'todo', 'DINAS PERINDUSTRIAN DAN PERDAGANGAN PROVINSI JAWA BARAT', 'https://lpse.jabarprov.go.id/eproc/lelang/view/29899014', '2016-05-28', '2016-06-30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tim`
--

DROP TABLE IF EXISTS `tim`;
CREATE TABLE `tim` (
  `username` varchar(16) NOT NULL,
  `id_tender` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tim`
--

INSERT INTO `tim` (`username`, `id_tender`) VALUES
('asanilta', 2),
('asanilta', 3),
('vanydeasy', 3),
('vanydeasy', 5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(36) NOT NULL,
  `password` varchar(36) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `role` enum('staf','pimpinan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `nama_lengkap`, `role`) VALUES
('asanilta', 'lalala', 'Asanilta Fahda', 'staf'),
('siswanda', 'lalala', 'Siswanda Harso Sumarto', 'pimpinan'),
('vanydeasy', 'lalala', 'Vanya Deasy Safrina', 'staf');

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
  MODIFY `id_perusahaan` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tender`
--
ALTER TABLE `tender`
  MODIFY `id_tender` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
  ADD CONSTRAINT `persyaratan_tender_ibfk_1` FOREIGN KEY (`id_tender`) REFERENCES `tender` (`id_tender`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tenaga_tender`
--
ALTER TABLE `tenaga_tender`
  ADD CONSTRAINT `tenaga_tender_ibfk_1` FOREIGN KEY (`id_tender`) REFERENCES `tender` (`id_tender`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tenaga_tender_ibfk_2` FOREIGN KEY (`id_ktp`) REFERENCES `tenaga_ahli` (`id_ktp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tender`
--
ALTER TABLE `tender`
  ADD CONSTRAINT `tender_ibfk_1` FOREIGN KEY (`id_perusahaan`) REFERENCES `perusahaan` (`id_perusahaan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tim`
--
ALTER TABLE `tim`
  ADD CONSTRAINT `tim_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tim_ibfk_2` FOREIGN KEY (`id_tender`) REFERENCES `tender` (`id_tender`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
