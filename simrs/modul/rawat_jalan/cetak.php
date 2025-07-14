<!DOCTYPE html>
<html>
<head>
	<title>PRINT DATA PASIEN RAWAT JALAN</title>
</head>
<body>
 
	<center>
 <h3>Print Pasien Rawat Jalan</h3>
 
	</center>
 
<?php 
	$conn = mysqli_connect('localhost','root','','simrs');
	?>
 
	<table border="1" style="width: 100%">
		<tr>
			<th width="1%">No Rawat</th>
			<th>No RM</th>
			<th>Tgl Periksa</th>
			<th width="5%">Jam Periksa</th>
      	<th>Jam Periksa</th>
        	<th>Nama Dokter</th>
          	<th>Bayar</th>
            	
		</tr>
		<?php 
		$sql = mysqli_query($conn,"select * from rajal");
		while($data = mysqli_fetch_array($sql)){
		?>
		<tr>
			<td><?php echo $data['no_rawat']; ?></td>
			<td><?php echo $data['no_rkm_medis']; ?></td>
			<td><?php echo $data['tgl_periksa']; ?></td>
      <td><?php echo $data['jam_periksa']; ?></td>
      <td><?php echo $data['nama_dokter']; ?></td>
      <td><?php echo $data['nama_pj']; ?></td>
      <td><?php echo $data['nama_stts']; ?></td>
      
		</tr>
		<?php 
		}
		?>
	</table>
 
	<script>
		window.print();
	</script>
 

</body>
</html>