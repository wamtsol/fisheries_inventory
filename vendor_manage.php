<?php
include("include/db.php");
include("include/utility.php");
include("include/session.php");
include("include/paging.php");
define("APP_START", 1);
$filename = 'vendor_manage.php';
include("include/admin_type_access.php");
$tab_array=array("list", "add", "edit", "status", "delete", "bulk_action");
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
	$_SESSION["vendor_manage"]["q"]=$q;
}
if(isset($_SESSION["vendor_manage"]["q"]))
	$q=$_SESSION["vendor_manage"]["q"];
else
	$q="";
if(!empty($q)){
	$extra.=" and name like '%".$q."%'";
	$is_search=true;
}
$admin_type = dofetch(doquery("select * from admin_type where id = '".$_SESSION["logged_in_admin"]["admin_type_id"]."'", $dblink));
$sql="select * from vendor where 1 $extra order by name";
switch($tab){
	case 'add':
		include("modules/vendor/add_do.php");
	break;
	case 'edit':
		include("modules/vendor/edit_do.php");
	break;
	case 'delete':
		include("modules/vendor/delete_do.php");
	break;
	case 'status':
		include("modules/vendor/status_do.php");
	break;
	case 'bulk_action':
		include("modules/vendor/bulkactions.php");
	break;
}
?>
<?php include("include/header.php");?>
	<div class="container-widget row">
    	<div class="col-md-12">
		  <?php
            switch($tab){
                case 'list':
                    include("modules/vendor/list.php");
                break;
                case 'add':
                    include("modules/vendor/add.php");
                break;
                case 'edit':
                    include("modules/vendor/edit.php");
                break;
            }
          ?>
    	</div>
  	</div>
</div>
<?php include("include/footer.php");?>