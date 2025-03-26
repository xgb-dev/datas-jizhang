<?php
error_reporting(0);
$dbhost = '118.25.102.123';  // mysql服务器主机地址
$dbuser = 'edit';           // mysql用户名
$dbpass = '5%XmwH$nJFor';               // mysql用户名密码
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
    $openid = $_REQUEST['openid'];
    $formid = $_REQUEST['formid'];
    $text = urldecode($_REQUEST['text']);
    $name = urldecode($_REQUEST['nickname']);
    $city = urldecode($_REQUEST['city']);
    $gender = urldecode($_REQUEST['gender']);

    $text = str_replace("\n", "", $text);
    $name = str_replace("\n", "", $name);

    $time = $_REQUEST['date'];
    if($formid =='the formId is a mock one'){
        echo json_encode(array('state'=> 1, 'openid' => "$openid", 'date' => "$time", 'form_id' => "$formid", 'nickname' => "$name", msg => '无效form_id'));
    }else{
        $sql = "INSERT INTO `formid` (`_openid`,`date`,`_id`,`form_id`,`text`,`nickname`,`city`,`gender`) VALUES ('$openid','$time','', '$formid', '$text', '$name', '$city', '$gender')";

        mysqli_query($conn, $sql);

        echo json_encode(array('state'=> 0, 'openid' => "$openid", 'date' => "$time", 'form_id' => "$formid", 'nickname' => "$name",msg=>'添加成功'));
    
    }

    mysqli_close($conn);
    
    
    break;
  case 'get':
    $limit = (int)$_GET['limit'];
    $result = array();
    if($limit){
        $res = mysqli_query($conn, "SELECT * FROM formid LIMIT $limit");
    }else {
        $res = mysqli_query($conn, "SELECT * FROM formid");
    }

    $json_arr = array();
    while ($row = mysqli_fetch_array($res)){
        $json_arr = array("openid" => $row[0],"date"=>$row[1],"id"=>$row[2],"formid"=>$row[3],"text" => $row[4],"nickname" => $row[5],"city" => $row[6],"gender" => $row[7], "sent" => $row[8], "senttime" => $row[9]);
        array_push($result, $json_arr);        
    }

    echo json_encode($result);

    mysqli_close($conn);

    break;

  case 'delete':
    /*session_start();

    echo $_SESSION["username"];

    echo $_SESSION["uid"];*/

    $formid=$_REQUEST['formid'];
    $openid=$_REQUEST['openid'];

    $sql="DELETE FROM `formid` WHERE `form_id`='$formid' AND `_openid`= '$openid'";// daozhe

    mysqli_query($conn, $sql);

    echo json_encode(array('state' => 0, 'msg' => 'ok'));

    mysqli_close($conn);

    break;
}

