-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2025 at 08:28 AM
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
-- Database: `simrs`
--

-- --------------------------------------------------------

--
-- Table structure for table `antrian_pasien`
--

CREATE TABLE `antrian_pasien` (
  `id` int(11) NOT NULL,
  `no_rkm_medis` varchar(40) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_antrian` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `antrian_pasien`
--

INSERT INTO `antrian_pasien` (`id`, `no_rkm_medis`, `nama`, `no_antrian`, `tanggal`, `waktu`) VALUES
(27, '0001', 'hasbi', 1, '2025-07-09', '2025-07-09 12:10:10'),
(28, '0001', 'hasbi', 2, '2025-07-09', '2025-07-09 14:22:38'),
(29, '0002', 'dika', 3, '2025-07-09', '2025-07-09 14:58:39'),
(30, '0001', 'hasbi', 4, '2025-07-09', '2025-07-09 14:58:55');

-- --------------------------------------------------------

--
-- Table structure for table `apam`
--

CREATE TABLE `apam` (
  `Id` int(11) NOT NULL,
  `nomer` bigint(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `biling`
--

CREATE TABLE `biling` (
  `no_rawat` varchar(30) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `nm_perawatan` varchar(50) NOT NULL,
  `biaya` double NOT NULL,
  `jumlah` double NOT NULL,
  `total` double NOT NULL,
  `status` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `biling`
--

INSERT INTO `biling` (`no_rawat`, `tgl_bayar`, `nm_perawatan`, `biaya`, `jumlah`, `total`, `status`) VALUES
('20250709/0001', '2025-07-09', 'bekas luka', 10000, 0, 10000, '-'),
('20250709/0002', '2025-07-02', '-', 8000, 2, 0, 'laboratorium');

-- --------------------------------------------------------

--
-- Table structure for table `data_ruang`
--

CREATE TABLE `data_ruang` (
  `id` int(30) NOT NULL,
  `nama_ruang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE `departemen` (
  `dep_id` varchar(15) NOT NULL,
  `nama_dep` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`dep_id`, `nama_dep`) VALUES
('1', 'Direktur RS');

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `kd_dokter` varchar(20) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`kd_dokter`, `nama_dokter`) VALUES
('D0002', 'Dr. Dwi'),
('D0001', 'Dr. Mutya');

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `jenis_kelamin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `icd10`
--

CREATE TABLE `icd10` (
  `kd_icd` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `icd10`
--

INSERT INTO `icd10` (`kd_icd`, `nama`) VALUES
('A00.0', 'Cholera');

-- --------------------------------------------------------

--
-- Table structure for table `igd`
--

CREATE TABLE `igd` (
  `id` int(20) NOT NULL,
  `no_rkm_medis` varchar(30) DEFAULT NULL,
  `tgl_inap` date NOT NULL,
  `jam_inap` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `igd`
--

INSERT INTO `igd` (`id`, `no_rkm_medis`, `tgl_inap`, `jam_inap`) VALUES
(15, '0001', '2025-07-01', '15:04:00');

-- --------------------------------------------------------

--
-- Table structure for table `laborat`
--

CREATE TABLE `laborat` (
  `no_rkm_medis` varchar(10) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam_periksa` time NOT NULL,
  `nama_dokter` varchar(50) NOT NULL,
  `nama_pj` varchar(20) NOT NULL,
  `hasil_lab` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laborat`
--

INSERT INTO `laborat` (`no_rkm_medis`, `tgl_periksa`, `jam_periksa`, `nama_dokter`, `nama_pj`, `hasil_lab`) VALUES
('0001', '0000-00-00', '00:00:00', 'Dr. Mutya', 'UMUM', '');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id` int(13) NOT NULL,
  `kd_obat` varchar(13) NOT NULL,
  `tgl` date NOT NULL,
  `nama` varchar(14) NOT NULL,
  `pcs` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `kd_obat`, `tgl`, `nama`, `pcs`) VALUES
