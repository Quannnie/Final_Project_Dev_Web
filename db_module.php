<?php
require_once "config.php";


function taoKetNoi(&$link)
{
    $link = mysqli_connect(HOST, USER, PASSWORD, DB);
	mysqli_set_charset($link, 'UTF8');
    if (mysqli_connect_errno()) {
        echo "Lỗi kết nối đến máy chủ: " . mysqli_connect_error();
        exit();
    }
}

function chayTruyVanTraVeDL($link, $q)
{
    $result = mysqli_query($link, $q);
    return $result;
}

function chayTruyVanKhongTraVeDL($link, $q)
{
    $result = mysqli_query($link, $q);
    return $result;
}

function giaiPhongBoNho($link, $result)
{
    try {
        mysqli_free_result($result);
        mysqli_close($link);
    } catch (TypeError $e) {
    }
}
?>
