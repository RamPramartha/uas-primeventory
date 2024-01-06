-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2024 at 02:39 PM
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
-- Database: `db_primeventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_barang` int(4) NOT NULL,
  `kode_ruangan` int(4) NOT NULL,
  `foto_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kode_barang`, `kode_ruangan`, `foto_barang`, `nama_barang`, `jumlah`) VALUES
(1, 1, 'img-1704294970344-337254109.jpeg', 'Komputer', 30),
(2, 2, 'img-1704295049588-504835354.jpeg', 'Komputer', 35),
(3, 3, 'img-1704295093971-847392173.jpeg', 'Komputer', 20),
(4, 1, 'img-1704295375453-625564885.png', 'AC', 2),
(25, 1, 'img-1704295641505-754019260.jpeg', 'Kursi', 30),
(27, 5, 'img-1704295810325-869337383.jpeg', 'Meja', 30),
(28, 5, 'img-1704325867356-447947531.jpeg', 'Kursi', 30),
(31, 2, 'img-1704326303066-767701725.jpeg', 'Kursi', 30),
(32, 2, 'img-1704326382242-285429376.jpeg', 'Proyektor', 1),
(33, 4, 'img-1704326464601-756996550.jpeg', 'Meja', 30),
(34, 4, 'img-1704326508322-514930435.jpeg', 'Kursi', 30),
(35, 1, 'img-1704326582802-92162125.jpeg', 'Meja Belajar', 30);

-- --------------------------------------------------------

--
-- Table structure for table `tb_jadwal_ruangan`
--

