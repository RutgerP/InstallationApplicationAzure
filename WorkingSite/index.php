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
        
        <!--[if lt IE 9]>
          <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
    </head>
    
    <body>
<div class="container">
  <h1>Demo Applicatie</h1>
  <p>Hostname: <?php echo gethostname(); ?></p>
  <p>IP-address: <?php require 'includes/getip.php'; ?></p>
  <p> NIEUW </p>	
</div>

<div class="container">
<form action="upload.php" method="post" enctype="multipart/form-data">
    Select image to upload:
    <input type="file" name="fileToUpload" id="fileToUpload">
    <input type="submit" value="Upload Image" name="submit">
</form>
</div>
	
          
    </body>
</html>
