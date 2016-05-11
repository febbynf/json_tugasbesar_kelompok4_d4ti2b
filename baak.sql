-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 26, 2016 at 10:50 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `baak`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_mahasiswa`
--

CREATE TABLE IF NOT EXISTS `t_mahasiswa` (
  `mahasiswa_npm` varchar(10) NOT NULL,
  `mahasiswa_password` varchar(50) NOT NULL,
  `mahasiswa_nama` varchar(50) NOT NULL,
  `mahasiswa_jurusan` varchar(50) NOT NULL,
  `mahasiswa_kelas` varchar(2) NOT NULL,
  `mahasiswa_alamat` text NOT NULL,
  `tgl_input` date NOT NULL,
  PRIMARY KEY (`mahasiswa_npm`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_mahasiswa`
--

INSERT INTO `t_mahasiswa` (`mahasiswa_npm`, `mahasiswa_password`, `mahasiswa_nama`, `mahasiswa_jurusan`, `mahasiswa_kelas`, `mahasiswa_alamat`, `tgl_input`) VALUES
('1144016', '827ccb0eea8a706c4c34a16891f84e7b', 'Anggi Sholiatus', 'D4-Teknik Informatika', '2B', 'Subang', '2016-01-03'),
('1144108', '827ccb0eea8a706c4c34a16891f84e7b', 'Agung Suryana', 'D4-Teknik Informatika', '2B', 'Bandung', '2015-12-25'),
('1144072', '827ccb0eea8a706c4c34a16891f84e7b', 'Ilyas Yasin', 'D4-Teknik Informatika', '2B', 'Bandung', '2016-01-06'),
('1144069', '827ccb0eea8a706c4c34a16891f84e7b', 'Adli Asirof', 'D4-Teknik Informatika', '2B', 'Bandung', '2016-01-07'),
('1144087', '827ccb0eea8a706c4c34a16891f84e7b', 'Eki Kesuma', 'D4-Teknik Informatika', '2B', 'Lumajang', '2016-01-07'),
('1144054', '827ccb0eea8a706c4c34a16891f84e7b', 'Nurpazrina', 'D4-Teknik Informatika', '2B', 'Bandung', '2016-01-07'),
('1144015', '827ccb0eea8a706c4c34a16891f84e7b', 'M Firman Kahfi', 'D4-Teknik Informatika', '2B', 'Brebes', '2016-01-17');

-- --------------------------------------------------------

--
-- Table structure for table `t_peminjaman`
--

CREATE TABLE IF NOT EXISTS `t_peminjaman` (
  `peminjaman_kode` int(10) NOT NULL AUTO_INCREMENT,
  `mahasiswa_npm` varchar(10) NOT NULL,
  `properti_id` int(5) NOT NULL,
  `peminjaman_tgl` datetime NOT NULL,
  `status_konf_peminjaman` char(10) NOT NULL,
  `status_kembali` varchar(10) NOT NULL,
  PRIMARY KEY (`peminjaman_kode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=107 ;

--
-- Dumping data for table `t_peminjaman`
--

INSERT INTO `t_peminjaman` (`peminjaman_kode`, `mahasiswa_npm`, `properti_id`, `peminjaman_tgl`, `status_konf_peminjaman`, `status_kembali`) VALUES
(106, '1144108', 24, '2016-01-26 09:38:27', 'Sudah', 'Sudah');

-- --------------------------------------------------------

--
-- Table structure for table `t_pengembalian`
--

CREATE TABLE IF NOT EXISTS `t_pengembalian` (
  `pengembalian_kode` int(5) NOT NULL AUTO_INCREMENT,
  `peminjaman_kode` varchar(10) NOT NULL,
  `mahasiswa_npm` varchar(10) NOT NULL,
  `pengembalian_tgl` datetime NOT NULL,
  `konf_kembali` varchar(10) NOT NULL,
  PRIMARY KEY (`pengembalian_kode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `t_pengembalian`
--

INSERT INTO `t_pengembalian` (`pengembalian_kode`, `peminjaman_kode`, `mahasiswa_npm`, `pengembalian_tgl`, `konf_kembali`) VALUES
(7, '106', '1144108', '2016-01-26 10:36:31', 'Sudah');

-- --------------------------------------------------------

--
-- Table structure for table `t_petugas`
--

CREATE TABLE IF NOT EXISTS `t_petugas` (
  `petugas_nik` varchar(10) NOT NULL,
  `petugas_password` varchar(50) NOT NULL,
  `petugas_nama` varchar(100) NOT NULL,
  `petugas_alamat` text NOT NULL,
  PRIMARY KEY (`petugas_nik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_petugas`
--

INSERT INTO `t_petugas` (`petugas_nik`, `petugas_password`, `petugas_nama`, `petugas_alamat`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator BAAK', 'Jalan Sariasih');

-- --------------------------------------------------------

--
-- Table structure for table `t_properti`
--

CREATE TABLE IF NOT EXISTS `t_properti` (
  `properti_id` int(5) NOT NULL AUTO_INCREMENT,
  `properti_nama` varchar(100) NOT NULL,
  `properti_jumlah` int(20) NOT NULL,
  `properti_status` enum('Baik','Rusak') NOT NULL DEFAULT 'Baik',
  `tgl_input` date NOT NULL,
  PRIMARY KEY (`properti_id`),
  UNIQUE KEY `properti_nama` (`properti_nama`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `t_properti`
--

INSERT INTO `t_properti` (`properti_id`, `properti_nama`, `properti_jumlah`, `properti_status`, `tgl_input`) VALUES
(24, 'Infokus', 5, 'Baik', '2015-12-22'),
(25, 'Remote AC', 5, 'Baik', '2016-01-28'),
(26, 'Kunci 301', 1, 'Baik', '2016-01-29'),
(27, 'Kunci 302', 1, 'Baik', '2016-01-30'),
(28, 'Kunci L305', 1, 'Baik', '2015-12-31'),
(29, 'Kunci L315', 1, 'Baik', '2016-01-01'),
(30, 'Kunci L309', 1, 'Baik', '2016-01-02'),
(31, 'Kunci L313', 1, 'Baik', '2016-01-03'),
(32, 'Kunci L320', 1, 'Baik', '2016-01-04'),
(33, 'Kunci L321', 1, 'Baik', '2016-01-06');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