(0, 'O001', '2025-07-01', 'CTM', '10');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `no_rkm_medis` varchar(10) NOT NULL,
  `nama` varchar(190) NOT NULL,
  `jk` varchar(20) NOT NULL,
  `no_ktp` int(16) NOT NULL,
  `tmp_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `nm_ibu` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `gol_darah` enum('-','B','O','AB') NOT NULL,
  `pekerjaan` varchar(60) NOT NULL,
  `stts` enum('B','M') NOT NULL,
  `agama` enum('-','ISLAM','KRISTEN','HINDU','BUDHA','KONGHUCHU','LAIN') NOT NULL,
  `tgl_daftar` date NOT NULL,
  `no_tlp` varchar(20) NOT NULL,
  `umur` varchar(30) NOT NULL,
  `pnd` enum('TK','SD','SMP','SMA','S1','S2','S3','-') NOT NULL,
  `keluarga` enum('IBU','ISTRI','SUAMI','SAUDARA') NOT NULL,
  `namakeluarga` varchar(50) NOT NULL,
  `kd_pj` char(5) NOT NULL,
  `no_peserta` varchar(25) NOT NULL,
  `kd_kel` varchar(100) NOT NULL,
  `kd_kec` int(11) NOT NULL,
  `kd_kab` int(11) NOT NULL,
  `pekerjaanpj` varchar(35) NOT NULL,
  `alamatpj` varchar(100) NOT NULL,
  `kelurahanpj` varchar(60) NOT NULL,
  `kecamatanpj` varchar(60) NOT NULL,
  `kabupatenpj` varchar(60) NOT NULL,
  `perusahaan_pasien` varchar(8) NOT NULL,
  `suku_bangsa` int(11) NOT NULL,
  `bahasa_pasien` int(11) NOT NULL,
  `cacat_fisik` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `kd_prop` int(11) NOT NULL,
  `propinsipj` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`no_rkm_medis`, `nama`, `jk`, `no_ktp`, `tmp_lahir`, `tgl_lahir`, `nm_ibu`, `alamat`, `gol_darah`, `pekerjaan`, `stts`, `agama`, `tgl_daftar`, `no_tlp`, `umur`, `pnd`, `keluarga`, `namakeluarga`, `kd_pj`, `no_peserta`, `kd_kel`, `kd_kec`, `kd_kab`, `pekerjaanpj`, `alamatpj`, `kelurahanpj`, `kecamatanpj`, `kabupatenpj`, `perusahaan_pasien`, `suku_bangsa`, `bahasa_pasien`, `cacat_fisik`, `email`, `nip`, `kd_prop`, `propinsipj`) VALUES
('0001', 'hasbi', 'L', 0, '', '0000-00-00', '', '', 'B', '', '', 'ISLAM', '0000-00-00', '', '', 'TK', 'IBU', '', 'UM', '', '', 0, 0, '', '', '', '', '', '', 0, 0, 0, '', '', 0, ''),
('0002', 'dika', 'L', 2147483647, 'KEDIRI', '2025-07-04', '-', '-', 'B', '-', '', '-', '2025-07-03', '', '', '-', '', '', '-', '', '', 0, 0, '', '', '', '', '', '', 0, 0, 0, '', '', 0, ''),
('0003', 'DEKA', 'L', 2147483647, '', '0000-00-00', '', 'PARE', '-', '', 'B', '-', '0000-00-00', '', '', 'TK', 'IBU', '', '', '', '', 0, 0, '', '', '', '', '', '', 0, 0, 0, '', '', 0, ''),
('0004', 'kusnandar', 'L', 2147483647, '', '0000-00-00', '', 'balowerti', '-', '', 'B', '-', '0000-00-00', '', '', 'TK', 'IBU', '', '', '', '', 0, 0, '', '', '', '', '', '', 0, 0, 0, '', '', 0, ''),
('0005', 'hasbullah', 'L', 341, 'kediri', '2025-07-03', '', 'sidoarjo', '-', '', 'B', '-', '0000-00-00', '', '', 'TK', 'IBU', '', '', '', '', 0, 0, '', '', '', '', '', '', 0, 0, 0, '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `kd_karyawan` varchar(20) NOT NULL,
  `nama_karyawan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`kd_karyawan`, `nama_karyawan`) VALUES
('P0001', 'DEKA');

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_cuti`
--

CREATE TABLE `pengajuan_cuti` (
  `no_cuti` int(10) NOT NULL,
  `kd_karyawan` varchar(30) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `alasan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengajuan_cuti`
--

INSERT INTO `pengajuan_cuti` (`no_cuti`, `kd_karyawan`, `tgl_mulai`, `tgl_selesai`, `alasan`) VALUES
(1, 'P0001', '2025-07-01', '2025-07-01', 'SAKIT');

-- --------------------------------------------------------

--
-- Table structure for table `penjab`
--

CREATE TABLE `penjab` (
  `kd_pj` char(5) NOT NULL,
  `nama_pj` varchar(30) NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjab`
--

INSERT INTO `penjab` (`kd_pj`, `nama_pj`, `status`) VALUES
('BPJS', 'BPJS KESEHATAN', '1'),
('UMUM', 'UMUM', '1');

-- --------------------------------------------------------

--
-- Table structure for table `periksarajal`
--

