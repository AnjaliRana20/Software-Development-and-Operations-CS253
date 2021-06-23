
<?php
require 'includes/connect.php';
$roll = mysqli_real_escape_string($con, $_POST['roll']);
$password = mysqli_real_escape_string($con, $_POST['password']);
echo $roll . " " . $password;
$select_query = "SELECT * FROM results WHERE roll='$roll' AND password='$password'";
$select_query_result = mysqli_query($con , $select_query);
$num_rows = mysqli_num_rows($select_query_result);
if(!$num_rows)
{   
    //echo $num_rows . " " . $roll . " " . $password;
    header("location: login_mitigated.php?login_error=Wrong Roll Number or password");
}
else {
    $_SESSION['logged'] = 1;
    //echo $row['marks'];
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
            table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 15px;
        }
    </style>
</head>
<body>
    <div class="center">
        <table>
            <caption><strong>JEE ADVANCED 2021 RESULT<br><br></strong></caption>
            <tbody>
                <tr>
                    <th>Roll number</th>
                    <th>Name</th>
                    <th>Marks (out of 400)</th>
                    <th>Rank</th>
                </tr>
        <?php   while($row = mysqli_fetch_array($select_query_result)) { ?>
                <tr>
                    <td><?php echo $row['roll']; ?>  </td>
                    <td><?php echo $row['name']; ?></td>
                    <td><?php echo $row['marks']; ?></td>
                    <td><?php echo $row['rank']; ?></td>
                </tr>
        <?php } ?>
            </tbody>
        </table>
        <div>
            <br>
        </div>
        <center>
        <form action="logout_script_mitigated.php">
            <div>
                <input type="submit" value="Logout">
            </div>
        </form>
        </center>
    </div>
</body>
</html>
<?php } ?>