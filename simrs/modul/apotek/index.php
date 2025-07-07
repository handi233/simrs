<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
// Cek apakah pengguna sudah login


if (empty($_SESSION['username'])) {
    $_SESSION['username'];
}

?>
<style>
.table-scroll {
   
   table-layout: absolute;
    width: 70%;

}
.table-scroll table {
    min-width: 70px; /* atur sesuai kebutuhan */
    border-collapse: collapse;
}
.table-scroll th, .table-scroll td {
    padding: 1px;
    border: 0px solid #ccc;
    white-space: nowrap; /* supaya isi kolom tidak patah */
}

.footer{
position: fixed;
margin-bottom: 12px;
   top: 552px;
    bottom: none;
    left: 0;
    width: 100%;
  background-color: green;
    border-top: 0 solid #ccc;
    padding: 0;
}
.simpan{
  width: 100px;
  height: 70px;
}
</style>
<?php
$host     = "localhost";
$username = "root";
$password = "";
$database = "simrs";

$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

if (isset($_POST['simpan'])) {
    $kd_obat = $_POST['kd_obat'];
    $tgl     = $_POST['tgl'];
    $nama    = $_POST['nama'];
    $pcs     = (int)$_POST['pcs']; 

    if (empty($kd_obat) || empty($tgl) || empty($nama) || $pcs <= 0) {
        die("Data tidak lengkap atau pcs tidak valid.");
    }

    $stmt = $conn->prepare("INSERT INTO obat (`kd_obat`, `tgl`, `nama`, `pcs`) VALUES (?, ?, ?, ?)");

    if ($stmt === false) {
        die("Prepare failed: " . $conn->error);
    }

    $stmt->bind_param("sssi", $kd_obat, $tgl, $nama, $pcs);

    if ($stmt->execute()) {
        echo "Data berhasil ditambahkan!";
    } else {
        echo "Gagal menambahkan data: " . $stmt->error;
    }
  
    $stmt->close();
    $conn->close();
}

?>



<!DOCTYPE html>
<html lang="en">
<head>
	<title>Apotek</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<meta name="robots" content="noindex, follow">
 <link rel="stylesheet" 
          href=
"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<style> 
     .navbar-dark bg-succes {
            background-color: lightgreen;
           
        }
        .navbar{
            height: 50px;
             padding-top: 10px;
      padding-bottom: 10px;
    }
    .dropdown {
  position: relative;
  display: inline-block;
}
.transparent-button {
  background-color: transparent;
  color: inherit;       /* ikut warna teks induk */
  border: none;         /* hilangkan border */
  padding: 10px 20px;
  cursor: pointer;
}
.dua {
  position: fixed;
  top: 155px;
  left: 200px;

}
.tiga {
  position: fixed;
  top: 155px;
  left: 300px;

}
.empat {
  position: fixed;
  top: 157px;
  left: 380px;

}
.lima {
  position: fixed;
  top: 157px;
  left: 460px;

}
.enam {
  position: fixed;
  top: 157px;
  left: 550px;


  }
.tujuh {
  position: fixed;
  top: 157px;
  left: 720px;

}
.selamatdatang {
  position: fixed;
  top: 15px;
  right: 130px;
  }
 
.daftarpasien {
  position: fixed;
  margin-top: 20px;
  left: 110px;

}
.exit {
  position: fixed;
  top: 10px;
  right: 10px;

}
.textdaftarpasien {
  position: fixed;
  top: 5px;
  color: white;
}
.home {
  position: fixed;
   margin-top: 5px;
  left: 20px;
  }
  .hometext {
  position: fixed;
  top: 15px;
  color: white;
  }
  .h1title {
  position:fixed;
  top: 70px;
  left: 20px;
  background-color:transparent;
  text-decoration: none;
  background: 0.2s;
  color: green;
  box-sizing: border-box;
  }
   

  body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

.id{
  margin-right: 50px;
}
/* Set a style for all buttons */
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

.modal{
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  right: 30;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 100px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
.btnform {
     margin-left: 30px;
     margin-top: 80px;
  }
  .inputform {
    padding-top:15px;
    font-size:13px;
    width: 300px;
    }
.save{
  background-color: #008CBA;
  margin-top: 5px;
  width: 100px;
  height: 70px;
}
    .batal{
  background-color:rgb(179, 78, 71);
  margin-top: 15px;
  width: 100px;
  height: 70px;

 
    }
 
    .search{
      margin-left: 20px;
      margin-right: 900px;
    }
  
  .home {
  position: fixed;
   margin-top: 5px;
  left: 20px;
  }
  .hometext {
  position: fixed;
  top: 15px;
  color: white;
  }
</style>
<script>
   function closeFunction() {
  }
  </script>
<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
  }

</script>
</style>
<nav>
    <nav class="navbar navbar-dark bg-success">
      <div class="selamatdatang">
       <p style="color: white;">
        <?php
    echo "Selamat Datang, " . htmlspecialchars($_SESSION['username']);
       ?>
   </p>