CREATE TABLE `periksarajal` (
  `id` int(11) NOT NULL,
  `no_rkm_medis` varchar(30) NOT NULL,
  `keluhan` varchar(30) NOT NULL,
  `diagnosa` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `periksarajal`
--

INSERT INTO `periksarajal` (`id`, `no_rkm_medis`, `keluhan`, `diagnosa`) VALUES
(2, '0001', 'tipes', 'svfv');

-- --------------------------------------------------------

--
-- Table structure for table `poliklinik`
--

CREATE TABLE `poliklinik` (
  `kd_poli` char(5) NOT NULL DEFAULT '',
  `nm_poli` varchar(50) DEFAULT NULL,
  `registrasi` double NOT NULL,
  `registrasilama` double NOT NULL,
  `status` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `poliklinik`
--

INSERT INTO `poliklinik` (`kd_poli`, `nm_poli`, `registrasi`, `registrasilama`, `status`) VALUES
('1.', 'INT', 0, 0, '0'),
('ANA', 'ANA Poli Anak tr', 0, 0, '0'),
('BDS', 'BEDAH SARAF', 0, 0, '0'),
('BSY', 'Bedah Syaraf', 0, 0, '0'),
('IGDK', 'IGD', 10000, 10000, '1'),
('INT', 'INT Poli Penyakit Dalam', 0, 0, '1'),
('OBG', 'OBG Poli Obstetri/Gyn.', 0, 0, '1'),
('U0001', 'Poliklinik Kandungan', 10000, 10000, '1'),
('U0002', 'Poliklinik Anak', 10000, 10000, '1'),
('U0003', 'Poliklinik Penyakit Dalam', 10000, 10000, '1'),
('U0004', 'Poliklinik Bedah', 10000, 10000, '1'),
('U0005', 'Poliklinik Mata', 10000, 10000, '1'),
('U0006', 'Poliklinik Kulit & Kelamin', 10000, 10000, '1'),
('U0007', 'Poliklinik Syaraf / Neurologi', 10000, 10000, '1'),
('U0008', 'Poliklinik Radiologi', 10000, 10000, '1'),
('U0009', 'Poliklinik Umum', 10000, 10000, '1'),
('U0010', 'Poliklinik Gigi & Mulut', 10000, 10000, '1'),
('U0011', 'Poliklinik THT', 10000, 10000, '1'),
('U0012', 'Poliklinik Jantung', 10000, 10000, '1'),
('U0016', 'ORTHOPEDI', 10000, 10000, '0'),
('U0026', 'Unit Laborat', 0, 0, '1'),
('U0027', 'MCU', 0, 0, '1'),
('U0028', 'TES ASA sasasa', 1000, 1000, '0'),
('U0044', 'Poli Syaraf', 0, 0, '0'),
('U0052', 'POLI GINJAL', 0, 0, '1'),
('U0053', 'fisioterapi', 0, 0, '1'),
('U0099', 'poli geriatri', 0, 0, '0'),
('UMU', 'UMUM', 0, 0, '1');

-- --------------------------------------------------------

--
-- Table structure for table `radiologi`
--

CREATE TABLE `radiologi` (
  `no_rkm_medis` varchar(20) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam_periksa` time NOT NULL,
  `nama_dokter` varchar(30) NOT NULL,
  `nama_pj` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `radiologi`
--

INSERT INTO `radiologi` (`no_rkm_medis`, `tgl_periksa`, `jam_periksa`, `nama_dokter`, `nama_pj`) VALUES
('0001', '0000-00-00', '00:00:00', 'Dr. Mutya', 'UMUM');

-- --------------------------------------------------------

--
-- Table structure for table `rajal`
--

CREATE TABLE `rajal` (
  `no_rawat` varchar(30) NOT NULL,
  `no_rkm_medis` varchar(20) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam_periksa` time NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `nama_pj` varchar(30) NOT NULL,
  `nama_stts` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rajal`
--

INSERT INTO `rajal` (`no_rawat`, `no_rkm_medis`, `tgl_periksa`, `jam_periksa`, `nama_dokter`, `nama_pj`, `nama_stts`) VALUES
('20250709/0001', '0001', '0000-00-00', '00:00:00', 'Dr. Mutya', 'UMUM', 'BARU'),
('20250709/0002', '0002', '2025-07-09', '06:23:00', 'Dr. Dwi', 'UMUM', 'BARU');

-- --------------------------------------------------------

--
-- Table structure for table `rawatinap`
--

CREATE TABLE `rawatinap` (
  `id` int(20) NOT NULL,
  `no_rkm_medis` varchar(30) DEFAULT NULL,
  `tgl_inap` date NOT NULL,
  `jam_inap` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rawatinap`
--

INSERT INTO `rawatinap` (`id`, `no_rkm_medis`, `tgl_inap`, `jam_inap`) VALUES
(15, '0001', '2025-07-01', '15:04:00');

-- --------------------------------------------------------

--
-- Table structure for table `satusehat`
--

CREATE TABLE `satusehat` (
  `client_key` varchar(30) NOT NULL,
  `secret_key` varchar(30) NOT NULL,
  `url` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(20) NOT NULL,
  `field` varchar(50) NOT NULL,
  `value` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `field`, `value`) VALUES
(1, 'logo', ''),
(2, 'nama_instansi', ''),
(3, 'alamat_instansi', '');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--
-- Error reading structure for table simrs.status: #1932 - Table 'simrs.status' doesn't exist in engine
-- Error reading data for table simrs.status: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'FROM `simrs`.`status`' at line 1

-- --------------------------------------------------------

--
-- Table structure for table `stts`
--

CREATE TABLE `stts` (
  `kd_stts` int(11) NOT NULL,
  `nama_stts` varchar(5) NOT NULL,
  `Harga` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stts`
--

INSERT INTO `stts` (`kd_stts`, `nama_stts`, `Harga`) VALUES
(1, 'BARU', '10000'),
(2, 'LAMA', '5000');

-- --------------------------------------------------------

--
-- Table structure for table `stts_biling`
--

CREATE TABLE `stts_biling` (
  `kd_stts` int(20) NOT NULL,
  `nama_stts` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stts_biling`
--

INSERT INTO `stts_biling` (`kd_stts`, `nama_stts`) VALUES
(0, '-'),
(1, 'laboratorium'),
(2, 'radiologi');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
('001', '$2y$10$r2eX7SOYEawUmlBXHclG9eIZVfop7n5x.LKxXAlim1F46tM0HqEHy', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `antrian_pasien`
--
ALTER TABLE `antrian_pasien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `nama` (`nama`),
  ADD KEY `no_rkm_medis` (`no_rkm_medis`);

--
-- Indexes for table `apam`
--
ALTER TABLE `apam`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `biling`
--
ALTER TABLE `biling`
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `data_ruang`
--
ALTER TABLE `data_ruang`
  ADD KEY `id` (`id`);

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD KEY `dep_id` (`dep_id`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`kd_dokter`),
  ADD KEY `nama_dokter` (`nama_dokter`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD KEY `jenis_kelamin` (`jenis_kelamin`);

--
-- Indexes for table `igd`
--
ALTER TABLE `igd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `no_rkm_medis` (`no_rkm_medis`);

--
-- Indexes for table `laborat`
--
ALTER TABLE `laborat`
  ADD PRIMARY KEY (`no_rkm_medis`),
  ADD KEY `no_rkm_medis` (`no_rkm_medis`),
  ADD KEY `nama_dokter` (`nama_dokter`),
  ADD KEY `nama_pj` (`nama_pj`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`no_rkm_medis`),
  ADD KEY `no_ktp` (`no_ktp`),
  ADD KEY `kd_pj` (`kd_pj`),
  ADD KEY `no_rkm_medis` (`no_rkm_medis`),
  ADD KEY `jenis_kelamin` (`jk`),
  ADD KEY `nama` (`nama`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`kd_karyawan`);

--
-- Indexes for table `pengajuan_cuti`
--
ALTER TABLE `pengajuan_cuti`
  ADD PRIMARY KEY (`no_cuti`),
  ADD KEY `kd_karyawan` (`kd_karyawan`);

--
-- Indexes for table `penjab`
--
ALTER TABLE `penjab`
  ADD PRIMARY KEY (`kd_pj`),
  ADD KEY `nama_pj` (`kd_pj`) USING BTREE,
  ADD KEY `nama_pj_2` (`nama_pj`);

--
-- Indexes for table `periksarajal`
--
ALTER TABLE `periksarajal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `no_rkm_medis` (`no_rkm_medis`);

--
-- Indexes for table `poliklinik`
--
ALTER TABLE `poliklinik`
  ADD PRIMARY KEY (`kd_poli`),
  ADD KEY `nm_poli` (`nm_poli`),
  ADD KEY `registrasi` (`registrasi`),
  ADD KEY `registrasilama` (`registrasilama`),
  ADD KEY `kd_poli` (`kd_poli`);

--
-- Indexes for table `radiologi`
--
ALTER TABLE `radiologi`
  ADD PRIMARY KEY (`no_rkm_medis`),
  ADD KEY `no_rkm_medis` (`no_rkm_medis`),
  ADD KEY `nama_dokter` (`nama_dokter`),
  ADD KEY `nama_pj` (`nama_pj`);

--
-- Indexes for table `rajal`
--
ALTER TABLE `rajal`
  ADD KEY `no_rawat` (`no_rawat`),
  ADD KEY `no_rkm_medis` (`no_rkm_medis`),
  ADD KEY `nama_dokter` (`nama_dokter`),
  ADD KEY `rajal_ibfk_4` (`nama_stts`),
  ADD KEY `rajal_ibfk_5` (`nama_pj`);

--
-- Indexes for table `rawatinap`
--
ALTER TABLE `rawatinap`
  ADD PRIMARY KEY (`id`),
  ADD KEY `no_rkm_medis` (`no_rkm_medis`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stts`
--
ALTER TABLE `stts`
  ADD PRIMARY KEY (`kd_stts`),
  ADD KEY `nama_stts` (`nama_stts`);

--
-- Indexes for table `stts_biling`
--
ALTER TABLE `stts_biling`
  ADD PRIMARY KEY (`kd_stts`),
  ADD KEY `nama_stts` (`nama_stts`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD KEY `username` (`username`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `antrian_pasien`
--
ALTER TABLE `antrian_pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `apam`
--
ALTER TABLE `apam`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `igd`
--
ALTER TABLE `igd`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `periksarajal`
--
ALTER TABLE `periksarajal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rawatinap`
--
ALTER TABLE `rawatinap`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `antrian_pasien`
--
ALTER TABLE `antrian_pasien`
  ADD CONSTRAINT `antrian_pasien_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON UPDATE CASCADE;

--
-- Constraints for table `biling`
--
ALTER TABLE `biling`
  ADD CONSTRAINT `biling_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `rajal` (`no_rawat`) ON UPDATE CASCADE,
  ADD CONSTRAINT `biling_ibfk_2` FOREIGN KEY (`status`) REFERENCES `stts_biling` (`nama_stts`) ON UPDATE CASCADE;

--
-- Constraints for table `igd`
--
ALTER TABLE `igd`
  ADD CONSTRAINT `igd_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON UPDATE CASCADE;

--
-- Constraints for table `laborat`
--
ALTER TABLE `laborat`
  ADD CONSTRAINT `laborat_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `rajal` (`no_rkm_medis`),
  ADD CONSTRAINT `laborat_ibfk_2` FOREIGN KEY (`nama_dokter`) REFERENCES `dokter` (`nama_dokter`) ON UPDATE CASCADE,
  ADD CONSTRAINT `laborat_ibfk_3` FOREIGN KEY (`nama_pj`) REFERENCES `penjab` (`nama_pj`) ON UPDATE CASCADE;

--
-- Constraints for table `pengajuan_cuti`
--
ALTER TABLE `pengajuan_cuti`
  ADD CONSTRAINT `pengajuan_cuti_ibfk_1` FOREIGN KEY (`kd_karyawan`) REFERENCES `pegawai` (`kd_karyawan`) ON UPDATE CASCADE;

--
-- Constraints for table `periksarajal`
--
ALTER TABLE `periksarajal`
  ADD CONSTRAINT `periksarajal_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON UPDATE CASCADE;

--
-- Constraints for table `radiologi`
--
ALTER TABLE `radiologi`
  ADD CONSTRAINT `radiologi_ibfk_1` FOREIGN KEY (`nama_dokter`) REFERENCES `dokter` (`nama_dokter`) ON UPDATE CASCADE,
  ADD CONSTRAINT `radiologi_ibfk_2` FOREIGN KEY (`nama_dokter`) REFERENCES `dokter` (`nama_dokter`) ON UPDATE CASCADE,
  ADD CONSTRAINT `radiologi_ibfk_3` FOREIGN KEY (`nama_pj`) REFERENCES `penjab` (`kd_pj`) ON UPDATE CASCADE,
  ADD CONSTRAINT `radiologi_ibfk_4` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON UPDATE CASCADE;

--
-- Constraints for table `rajal`
--
ALTER TABLE `rajal`
  ADD CONSTRAINT `rajal_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rajal_ibfk_2` FOREIGN KEY (`nama_dokter`) REFERENCES `dokter` (`nama_dokter`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rajal_ibfk_4` FOREIGN KEY (`nama_stts`) REFERENCES `stts` (`nama_stts`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rajal_ibfk_5` FOREIGN KEY (`nama_pj`) REFERENCES `penjab` (`kd_pj`) ON UPDATE CASCADE;

--
-- Constraints for table `rawatinap`
--
ALTER TABLE `rawatinap`
  ADD CONSTRAINT `rawatinap_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
