<?php
// error_reporting(0);
//Phpinfo();
$dbhost = '127.0.0.1'//'122.51.255.60';  // mysql服务器主机地址
$dbuser = 'root';           // mysql用户名
$dbpass = 'zhuZHU1989~!@';               // mysql用户名密码
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

    $date = $_REQUEST['date'];
    $amount = $_REQUEST['amount'];
    $remarks = $_REQUEST['remarks'];
    $text = $_REQUEST['text'];
    $type = $_REQUEST['type'];
    $W = $_REQUEST['w'];
    $M_W = $_REQUEST['m_w'];
    $nickname = $_REQUEST['nickname'];
    $openid = $_REQUEST['openid'];
    $gender = $_REQUEST['gender'];
    $city = $_REQUEST['city'];

    $y = $_REQUEST['y'];
    $m = $_REQUEST['m'];
    $d = $_REQUEST['d'];
    $icon = $_REQUEST['icon'];
    $allamount = $_REQUEST['allamount'];
    $payall = $_REQUEST['payall'];
    $t = date("Y-m-d H:i:s",time());
    $paytype = $_REQUEST['paytype'];
    
    $sql = "INSERT INTO `bill`(`date`,`amount`,`remarks`,`text`,`type`,`w`,`m_w`,`nickname`,`_openid`,`gender`,`city`,`y`,`m`,`d`,`icon`,`allamount`,`payall`,`ff`,`paytype`) VALUES ('$date',$amount,'$remarks','$text','$type','$W','$M_W','$nickname','$openid',$gender,'$city','$y','$m','$d','$icon','$allamount','$payall','$t','$paytype')";
    
    

    mysqli_query($conn, $sql);
    
    echo json_encode(array('state'=> 0, 'openid' => "$openid", 'date' => "$date", 'remarks' => "$remarks", 'nickname' => "$t",'msg'=>'添加成功'));

    mysqli_close($conn);

    
    break;

  case 'edit':

    $date = $_REQUEST['date'];
    $amount = $_REQUEST['amount'];
    $remarks = $_REQUEST['remarks'];
    $text = $_REQUEST['text'];
    $type = $_REQUEST['type'];
    $W = $_REQUEST['w'];
    $M_W = $_REQUEST['m_w'];
    $nickname = $_REQUEST['nickname'];
    $openid = $_REQUEST['openid'];
    $gender = $_REQUEST['gender'];
    $city = $_REQUEST['city'];
    $id = $_REQUEST['id'];

    $y = $_REQUEST['y'];
    $m = $_REQUEST['m'];
    $d = $_REQUEST['d'];
    $icon = $_REQUEST['icon'];
    $allamount = $_REQUEST['allamount'];
    $payall = $_REQUEST['payall'];
    $hisprice = $_REQUEST['hisprice'];
    $payment = $_REQUEST['payment'];
    $paytype = $_REQUEST['paytype'];

    $sql = "UPDATE bill SET hisprice='$hisprice',payment='$payment', allamount='$allamount',payall='$payall',nickname='$nickname', `date` = '$date', amount = '$amount',remarks = '$remarks',text = '$text', type = '$type', w = '$W',m_w= '$M_W', m = '$m',d = '$d',icon = '$icon' ,paytype='$paytype' WHERE id = {$id}";
    

    mysqli_query($conn, $sql);
    
    echo json_encode(array('state'=> 0, 'openid' => "$openid", 'date' => "$date", 'remarks' => "$remarks", 'nickname' => "$nickname",msg=>'添加成功'));

    mysqli_close($conn);
    
    break;

  case 'ispay':
    $openid = $_REQUEST['openid'];
    $id = $_REQUEST['id'];

    $payment = $_REQUEST['checked'];
    $hisprice = $_REQUEST['hisamount'];
    $amount = $_REQUEST['amount'];

    $sql = "UPDATE bill SET payment = 1,hisprice='$hisprice',amount=$amount WHERE id = {$id} AND _openid = '$openid'";

    mysqli_query($conn, $sql);
    
    echo json_encode(array('state'=> 0, 'openid' => "$openid", 'msg'=>'修改成功','hisprice'=>$hisprice,'amount'=>$amount,'payment'=>1));

    mysqli_close($conn);
    
    break;

  case 'getfirst':
    $result = array();
    session_start();

    echo $_SESSION["username"];

    echo $_SESSION["uid"];

    $res = mysqli_query($conn, 'SELECT * FROM art_list ORDER BY id DESC LIMIT 1');
    $json_arr = array();
    while ($row = mysqli_fetch_array($res)){
        $json_arr = array("id" => (int)$row[0],"art_title"=>$row[1],"art_info"=>$row[2],"add_time"=>$row[3]);
        array_push($result, $json_arr);        
    }

    echo json_encode($result);

    mysqli_close($conn);

    break;

  case 'getById':
    $openid = $_GET['openid'];
    $id = (int)$_GET['id'];
    $result = array();

    $res = mysqli_query($conn, "SELECT * FROM bill WHERE _openid = '$openid' AND id = $id");

    $json_arr = array();

    while ($row = mysqli_fetch_array($res)){
        $json_arr = array("id"=>$row[0],"openid" => $row[1],"text"=>$row[2],"type"=>$row[3],"remarks"=>$row[4],"amount" => $row[5],"date"=> $row[6],"week"=> $row[7],"m_w"=> $row[8],"nickname"=> $row[9],"gender"=> $row[10],'city'=>$row[11],'y'=>$row[12],'m'=>$row[13],'d'=>$row[14],'icon'=>$row[15],'allamount'=>$row[16],'payall'=>$row[17],'pater'=>$row[18],'hisprice'=>$row[19],'payment'=>$row[20],'ff'=>$row[21],'paytype'=>$row[22]);    
    }

    echo json_encode($json_arr);

    mysqli_close($conn);

    break;

  case 'get':
    $limit = (int)$_GET['limit'];
    $skip = $_GET['skip'];
    $openid = $_GET['openid'];
    $y = $_GET['y'];
    $m = (int)$_GET['m'];
    $result = array();
    if($limit>0 && $skip >= 0 && $openid != ''){

        $res = mysqli_query($conn, "SELECT * FROM bill WHERE _openid = '$openid' AND y = $y AND m = $m ORDER BY date DESC LIMIT $skip,$limit");

        $resin = mysqli_query($conn, "SELECT SUM(amount) AS amountin FROM bill WHERE _openid = '$openid' AND y = '$y' AND m = '$m' AND type = 'in'");
        $resout = mysqli_query($conn, "SELECT SUM(amount) AS amountout FROM bill WHERE _openid = '$openid' AND y = '$y' AND m = '$m' AND type = 'out'");

        
    }else {
        $res = mysqli_query($conn, "SELECT * FROM bill");
    }
    /*session_start();

    echo $_SESSION["username"];

    echo $_SESSION["uid"];*/

    $json_arr = array();
    $amountin = 0;
    $amountout = 0;

    while ($row = mysqli_fetch_array($resin)){
        $amountin = $row[0];        
    }
    while ($row = mysqli_fetch_array($resout)){
        $amountout = $row[0];        
    }
    while ($row = mysqli_fetch_array($res)){
        $json_arr = array("id"=>$row[0],"openid" => $row[1],"text"=>$row[2],"type"=>$row[3],"remarks"=>$row[4],"amount" => $row[5],"date"=> $row[6],"week"=> $row[7],"m_w"=> $row[8],"nickname"=> $row[9],"gender"=> $row[10],'city'=>$row[11],'y'=>$row[12],'m'=>$row[13],'d'=>$row[14],'icon'=>$row[15],'allamount'=>$row[16],'payall'=>$row[17],'pater'=>$row[18],'hisprice'=>$row[19],'payment'=>$row[20],'ff'=>$row[21],'paytype'=>$row[22]);
        array_push($result, $json_arr);        
    }

    $arr = array('list' => $result,'amountin' => $amountin,'amountout' => $amountout);

    echo json_encode($arr);

    mysqli_close($conn);

    break;
