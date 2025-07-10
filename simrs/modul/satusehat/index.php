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
	<title>SATU SEHAT</title>
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
.satu a, .dua a, .tiga a, .empat a {
  color: black !important;
  text-decoration: none !important;
}
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
.delapan {
  position: fixed;
  top: 163px;
  left: 800px;
}
.selamatdatang {
  position: fixed;
  top: 15px;
  right: 130px;
  }
.daftarpasien {
  position: fixed;
  top: 5px;
  left: 100px;

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
   .satu{
    position: fixed;
    margin-top: 50px;
    margin-left: 50px;
    color: black !important;
    text-decoration: none;
}
.dua{
    position: fixed;
    margin-top: -10;
    margin-left: 60px;
    color: black !important;
    text-decoration: none;
}
.tiga{
    position: fixed;
    margin-top: -10;
    margin-left: 130px;
    color: black !important;
    text-decoration: none;
}
.empat{
    position: fixed;
    margin-top: -10;
    margin-left: 210px;
    color: black !important;
    text-decoration: none;
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
       <div class="home">
             <div class="hometext">
   <p><a href="../../modul/dasbor/"><img src="/simrs/asset/img/home.png" height="25"></a>  Home</p>
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
<h1 class="h1title">SATU SEHAT</h1>
<div class="satu">
      <div class="row"> 
  <div class="col-md-4" >
    <div class="container">
      <p style="text-size: 12px;" class="md-3" >
      <a href="../../modul/satusehat/mapingdepartemen/index.php" >
        <img src="/simrs/asset/images/images/satusehat.png" style="width:39px">
        <div class="caption">
      <p style="left:8px;">MAPPING DEPARTEMEN</p>
        </div>
</div>
<div class="dua">
              <div class="row"> 
  <div class="col-md-4" >
    <div class="container">
      <p style="text-size: 12px;" class="md-3" >
      <a href="../../modul/satusehat/mapinglokasi/index.php">
        <img src="/simrs/asset/images/images/satusehat.png" style="width:39px">
        <div class="caption">
      <p style="left:8px;">MAPPING LOKASI </p>
        </div>
        <div class="tiga">
              <div class="row"> 
  <div class="col-md-4" >
    <div class="container">
      <p style="text-size: 12px;" class="md-3" >
      <a href="../../modul/satusehat/mapingpraktisi/index.php">
        <img src="/simrs/asset/images/images/satusehat.png" style="width:39px">
        <div class="caption">
            <div class="4">
      <p style="left:8px;">MAPPING PRAKTISI </p>
        </div>
        <div class="empat">
              <div class="row"> 
  <div class="col-md-4" >
    <div class="container">
      <p style="text-size: 12px;" class="md-3" >
      <a href="#">
        <img src="/simrs/asset/images/images/satusehat.png" style="width:39px">
        <div class="caption">
      <p style="">PERATURAN </p>
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

