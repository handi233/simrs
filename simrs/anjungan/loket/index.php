
<!doctype html>
<html lang="en">
    <style>
        body {
  background-color: blue;
}
  .title {
  color:white;
  margin-left: 400px;
  margin-top: 100px;
  
}
.alamat {
  color:white;
  margin-left: 500px;
  margin-top: 30px;
}
.ambil{
    background-color: red;
    width: 500px;
    height: 150px;
    padding: 0;
    margin-left: 380px;
    size: 200px;
    color: white;
}
        </style>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>APAM</title>
  </head>
  <body>
  <h1 class="title">Klinik Rawat Inap Arafah Husada</h1>
  <p class="alamat">Jl Nusa Dua Gampengrejo Kediri</p>
  </body>
</html>
<?php
    // Koneksi ke database
    include('../../config/koneksi.php');

    // Cek apakah koneksi berhasil
    if ($conn->connect_error) {
        die("Koneksi gagal: " . $conn->connect_error); // Menampilkan error jika koneksi gagal
    

    // Menjalankan query untuk mendapatkan nilai MAX(nomer)
    $result = $conn->query("SELECT MAX(nomer) as last FROM apam");

    // Cek apakah query berhasil dijalankan
    if (!$result) {
        // Jika query gagal, tampilkan error
        echo "Query gagal: " . $conn->error;
        exit; // Menghentikan eksekusi script jika query gagal
    }
  
    // Mengambil hasil query sebagai array asosiatif
    $data = $result->fetch_assoc();

    // Jika tidak ada data (tabel kosong), maka last di-set ke 0
    $last = $data['last'] ?? 0;

    // Menampilkan nomor antrian terakhir yang ditemukan (atau 0 jika tabel kosong)
    echo "Nomor antrian terakhir: $last";

    // Menentukan nomor antrian selanjutnya
    $next = $last + 1;

    // Menampilkan nomor antrian selanjutnya
    echo "<br>Nomor antrian selanjutnya: $next";

    // ====================
    // CETAK KE PRINTER
    // ====================
    // Ubah sesuai sistem Anda:
    // Windows: LPT1 atau \\localhost\printer_name
    // Linux: /dev/usb/lp0 atau /dev/usb/lp1
    $printer = fopen("LPT1", "w"); // untuk Windows (atau gunakan file printer USB/COM)
    if ($printer) {
        fwrite($printer, "===== NOMOR ANTRIAN =====\n");
        fwrite($printer, "         A - $next\n");
        fwrite($printer, "  Silakan tunggu dipanggil\n");
        fwrite($printer, "==========================\n\n\n\n\n");
        fclose($printer);
    } else {
        echo "<p style='color:red;'>Gagal mencetak ke printer. Periksa koneksi printer Anda.</p>";
    }

    // Tutup koneksi setelah selesai
    $conn->close();
  }
    ?>

    <!-- Tombol untuk mengambil nomor antrian -->
    <a href="ambil_nomor.php"><button class="ambil">ANTRIAN </button></a>

</body>
</html>