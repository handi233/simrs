<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
    include('../../config/koneksi.php'); 
}

// Cek apakah pengguna sudah login
if (!isset($_SESSION['username'])) {
    header('Location: http://localhost/simrs/');
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashboard</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="robots" content="noindex, follow" />
    <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
    <!-- Bootstrap & vendor CSS -->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css" />
    <link rel="stylesheet" href="vendor/animate/animate.css" />
    <link rel="stylesheet" href="vendor/css-hamburgers/hamburgers.min.css" />
    <link rel="stylesheet" href="vendor/animsition/css/animsition.min.css" />
    <link rel="stylesheet" href="vendor/select2/select2.min.css" />
    <link rel="stylesheet" href="vendor/daterangepicker/daterangepicker.css" />
    <link rel="stylesheet" href="css/util.css" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />

    <style>
        .navbar-dark.bg-success {
            background-color:#28a745 !important; /* Bootstrap green */
           opacity: 1; /* pastikan tidak transparan */
        }
        .navbar {
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
            color: inherit;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        /* Posisi fixed menu */
        .dua { position: fixed; top: 155px; left: 200px; }
        .tiga { position: fixed; top: 155px; left: 300px; }
        .empat { position: fixed; top: 157px; left: 400px; }
        .lima { position: fixed; top: 157px; left: 500px; }
        .enam { position: fixed; top: 157px; left: 600px; }
        .tujuh { position: fixed; top: 157px; left: 700px; }
        .delapan { position: fixed; top: 163px; left: 800px; }
        .sembilan { position: fixed; top: 163px; left: 900px; }
        .rad { position: fixed; top: 163px; left: 1050px; }
        .bill { position: fixed; top: 260px; left: 100px; }
        .dok { position: fixed; top: 260px; left: 200px; }
        .peg { position: fixed; top: 270px; left: 300px; }
        .cuti { position: fixed; top: 270px; left: 400px; }
        .selamatdatang {
            position: absolute;
            top: 15px;
            right: 130px;
            color: white!important;
            text-decoration: none;
        }
        .daftarpasien {
            position: absolute;
            top: 5px;
            left: 55px;
            color: white !important;
        }
        .exit {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .textdaftarpasien {
            color: white !important;
        }
        .h1title {
            margin-left: 20px;
            color: green;
            margin-top: 0;
            margin-bottom: 30px;
        }
        .footer {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: green;
            padding: 10px 20px;
            color: white;
        }
        
        .modul-link {
            text-decoration: none;
            color: inherit;
        }
        .modul-link strong {
            display: block;
            margin-top: 8px;
        }
        body {
    margin-bottom: 50px;
}
.modul-link,
.modul-link:visited,
.modul-link:hover,
.modul-link:active,
.modul-link:focus,
.modul-link strong {
    text-decoration: none !important;
    color: inherit;
}
.daftarpasien a {
    color: white !important;
    text-decoration: none !important;
}

.daftarpasien a:hover {
    color: white;
    text-decoration: none;
}


    </style>
</head>
<body>
<nav class="navbar navbar-dark bg-success">
    <div class="selamatdatang">
        <p>Selamat Datang, <?php echo htmlspecialchars($_SESSION['username']); ?></p>
        <form class="form-inline" method="GET" action="">
            <input class="form-control mr-sm-2" type="search" name="q" placeholder="Cari..." aria-label="Search" />
            <button class="btn btn-outline-light" type="submit">Cari</button>
        </form>
    </div>
    <div class="exit">
        <a href="http://localhost/simrs"><img src="/simrs/asset/images/icon/exit.png" height="30" alt="Keluar" /></a>
    </div>
    <div class="daftarpasien">
        <p><a href="http://localhost/simrs/modul/pasien/index.php"><img src="/simrs/asset/images/listpasien.png" height="50"  /> Pasien</a></p>
    </div>
</nav>

<?php
$search = isset($_GET['q']) ? strtolower(trim($_GET['q'])) : '';
?>

<h1 class="h1title">Daftar Menu</h1>

<div class="container">
    <div class="row">
        <?php
        $moduls = [
            ['nama' => 'Rawat Jalan', 'icon' => 'rawatjalan.png', 'url' => '/simrs/modul/rawat_jalan/index.php'],
            ['nama' => 'Rawat Inap', 'icon' => 'rawatinap.png', 'url' => '/simrs/modul/rawat_inap/index.php'],
            ['nama' => 'Apotek', 'icon' => 'apotek.png', 'url' => '/simrs/modul/apotek/index.php'],
            ['nama' => 'ICD 9', 'icon' => 'icd.png', 'url' => '/simrs/modul/icd9/index.php'],
            ['nama' => 'ICD 10', 'icon' => 'icd.png', 'url' => '/simrs/modul/icd10/index.php'],
            ['nama' => 'Periksa', 'icon' => 'pemeriksaan_ralan.png', 'url' => '/simrs/modul/periksa_ralan/index.php'],
            ['nama' => 'IGD', 'icon' => 'IGD.png', 'url' => '/simrs/modul/igd/index.php'],
            ['nama' => 'Satu Sehat', 'icon' => 'satusehat.png', 'url' => '/simrs/modul/satusehat/index.php'],
            ['nama' => 'Laboratorium', 'icon' => 'laborat.png', 'url' => '/simrs/modul/laboratorium/index.php'],
            ['nama' => 'Radiologi', 'icon' => 'rad.png', 'url' => '/simrs/modul/radiologi/index.php'],
            ['nama' => 'Biling', 'icon' => 'biling.png', 'url' => '/simrs/modul/biling/index.php'],
            ['nama' => 'Dokter', 'icon' => 'doctor.png', 'url' => '/simrs/modul/dokter/index.php'],
            ['nama' => 'Pegawai', 'icon' => 'pegawai.png', 'url' => '/simrs/modul/pegawai/index.php'],
            ['nama' => 'Pengajuan Cuti', 'icon' => 'pegawai.png', 'url' => '/simrs/modul/cuti/index.php'],
        ];

        $found = false;

        foreach ($moduls as $modul) {
            if ($search === '' || strpos(strtolower($modul['nama']), $search) !== false) {
                $found = true;
                echo '<div class="col-md-3 text-center mb-4">';
                echo '<a class="modul-link" href="' . $modul['url'] . '">';
                echo '<img src="/simrs/asset/images/' . $modul['icon'] . '" style="width:70px;" alt="' . htmlspecialchars($modul['nama']) . '" /><br>';
                echo '<strong>' . strtoupper(htmlspecialchars($modul['nama'])) . '</strong>';
                echo '</a>';
                echo '</div>';
            }
        }

        if (!$found) {
            echo '<div class="col-12 text-center">';
            echo '<p>Tidak ada modul yang cocok dengan pencarian "<strong>' . htmlspecialchars($search) . '</strong>"</p>';
            echo '</div>';
        }
        ?>
    </div>
</div>

<footer class="footer">
    <div class="tanggal">
        <span id="tanggal"></span>
    </div>
</footer>

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

</body>
</html>
