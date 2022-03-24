<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_POST["item_add"])){
	extract($_POST);
	$err="";
	if(empty($title))
		$err="Fields with (*) are Mandatory.<br />";
	if($err==""){
		$sql="INSERT INTO item (title, type, unit, low_stock) VALUES ('".slash($title)."', '".slash($type)."', '".slash($unit)."', '".slash($low_stock)."')";
		doquery($sql,$dblink);
		unset($_SESSION["item_manage"]["add"]);
		header('Location: item_manage.php?tab=list&msg='.url_encode("Successfully Added"));
		die;
	}
	else{
		foreach($_POST as $key=>$value)
			$_SESSION["item_manage"]["add"][$key]=$value;
		header('Location: item_manage.php?tab=add&err='.url_encode($err));
		die;
	}
}