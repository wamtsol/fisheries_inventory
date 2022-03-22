<?php
include("include/db.php");
include("include/utility.php");
include("include/session.php");
include("include/paging.php");
define("APP_START", 1);
$filename = 'item_manage.php';
include("include/admin_type_access.php");
$tab_array=array("list", "add", "edit", "status", "delete", "bulk_action", "print");
if(isset($_REQUEST["tab"]) && in_array($_REQUEST["tab"], $tab_array)){
	$tab=$_REQUEST["tab"];
}
else{
	$tab="list";
}
$extra='';
$is_search=false;
if(isset($_GET["q"])){
	$q=slash($_GET["q"]);
	$_SESSION["item_manage"]["q"]=$q;
}
if(isset($_SESSION["item_manage"]["q"])){
	$q=$_SESSION["item_manage"]["q"];
}
else{
	$q="";
}
if(!empty($q)){
	$extra.=" and title like '%".$q."%'";
	$is_search=true;
}
if(isset($_GET["type"])){
	$type=slash($_GET["type"]);
	$_SESSION["item_manage"]["type"]=$type;
}
if(isset($_SESSION["item_manage"]["type"])){
	$type=$_SESSION["item_manage"]["type"];
}
else{
	$type="";
}
if($type!=""){
	$extra.=" and type='".$type."'";
	$is_search=true;
}
$sql="select * from item where 1 $extra order by title";
switch($tab){
	case 'add':
		include("modules/item/add_do.php");
	break;
	case 'edit':
		include("modules/item/edit_do.php");
	break;
	case 'delete':
		include("modules/item/delete_do.php");
	break;
	case 'status':
		include("modules/item/status_do.php");
	break;
	case 'bulk_action':
		include("modules/item/bulkactions.php");
	break;
	case 'print':
		include("modules/item/print.php");
	break;
}
?>
<?php include("include/header.php");?>
	<div class="container-widget row">
    	<div class="col-md-12">
		  <?php
            switch($tab){
                case 'list':
                    include("modules/item/list.php");
                break;
                case 'add':
                    include("modules/item/add.php");
                break;
                case 'edit':
                    include("modules/item/edit.php");
                break;
            }
          ?>
    	</div>
  	</div>
</div>
<?php include("include/footer.php");?>