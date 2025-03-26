<?php
error_reporting(0);
$dbhost = '118.25.102.123';  // mysql服务器主机地址
$dbuser = 'test';           // mysql用户名
$dbpass = '123456';               // mysql用户名密码
$conn = mysqli_connect($dbhost, $dbuser, $dbpass);
mysqli_select_db($conn,'test');
if( !$conn ) {
die('连接错误1: ' . mysqli_error());
}
mysqli_set_charset($conn,"utf8");
mysqli_query($conn, "SET NAMES 'utf8'");

// 设置header
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
header('Access-Control-Allow-Headers:x-requested-with,content-type');

$actions= $_REQUEST['act'];
switch($actions) {
  case 'get':
    $datatime = date('Y-m-d',time());

    $list_s = mysqli_query($conn, "SELECT count(_openid) FROM bill");
    $user_s =  mysqli_query($conn, "SELECT count(distinct(_openid)) FROM bill");

    $list_d_s = mysqli_query($conn, "SELECT count(_openid) FROM bill WHERE ff>'$datatime'");
    $user_d_s =  mysqli_query($conn, "SELECT count(distinct(_openid)) FROM bill WHERE ff>'$datatime'");

    $list_num = array();
    while ($row = mysqli_fetch_array($list_s)){
        $list_num = array("num" => $row[0]);       
    }
    $user_num = array();
    while ($row = mysqli_fetch_array($user_s)){
        $user_num = array("num" => $row[0]);        
    }

    $list_d_num = array();
    while ($row = mysqli_fetch_array($list_d_s)){
        $list_d_num = array("num" => $row[0]);       
    }
    $user_d_num = array();
    while ($row = mysqli_fetch_array($user_d_s)){
        $user_d_num = array("num" => $row[0]);        
    }

    echo json_encode(array('list'=>$list_num,'user'=>$user_num,'list_d'=>$list_d_num,'user_d'=>$user_d_num));
    // echo json_encode( array( 'list' => $datatime ) );

    mysqli_close($conn);

    break;
}

