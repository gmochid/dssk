-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 03 Des 2013 pada 13.23
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

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertJalan`(IN numrow int)
begin
		declare i int;
		set i = 1;
		start transaction;
		while i <= numrow do
			update dssk.penilaian set
				dssk.komunikasi = CEIL(rand() * 5),
				dssk.inovasi = CEIL(rand() * 5),
				dssk.leadership = CEIL(rand() * 5),
				dssk.kerjasama = CEIL(rand() * 5),
				dssk.finance = CEIL(rand() * 3),
				dssk.programming = CEIL(rand() * 3)
			where dssk.pegawai_id = i;
			set i = i + 1;
		end while;
		commit;
	end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertXXX`(IN numrow int)
begin
		declare i int;
		set i = 1;
		start transaction;
		while i <= numrow do
			update penilaian set
				penilaian.komunikasi = CEIL(rand() * 5),
				penilaian.inovasi = CEIL(rand() * 5),
				penilaian.leadership = CEIL(rand() * 5),
				penilaian.kerjasama = CEIL(rand() * 5),
				penilaian.finance = CEIL(rand() * 3),
				penilaian.programming = CEIL(rand() * 3)
			where penilaian.pegawai_id = i;
			set i = i + 1;
		end while;
		commit;
	end$$

DELIMITER ;

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
(1, 'Budi Hartono', '2012-05-02', 'Jl. Mangga no 68', 0, 'L', 1999, 'sarjana'),
(2, 'Ema Sukawati', '1988-09-07', 'Jl. Salak no. 7', 0, 'P', 2011, 'sarjana'),
(3, 'Setia Pribadi', '2012-05-02', 'Jl. Jakarta no. 20\n', 0, 'L', 2008, 'sarjana'),
(4, 'Supojono', '2012-05-02', 'Jl. Soekarna Hatta no. 1', 1, 'L', 2006, 'sarjana'),
(5, 'Stefanus Lauren', '2012-05-02', 'Jl. Kalimantan no.35', 0, 'L', 2010, 'sarjana'),
(6, 'Nugroho Simanjuntak', '2012-05-02', 'Jl. Suparman no. 29', 0, 'L', 2009, 'sarjana'),
(7, 'Susi Susanti', '2012-05-02', 'Jl. Damar no. 18', 1, 'P', 2001, 'sarjana'),
(8, 'Hartini', '2012-05-02', 'Jl. Flamboyan no. 10', 0, 'P', 2006, 'sarjana'),
(9, 'Benny Subianto', '2012-05-02', 'Jl. Permata no. 54', 1, 'L', 1996, 'sarjana'),
(10, 'Gumarus William', '2012-05-02', 'Jl. Setiabudi no. 68', 1, 'L', 1998, 'magister'),
(11, 'Jumawa Juwana', '2012-05-02', 'Jl. Kuningan no. 23', 1, 'L', 1992, 'magister');

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
  `programming` int(11) NOT NULL,
  PRIMARY KEY (`pegawai_id`,`jabatan_id`),
  KEY `cons_jabatan` (`jabatan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penilaian`
--

INSERT INTO `penilaian` (`pegawai_id`, `jabatan_id`, `komunikasi`, `inovasi`, `leadership`, `kerjasama`, `finance`, `programming`) VALUES
(1, 4, 3, 3, 2, 1, 0, 1),
(2, 4, 4, 5, 5, 2, 0, 1),
(3, 5, 5, 3, 1, 4, 0, 3),
(4, 5, 3, 5, 5, 4, 0, 3),
(5, 6, 1, 4, 3, 1, 1, 0),
(6, 6, 2, 3, 4, 4, 2, 0),
(7, 7, 5, 4, 4, 2, 1, 0),
(8, 7, 5, 4, 1, 1, 1, 0),
(9, 2, 2, 2, 3, 3, 1, 2),
(10, 3, 1, 2, 5, 4, 2, 2),
(11, 1, 1, 4, 1, 5, 3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(40) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`username`, `password`) VALUES
('test', '098f6bcd4621d373cade4e832627b4f6');

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
