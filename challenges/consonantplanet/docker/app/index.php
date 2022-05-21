<html>
    <head>
    <link rel="stylesheet" href="https://cdn.rawgit.com/Chalarangelo/mini.css/v3.0.1/dist/mini-default.min.css">
    </head>
    <body style="padding: 50px; background-color: #ffffff; background-image: url('background.jpg'); background-size: cover;">
    <div style="width:150px; margin:0 auto;">
      <img src="logo.png" style="width:150px;"></img>
    </div>
    <div style="width:500px; margin:0 auto; text-align:center">
    <br/><br/><h4>Th ltmt pg fr ths wtht vwls!</h4>
    </div>

<?php
if (isset($_GET['name'])) {
    $name = $_GET['name'];
	if (!preg_match('/[;\'aeiouAEIOU.]/is', $name) && strlen($name < 12)) {
        eval('$result = "' . $name . '";');
        if ($result === 'Apollo') {
            print('<form action="#" style="width:480px; margin:0 auto;">');
            print('Cngrts, hr\'s yr flg:<br/>' . htmlspecialchars(file_get_contents('/etc/flag.txt', true)));
            print('</form>');
        } else {
            print('<form action="#" style="width:480px; margin:0 auto;">');
            print('Hl wrld, ' . $result . '!');
            print('</form>');
        }
	} else {
        print('<form action="#" style="width:480px; margin:0 auto;">');
        print('f0rb1dd3n');
        print('</form>');
    }
} else {
?>
<br/>
<form action="/" method="GET" style="width:480px; margin:0 auto;">
&nbsp;&nbsp;ntr yr nm + psh th bttn<br/>  
    <input type="text" name="name" placeholder="Cptn Krk"></input>
    <input type="submit" value="Sbmt!"></input>
</form>
<?php	
}
?>

</body>
</html>