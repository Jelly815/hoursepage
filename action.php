<?php
session_start();
include_once('./lib/handling.php');
include_once('./lib/lang.php');

$db         = new db_function();
$action     = isset($_GET['action'])?$_GET['action']:'';
$log_msg    = array('status' => true,'msg' => '','data' => array());

switch($action){
    // 登入
	case 'login':
		$user_mail 	= isset($_POST['user'])?filter_var($_POST['user'], FILTER_VALIDATE_EMAIL):'';
		$user_psw 	= isset($_POST['pwd'])?filter_var($_POST['pwd'], FILTER_SANITIZE_STRING):'';

		$user_psw 	= md5($user_psw);

        $re_array   = $db->login($user_mail,$user_psw);

        if(!empty($re_array)){
            $_SESSION['uname']  = $re_array[0]['ex_name'];
            $_SESSION['umail']  = $re_array[0]['ex_mail'];
            $log_msg['msg'] = HI.$_SESSION['uname'];
        }else{
            $log_msg    = array('status' => false,'msg' => ALERTXT05);
        }

        echo json_encode($log_msg);
	break;
    // 登出
    case 'logout':
        $_SESSION['uname']  = null;
        $_SESSION['umail']  = null;
        unset($_SESSION['uname']);
        unset($_SESSION['umail']);

        header("Refresh:0; url=".INDEXPATH);
    break;
    // 註冊
    case 'signup':
        $profile_hid    = isset($_POST['profile_hid'])?$_POST['profile_hid']:'';

        if(str_replace(';;', '', $profile_hid) == ''){
            exit(json_encode(array('status' => false,'msg' => ALERTXT06)));
        }else{
            list($name,$pwd,$email) = explode(';;', $profile_hid);
            $name       = filter_var($name, FILTER_SANITIZE_STRING);
            $pwd        = md5($pwd);
            $email      = filter_var($email, FILTER_SANITIZE_EMAIL);

            $data       = array($name,$pwd,$email);
            $dataArr    = $db->add_user($data);

            if(!empty($dataArr)){
                $log_msg    = array('status' => true,'msg' => '','data' => array());
                $log_msg['data'] = $dataArr;
            }else{
                $log_msg    = array('status' => false,'msg' => ALERTXT06);
            }
        }

        echo json_encode($log_msg);
    break;
    // 檢查mail重複
    case 'chkmail':
        $user_mail  = isset($_POST['email'])?filter_var($_POST['email'], FILTER_VALIDATE_EMAIL):'';

        $re_chk     = $db->chk_mail($user_mail);

        if(!$re_chk){
            $log_msg    = array('status' => False,'msg' => ALERTXT04);
        }

        echo json_encode($log_msg);
    break;
	default:

}
?>
