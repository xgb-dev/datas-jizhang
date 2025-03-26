<?php
// error_reporting(0);
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
  case 'login':
    $userName = $_REQUEST['userName'];
    $upass = $_REQUEST['upass'];

    $sql="SELECT * FROM `users` WHERE userName='$userName' AND upass='$upass'";

    $res = mysqli_query($conn, $sql);

    if($res->num_rows > 0){    

        echo json_encode(array('state'=> 0,msg=>'登录成功',role=>'系统管理员', roleType=>'1',uid=>'1',userName=>'zhu')); 

    } else {  

        echo json_encode(array('state'=> 1,msg=>'登录失败'));  

    }

    mysqli_close($conn);
    
    break;
}