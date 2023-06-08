<?php
include "conn3.php";

//$idx = 'CX002';
$lat = $_POST['lat'];
$lng = $_POST['lng'];





    if($lat != NULL) {
        $result2 = mysqli_query($connect,
        "
        insert into t_latlng
        (lat, lng) values ('$lat', '$lng')
        "
        );
        echo json_encode('success');
        }
?>
