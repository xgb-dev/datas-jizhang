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
    $openid = $_REQUEST['openid'];
    $id = (int)$_REQUEST['id'];

    $result = mysql_query($conn , "SELECT * FROM sign WHERE user_id='$openid' AND id=$id");
    
	$timedate = array();
    while ($row = mysqli_fetch_array($result)){
        $timedate = array('num'=>$row[3]);       
    }
  	echo json_encode(array('state'=> $timedate, 'openid' => $openid, 'id' => $id));




    /*$num = mysql_num_rows($result);

    if($num == '0'){
    	// 不存在
      echo json_encode(array('state'=> 1, 'openid' => $openid, msg=>'添加成功'));



    }else{
    	// 存在
    	
    	// $sql = "UPDATE sign SET last_sign_time='$last_sign_time' WHERE user_id = '$openid'";
		while ($row = mysqli_fetch_array($result)){
	        $timedate = $row[3];       
	    }
      	echo json_encode(array('state'=> $timedate, 'openid' => $openid, 'id' => $id));
    }*/
}