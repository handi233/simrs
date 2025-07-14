 
<?php
session_start();
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
// Koneksi
$conn = new mysqli("localhost", "root", "", "simrs");

// Cek koneksi berhasil
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Contoh input dari form
$username = isset($_POST['username']) ? $_POST['username'] : '';

// Escape string hanya jika koneksi valid
if ($conn instanceof mysqli && $conn->ping()) {
    $username_safe = mysqli_real_escape_string($conn, $username);
} else {
    die("Koneksi tidak tersedia.");
}

?>
<style>
	.alert-danger{
	margin-left:100px;
	color: #f44336;
	font-family: Arial, sans-serif;
    font-size: 16px;
	border-radius: 4px;
    text-align: center;
    margin-right: 100px;

}


	</style>
	<style>
a:link, a:visited {
  background-color: #f44336;
  color: white;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin-top: 0px;
}

a:hover, a:active {
  background-color: red;
}
		</style>
        <style>
           
    .posisi-absolute {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        font-size: 24px;
        color: orange;
        text-align: center;
    }
</style>
  <?php


// Koneksi database
$conn = new mysqli("localhost", "root", "", "simrs");
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

$error = '';

// Proses login
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $password = $_POST['password'] ?? '';

    if (!empty($username) && !empty($password)) {
        $stmt = $conn->prepare("SELECT * FROM users WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result && $result->num_rows === 1) {
            $row = $result->fetch_assoc();

            // Verifikasi password yang sudah di-hash
            if (password_verify($password, $row['password'])) {
                $_SESSION['username'] = $row['username'];
                $_SESSION['user_id'] = $row['id'] ?? null;
                $_SESSION['role'] = $row['role'] ?? 'user';

                // Redirect ke dasbor
                header("Location: ../simrs/modul/dasbor/index.php");
                exit;
            } else {
                $error = "Password salah!";
            }
        } else {
            $error = "Username tidak ditemukan!";
        }

        $stmt->close();
    } else {
        $error = "Harap isi username dan password.";
    }
}

$conn->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login | SIMRS</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="asset/images/icons/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="asset/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="asset/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="asset/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <link rel="stylesheet" type="text/css" href="asset/vendor/animate/animate.css">
    <link rel="stylesheet" type="text/css" href="asset/vendor/css-hamburgers/hamburgers.min.css">
    <link rel="stylesheet" type="text/css" href="asset/vendor/animsition/css/animsition.min.css">
    <link rel="stylesheet" type="text/css" href="asset/vendor/select2/select2.min.css">
    <link rel="stylesheet" type="text/css" href="asset/vendor/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" type="text/css" href="asset/css/util.css">
    <link rel="stylesheet" type="text/css" href="asset/css/main.css">
    <meta name="robots" content="noindex, follow">

    <style>
        /* Alert style */
        .alert-danger {
            margin-top: 20px;
            margin-bottom: 20px;
            color: #f44336;
            font-family: Arial, sans-serif;
            font-size: 16px;
            border-radius: 4px;
            margin-right: 100x;
            background-color: #f8d7da;
            padding: 15px;
            width: 100%;
        }

        /* Optional additional style */
        .container-login100 {
            padding-top: 0; /* Give space to alert */
        }
    </style>

</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form" method="POST" action="">
                <?php if (!empty($error)): ?>
                    <div class="alert alert-danger" role="alert">
                        <?php echo htmlspecialchars($error); ?>
                    </div>
                <?php endif; ?>

                <span class="login100-form-title p-b-34">
                    Klinik Rawat Inap Arafah Husada
                    <p class="text-center justify">Jl. Nusa Dua, Kabupaten Kediri</p>
                </span>

                <div class="wrap-input100 rs1-wrap-input100 validate-input m-b-20" data-validate="Type user name">
                    <input id="first-name" class="input100" type="text" name="username" placeholder="nama pengguna" autofocus required>
                    <span class="focus-input100"></span>
                </div>
                <div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20" data-validate="Type password">
                    <input class="input100" type="password" name="password" placeholder="password" required>
                    <span class="focus-input100"></span>
                </div>

                <div class="container-login100-form-btn">
                    <button class="login100-form-btn" type="submit">
                        Masuk
                    </button>
                </div>

                <a href="../simrs/anjungan/loket">APAM(Antrian)</a>

                <div>
                    <p class="text text-center">V1.0 </p>
                </div>
            </form>

            <div class="login100-more" style="background-image: url('asset/images/wallpaper.jpg');"></div>
        </div>
    </div>
</div>

<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="vendor/animsition/js/animsition.min.js"></script>
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/select2/select2.min.js"></script>
<script>
    $(".selection-2").select2({
        minimumResultsForSearch: 20,
        dropdownParent: $('#dropDownSelect1')
    });
</script>
<script src="vendor/daterangepicker/moment.min.js"></script>
<script src="vendor/daterangepicker/daterangepicker.js"></script>
<script src="vendor/countdowntime/countdowntime.js"></script>
<script src="js/main.js"></script>

</body>
</html>