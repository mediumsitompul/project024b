<?php
include "conn3.php";

//$idx = 'CX002';
$idx = $_POST['idx'];

    if($idx != NULL) {
        $result2 = mysqli_query($connect,
        "
        insert into t_buy_now
        SELECT * FROM t_goods_list where idx='$idx'
        "
        );
        echo json_encode('success');
        }
?>
