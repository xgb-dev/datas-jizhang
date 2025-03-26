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
    $setdate = $_REQUEST['date'];
    $amount = (int)$_REQUEST['amount'];
    $remark = $_REQUEST['remark'];
    $text = $_REQUEST['text'];
    $type = $_REQUEST['type'];
    $y = (int)$_REQUEST['y'];
    $W = $_REQUEST['w'];
    $nickname = $_REQUEST['nickname'];
    $openid = $_REQUEST['openid'];
    $gender = (int)$_REQUEST['gender'];
    $city = $_REQUEST['city'];
    $icon = $_REQUEST['icon'];
    $title = $_REQUEST['title'];
    $t_city = $_REQUEST['t_city'];
    $t_person = $_REQUEST['t_person'];
    $payer = $_REQUEST['payer'];
    $date = $_REQUEST['c_time'];
    $pay_amount = (int)$_REQUEST['pay_amount'];

    $sql = "INSERT INTO `travel` (`title`,`t_city`,`t_person`,`date`,`setdate`,`payer`, `amount`,`pay_amount`, `remark`, `typetext`, `type`, `week`, `nickname`, `openid`, `gender`, `city`, `y`, `icon`) VALUES ('$title','$t_city','$t_person','$date','$setdate','$payer',$amount,$pay_amount,'$remark','$text','$type','$W','$nickname','$openid',$gender,'$city',$y,'$icon')";

    mysqli_query($conn, $sql);
    
    echo json_encode(array('state'=> 0, 'openid' => "$openid", 'date' => "$date", 'remark' => "$remark", 'nickname' => "$nickname",msg=>'添加成功'));

    mysqli_close($conn);
    
    break;

  case 'edit':

    $setdate = $_REQUEST['date'];
    $amount = (int)$_REQUEST['amount'];
    $remark = $_REQUEST['remark'];
    $text = $_REQUEST['text'];
    $type = $_REQUEST['type'];
    $y = (int)$_REQUEST['y'];
    $w = $_REQUEST['w'];
    $nickname = $_REQUEST['nickname'];
    $openid = $_REQUEST['openid'];
    $gender = (int)$_REQUEST['gender'];
    $city = $_REQUEST['city'];
    $icon = $_REQUEST['icon'];
    $title = $_REQUEST['title'];
    $t_city = $_REQUEST['t_city'];
    $t_person = $_REQUEST['t_person'];
    $payer = $_REQUEST['payer'];
    $date = $_REQUEST['c_time'];
    $pay_amount = (int)$_REQUEST['pay_amount'];
    $id = (int)$_REQUEST['id'];

    $sql = "UPDATE travel SET title = '$title', `t_city` = '$t_city',`t_person` = '$t_person',`date` = '$date', `setdate` = '$setdate', `payer` = '$payer',`amount`= $amount, `pay_amount` = $pay_amount,`remark` = '$remark',`icon` = '$icon' ,`typetext`='$text' ,`type`='$type',`week`='$w',`nickname`='$nickname',`openid`='$openid',`gender`=$gender,`city`='$city',`y`=$y WHERE `id` = $id";

    mysqli_query($conn, $sql);
    
    echo json_encode(array('state'=> 0, 'openid' => "$openid", 'date' => "$date", 'remarks' => "$remark", 'nickname' => "$nickname",msg=>'修改成功'));

    mysqli_close($conn);
    
    break;

  case 'get':
    $limit = (int)$_REQUEST['limit'];
    $skip = (int)$_REQUEST['skip'];
    $openid = $_REQUEST['openid'];
    $y = (int)$_REQUEST['y'];
    $title = $_REQUEST['title'];

    $result = array();
    if($limit > 0 && $skip >= 0 && $openid != ''){
        if(!empty($title)){
            $res = mysqli_query($conn, "SELECT * FROM `travel` WHERE `openid` = '$openid' AND `y` = $y AND `title`= '$title' ORDER BY `date` DESC LIMIT $skip,$limit");

            $amountall = mysqli_query($conn, "SELECT SUM(amount) AS amountin FROM `travel` WHERE `openid` = '$openid' AND `y` = $y AND `title`='$title'");
            $pay_amountall = mysqli_query($conn, "SELECT SUM(pay_amount) AS pay_amount FROM `travel` WHERE `openid` = '$openid' AND `y` = $y AND `title`='$title'");

        }else{

            $res = mysqli_query($conn, "SELECT * FROM `travel` WHERE `openid` = '$openid' AND `y` = $y ORDER BY `date` DESC");
            $checktitle = '';
            while ($row = mysqli_fetch_array($res)){
                $checktitle = $row[2];       
            }
        }

        

        
    }else if($openid != '') {
        $res = mysqli_query($conn, "SELECT * FROM travel WHERE openid = '$openid'");
    }

    $json_arr = array();
    $amountall_money = 0;
    $pay_amountall_money = 0;

    while ($row = mysqli_fetch_array($amountall)){
        $amountall_money = $row[0];        
    }
    while ($row = mysqli_fetch_array($pay_amountall)){
        $pay_amountall_money = $row[0];        
    }
    while ($row = mysqli_fetch_array($res)){
        $json_arr = array(
            "id"            => $row[0],
            "nickname"      => $row[1],
            "title"         => $row[2],
            "typetext"      => $row[3],
            "type"          => $row[4],
            "remark"        => $row[5],
            "amount"        => $row[6],
            "date"          => $row[7],
            "y"             => $row[8],
            "week"          => $row[9],
            "gender"        => $row[10],
            'city'          => $row[11],
            't_city'        => $row[12],
            't_person'      => $row[13],
            'pay_type'      => $row[14],
            'pay_amount'    => $row[15],
            'icon'          => $row[16],
            'openid'        => $row[17],
            'payer'         => $row[18],
            'setdate'       => $row[19]
        );
        array_push($result, $json_arr);        
    }

    $arr = array('list' => $result,'payment' => $amountall_money,'collect' => $pay_amountall_money,'t_person' => $result[13] );

    echo json_encode($arr);

    mysqli_close($conn);

    break;

    
  case 'getbyid':

    $id= (int)$_REQUEST['id'];

    $openid = $_REQUEST['openid'];

    $res = mysqli_query($conn, "SELECT * FROM travel WHERE id=$id AND openid='$openid'");

    while ($row = mysqli_fetch_array($res)){
        $json_arr = array(
            "id"            => $row[0],
            "nickname"      => $row[1],
            "title"         => $row[2],
            "typetext"      => $row[3],
            "type"          => $row[4],
            "remark"        => $row[5],
            "amount"        => $row[6],
            "date"          => $row[7],
            "y"             => $row[8],
            "week"          => $row[9],
            "gender"        => $row[10],
            'city'          => $row[11],
            't_city'        => $row[12],
            't_person'      => $row[13],
            'pay_type'      => $row[14],
            'pay_amount'    => $row[15],
            'icon'          => $row[16],
            'openid'        => $row[17],
            'payer'         => $row[18],
            'setdate'       => $row[19]
        );
    }
    mysqli_close($conn);

    echo json_encode($json_arr);

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

    break;

case 'getperson':

    $title = $_REQUEST['title'];

    $arr = mysqli_query($conn, "SELECT * FROM `travel` WHERE `title` = 'title' LIMIT 0,1");

    $person = null;

    while ($row = mysqli_fetch_array($arr)){

        $person = $row[13]; 

    }

    mysqli_close($conn);

    echo json_encode(array('state' => 0, 'title' => $title ,'person' => $person, 'msg' => 'ok'));
    
}