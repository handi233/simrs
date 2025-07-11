<style>
  .title{
    color: #ddd;
  }
  </style>

<?php
date_default_timezone_set('Asia/Jakarta'); 

$conn = new mysqli("localhost", "root", "", "simrs");
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nama = $_POST['nama'] ?? "";
    $no_rkm_medis = $_POST['no_rkm_medis'] ?? "";
    $tanggal = date("Y-m-d");

    // Cek apakah pasien terdaftar di database
    $cek_pasien = $conn->query("SELECT * FROM pasien WHERE no_rkm_medis = '$no_rkm_medis' AND nama = '$nama'");
    
    if ($cek_pasien->num_rows == 0) {
        echo "<h2 style='color:red;' button-left:20px; margin-top:30px;>Gagal! Data pasien tidak ditemukan. Pastikan No RM dan Nama sesuai.</h2>";
         echo "<script>setTimeout(function(){ window.location.href = 'index.php'; }, 3000);</script>";
        exit;
        
    }

    // Lanjut jika data pasien valid
    $sql = "SELECT MAX(no_antrian) AS terakhir FROM antrian_pasien WHERE tanggal = '$tanggal'";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    $terakhir = $row['terakhir'] ?? 0;

    $no_antrian = $terakhir + 1;

    $conn->query("INSERT INTO antrian_pasien (no_rkm_medis,nama, no_antrian, tanggal) VALUES ('$no_rkm_medis','$nama', $no_antrian, '$tanggal')");

    $printer_path = "LPT1";
    $handle = @fopen($printer_path, "w");
    if ($handle) {
        fwrite($handle, "===== NOMOR ANTRIAN =====\n");
        fwrite($handle, "Klinik Rawat Inap Arafah Husada\n");
        fwrite($handle, "no_rkm_medis: $no_rkm_medis\n");
        fwrite($handle, "Nama: $nama\n");
        fwrite($handle, "Nomor Antrian: A - $no_antrian\n");
        fwrite($handle, "Tanggal: " . date("d-m-Y") . "\n");
        fwrite($handle, "Silakan tunggu dipanggil\n");
        fwrite($handle, "========================\n\n\n");
        fclose($handle);
        $cetak_msg = "<p style='color:green;'>Struk berhasil dicetak.</p>";
        echo "<script>setTimeout(function(){ window.location.href = 'index.php'; }, 3000);</script>";
    } else {
        $cetak_msg = "<p style='color:red;'>Gagal mencetak ke printer. Periksa koneksi printer Anda.</p>";   
         echo "<script>setTimeout(function(){ window.location.href = 'index.php'; }, 3000);</script>";
    }

    echo "<h2>Terima kasih, $no_rkm_medis</h2>";
    echo "<h3>Nomor Antrian Anda: <strong>A - $no_antrian</strong></h3>";
    echo "<p>Tanggal: " . date("d-m-Y") . "</p>";
    echo $cetak_msg;
    exit;
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <title>APAM Klinik Arafah Husada</title>
    <style>
        body {
            font-family: sans-serif;
            text-align: center;
            margin-top: 50px;
            background-color: green;
      
        }
        form {
            background:rgb(21, 21, 222);
            display: inline-block;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px gray;
        }
        #nama {
            padding: 10px;
            font-size: 20px;
            width: 400px;
            margin-bottom: 10px;
        }
        button.submit-btn {
            padding: 10px 30px;
            font-size: 20px;
            background: blue;
            color: white;
            border: none;
            cursor: pointer;
        }
        /* Keyboard styling */
        .keyboard {
            margin-top: 20px;
            user-select: none;
            display: inline-block;
        }
        .keyboard-row {
            margin-bottom: 5px;
        }
        .key {
            display: inline-block;
            padding: 12px 18px;
            margin: 2px;
            background: #ddd;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            font-size: 18px;
            width: 40px;
            text-align: center;
            box-shadow: 0 3px #999;
            user-select: none;
        }
        .key:active {
            box-shadow: none;
            position: relative;
            top: 3px;
        }
        .key.wide {
            width: 80px;
        }
    </style>
</head>
<body>

<form method="post" action="">
    <h2 class="title">Pendaftaran Pasien Hari Ini</h2>
    <input type="text" id="no_rkm_medis" name="no_rkm_medis" placeholder="Isi No Rekam Medis Anda" required style="padding:10px; font-size:20px; width:400px; margin-bottom:10px;"><br />
     <input type="text" name="nama" placeholder="Isi Nama Anda" required style="padding:10px; font-size:20px; width:400px; margin-bottom:10px;"><br />
    <br />
    <button type="submit" class="submit-btn">Ambil Nomor & Cetak</button>
</form>

<!-- Virtual Keyboard -->
<div class="keyboard" id="keyboard">

    <!-- Baris angka -->
    <div class="keyboard-row">
        <div class="key">1</div>
        <div class="key">2</div>
        <div class="key">3</div>
        <div class="key">4</div>
        <div class="key">5</div>
        <div class="key">6</div>
        <div class="key">7</div>
        <div class="key">8</div>
        <div class="key">9</div>
        <div class="key">0</div>
    </div>

    <!-- Baris huruf atas -->
    <div class="keyboard-row">
        <div class="key">Q</div>
        <div class="key">W</div>
        <div class="key">E</div>
        <div class="key">R</div>
        <div class="key">T</div>
        <div class="key">Y</div>
        <div class="key">U</div>
        <div class="key">I</div>
        <div class="key">O</div>
        <div class="key">P</div>
    </div>

    <!-- Baris huruf tengah -->
    <div class="keyboard-row">
        <div class="key">A</div>
        <div class="key">S</div>
        <div class="key">D</div>
        <div class="key">F</div>
        <div class="key">G</div>
        <div class="key">H</div>
        <div class="key">J</div>
        <div class="key">K</div>
        <div class="key">L</div>
    </div>

    <!-- Baris bawah: spasi dan backspace -->
    <div class="keyboard-row">
        <div class="key wide" id="space">Space</div>
        <div class="key" id="backspace">⌫</div>
    </div>

</div>

<script>
    const input = document.getElementById('no_rkm_medis');
    const keys = document.querySelectorAll('.key');

    keys.forEach(key => {
        key.addEventListener('click', () => {
            if (key.id === 'backspace') {
                input.value = input.value.slice(0, -1);
            } else if (key.id === 'space') {
                input.value += ' ';
            } else {
                input.value += key.textContent;
            }
            input.focus();
        });
    });
</script>

</body>
</html>
