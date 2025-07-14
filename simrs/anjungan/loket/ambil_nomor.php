<?php
// Koneksi ke database
include ('../../config/koneksi.php');

// Cek koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Ambil nomor antrian terakhir
$sql = "SELECT MAX(nomer) AS nomer FROM apam";
$result = $conn->query($sql);

if (!$result) {
    die("Query gagal: " . $conn->error);
}

$row = $result->fetch_assoc();
$id = $row['nomer'] ?? 0; // Jika null, set ke 0
$next = $id + 1; // Nomor antrian berikutnya

// Simpan nomor baru ke database
$sql_insert = "INSERT INTO apam (nomer) VALUES ($next)";
if (!$conn->query($sql_insert)) {
    die("Gagal menyimpan data: " . $conn->error);
}

// ====================
// CETAK KE PRINTER
// ====================
$printer_path = "LPT1"; // Ubah sesuai printer Anda
$handle = @fopen($printer_path, "w"); // Gunakan @ untuk suppress warning jika gagal

if ($handle) {
    fwrite($handle, "========================\n");
    fwrite($handle, "     NOMOR ANTRIAN      \n");
    fwrite($handle, "         A - $next\n");
    fwrite($handle, "Silakan tunggu dipanggil\n");
    fwrite($handle, "========================\n");
    fwrite($handle, "\n\n\n\n\n");
    fclose($handle);
} else {
    echo "<p style='color:red;'>Gagal mencetak ke printer. Periksa koneksi printer Anda.</p>";
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="refresh" content="2;url=../../anjungan/loket/">
    <title>Cetak Struk</title>
    <style>
        body {
            text-align: center;
            font-family: sans-serif;
            margin-top: 100px;
        }
        h1.title {
            font-size: 20px;
            margin-bottom: 10px;
        }
        p.alamat {
            font-size: 16px;
            margin-bottom: 40px;
        }
        h1.no {
            font-size: 40px;
            color: red;
        }
        p.tunggu {
            font-size: 16px;
        }
    </style>
</head>
<body>
    <h1 class="title">Klinik Rawat Inap Arafah Husada</h1>
    <p class="alamat">Jl Nusa Dua Gampengrejo Kab Kediri</p>
    <h1 class="no">Nomor Anda: <strong>A - <?= htmlspecialchars($next) ?></strong></h1>
    <p class="tunggu">Mohon menunggu di ruang tunggu hingga dipanggil.</p>
</body>
</html>
