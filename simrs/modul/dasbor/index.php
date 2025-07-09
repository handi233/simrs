<?php

if (session_status() == PHP_SESSION_NONE) {
    session_start();
   include('../../config/koneksi.php'); 
}
// Cek apakah pengguna sudah login



// Cek apakah pengguna sudah login
if (!isset($_SESSION['username'])) {
    // Jika belum login, redirect ke halaman login
    header('Location: http://localhost/simrs/');
    exit();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Dasboard</title>
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
  left: 400px;

}
.lima {
  position: fixed;
  top: 157px;
  left: 500px;

}
.enam {
  position: fixed;
  top: 157px;
  left: 600px;


  }
.tujuh {
  position: fixed;
  top: 157px;
  left: 700px;

   }
.delapan {
  position: fixed;
  top: 163px;
  left: 800px;
}
.sembilan {
  position: fixed;
  top: 163px;
  left: 900px;
}
  .rad {
  position: fixed;
  top: 163px;
  left: 1050px;
}
.bill {
  position: fixed;
  top: 260px;
  left: 100px;
}
.dok {
  position: fixed;
  top: 260px;
  left: 200px;
}

.peg {
  position: fixed;
  top: 270px;
  left: 300px;
}
.cuti {
  position: fixed;
  top: 270px;
  left: 400px;
}

.selamatdatang {
  position: fixed;
  top: 15px;
  right: 130px;
  }
.daftarpasien {
  position: fixed;
  top: 5px;
  left: 55px;

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
.h1title{
    margin-left: 20px;
    color: green;
    margin-top: fixed;
    
}
.footer{
    position: fixed;
    top: 550px;
    bottom: none;
    left: 0;
    width: 100%;
    background-color: green;
    border-top: 0 solid #ccc;
    padding: 0;
    
}

</style>
<nav>
    <nav class="navbar navbar-dark bg-success">
      <div class="selamatdatang">
       <p style="color: white;"><?php echo "Selamat Datang, " . htmlspecialchars($_SESSION['username']); ?> </p>
</div>
      <div class="exit">
    <a href="http://localhost/simrs"><img src="/simrs/asset/images/icon/exit.png" height="30"></a>
      </div>
        <div class="daftarpasien">
           <div class="textdaftarpasien">
   <p><a href="http://localhost/simrs/modul/pasien/index.php"><img src="/simrs/asset/images/listpasien.png" height="50"></a>Pasien</p>
      </div>
    </nav>
 
</div>
</nav>
</head>
<body>
<h1 class="h1title">Daftar Menu</h1>
<div class="container">
<div class="row">
  <div class="col-md-4">
    <div class="container">
      <p style="text-size: 12px;" class="mt-4">
      <a href="/simrs/modul/rawat_jalan/index.php">
        <img src="/simrs/asset/images/rawatjalan.png" style="width:20%">
        <div class="caption">
       RAWAT JALAN</p>
    </div>
   <div class="dua">
    <div class="row"> 
  <div class="col-md-4" >
    <div class="container">
      <p style="text-size: 12px;" class="md-4" >
      <a href="../../modul/rawat_inap/index.php">
        <img src="/simrs/asset/images/rawatinap.png" style="width:30%">
        <div class="caption">
     RAWAT INAP</p>
        </div>
         <div class="tiga">
    <div class="row"> 
  <div class="col-md-4" >
    <div class="container">
      <p style="text-size: 12px;" class="md-4" >
      <a href="../../modul/apotek/index.php">
        <img src="/simrs/asset/images/apotek.png" style="width:30%">
        <div class="caption">
      APOTEK</p>
        </div>
        <div class="empat">
         <div class="row"> 
  <div class="col-md-4" >
    <div class="container">
      <p style="text-size: 12px;" class="md-4" >
      <a href="../../modul/icd9/index.php">
        <img src="/simrs/asset/images/icd.png" style="width:30%">
        <div class="caption">
       ICD 9</p>
        </div>
        <div class="lima">
         <div class="row"> 
  <div class="col-md-4" >
    <div class="container">
      <p style="text-size: 12px;" class="md-4" >
      <a href="../../modul/icd10/index.php">
        <img src="/simrs/asset/images/icd.png" style="width:30%">
        <div class="caption">
       ICD 10</p>
        </div>
         <div class="enam">
         <div class="row"> 
  <div class="col-md-4" >
    <div class="container">
      <p style="text-size: 12px;" class="md-4" >
      <a href="../../modul/periksa_ralan/index.php">
        <img src="/simrs/asset/images/pemeriksaan_ralan.png" style="width:30%">
        <div class="caption">
     PERIKSA</p>
        </div>
           <div class="tujuh">
         <div class="row"> 
  <div class="col-md-4" >
    <div class="container">
      <p style="text-size: 12px;" class="md-4" >
      <a href="/simrs/modul/igd/index.php">
        <img src="/simrs/asset/images/IGD.png" style="width:30%">
        <div class="caption">
      <p style="left:10px;">IGD</p>
        </div>
    <div class="delapan">
         <div class="row"> 
  <div class="col-md-4" >
    <div class="container">
      <p style="text-size: 12px;" class="md-3" >
      <a href="/simrs/modul/satusehat/index.php">
        <img src="/simrs/asset/images/images/satusehat.png" style="width:39px">
        <div class="caption">
      <p style="left:8px;">SATU SEHAT </p>
        </div>
           <div class="sembilan">
         <div class="row"> 
  <div class="col-md-4" >
    <div class="container">
      <p style="text-size: 12px;" class="md-3" >
      <a href="/simrs/modul/laboratorium/index.php">
        <img src="/simrs/asset/images/laborat.png" style="width:39px">
        <div class="caption">
      <p style="left:8px;">LABORATORIUM</p>
        </div>
             <div class="rad">
         <div class="row"> 
  <div class="col-md-4" >
    <div class="container">
      <p style="text-size: 12px;" class="md-3" >
      <a href="/simrs/modul/radiologi/index.php">
        <img src="/simrs/asset/images/rad.png" style="width:39px">
        <div class="caption">
      <p style="left:8px;">RADIOLOGI</p>
        </div>
           <div class="bill">
         <div class="row"> 
  <div class="col-md-4" >
    <div class="container">
      <p style="text-size: 12px;" class="md-3" >
      <a href="/simrs/modul/biling/index.php">
        <img src="/simrs/asset/images/biling.png" style="width:39px">
        <div class="caption">
      <p style="left:8px;">BILING</p>
        </div>
           <div class="dok">
         <div class="row"> 
  <div class="col-md-4" >
    <div class="container">
      <p style="text-size: 12px;" class="md-3" >
      <a href="/simrs/modul/dokter/index.php">
        <img src="/simrs/asset/images/doctor.png" style="width:39px">
        <div class="caption">
      <p style="left:8px;">DOKTER</p>
        </div>
             <div class="peg">
         <div class="row"> 
  <div class="col-md-4" >
    <div class="container">
      <p style="text-size: 12px;" class="md-3" >
      <a href="/simrs/modul/pegawai/index.php">
        <img src="/simrs/asset/images/pegawai.png" style="width:39px">
        <div class="caption">
      <p style="left:8px;">PEGAWAI</p>
        </div>
               <div class="cuti">
         <div class="row"> 
  <div class="col-md-4" >
    <div class="container">
      <p style="text-size: 12px;" class="md-3" >
      <a href="/simrs/modul/cuti/index.php">
        <img src="/simrs/asset/images/pegawai.png" style="width:39px">
        <div class="caption">
      <p style="left:8px;">PENGAJUAN CUTI</p>
        </div>

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
	
</body>

</html>

