<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_POST["items_add"])){
	extract($_POST);
	$err="";
	if(empty($title))
		$err="Fields with (*) are Mandatory.<br />";
	if($err==""){
		$sql="INSERT INTO items (type, title, unit_price, quantity, low_stock_quantity) VALUES ('".slash($type)."','".slash($title)."','".slash($unit_price)."','".slash($quantity)."', '".slash($low_stock_quantity)."')";
		doquery($sql,$dblink);
		$id = inserted_id();
		unset($_SESSION["items_manage"]["add"]);
		header('Location: items_manage.php?tab=list&msg='.url_encode("Sucessfully Added"));
		die;
	}
	else{
		foreach($_POST as $key=>$value)
			$_SESSION["items_manage"]["add"][$key]=$value;
		header('Location: items_manage.php?tab=add&err='.url_encode($err));
		die;
	}
}