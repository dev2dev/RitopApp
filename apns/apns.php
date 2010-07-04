<html>
	<head>
		<title>Push Notification Tests</title>
		<style>
			body
			{
				background:-webkit-gradient(
    							 linear,
    							 left top,
    							 left bottom,
    							 color-stop(0, #637790),
    							 color-stop(1, #202A36)
				);
				background:-moz-linear-gradient(
    							 center top,
    							 #637790 0%,
    							 #202A36 100%
				);
			}
		</style>
	</head>
	<body>
		<center>
			<h1>Push Notification Tests</h1>
			<?php
				error_reporting(E_ALL | E_STRICT);
				include 'APNSBase.php';
				include 'APNotification.php';
				include 'APFeedback.php';

				try{
  				$notification = new APNotification("development");
  				$notification->setDeviceToken("c9a3ba8f bdb98a43 0d4c2f5e 260cf843 34252577 b17d84e8 d424bcea b32993fb");
  				$notification->setMessage($_POST["message"]);
  				$notification->setBadge((int)$_POST["badgeNumber"]);
  				$notification->setPrivateKey("certificate/apns-dev.pem");
 					$notification->setPrivateKeyPassphrase(""); 
  				$notification->send();
					echo "Message has been sent successfully.";
				}  catch(Exception $e){
  				echo $e->getLine().': '.$e->getMessage();
				}
			?>
			<br/><br/><a href="apns.html">zur&uuml;ck</a>
		</center>
	</body>
</html>