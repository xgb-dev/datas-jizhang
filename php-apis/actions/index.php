<?php
error_reporting(0);
$dbhost = '122.51.255.60';  // mysql服务器主机地址
$dbuser = 'root';           // mysql用户名
$dbpass = 'zhuZHU989~!@';               // mysql用户名密码
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
    $title = urldecode($_REQUEST['art_title']);
    $article = urldecode($_REQUEST['art_info']);
    $title = str_replace("\n", "", $title);
    $article = str_replace("\n", "", $article);

    $time = time();

    $time = (int)$time;

    $sql = "INSERT INTO `art_list`(`id`,`art_title`,`art_info`,`add_time`) VALUES(NULL,'$title','$article','$time')";

    mysqli_query($conn, $sql);

    $res = mysqli_query($conn,'SELECT * FROM `art_list` ORDER BY `id` DESC LIMIT 1');

    $row = mysqli_fetch_array($res);

    $id = $row[0];
    
    mysqli_close($conn);

    echo json_encode(array('state'=> 0, 'id' => "$id", 'time' => "$time"));
    
    break;

  case 'edit':
    $title = urldecode($_REQUEST['art_title']);
    $article = urldecode($_REQUEST['art_info']);
    $title = str_replace("\n", "", $title);
    $article = str_replace("\n", "", $article);
    $id = $_REQUEST['id'];
    $time = time();

    $time = (int)$time;

    $sql = "UPDATE `art_list` SET `art_title` = '$title',`art_info` = '$article',`add_time` = '$time' WHERE `id` = '$id'";

    mysqli_query($conn, $sql);
    
    mysqli_close($conn);

    echo json_encode(array('state'=> 0, 'id' => "$id", 'time' => "$time"));
    
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

  case 'get':
    $limit = (int)$_GET['limit'];
    $result = array();
    if($limit){
        $res = mysqli_query($conn, "SELECT * FROM art_list ORDER BY id DESC LIMIT $limit");
    }else {
        $res = mysqli_query($conn, "SELECT * FROM art_list");
    }
    /*session_start();

    echo $_SESSION["username"];

    echo $_SESSION["uid"];*/

    $json_arr = array();
    while ($row = mysqli_fetch_array($res)){
        $json_arr = array("id" => (int)$row[0],"art_title"=>$row[1],"art_info"=>$row[2],"add_time"=>date('Y-m-d h:i:s',$row[3]),"add_zan" => $row[4]);
        array_push($result, $json_arr);        
    }

    echo json_encode($result);

    mysqli_close($conn);

    break;
case 'single':
    $id = (int)$_GET['id'];
    $result = array();
    
    /*session_start();

    echo $_SESSION["username"];

    echo $_SESSION["uid"];*/
    
    $res = mysqli_query($conn, "SELECT * FROM art_list WHERE id=$id");

    $json_arr = array();
    while ($row = mysqli_fetch_array($res)){
        $json_arr = array("id" => (int)$row[0],"art_title"=>$row[1],"art_info"=>$row[2],"add_time"=>$row[3]);
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

    $sql="DELETE FROM `art_list` WHERE id={$id}";// daozhe

    mysqli_query($conn, $sql);

    mysqli_close($conn);

    echo json_encode(array('state' => 0, 'msg' => 'ok'));

    break;

  case 'plus':
    /*session_start();

    echo $_SESSION["username"];

    echo $_SESSION["uid"];*/

    $id=(int)$_REQUEST['id'];

    $oldzan = "SELECT add_zan FROM art_list WHERE id = {$id}";

    $res = mysqli_query($conn, $oldzan);

    $oldzanvalue = mysqli_fetch_array($res)[0];

    $sql="UPDATE art_list SET add_zan= $oldzanvalue+1  WHERE id={$id}";

    mysqli_query($conn, $sql);

    mysqli_close($conn);

    echo json_encode(array('state' => 0, 'msg' => 'ok'));

    break;
  case 'reduce':

    $id=(int)$_REQUEST['id'];

    $oldzan = "SELECT add_zan FROM art_list WHERE id = {$id}";

    $res = mysqli_query($conn, $oldzan);

    $oldzanvalue = mysqli_fetch_array($res)[0];

    $sql="UPDATE art_list SET add_zan = $oldzanvalue-1  WHERE id={$id}";

    mysqli_query($conn, $sql);

    mysqli_close($conn);

    echo json_encode(array('state' => 0, 'msg' => 'ok'));
}

