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
  case 'add':
    $datetime = $_REQUEST['date'];
    $nickname = $_REQUEST['nickname'];
    $openid = $_REQUEST['openid'];
    $gender = (int)$_REQUEST['gender'];
    $city = $_REQUEST['city'];

    $name = $_REQUEST['name'];
    $numbers = $_REQUEST['numbers'];
    $address = $_REQUEST['address'];
    $phone = $_REQUEST['phone'];
    $bank = $_REQUEST['bank'];
    $banknumber = $_REQUEST['banknumber'];

    $sql = "INSERT INTO `invoice` ( `name`, `numbers`, `address`, `phone`, `bank`, `banknumber`, `datetime`, `nickname`, `openid`, `gender`, `city` ) VALUES ( '$name', '$numbers', '$address', '$phone', '$bank', '$banknumber', '$datetime', '$nickname', '$openid', $gender, '$city' )";

    mysqli_query($conn, $sql);
    
    echo json_encode(array('state'=> 0, 'openid' => $openid, 'date' => $datetime, 'nickname' => $nickname , msg=>'添加成功'));
    mysqli_close($conn);
    
    break;

  case 'update':
    $datetime = $_REQUEST['date'];
    $nickname = $_REQUEST['nickname'];
    $openid = $_REQUEST['openid'];
    $gender = (int)$_REQUEST['gender'];
    $city = $_REQUEST['city'];

    $name = $_REQUEST['name'];
    $numbers = $_REQUEST['numbers'];
    $address = $_REQUEST['address'];
    $phone = $_REQUEST['phone'];
    $bank = $_REQUEST['bank'];
    $banknumber = $_REQUEST['banknumber'];
    $id = (int)$_REQUEST['id'];

    $sql = "UPDATE `invoice` SET 
        `name` = '$name',
        `numbers` = '$numbers',
        `address` = '$address',
        `phone` = '$phone',
        `bank` = '$bank',
        `banknumber` = '$banknumber',
        `datetime` = '$datetime',
        `nickname` = '$nickname',
        `openid` = '$openid',
        `gender` = $gender,
        `city` = '$city' WHERE id = {$id}";

    mysqli_query($conn, $sql);
    
    echo json_encode(array('state'=> 0, 'openid' => "$openid", 'date' => "$datetime",  'nickname' => "$nickname",msg=>'修改成功'));

    mysqli_close($conn);
    
    break;

  case 'get':
    $limit = (int)$_REQUEST['limit'];
    $skip = (int)$_REQUEST['skip'];
    $openid = $_REQUEST['openid'];

    $result = array();
    $res = mysqli_query($conn, "SELECT * FROM `invoice` WHERE `openid` = '$openid' ORDER BY `datetime`");  
    

    $json_arr = array();
    while ($row = mysqli_fetch_array($res)){

        $json_arr = array(
            "id"            => $row[0],
            "nickname"      => $row[1],
            "gender"        => $row[2],
            "city"          => $row[3],
            "name"          => $row[4],
            "numbers"       => $row[5],
            "address"       => $row[6],
            "phone"         => $row[7],
            "bank"          => $row[8],
            "banknumber"    => $row[9],
            "openid"        => $row[10],
            'datetime'      => $row[11],
        );
        array_push($result, $json_arr);        
    }

    echo json_encode($result);

    mysqli_close($conn);

    break;
case 'getbyid':
    $openid = $_REQUEST['openid'];
    $id = (int)$_REQUEST['id'];


    $result = array();
    if($openid != '' && $id!=''){
        $res = mysqli_query($conn, "SELECT * FROM `invoice` WHERE `openid` = '$openid' AND `id`=$id ");        
    }

    $json_arr = array();
    while ($row = mysqli_fetch_array($res)){

        $json_arr = array(
            "id"            => $row[0],
            "nickname"      => $row[1],
            "gender"        => $row[2],
            "city"          => $row[3],
            "name"          => $row[4],
            "numbers"       => $row[5],
            "address"       => $row[6],
            "phone"         => $row[7],
            "bank"          => $row[8],
            "banknumber"    => $row[9],
            "openid"        => $row[10],
            'datetime'      => $row[11],
        );       
    }

    echo json_encode($json_arr);

    mysqli_close($conn);

    break;

  case 'delete':
    /*session_start();

    echo $_SESSION["username"];

    echo $_SESSION["uid"];*/

    $id=(int)$_REQUEST['id'];

    $sql="DELETE FROM `bill` WHERE id={$id}";// daozhe

    mysqli_query($conn, $sql);

    mysqli_close($conn);

    echo json_encode(array('state' => 0, 'msg' => 'ok'));
    
}