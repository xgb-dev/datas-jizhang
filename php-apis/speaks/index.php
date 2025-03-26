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
    $nickname = $_REQUEST['nickname'];
    $speak = $_REQUEST['speak'];
    
    $sql = "INSERT INTO speaks (nickname,speak) VALUES ('$nickname','$speak')";

    mysqli_query($conn, $sql);
    
    echo json_encode(array('state'=> 0,'msg'=>'添加成功'));

    mysqli_close($conn);

    break;

  case 'get':

    /*$limit = (int)$_GET['limit'];
    $skip = $_GET['skip'];*/
    $result = array();
    $res = mysqli_query($conn, "SELECT * FROM speaks");
    
    while ($row = mysqli_fetch_array($res)){
        $json_arr = array("id"=>$row[0],"name"=>$row[1],"speak"=>$row[2],"favor" => $row[3],"opposition"=>$row[4],"comment"=>$row[5]);
        array_push($result, $json_arr);        
    }

    echo json_encode($result);

    mysqli_close($conn);

    break;

  case 'updateop':

    $id = (int)$_GET['id'];
    $opposition = (int)$_GET['opposition'];

    $res = mysqli_query($conn, "UPDATE speaks SET opposition=$opposition WHERE id = {$id}");

    echo json_encode(array('state'=> 0,'msg'=>'成功'));

    mysqli_close($conn);

    break;

  case 'updatefa':

    $id = (int)$_GET['id'];

    $favor = (int)$_GET['favor'];

    $res = mysqli_query($conn, "UPDATE speaks SET favor=$favor WHERE id = {$id}");

    echo json_encode(array('state'=> 0,'msg'=>'成功'));

    mysqli_close($conn);

    break;


  case 'updatecomment':

    $id = (int)$_GET['id'];
    
    $comment = $_GET['comment'];

    $res = mysqli_query($conn, "UPDATE speaks SET comment='$comment' WHERE id = {$id}");

    echo json_encode(array('state'=> 0,'msg'=>'成功'));

    mysqli_close($conn);

    break;

}