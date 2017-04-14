<?php

#require 'includes/getip.php';


?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />

        <title>Demo Applicatie</title>

        <!-- Our CSS stylesheet file -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/main.css" />

          <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>

    <body>
<div class="container">
  <h1>Demo Applicatie</h1>
  <h3>Hostname: <?php echo gethostname(); ?></h3>
  <h4>IP-address: <?php require 'includes/getip.php'; ?></h4>

<form action="upload.php" method="post" enctype="multipart/form-data">
    Select image to upload:
<label>
    <input type="file" name="fileToUpload">
</label>
    <input type="submit" value="Upload Image" name="submit">
</form>
</div>

    </body>
</html>