CREATE TABLE `tb_jadwal_ruangan` (
  `kode_jadwal_peminjaman` int(4) NOT NULL,
  `kode_ruangan` varchar(3) NOT NULL,
  `id_user` varchar(11) NOT NULL,
  `kegiatan` text NOT NULL,
  `waktu_mulai` datetime NOT NULL,
  `waktu_selesai` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_jadwal_ruangan`
--

INSERT INTO `tb_jadwal_ruangan` (`kode_jadwal_peminjaman`, `kode_ruangan`, `id_user`, `kegiatan`, `waktu_mulai`, `waktu_selesai`) VALUES
(4, '2', '2101010031', 'test', '2023-12-31 09:39:00', '2023-12-31 12:40:00'),
(5, '2', '2101010031', 'test', '2023-12-15 09:40:00', '0000-00-00 00:00:00'),
(6, '2', '2101010031', 'test', '2023-12-01 13:19:00', '2023-12-01 15:19:00'),
(7, '1', '2101010031', 'iya', '2023-12-09 10:20:00', '2023-12-30 14:20:00'),
(8, '1', '2101010031', 'huahem', '2023-12-19 19:14:00', '2023-12-20 15:14:00'),
(9, '1', '2101010031', 'test yg ke 3', '2023-12-25 17:04:00', '2023-12-26 20:04:00'),
(10, '2', '2101010031', 'test yg ke 3', '2024-01-01 22:02:00', '2024-01-01 01:03:00'),
(11, '1', '2101010031', 'gatau', '2024-01-02 08:08:00', '2024-01-02 12:00:00'),
(12, '1', '2101010031', 'gatau', '2024-01-02 08:08:00', '2024-01-02 12:00:00'),
(13, '1', '2101010031', 'iya', '2024-01-02 11:00:00', '2024-01-02 15:00:00'),
(14, '1', '2101010031', 'iya', '2024-01-02 10:00:00', '2024-01-02 14:00:00'),
(15, '1', '2101010031', 'IYA', '2024-01-02 09:39:00', '2024-01-02 13:00:00'),
(16, '', '2101010008', 'Tugas', '2024-01-03 10:00:00', '2024-01-03 13:00:00'),
(17, '', '2101010008', 'Tugas', '2024-01-03 10:00:00', '2024-01-03 13:00:00'),
(18, '', '2101010008', 'Tugas', '2024-01-03 10:00:00', '2024-01-03 13:00:00'),
(19, '', '2101010008', 'Tugas', '2024-01-03 10:00:00', '2024-01-03 13:00:00'),
(20, '', '2101010031', 'gatau', '2024-01-03 10:00:00', '2024-01-03 13:00:00'),
(21, '', '2101010008', 'test', '2024-01-03 10:00:00', '2024-01-03 13:00:00'),
(22, '', '2101010008', 'Membuat tugas', '2024-01-03 10:00:00', '2024-01-03 12:00:00'),
(23, '', '2101010031', 'iya', '2024-01-03 01:01:00', '2024-01-03 03:03:00'),
(24, '', '2101010031', '2101010031', '2024-01-03 08:00:00', '2024-01-03 10:00:00'),
(26, '', '2101010031', 'tst', '2024-01-03 10:00:00', '2024-01-03 12:00:00'),
(27, '', '2101010031', 'test', '2024-01-10 10:00:00', '2024-01-10 12:00:00'),
(28, '', '2101010031', 'test', '2024-01-10 10:00:00', '2024-01-10 12:00:00'),
(29, '', '2101010031', 'test yg ke 3', '2024-01-03 20:37:00', '2024-01-03 22:37:00'),
(30, '', '2101010031', 'test yg ke 3', '2024-01-03 20:37:00', '2024-01-03 22:37:00'),
(31, '', '2101010031', 'test yg ke 120', '2024-01-03 20:43:00', '2024-01-03 23:43:00'),
(32, '', '2101010031', 'test yg ke 120', '2024-01-03 20:43:00', '2024-01-03 23:43:00'),
(33, '', '2101010031', 'test yg ke 120', '2024-01-03 20:43:00', '2024-01-03 23:43:00'),
(34, '', '2101010031', 'test yg ke 150', '2024-01-03 20:48:00', '2024-01-03 22:48:00'),
(35, '', '2101010031', 'test ke 1080', '2024-01-03 20:53:00', '2024-01-03 23:53:00'),
(36, '', '21111111', 'test lagi sekali deh', '2024-01-03 21:23:00', '2024-01-03 23:23:00'),
(37, '', '213123', 'asdasd', '2024-01-03 21:31:00', '2024-01-05 21:31:00'),
(38, '', '213123', 'asdasd', '2024-01-03 21:31:00', '2024-01-05 21:31:00'),
(39, '', '213123', 'asdasd', '2024-01-03 21:31:00', '2024-01-05 21:31:00'),
(40, '4', 'asdasd', 'asdasd', '2024-01-03 21:43:00', '2024-01-03 21:43:00'),
(41, '5', '2101010031', 'Buat tugas', '2024-01-03 23:30:00', '2024-01-03 01:31:00'),
(42, '5', '2101010031', 'Pembubaran Panitia', '2024-01-04 07:49:00', '2024-01-04 09:49:00'),
(43, '1', '2101010031', 'Membuat tugas', '2024-01-04 08:12:00', '2024-01-04 10:13:00');

-- --------------------------------------------------------

--
-- Table structure for table `tb_ruangan`
--

CREATE TABLE `tb_ruangan` (
  `kode_ruangan` int(4) NOT NULL,
  `nama_ruangan` varchar(50) NOT NULL,
  `deskripsi_ruangan` text NOT NULL,
  `kategori` enum('lab','kelas','lainnya') NOT NULL,
  `foto_ruangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_ruangan`
--

INSERT INTO `tb_ruangan` (`kode_ruangan`, `nama_ruangan`, `deskripsi_ruangan`, `kategori`, `foto_ruangan`) VALUES
(1, 'Lab Data', '4×7Meter, maksimal 30 orang', 'lab', 'Lab. Data.jpg'),
(2, 'Lab RPL', '4×7Meter, maksimal 30 orang', 'lab', 'Lab. RPL.jpg'),
(3, 'Lab Komputer', '4×7Meter, maksimal 30 orang', 'lab', 'ruangan.png'),
(4, 'Kelas 01', '4×7Meter, maksimal 30 orang', 'kelas', 'R.01.JPG'),
(5, 'Kelas 02', '4×7Meter, maksimal 30 orang', 'kelas', 'R.02.JPG'),
(6, 'Kelas 03', '4×7Meter, maksimal 30 orang', 'kelas', 'R.03.JPG'),
(7, 'Ruang 04', '4×7Meter, maksimal 30 orang', 'kelas', 'R.04.JPG'),
(8, 'Ruang 05', '4×7Meter, maksimal 30 orang', 'kelas', 'R.05.JPG'),
(9, 'Ruang 06', '4×7Meter, maksimal 30 orang', 'kelas', 'R.06.JPG'),
(10, 'Auditorium', '10×5Meter, maksimal 50 orang', 'lainnya', 'Auditorium.jpg'),
(11, 'Aula', '120×20Meter, maksimal 250 orang', 'lainnya', 'Aula .JPG'),
(12, 'Ruang Hima', '3×5Meter, maksimal 15 orang', 'lainnya', 'R. Hima.jpg'),
(13, 'Ruang Kreatif', '4×7Meter, maksimal 30 orang', 'lainnya', 'R. Kreatif.JPG'),
(14, 'Ruang Studio', '3×6Meter, maksimal 15 orang', 'lainnya', 'R. Studio.jpg'),
(15, 'XD Space', '5×10Meter, maksimal 40 orang', 'lainnya', 'XD. Space.JPG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `tb_jadwal_ruangan`
--
ALTER TABLE `tb_jadwal_ruangan`
  ADD PRIMARY KEY (`kode_jadwal_peminjaman`);

--
-- Indexes for table `tb_ruangan`
--
ALTER TABLE `tb_ruangan`
  ADD PRIMARY KEY (`kode_ruangan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `kode_barang` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tb_jadwal_ruangan`
--
ALTER TABLE `tb_jadwal_ruangan`
  MODIFY `kode_jadwal_peminjaman` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `tb_ruangan`
--
ALTER TABLE `tb_ruangan`
  MODIFY `kode_ruangan` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
