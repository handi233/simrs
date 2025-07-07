<style>
.title {
        font-size: 12px; /* Perbaiki 'size' menjadi 'font-size' */
    }
    .alamat {
        font-size: 12px;
    }
    .no {
        font-size: 12px;
    }
    .tunggu {
        font-size: 12px;
    }
</style>
<?php
// Koneksi ke database
include ('../../config/koneksi.php');

// Cek apakah koneksi berhasil
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Ambil nomor antrian terakhir
$sql = "SELECT MAX(nomer) AS nomer FROM apam";


if (!$result) {
    die("Query gagal: " . $conn->error);
}

$row = $result->fetch_assoc();
$id = $row['nomer'] ?? 0; // Gunakan null coalescing untuk menangani NULL
$next= $id + 1; // Menambahkan 1 untuk nomor antrian berikutnya

// Simpan nomor baru ke database
$sql_insert = "INSERT INTO apam (nomer) VALUES ($next)";


// ====================
// CETAK KE PRINTER
// ====================
// Ubah sesuai sistem Anda:
// Windows: LPT1 atau \\localhost\printer_name
// Linux: /dev/usb/lp0 atau /dev/usb/lp1
$microsoft_print = "LPT1"; // Pastikan printer Anda terhubung

$handle = fopen($microsoft_print, "w");
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
    <title>Cetak Struck</title>
    <style>
        body { text-align: center; font-family: sans-serif; margin-top: 100px; }
        h1 { font-size: 50px; }
        p { font-size: 24px; }
    </style>
</head>
<body>
    <h1 class="title">Klinik Rawat Inap Arafah Husada</h1>
    <p class="alamat">Jl Nusa Dua Gampengrejo Kab Kediri</p>
    <h1 class="no">Nomor Anda: <strong>A - <?= $next ?></strong></h1>
    <p class="tunggu">Mohon menunggu di ruang tunggu hingga dipanggil.</p>
</body>
</html>