case 'chartget':
    $openid = $_GET['openid'];
    $y = $_GET['y'];
    $m = (int)$_GET['m'];
    $m_w = $_GET['m_w'];
    $type = $_GET['type'];

    $result = array();
    //$chart = mysqli_query($conn, "SELECT * FROM bill WHERE _openid = '$openid' AND y = '$y' AND m = '$m' AND m_w = '$m_w' AND type = '$type'");
    if(empty($m)){
        $chart = mysqli_query($conn, "SELECT * FROM bill WHERE _openid = '$openid' AND y = '$y' AND type = '$type'");
    }else if(empty($m_w)){
        $chart = mysqli_query($conn, "SELECT * FROM bill WHERE _openid = '$openid' AND y = '$y' AND m = '$m' AND type = '$type'");
    }else{
        $chart = mysqli_query($conn, "SELECT * FROM bill WHERE _openid = '$openid' AND y = '$y' AND m = '$m' AND m_w = '$m_w' AND type = '$type'");
    }
    

    $json_arr = array();
    while ($row = mysqli_fetch_array($chart)){
        $json_arr = array("openid" => $row[1],"text"=>$row[2],"type"=>$row[3],"remarks"=>$row[4],"amount" => $row[5],"date"=> $row[6],"week"=> $row[7],"m_w"=> $row[8],"nickname"=> $row[9],"gender"=> $row[10],'city'=>$row[11],'y'=>$row[12],'m'=>$row[13],'d'=>$row[14],'icon'=>$row[15],'allamount'=>$row[16],'payall'=>$row[17],'pater'=>$row[18],'hisprice'=>$row[19],'payment'=>$row[20],'ff'=>$row[21],'paytype'=>$row[22]);
        array_push($result, $json_arr);        
    }
    
    echo json_encode($result);

    mysqli_close($conn);

    break;