$code = $_GET['code'];//获取code
if($code){
    $weixin =  file_get_contents("https://api.weixin.qq.com/sns/oauth2/access_token?appid=wxd1d8a59c396055f4&secret=ced5ab98c1960e86ef0e41e0718c156c&code=".$code."&grant_type=authorization_code");//通过code换取网页授权access_token
    $jsondecode = json_decode($weixin); //对JSON格式的字符串进行编码
    $array = get_object_vars($jsondecode);//转换成数组
    $openid = $array['openid'];//输出openid
    echo json_encode($openid);  
}
$formid = $_REQUEST['formid'];
if($formid!=null){
    temMsg($conn);
}
function temMsg($conn)
{
    $name = $_REQUEST['name'];
    $formid = $_REQUEST['formid'];
    $temid = 'r-S0Ymgr2G-zTygMY8LohUQTn-McmWadBOpavrKHfuA';//FF287-Vo1tXQSPzYckCgUwZON6-8JZ45TqNmNM5x3f0

    $key1val = $_REQUEST['key1'];
    $key2val = $_REQUEST['key2'];
    $key3val = $_REQUEST['key3'];

    $page = 'pages/index/index';
    $openid = $_REQUEST['openid'];
    if(!$openid||!$formid)die('failed!');
    $key1 = $key1val;//发送的消息
    $key2 = $name.$key2val;
    $key3 = $key3val;
    $access_token = returnAssKey();
    $url = 'https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token='.$access_token;
    $data = array(//这里一定要按照微信给的格式
        "touser"=>$openid,
        "template_id"=>$temid,
        "page"=>$page,
        "form_id"=>$formid,
        "data"=>array(
            "keyword1"=>array(
                "value"=>$key1,
                "color"=>"#173177"
            ),
            "keyword2"=>array(
                "value"=>$key2,
                "color"=>"#173177"
            ),
            "keyword3"=>array(
                "value"=>$key3,
                "color"=>"#173177"
            ),
        ),
        "emphasis_keyword"=>"keyword1.DATA",//需要进行加大的消息
    );
    $res = postCurl($url,$data,'json');//将data数组转换为json数据
    if($res){
        $timer = date('Y-m-d h:i:s',time());
        $noticesql="UPDATE formid SET sent = '是' , senttime = '$timer'  WHERE form_id='$formid'";
        mysqli_query($conn, $noticesql);
        echo json_encode(array('state'=>4,'msg'=>$res));
    }else{
        $timer = date('Y-m-d h:i:s',time());
        $noticesql="UPDATE formid SET sent = '是' , senttime = '$timer'  WHERE form_id='$formid'";
        mysqli_query($conn, $noticesql);
        echo json_encode(array('state'=>5,'msg'=>$res));
    }
 
}
 
function returnAsskey()
{
    $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wxd1d8a59c396055f4&secret=ced5ab98c1960e86ef0e41e0718c156c';
    $ass_key = curl_get($url);
    $a1 = $ass_key->access_token;
    return $a1;
}

function postCurl($url,$data,$type)
{
    if($type == 'json'){
        $data = json_encode($data);//对数组进行json编码
        $header= array("Content-type: application/json;charset=UTF-8","Accept: application/json","Cache-Control: no-cache", "Pragma: no-cache");
    }
    $curl = curl_init();
    curl_setopt($curl,CURLOPT_URL,$url);
    curl_setopt($curl,CURLOPT_POST,1);
    curl_setopt($curl,CURLOPT_SSL_VERIFYPEER,false);
    curl_setopt($curl,CURLOPT_SSL_VERIFYHOST,false);
    if(!empty($data)){
        curl_setopt($curl,CURLOPT_POSTFIELDS,$data);
    }
    curl_setopt($curl,CURLOPT_RETURNTRANSFER,1);
    curl_setopt($curl,CURLOPT_HTTPHEADER,$header);
    $res = curl_exec($curl);
    if(curl_errno($curl)){
        echo 'Error+'.curl_error($curl);
    }
    curl_close($curl);
    return $res;
}


function curl_get($url) {
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    $data = curl_exec($curl);
    $err = curl_error($curl);
    curl_close($curl);
    return json_decode($data);//对数据进行json解码
}