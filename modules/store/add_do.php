<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_POST["store_add"])){
	extract($_POST);
	$err="";
	if(empty($title))
		$err="Fields with (*) are Mandatory.<br />";
	if($err==""){
		$sql="INSERT INTO store (title, balance) VALUES ('".slash($title)."', '".slash($balance)."')";
		doquery($sql,$dblink);
		unset($_SESSION["store_manage"]["add"]);
		header('Location: store_manage.php?tab=list&msg='.url_encode("Successfully Added"));
		die;
	}
	else{
		foreach($_POST as $key=>$value)
			$_SESSION["store_manage"]["add"][$key]=$value;
		header('Location: store_manage.php?tab=add&err='.url_encode($err));
		die;
	}
}