case 'fullmouth':
    $openid = $_GET['openid'];
    $y = $_GET['y'];

    $result = array();
    
    $chartin = mysqli_query($conn, "SELECT * FROM bill WHERE _openid = '$openid' AND y = '$y'");

    $json_arr = array();
    while ($row = mysqli_fetch_array($chartin)){
        $json_arr = array("openid" => $row[1],"text"=>$row[2],"type"=>$row[3],"remarks"=>$row[4],"amount" => $row[5],"date"=> $row[6],"week"=> $row[7],"m_w"=> $row[8],"nickname"=> $row[9],"gender"=> $row[10],'city'=>$row[11],'y'=>$row[12],'m'=>$row[13],'d'=>$row[14],'icon'=>$row[15],'allamount'=>$row[16],'payall'=>$row[17],'pater'=>$row[18],'hisprice'=>$row[19],'payment'=>$row[20],'ff'=>$row[21],'paytype'=>$row[22]);
        array_push($result, $json_arr);        
    }

    echo json_encode($result);

    mysqli_close($conn);

    break;

case 'mouth':
    $openid = $_GET['openid'];
    $y = $_GET['y'];
    $m = $_GET['m'];

    $result = array();
    
    $chartin = mysqli_query($conn, "SELECT * FROM bill WHERE _openid = '$openid' AND y = '$y' AND m = '$m'");

    $json_arr = array();
    while ($row = mysqli_fetch_array($chartin)){
        $json_arr = array("openid" => $row[1],"text"=>$row[2],"type"=>$row[3],"remarks"=>$row[4],"amount" => $row[5],"date"=> $row[6],"week"=> $row[7],"m_w"=> $row[8],"nickname"=> $row[9],"gender"=> $row[10],'city'=>$row[11],'y'=>$row[12],'m'=>$row[13],'d'=>$row[14],'icon'=>$row[15],'allamount'=>$row[16],'payall'=>$row[17],'pater'=>$row[18],'hisprice'=>$row[19],'payment'=>$row[20],'ff'=>$row[21],'paytype'=>$row[22]);
        array_push($result, $json_arr);        
    }

    echo json_encode($result);

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