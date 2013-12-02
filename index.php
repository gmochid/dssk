<!DOCTYPE html>
<html>
	<head>
		<title>DSSK</title>
	</head>
	<body>
		<h2>Sistem Pendukung Keputusan</h2>
		<h4>Promosi Jabatan Karyawan</h4>
		<form action="session.php" method="post">
			<fieldset>
				<?php
					if(isset($_GET['error']))
						echo "<b>".$_GET['error']."</b>";
				?>
				<legend>LOGIN</legend>
				<input type="text" name="username" placeholder="Username" required><br>
				<input type="password" name="password" placeholder="Password" required><br>
				<input type="submit" value="Login">
			</fieldset>
		</form>
	</body>
</html>
