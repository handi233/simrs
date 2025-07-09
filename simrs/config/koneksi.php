<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "simrs";

// Create connection
$conn = new mysqli($servername, $username, $password,$database);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$result = $conn->query("SELECT MAX(no_rkm_medis) AS max_rm FROM pasien");

// Cek apakah query berhasil
if (!$result) {
    die("Query gagal: " . $conn->error); // 
}

$row = $result->fetch_assoc();
$last_rm = $row['max_rm'] ?? 0;

// Buat nomor_rm baru
$new_rm = str_pad($last_rm + 1, 4, '0', STR_PAD_LEFT);

$conn->close();
?>