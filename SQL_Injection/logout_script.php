<?php
session_start();
if(!isset($_SESSION['logged']))
{
    header('location: login.php');
}
else {
    session_destroy();
    header('location: login.php');
}