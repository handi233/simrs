/*
 Navicat Premium Dump SQL

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : simrs

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 11/07/2025 13:51:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for antrian_pasien
-- ----------------------------
DROP TABLE IF EXISTS `antrian_pasien`;
CREATE TABLE `antrian_pasien`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_rkm_medis` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_antrian` int NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` datetime NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `nama`(`nama` ASC) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis` ASC) USING BTREE,
  CONSTRAINT `antrian_pasien_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of antrian_pasien
-- ----------------------------
INSERT INTO `antrian_pasien` VALUES (27, '0001', 'hasbi', 1, '2025-07-09', '2025-07-09 12:10:10');
INSERT INTO `antrian_pasien` VALUES (28, '0001', 'hasbi', 2, '2025-07-09', '2025-07-09 14:22:38');
INSERT INTO `antrian_pasien` VALUES (29, '0002', 'dika', 3, '2025-07-09', '2025-07-09 14:58:39');
INSERT INTO `antrian_pasien` VALUES (30, '0001', 'hasbi', 4, '2025-07-09', '2025-07-09 14:58:55');

-- ----------------------------
-- Table structure for apam
-- ----------------------------
DROP TABLE IF EXISTS `apam`;
CREATE TABLE `apam`  (
  `Id` int NOT NULL AUTO_INCREMENT,
  `nomer` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apam
-- ----------------------------

-- ----------------------------
-- Table structure for biling
-- ----------------------------
DROP TABLE IF EXISTS `biling`;
CREATE TABLE `biling`  (
  `no_rawat` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_bayar` date NOT NULL,
  `nm_perawatan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `biaya` double NOT NULL,
  `jumlah` double NOT NULL,
  `total` double NOT NULL,
  `status` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  INDEX `no_rawat`(`no_rawat` ASC) USING BTREE,
  INDEX `status`(`status` ASC) USING BTREE,
  CONSTRAINT `biling_ibfk_1` FOREIGN KEY (`no_rawat`) REFERENCES `rajal` (`no_rawat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `biling_ibfk_2` FOREIGN KEY (`status`) REFERENCES `stts_biling` (`nama_stts`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biling
-- ----------------------------
INSERT INTO `biling` VALUES ('20250709/0001', '2025-07-09', 'bekas luka', 10000, 0, 10000, '-');
INSERT INTO `biling` VALUES ('20250709/0002', '2025-07-02', '-', 8000, 2, 0, 'laboratorium');

-- ----------------------------
-- Table structure for data_ruang
-- ----------------------------
DROP TABLE IF EXISTS `data_ruang`;
CREATE TABLE `data_ruang`  (
  `id` int NOT NULL,
  `nama_ruang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_ruang
-- ----------------------------

-- ----------------------------
-- Table structure for departemen
-- ----------------------------
DROP TABLE IF EXISTS `departemen`;
CREATE TABLE `departemen`  (
  `dep_id` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_dep` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  INDEX `dep_id`(`dep_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departemen
-- ----------------------------
INSERT INTO `departemen` VALUES ('1', 'Direktur RS');

-- ----------------------------
-- Table structure for dokter
-- ----------------------------
DROP TABLE IF EXISTS `dokter`;
CREATE TABLE `dokter`  (
  `kd_dokter` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_dokter` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`kd_dokter`) USING BTREE,
  INDEX `nama_dokter`(`nama_dokter` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dokter
-- ----------------------------
INSERT INTO `dokter` VALUES ('D0002', 'Dr. Dwi');
INSERT INTO `dokter` VALUES ('D0001', 'Dr. Mutya');

-- ----------------------------
-- Table structure for gender
-- ----------------------------
DROP TABLE IF EXISTS `gender`;
CREATE TABLE `gender`  (
  `jenis_kelamin` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  INDEX `jenis_kelamin`(`jenis_kelamin` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gender
-- ----------------------------

-- ----------------------------
-- Table structure for igd
-- ----------------------------
DROP TABLE IF EXISTS `igd`;
CREATE TABLE `igd`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_rkm_medis` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tgl_inap` date NOT NULL,
  `jam_inap` time NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis` ASC) USING BTREE,
  CONSTRAINT `igd_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of igd
-- ----------------------------
INSERT INTO `igd` VALUES (15, '0001', '2025-07-01', '15:04:00');

-- ----------------------------
-- Table structure for laborat
-- ----------------------------
DROP TABLE IF EXISTS `laborat`;
CREATE TABLE `laborat`  (
  `no_rkm_medis` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam_periksa` time NOT NULL,
  `nama_dokter` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_pj` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`no_rkm_medis`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis` ASC) USING BTREE,
  INDEX `nama_dokter`(`nama_dokter` ASC) USING BTREE,
  INDEX `nama_pj`(`nama_pj` ASC) USING BTREE,
  CONSTRAINT `laborat_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `laborat_ibfk_2` FOREIGN KEY (`nama_dokter`) REFERENCES `dokter` (`nama_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `laborat_ibfk_3` FOREIGN KEY (`nama_pj`) REFERENCES `penjab` (`nama_pj`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of laborat
-- ----------------------------
INSERT INTO `laborat` VALUES ('0001', '0000-00-00', '00:00:00', 'Dr. Mutya', 'UMUM');

-- ----------------------------
-- Table structure for obat
-- ----------------------------
DROP TABLE IF EXISTS `obat`;
CREATE TABLE `obat`  (
  `id` int NOT NULL,
  `kd_obat` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl` date NOT NULL,
  `nama` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pcs` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of obat
-- ----------------------------
INSERT INTO `obat` VALUES (0, 'O001', '2025-07-01', 'CTM', '10');

-- ----------------------------
-- Table structure for pasien
-- ----------------------------
DROP TABLE IF EXISTS `pasien`;
CREATE TABLE `pasien`  (
  `no_rkm_medis` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jk` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_ktp` int NOT NULL,
  `tmp_lahir` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_lahir` date NOT NULL,
  `nm_ibu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gol_darah` enum('-','B','O','AB') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pekerjaan` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stts` enum('B','M') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `agama` enum('-','ISLAM','KRISTEN','HINDU','BUDHA','KONGHUCHU','LAIN') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_daftar` date NOT NULL,
  `no_tlp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `umur` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pnd` enum('TK','SD','SMP','SMA','S1','S2','S3','-') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `keluarga` enum('IBU','ISTRI','SUAMI','SAUDARA') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `namakeluarga` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kd_pj` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_peserta` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kd_kel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kd_kec` int NOT NULL,
  `kd_kab` int NOT NULL,
  `pekerjaanpj` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamatpj` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kelurahanpj` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kecamatanpj` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kabupatenpj` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `perusahaan_pasien` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `suku_bangsa` int NOT NULL,
  `bahasa_pasien` int NOT NULL,
  `cacat_fisik` int NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kd_prop` int NOT NULL,
  `propinsipj` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`no_rkm_medis`) USING BTREE,
  INDEX `no_ktp`(`no_ktp` ASC) USING BTREE,
  INDEX `kd_pj`(`kd_pj` ASC) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis` ASC) USING BTREE,
  INDEX `jenis_kelamin`(`jk` ASC) USING BTREE,
  INDEX `nama`(`nama` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pasien
-- ----------------------------
INSERT INTO `pasien` VALUES ('0001', 'hasbi', 'L', 0, '', '0000-00-00', '', '', 'B', '', '', 'ISLAM', '0000-00-00', '', '', 'TK', 'IBU', '', 'UM', '', '', 0, 0, '', '', '', '', '', '', 0, 0, 0, '', '', 0, '');
INSERT INTO `pasien` VALUES ('0002', 'dika', 'L', 2147483647, 'KEDIRI', '2025-07-04', '-', '-', 'B', '-', '', '-', '2025-07-03', '', '', '-', '', '', '-', '', '', 0, 0, '', '', '', '', '', '', 0, 0, 0, '', '', 0, '');
INSERT INTO `pasien` VALUES ('0003', 'DEKA', 'L', 2147483647, '', '0000-00-00', '', 'PARE', '-', '', 'B', '-', '0000-00-00', '', '', 'TK', 'IBU', '', '', '', '', 0, 0, '', '', '', '', '', '', 0, 0, 0, '', '', 0, '');
INSERT INTO `pasien` VALUES ('0004', 'kusnandar', 'L', 2147483647, '', '0000-00-00', '', 'balowerti', '-', '', 'B', '-', '0000-00-00', '', '', 'TK', 'IBU', '', '', '', '', 0, 0, '', '', '', '', '', '', 0, 0, 0, '', '', 0, '');
INSERT INTO `pasien` VALUES ('0005', 'hasbullah', 'L', 341, 'kediri', '2025-07-03', '', 'sidoarjo', '-', '', 'B', '-', '0000-00-00', '', '', 'TK', 'IBU', '', '', '', '', 0, 0, '', '', '', '', '', '', 0, 0, 0, '', '', 0, '');

-- ----------------------------
-- Table structure for pegawai
-- ----------------------------
DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE `pegawai`  (
  `kd_karyawan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_karyawan` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`kd_karyawan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pegawai
-- ----------------------------
INSERT INTO `pegawai` VALUES ('P0001', 'DEKA');

-- ----------------------------
-- Table structure for pengajuan_cuti
-- ----------------------------
DROP TABLE IF EXISTS `pengajuan_cuti`;
CREATE TABLE `pengajuan_cuti`  (
  `no_cuti` int NOT NULL,
  `kd_karyawan` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `alasan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`no_cuti`) USING BTREE,
  INDEX `kd_karyawan`(`kd_karyawan` ASC) USING BTREE,
  CONSTRAINT `pengajuan_cuti_ibfk_1` FOREIGN KEY (`kd_karyawan`) REFERENCES `pegawai` (`kd_karyawan`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengajuan_cuti
-- ----------------------------
INSERT INTO `pengajuan_cuti` VALUES (1, 'P0001', '2025-07-01', '2025-07-01', 'SAKIT');

-- ----------------------------
-- Table structure for penjab
-- ----------------------------
DROP TABLE IF EXISTS `penjab`;
CREATE TABLE `penjab`  (
  `kd_pj` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_pj` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`kd_pj`) USING BTREE,
  INDEX `nama_pj`(`kd_pj` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of penjab
-- ----------------------------
INSERT INTO `penjab` VALUES ('BPJS', 'BPJS KESEHATAN', '1');
INSERT INTO `penjab` VALUES ('UMUM', 'UMUM', '1');

-- ----------------------------
-- Table structure for periksarajal
-- ----------------------------
DROP TABLE IF EXISTS `periksarajal`;
CREATE TABLE `periksarajal`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_rkm_medis` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `keluhan` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `diagnosa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis` ASC) USING BTREE,
  CONSTRAINT `periksarajal_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of periksarajal
-- ----------------------------
INSERT INTO `periksarajal` VALUES (2, '0001', 'tipes', 'svfv');

-- ----------------------------
-- Table structure for poliklinik
-- ----------------------------
DROP TABLE IF EXISTS `poliklinik`;
CREATE TABLE `poliklinik`  (
  `kd_poli` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nm_poli` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `registrasi` double NOT NULL,
  `registrasilama` double NOT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kd_poli`) USING BTREE,
  INDEX `nm_poli`(`nm_poli` ASC) USING BTREE,
  INDEX `registrasi`(`registrasi` ASC) USING BTREE,
  INDEX `registrasilama`(`registrasilama` ASC) USING BTREE,
  INDEX `kd_poli`(`kd_poli` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of poliklinik
-- ----------------------------
INSERT INTO `poliklinik` VALUES ('1.', 'INT', 0, 0, '0');
INSERT INTO `poliklinik` VALUES ('ANA', 'ANA Poli Anak tr', 0, 0, '0');
INSERT INTO `poliklinik` VALUES ('BDS', 'BEDAH SARAF', 0, 0, '0');
INSERT INTO `poliklinik` VALUES ('BSY', 'Bedah Syaraf', 0, 0, '0');
INSERT INTO `poliklinik` VALUES ('IGDK', 'IGD', 10000, 10000, '1');
INSERT INTO `poliklinik` VALUES ('INT', 'INT Poli Penyakit Dalam', 0, 0, '1');
INSERT INTO `poliklinik` VALUES ('OBG', 'OBG Poli Obstetri/Gyn.', 0, 0, '1');
INSERT INTO `poliklinik` VALUES ('U0001', 'Poliklinik Kandungan', 10000, 10000, '1');
INSERT INTO `poliklinik` VALUES ('U0002', 'Poliklinik Anak', 10000, 10000, '1');
INSERT INTO `poliklinik` VALUES ('U0003', 'Poliklinik Penyakit Dalam', 10000, 10000, '1');
INSERT INTO `poliklinik` VALUES ('U0004', 'Poliklinik Bedah', 10000, 10000, '1');
INSERT INTO `poliklinik` VALUES ('U0005', 'Poliklinik Mata', 10000, 10000, '1');
INSERT INTO `poliklinik` VALUES ('U0006', 'Poliklinik Kulit & Kelamin', 10000, 10000, '1');
INSERT INTO `poliklinik` VALUES ('U0007', 'Poliklinik Syaraf / Neurologi', 10000, 10000, '1');
INSERT INTO `poliklinik` VALUES ('U0008', 'Poliklinik Radiologi', 10000, 10000, '1');
INSERT INTO `poliklinik` VALUES ('U0009', 'Poliklinik Umum', 10000, 10000, '1');
INSERT INTO `poliklinik` VALUES ('U0010', 'Poliklinik Gigi & Mulut', 10000, 10000, '1');
INSERT INTO `poliklinik` VALUES ('U0011', 'Poliklinik THT', 10000, 10000, '1');
INSERT INTO `poliklinik` VALUES ('U0012', 'Poliklinik Jantung', 10000, 10000, '1');
INSERT INTO `poliklinik` VALUES ('U0016', 'ORTHOPEDI', 10000, 10000, '0');
INSERT INTO `poliklinik` VALUES ('U0026', 'Unit Laborat', 0, 0, '1');
INSERT INTO `poliklinik` VALUES ('U0027', 'MCU', 0, 0, '1');
INSERT INTO `poliklinik` VALUES ('U0028', 'TES ASA sasasa', 1000, 1000, '0');
INSERT INTO `poliklinik` VALUES ('U0044', 'Poli Syaraf', 0, 0, '0');
INSERT INTO `poliklinik` VALUES ('U0052', 'POLI GINJAL', 0, 0, '1');
INSERT INTO `poliklinik` VALUES ('U0053', 'fisioterapi', 0, 0, '1');
INSERT INTO `poliklinik` VALUES ('U0099', 'poli geriatri', 0, 0, '0');
INSERT INTO `poliklinik` VALUES ('UMU', 'UMUM', 0, 0, '1');

-- ----------------------------
-- Table structure for radiologi
-- ----------------------------
DROP TABLE IF EXISTS `radiologi`;
CREATE TABLE `radiologi`  (
  `no_rkm_medis` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam_periksa` time NOT NULL,
  `nama_dokter` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_pj` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`no_rkm_medis`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis` ASC) USING BTREE,
  INDEX `nama_dokter`(`nama_dokter` ASC) USING BTREE,
  INDEX `nama_pj`(`nama_pj` ASC) USING BTREE,
  CONSTRAINT `radiologi_ibfk_1` FOREIGN KEY (`nama_dokter`) REFERENCES `dokter` (`nama_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `radiologi_ibfk_2` FOREIGN KEY (`nama_dokter`) REFERENCES `dokter` (`nama_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `radiologi_ibfk_3` FOREIGN KEY (`nama_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `radiologi_ibfk_4` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of radiologi
-- ----------------------------
INSERT INTO `radiologi` VALUES ('0001', '0000-00-00', '00:00:00', 'Dr. Mutya', 'UMUM');

-- ----------------------------
-- Table structure for rajal
-- ----------------------------
DROP TABLE IF EXISTS `rajal`;
CREATE TABLE `rajal`  (
  `no_rawat` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_rkm_medis` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam_periksa` time NOT NULL,
  `nama_dokter` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_pj` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_stts` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  INDEX `no_rawat`(`no_rawat` ASC) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis` ASC) USING BTREE,
  INDEX `nama_dokter`(`nama_dokter` ASC) USING BTREE,
  INDEX `rajal_ibfk_4`(`nama_stts` ASC) USING BTREE,
  INDEX `rajal_ibfk_5`(`nama_pj` ASC) USING BTREE,
  CONSTRAINT `rajal_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rajal_ibfk_2` FOREIGN KEY (`nama_dokter`) REFERENCES `dokter` (`nama_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rajal_ibfk_4` FOREIGN KEY (`nama_stts`) REFERENCES `stts` (`nama_stts`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rajal_ibfk_5` FOREIGN KEY (`nama_pj`) REFERENCES `penjab` (`kd_pj`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rajal
-- ----------------------------
INSERT INTO `rajal` VALUES ('20250709/0001', '0001', '0000-00-00', '00:00:00', 'Dr. Mutya', 'UMUM', 'BARU');
INSERT INTO `rajal` VALUES ('20250709/0002', '0002', '2025-07-09', '06:23:00', 'Dr. Dwi', 'UMUM', 'BARU');

-- ----------------------------
-- Table structure for rawatinap
-- ----------------------------
DROP TABLE IF EXISTS `rawatinap`;
CREATE TABLE `rawatinap`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_rkm_medis` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tgl_inap` date NOT NULL,
  `jam_inap` time NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis` ASC) USING BTREE,
  CONSTRAINT `rawatinap_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rawatinap
-- ----------------------------
INSERT INTO `rawatinap` VALUES (15, '0001', '2025-07-01', '15:04:00');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int NOT NULL,
  `field` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'logo', '');
INSERT INTO `settings` VALUES (2, 'nama_instansi', '');
INSERT INTO `settings` VALUES (3, 'alamat_instansi', '');

-- ----------------------------
-- Table structure for stts
-- ----------------------------
DROP TABLE IF EXISTS `stts`;
CREATE TABLE `stts`  (
  `kd_stts` int NOT NULL,
  `nama_stts` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Harga` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`kd_stts`) USING BTREE,
  INDEX `nama_stts`(`nama_stts` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stts
-- ----------------------------
INSERT INTO `stts` VALUES (1, 'BARU', '10000');
INSERT INTO `stts` VALUES (2, 'LAMA', '5000');

-- ----------------------------
-- Table structure for stts_biling
-- ----------------------------
DROP TABLE IF EXISTS `stts_biling`;
CREATE TABLE `stts_biling`  (
  `kd_stts` int NOT NULL,
  `nama_stts` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`kd_stts`) USING BTREE,
  INDEX `nama_stts`(`nama_stts` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stts_biling
-- ----------------------------
INSERT INTO `stts_biling` VALUES (0, '-');
INSERT INTO `stts_biling` VALUES (1, 'laboratorium');
INSERT INTO `stts_biling` VALUES (2, 'radiologi');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('001', '$2y$10$r2eX7SOYEawUmlBXHclG9eIZVfop7n5x.LKxXAlim1F46tM0HqEHy', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  () COMMENT = 'Table \'simrs.status\' doesn\'t exist in engine';