</div>
      <div class="exit">
    <a href="http://localhost/simrs"><img src="/simrs/asset/images/icon/exit.png" height="30"></a>
      </div>
           <div class="home">
             <div class="hometext">
   <p><a href="../../modul/dasbor/"><img src="/simrs/asset/img/home.png" height="25"></a>  Home</p>
      </div>
        <div class="daftarpasien">
           <div class="textdaftarpasien">
   <p><a href="#"><img src="/simrs/asset/images/listpasien.png" height="50"></a>Pasien</p>
      </div>
    </nav>
 
</div>
</nav>
</head>
<body>
  <div>
  <h1 class="h1title">Apotek</h1>
</div>

<div class="btnform">
<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Buka Form</button>
</div>
<div id="id01" class="modal">
  <form class="modal-content animate" action="../../modul/apotek/index.php" method="post">
    <div class="container">
   <div class="inputform">
    
<div>

 <input type="text"  name="kd_obat"  placeholder="Kode Obat" required>
   </div>
 <input type="date"name="tgl" placeholder="tgl">
 <div>
  <input type="text"name="nama" placeholder="Nama Obat">
<input type="text"name="pcs" placeholder="Jml Obat">
   <div class="simpan">
<button class="simpan" name="simpan"><img src="../../asset/img/save.png" width="15">Simpan
</button>
   </div>
</form>
<form>
<button type="button" class="batal" onclick="document.getElementById('id01').style.display='none'">Batal
</button>
</body>
</html>

</div>
</div>
</div>
</div>
</div>
<div>
<div>
<div>

</form>
</div>
            </div>
  </div>                
<?php
// Membuka koneksi ke database
$conn = new mysqli("localhost", "root", "", "simrs");

// Memastikan koneksi berhasil
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query pertama
$result = $conn->query("SELECT * FROM obat");

// Jika perlu, simpan hasil query, baru setelah itu menutup koneksi
// Menutup koneksi setelah semua query selesai
$conn->close();

$conn = new mysqli("localhost", "root", "", "simrs");
$result2 = $conn->query("SELECT * FROM obat");
$conn->close();


?>



<!-- <div class="search">
<form method="GET" action="">
    <input type="text" name="keyword" placeholder="Masukkan Nama " required>
    <button type="submit">Cari</button> -->
</div>
<div style="overflow-x: auto;">
   <div class="table-scroll">
    <h2 class="mb-4">Tabel Data </h2>
    <table style="margin-bottom: 2px;">
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th>KODE OBAT</th>
                <th>TGL STOCK</th>
                 <th>NAMA OBAT</th>
                <th>PCS</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($result && $result->num_rows > 0): ?>
                <?php while($row = $result->fetch_assoc()): ?>
                    <tr>
                        <td><?= htmlspecialchars($row["kd_obat"]) ?></td>
                        <td><?= htmlspecialchars($row["tgl"]) ?></td>
                        <td><?= htmlspecialchars($row["nama"]) ?></td>
                         <td><?= htmlspecialchars($row["pcs"]) ?></td>
                    </tr>
                <?php endwhile; ?>
            <?php else: ?>
                <tr><td colspan="5" class="text-center">Data tidak ditemukan.</td></tr>
            <?php endif; ?>
        </tbody>
    </table>
</form>

<?php
if (isset($_GET['keyword'])) {
    $keyword = $_GET['keyword'];

    // Koneksi ke database
  include('../../config/koneksi.php');


    // Query pencarian (gunakan LIKE)
    $sql = "SELECT * FROM obat WHERE kd_obat";
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
    die("Prepare gagal: " . $conn->error);
    }
    $param = "%" . $keyword . "%";
    $stmt->bind_param("ss", $param, $param);
    $stmt->execute();
    $result = $stmt->get_result();

    // Tampilkan hasil pencarian
    if ($result->num_rows > 0) {
       while ($row = $result->fetch_assoc()) {
          // Cek apakah data baris cocok dengan keyword (untuk highlight)
          $highlight = '';
          if ($keyword != '') {
              // Cek apakah keyword ada di nm_pasien atau no_rkm_medis (case insensitive)
              if (stripos($row['kd_obat'], $keyword) !== false || stripos($row['nama'], $keyword) !== false) {
                  $highlight = 'highlight';
              }
          }
            echo "<tr class='{$highlight}'>
                    <td>{$row['kd_obat']}</td>
                    <td>{$row['tgl']}</td>
                     <td>{$row['nama']}</td>
                     <td>{$row['pcs']}</td>
                 </tr>";
        }
        echo "</table>";
    } else {
        echo "<p>Tidak ada data ditemukan.</p>";
    }

    $stmt->close();

}
?>
</div>
</div>






<tr>
<tr>
 
<footer style="margin-top: 40px;">
<div class="footer">
  <div class="tanggal">
<footer style="text-align: left ; margin-top: 7px;  color: white;">
  <span id="tanggal"></span>

  <script>
    const hari = ['Minggu','Senin','Selasa','Rabu','Kamis','Jumat','Sabtu'];
    const bulan = ['Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember'];

    const now = new Date();
    const hariIni = hari[now.getDay()];
    const tanggal = now.getDate();
    const bulanIni = bulan[now.getMonth()];
    const tahun = now.getFullYear();

    document.getElementById('tanggal').innerText = `Hari ini: ${hariIni}, ${tanggal} ${bulanIni} ${tahun}`;
  </script>
</footer>
</div>
</div>