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

 Date: 05/08/2025 14:30:42
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
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of antrian_pasien
-- ----------------------------

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
  `no_rkm_medis` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_bayar` date NOT NULL,
  `nm_perawatan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `biaya` double NOT NULL,
  `jumlah` double NOT NULL,
  `total` double NOT NULL,
  `status` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  INDEX `status`(`status` ASC) USING BTREE,
  INDEX `no_rawat`(`no_rkm_medis` ASC) USING BTREE,
  CONSTRAINT `biling_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `rajal` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `biling_ibfk_2` FOREIGN KEY (`status`) REFERENCES `stts_biling` (`nama_stts`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biling
-- ----------------------------

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
INSERT INTO `dokter` VALUES ('D0002', 'Dr. A');
INSERT INTO `dokter` VALUES ('D0001', 'Dr. B');

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
-- Table structure for icd10
-- ----------------------------
DROP TABLE IF EXISTS `icd10`;
CREATE TABLE `icd10`  (
  `kd_icd` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of icd10
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

-- ----------------------------
-- Table structure for kamar
-- ----------------------------
DROP TABLE IF EXISTS `kamar`;
CREATE TABLE `kamar`  (
  `id` int NOT NULL,
  `kd_kamar` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_kamar` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  INDEX `nama_kamar`(`nama_kamar` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kamar
-- ----------------------------
INSERT INTO `kamar` VALUES (1, 'K001', 'mawar');
INSERT INTO `kamar` VALUES (2, 'K002', 'melati');
INSERT INTO `kamar` VALUES (3, '', 'anggrek');

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
  `hasil_lab` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`no_rkm_medis`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis` ASC) USING BTREE,
  INDEX `nama_pj`(`nama_pj` ASC) USING BTREE,
  INDEX `nama_dokter`(`nama_dokter` ASC) USING BTREE,
  CONSTRAINT `laborat_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `laborat_ibfk_2` FOREIGN KEY (`nama_dokter`) REFERENCES `dokter` (`nama_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `laborat_ibfk_3` FOREIGN KEY (`nama_pj`) REFERENCES `penjab` (`nama_pj`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of laborat
-- ----------------------------

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

-- ----------------------------
-- Table structure for pasien
-- ----------------------------
DROP TABLE IF EXISTS `pasien`;
CREATE TABLE `pasien`  (
  `id` int NOT NULL,
  `no_rkm_medis` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
  INDEX `jenis_kelamin`(`jk` ASC) USING BTREE,
  INDEX `nama`(`nama` ASC) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis` ASC) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pasien
-- ----------------------------

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
-- Table structure for pemanggilan_terakhir
-- ----------------------------
DROP TABLE IF EXISTS `pemanggilan_terakhir`;
CREATE TABLE `pemanggilan_terakhir`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `no_antrian` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `waktu_panggil` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pemanggilan_terakhir
-- ----------------------------

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
  INDEX `nama_pj`(`kd_pj` ASC) USING BTREE,
  INDEX `nama_pj_2`(`nama_pj` ASC) USING BTREE
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

-- ----------------------------
-- Table structure for poli
-- ----------------------------
DROP TABLE IF EXISTS `poli`;
CREATE TABLE `poli`  (
  `kd_poli` int NOT NULL,
  `nm_poli` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`kd_poli`) USING BTREE,
  INDEX `nm_poli`(`nm_poli` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of poli
-- ----------------------------
INSERT INTO `poli` VALUES (1, 'Anak');
INSERT INTO `poli` VALUES (2, 'Obgyn');
INSERT INTO `poli` VALUES (3, 'Umum');

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

-- ----------------------------
-- Table structure for rajal
-- ----------------------------
DROP TABLE IF EXISTS `rajal`;
CREATE TABLE `rajal`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_rkm_medis` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_periksa` date NOT NULL,
  `jam_periksa` time NOT NULL,
  `nama_dokter` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_pj` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_stts` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nm_poli` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis` ASC) USING BTREE,
  INDEX `nama_dokter`(`nama_dokter` ASC) USING BTREE,
  INDEX `nama_pj`(`nama_pj` ASC) USING BTREE,
  INDEX `nama_stts`(`nama_stts` ASC) USING BTREE,
  INDEX `nm_poli`(`nm_poli` ASC) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE,
  INDEX `nama`(`nama` ASC) USING BTREE,
  CONSTRAINT `rajal_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rajal_ibfk_2` FOREIGN KEY (`nama`) REFERENCES `pasien` (`nama`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rajal_ibfk_3` FOREIGN KEY (`nama_dokter`) REFERENCES `dokter` (`nama_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rajal_ibfk_4` FOREIGN KEY (`nama_pj`) REFERENCES `penjab` (`nama_pj`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rajal_ibfk_5` FOREIGN KEY (`nama_stts`) REFERENCES `stts` (`nama_stts`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `rajal_ibfk_6` FOREIGN KEY (`nm_poli`) REFERENCES `poli` (`nm_poli`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rajal
-- ----------------------------

-- ----------------------------
-- Table structure for rawatinap
-- ----------------------------
DROP TABLE IF EXISTS `rawatinap`;
CREATE TABLE `rawatinap`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_rkm_medis` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tgl_inap` date NOT NULL,
  `jam_inap` time NOT NULL,
  `nama_kamar` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `no_rkm_medis`(`no_rkm_medis` ASC) USING BTREE,
  INDEX `nama_kamar`(`nama_kamar` ASC) USING BTREE,
  CONSTRAINT `rawatinap_ibfk_1` FOREIGN KEY (`no_rkm_medis`) REFERENCES `pasien` (`no_rkm_medis`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `rawatinap_ibfk_2` FOREIGN KEY (`nama_kamar`) REFERENCES `kamar` (`nama_kamar`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rawatinap
-- ----------------------------

-- ----------------------------
-- Table structure for satusehat
-- ----------------------------
DROP TABLE IF EXISTS `satusehat`;
CREATE TABLE `satusehat`  (
  `id` int NOT NULL,
  `client_key` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `secret_key` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of satusehat
-- ----------------------------

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int NOT NULL,
  `nama_instansi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat_instansi` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `baground` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'Klinik Arafah Husada', 'Kab Kediri Jatim', '../simrs/asset/images/wallpaperrr.jpeg');

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
  `user_id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `level` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `username`(`username` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `role_id`(`level` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL, NULL, NULL, '');

SET FOREIGN_KEY_CHECKS = 1;
