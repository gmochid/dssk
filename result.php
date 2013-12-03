<?php

require_once 'lib/database.php';

function cmp($a, $b)
{
    if ($a[9] == $b[9]) {
        return 0;
    }
    return ($a[9] > $b[9]) ? -1 : 1;
}

$link = new PDO(DATABASE_INFO, DATABASE_USERNAME, DATABASE_PASSWORD);

$sql = "SELECT 
			kepegawaian.nama, jabatan.tingkatan, jabatan.nama, penilaian.komunikasi, penilaian.inovasi, penilaian.leadership,
			penilaian.kerjasama, penilaian.finance, penilaian.programming
		FROM jabatan join kepegawaian join penilaian
		WHERE jabatan.jabatan_id = penilaian.jabatan_id AND kepegawaian.pegawai_id = penilaian.pegawai_id AND jabatan.parent = ?";
$stmt = $link->prepare($sql);

$stmt->execute(array($_POST['jabatan']));

$res = array();
while($row = $stmt->fetch()) {
	if($_POST['model'] == 1) {
		$row[9] = $row['komunikasi'] * $_POST['komunikasi'] + 
			$row['inovasi'] * $_POST['inovasi'] +
			$row['leadership'] * $_POST['leadership'] +
			$row['kerjasama'] * $_POST['kerjasama'] +
			$row['finance'] * (isset($_POST['finance']) ? $_POST['finance'] : 0) +
			$row['programming'] + (isset($_POST['programming']) ? $_POST['programming'] : 0);

		if(isset($_POST['finance']) && isset($_POST['programming'])) {
			$peny = ($_POST['komunikasi'] * 5) + 
				$_POST['inovasi'] * 5 + 
				$_POST['leadership'] * 5 + 
				$_POST['kerjasama'] * 5 + 
				$_POST['finance'] * 3 + 
				$_POST['programming'] * 3;
		} else if (isset($_POST['finance'])) {
			$peny = ($_POST['komunikasi'] * 5) + 
				$_POST['inovasi'] * 5 + 
				$_POST['leadership'] * 5 + 
				$_POST['kerjasama'] * 5 + 
				$_POST['finance'] * 3;
		} else {
			$peny = ($_POST['komunikasi'] * 5) + 
				$_POST['inovasi'] * 5 + 
				$_POST['leadership'] * 5 + 
				$_POST['kerjasama'] * 5 + 
				$_POST['programming'] * 3;
		}
	} else {
		$row[9] = pow($row['komunikasi'], $_POST['komunikasi']) * 
			pow($row['inovasi'], $_POST['inovasi']) *
			pow($row['leadership'], $_POST['leadership']) *
			pow($row['kerjasama'], $_POST['kerjasama']) *
			(!isset($_POST['finance']) ? 1 : (pow($row['finance'], $_POST['finance']) == 0 ? 1 : pow($row['finance'], $_POST['finance']))) *
			(!isset($_POST['programming']) ? 1 : (pow($row['programming'], $_POST['programming']) == 0 ? 1 : pow($row['programming'], $_POST['programming'])));

		if(isset($_POST['finance']) && isset($_POST['programming'])) {
			$peny = pow(5, $_POST['komunikasi']) *
				pow(5, $_POST['inovasi']) *
				pow(5, $_POST['leadership']) * 
				pow(5, $_POST['kerjasama']) * 
				pow(3, $_POST['finance']) *
				pow(3, $_POST['programming']);
		} else if (isset($_POST['finance'])) {
			$peny = pow(5, $_POST['komunikasi']) *
				pow(5, $_POST['inovasi']) *
				pow(5, $_POST['leadership']) * 
				pow(5, $_POST['kerjasama']) * 
				pow(3, $_POST['finance']);
		} else {
			$peny = pow(5, $_POST['komunikasi']) *
				pow(5, $_POST['inovasi']) *
				pow(5, $_POST['leadership']) * 
				pow(5, $_POST['kerjasama']) * 
				pow(3, $_POST['programming']);
		}
	}

	$row[9] /= $peny;
	
	$res[] = $row;
}

usort($res, 'cmp');

?>
<!DOCTYPE html>
<html>
	<head>
		<title>DSSK - Hasil</title>
	</head>
	<body>
		<h4>Hasil Rekomendasi Promosi Jabatan Karyawan</h4>
		<table border="1">
			<tr>
				<th>Nama Karyawan</th>
				<th>Jabatan</th>
				<th>Bobot</th>
				<th>Komunikasi</th>
				<th>Inovasi</th>
				<th>Leadership</th>
				<th>Teamwork</th>
				<th>Finance</th>
				<th>Programmer</th>
				<th>Nilai dari Model</th>
			</tr>
			<?php foreach($res as $row) { ?>
				<tr>
					<td><?php echo $row[0]; ?></td>
					<td><?php echo $row[1]; ?></td>
					<td><?php echo $row[2]; ?></td>
					<td><?php echo $row[3]; ?></td>
					<td><?php echo $row[4]; ?></td>
					<td><?php echo $row[5]; ?></td>
					<td><?php echo $row[6]; ?></td>
					<td><?php echo $row[7]; ?></td>
					<td><?php echo $row[8]; ?></td>
					<td><?php echo $row[9]; ?></td>
				</tr>
			<?php } ?>
		</table>
		<a href="jabatan.php">Start Again</a>
	</body>
</html>
