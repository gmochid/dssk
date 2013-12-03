<!DOCTYPE html>
<html>
	<head>
		<title>DSSK - Pilih Model</title>
	</head>
	<body>
		<h4>Pilih Model dan Berikan Bobot di setiap Kriteria Penilaian</h4>
		<form method="post" action="result.php">
		<input type="hidden" value='<?php echo $_POST["jabatan"]; ?>' name='jabatan'>
			<fieldset>
				<legend>Model</legend>
				<select name="model">
					<option value="1">Model SAW</option>
					<option value="2">Model WP</option>
				</select>
			</fieldset>
			<fieldset>
				<legend>Bobot</legend>
				<fieldset>
					<legend>Softskill</legend>
					Komunikasi<br>
					<input type="text" name="komunikasi" placeholder="1-10"><br>
					Inovasi<br>
					<input type="text" name="inovasi" placeholder="1-10"><br>
					Leadership<br>
					<input type="text" name="leadership" placeholder="1-10"><br>
					Kerjasama<br>
					<input type="text" name="kerjasama" placeholder="1-10"><br>
				</fieldset>
				<fieldset>
					<legend>Hardskill</legend>
					<?php if(($_POST['jabatan'] == 1) || ($_POST['jabatan'] == 3)) { ?>
						Finance<br>
						<input type="text" name="finance" placeholder="1-10"><br>
					<?php } ?>
					<?php if(($_POST['jabatan'] == 1) || ($_POST['jabatan'] == 2)) { ?>
						Programming<br>
						<input type="text" name="programming" placeholder="1-10"><br>
					<?php } ?>
				</fieldset>
			</fieldset>
			<input type="submit" value="Next">
		</form>
		<a href="jabatan.php">Back</a>
	</body>
</html>
