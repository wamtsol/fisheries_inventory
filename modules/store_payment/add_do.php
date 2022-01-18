<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_POST["store_payment_add"])){
	extract($_POST);
	$err="";
	if(empty($store_id))
		$err="Fields with (*) are Mandatory.<br />";
	if(!empty($_FILES["payment_image"]["tmp_name"]) && !in_array($_FILES["payment_image"]["type"],$imagetypes)){
		$err.="Image format not supported. <br>";
	}
	if($err==""){
		$sql="INSERT INTO store_payment (store_id, datetime_added, amount, account_id, details) VALUES ('".slash($store_id)."','".slash(datetime_dbconvert($datetime_added))."','".slash($amount)."','".slash($account_id)."','".slash($details)."')";
		doquery($sql,$dblink);
		$id=inserted_id();
		if(!empty($_FILES["payment_image"]["tmp_name"])){
			$payment_image=getFilename($_FILES["payment_image"]["name"], $id);
			move_uploaded_file($_FILES["payment_image"]["tmp_name"], $file_upload_root."store_payment_image/".$payment_image);
			$sql1="Update store_payment set payment_image='".$payment_image."' where id=$id";
			doquery($sql1,$dblink);
		}
		unset($_SESSION["store_payment_manage"]["add"]);
		header('Location: store_payment_manage.php?tab=list&msg='.url_encode("Sucessfully Added"));
		die;
	}
	else{
		foreach($_POST as $key=>$value)
			$_SESSION["store_payment_manage"]["add"][$key]=$value;
		header('Location: store_payment_manage.php?tab=add&err='.url_encode($err));
		die;
	}
}