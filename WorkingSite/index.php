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
        <script src="//cdn.jsdelivr.net/jdenticon/1.3.2/jdenticon.min.js" async></script>

    </head>

    <body>
<div class="container">
  <h1>Demo Applicatie</h1>
  <h3>Hostname: <?php echo gethostname(); ?></h3>
  <h4>IP-address: <?php echo $_SERVER['SERVER_ADDR']; ?></h4>
    <td>
     <?php
                        $url = "http://ipinfo.io/org";
                        $ch = curl_init();
                        // set URL and other appropriate options
                        curl_setopt($ch, CURLOPT_URL, $url);
                        curl_setopt($ch, CURLOPT_HEADER, 0);
                        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                        // grab URL and pass it to the browser
                        $org = curl_exec($ch);
			if (strpos($org, 'Cronos') !== false) {
			    echo "<img height='50px' src='images/org-cronos.png' />"; 
			}
			else if (strpos($org, 'Amazon') !== false) {
			    echo "<img height='50px' src='images/org-aws.png' />"; 
			}
			else if (strpos($org, 'Mobistar') !== false) {
			    echo "<img height='50px' src='images/org-orange.png' />"; 
			}
                        else {
			    echo $org;
                        }
                        // close curl resource, and free up system resources
                        curl_close($ch);
                ?>
    </td>
<form action="upload.php" method="post" enctype="multipart/form-data">
    Select image to upload:
<label>
    <input type="file" name="fileToUpload">
</label>
    <input type="submit" value="Upload Image" name="submit">
</form>
</div>
        	<tr>
          <canvas width="150" height="150" data-jdenticon-hash="<?php echo hash('sha256', gethostname()); ?>"></canvas> 
	</tr>

    </body>
</html>
