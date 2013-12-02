-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 02 Des 2013 pada 13.16
-- Versi Server: 5.5.32
-- Versi PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `dssk`
--
CREATE DATABASE IF NOT EXISTS `dssk` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dssk`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE IF NOT EXISTS `jabatan` (
  `jabatan_id` int(11) NOT NULL AUTO_INCREMENT,
  `tingkatan` varchar(40) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `parent` int(11) NOT NULL,
  PRIMARY KEY (`jabatan_id`),
  UNIQUE KEY `jabatan_id` (`jabatan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`jabatan_id`, `tingkatan`, `nama`, `parent`) VALUES
(1, 'Direktorat', 'Teknologi Informasi dan Keuangan', 0),
(2, 'Departemen', 'Teknologi Informasi', 1),
(3, 'Departemen', 'Keuangan', 1),
(4, 'Divisi', 'Analis Sistem', 2),
(5, 'Divisi', 'IT Support', 2),
(6, 'Divisi', 'Administrasi', 3),
(7, 'Divisi', 'Perpajakan', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kepegawaian`
--

CREATE TABLE IF NOT EXISTS `kepegawaian` (
  `pegawai_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(45) NOT NULL,
  `status_perkawinan` int(11) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `tahun_masuk` int(11) NOT NULL,
  `pendidikan_terakhir` varchar(20) NOT NULL,
  PRIMARY KEY (`pegawai_id`),
  UNIQUE KEY `pegawai_id` (`pegawai_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data untuk tabel `kepegawaian`
--

INSERT INTO `kepegawaian` (`pegawai_id`, `nama`, `tanggal_lahir`, `alamat`, `status_perkawinan`, `jenis_kelamin`, `tahun_masuk`, `pendidikan_terakhir`) VALUES
(1, 'Budi Hartono', '2012-05-02', 'haha', 0, 'L', 1999, 'sarjana'),
(2, 'Budi Hartono', '2012-05-02', 'haha', 0, 'P', 1999, 'sarjana'),
(3, 'Budi Hartono', '2012-05-02', 'haha', 0, 'L', 1999, 'sarjana'),
(4, 'Budi Hartono', '2012-05-02', 'haha', 1, 'L', 1999, 'sarjana'),
(5, 'Budi Hartono', '2012-05-02', 'haha', 0, 'L', 1999, 'sarjana'),
(6, 'Budi Hartono', '2012-05-02', 'haha', 0, 'L', 1999, 'sarjana'),
(7, 'Budi Hartono', '2012-05-02', 'haha', 1, 'P', 1999, 'sarjana'),
(8, 'Budi Hartono', '2012-05-02', 'haha', 0, 'P', 1999, 'sarjana'),
(9, 'Budi Hartono', '2012-05-02', 'haha', 1, 'L', 1999, 'sarjana'),
(10, 'Budi Hartono', '2012-05-02', 'haha', 1, 'L', 1999, 'magister'),
(11, 'Budi Hartono', '2012-05-02', 'haha', 1, 'L', 1999, 'magister');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian`
--

CREATE TABLE IF NOT EXISTS `penilaian` (
  `pegawai_id` int(11) NOT NULL,
  `jabatan_id` int(11) NOT NULL,
  `komunikasi` int(11) NOT NULL,
  `inovasi` int(11) NOT NULL,
  `leadership` int(11) NOT NULL,
  `kerjasama` int(11) NOT NULL,
  `finance` int(11) NOT NULL,
  `programmer` int(11) NOT NULL,
  PRIMARY KEY (`pegawai_id`,`jabatan_id`),
  KEY `cons_jabatan` (`jabatan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penilaian`
--

INSERT INTO `penilaian` (`pegawai_id`, `jabatan_id`, `komunikasi`, `inovasi`, `leadership`, `kerjasama`, `finance`, `programmer`) VALUES
(1, 4, 2, 3, 2, 4, 0, 5),
(2, 4, 4, 3, 4, 5, 0, 4),
(3, 5, 5, 4, 3, 3, 0, 3),
(4, 5, 2, 3, 2, 4, 0, 5),
(5, 6, 2, 3, 2, 4, 0, 5),
(6, 6, 2, 3, 2, 4, 0, 5),
(7, 7, 2, 3, 2, 4, 0, 5),
(8, 7, 2, 3, 2, 4, 0, 5),
(9, 2, 2, 3, 2, 4, 0, 5),
(10, 3, 2, 3, 2, 4, 0, 5),
(11, 1, 2, 3, 2, 4, 0, 5);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `cons_jabatan` FOREIGN KEY (`jabatan_id`) REFERENCES `jabatan` (`jabatan_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cons_pegawai` FOREIGN KEY (`pegawai_id`) REFERENCES `kepegawaian` (`pegawai_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
