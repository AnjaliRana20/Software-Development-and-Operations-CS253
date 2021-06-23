<?php
session_start();
if(!isset($_SESSION['logged']))
{
    header('location: login_mitigated.php');
}
else {
    session_destroy();
    header('location: login_mitigated.php');
}