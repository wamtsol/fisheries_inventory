<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_POST["item_edit"])){
	extract($_POST);
	$err="";
	if(empty($title))
		$err="Fields with (*) are Mandatory.<br />";
	if($err==""){
		$sql="Update item set `title`='".slash($title)."', `type`='".slash($type)."', `unit`='".slash($unit)."', `low_stock`='".slash($low_stock)."'"." where id='".$id."'";
		doquery($sql,$dblink);
		unset($_SESSION["item_manage"]["edit"]);
		header('Location: item_manage.php?tab=list&msg='.url_encode("Successfully Updated"));
		die;
	}
	else{
		foreach($_POST as $key=>$value)
			$_SESSION["item_manage"]["edit"][$key]=$value;
		header("Location: item_manage.php?tab=edit&err=".url_encode($err)."&id=$id");
		die;
	}
}
/*----------------------------------------------------------------------------------*/
if(isset($_GET["id"]) && $_GET["id"]!=""){
	$rs=doquery("select * from item where id='".slash($_GET["id"])."'",$dblink);
	if(numrows($rs)>0){
		$r=dofetch($rs);
		foreach($r as $key=>$value)
			$$key=htmlspecialchars(unslash($value));
		if(isset($_SESSION["item_manage"]["edit"]))
			extract($_SESSION["item_manage"]["edit"]);
	}
	else{
		header("Location: item_manage.php?tab=list");
		die;
	}
}
else{
	header("Location: item_manage.php?tab=list");
	die;
}