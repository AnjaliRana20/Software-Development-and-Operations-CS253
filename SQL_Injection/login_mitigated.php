
<?php
require 'includes/connect.php';
if(isset($_SESSION['logged']))
{
    header('location: result_mitigated.php');
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>JEE Advanced Result Portal</title>
    <meta charset="utf-8">
    <meta name='viewport' content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <style>
        .center {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
    </style>
</head>
<body>
    <?php if(!isset($_GET['login_error'])) { ?>

    <?php } else { ?>
        <div>
            <center><h4><strong><?php echo $_GET['login_error']."!"; ?></strong></h4></center>
        </div>
    <?php } ?>
<center>
    <div class="center">
        <h4><strong>LOGIN</strong></h4>
        <p>
            <em>Login to check your result</em>
        </p>
        <form action="result_mitigated.php" method="post">
            <div>
                <input type="text" name="roll" placeholder="Roll Number" required="True" size="30" style="line-height: 25px">
            </div>
            <div>
                <br />
            </div>
            <div>
                <input type="text" name="password" placeholder="Password" required="True" size="30" style="line-height: 25px">
            </div>
            <div>
                <br />
            </div>
            <div>
                <input type="submit" value="Login">
            </div>
        </form>
    </div>
</center>
</body>
</html>