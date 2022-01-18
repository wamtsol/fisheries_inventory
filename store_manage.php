<?php
include("include/db.php");
include("include/utility.php");
include("include/session.php");
include("include/paging.php");
define("APP_START", 1);
$filename = 'store_manage.php';
include("include/admin_type_access.php");
$tab_array=array("list", "add", "edit", "status", "delete", "bulk_action", "report_debit_credit", "report_debit_credit_print");
if(isset($_REQUEST["tab"]) && in_array($_REQUEST["tab"], $tab_array)){
	$tab=$_REQUEST["tab"];
}
else{
	$tab="list";
}

switch($tab){
	case 'add':
		include("modules/store/add_do.php");
	break;
	case 'edit':
		include("modules/store/edit_do.php");
	break;
	case 'delete':
		include("modules/store/delete_do.php");
	break;
	case 'status':
		include("modules/store/status_do.php");
	break;
	case 'bulk_action':
		include("modules/store/bulkactions.php");
	break;
	case 'report_debit_credit':
		include("modules/store/report_debit_credit_do.php");
	break;
	case 'report_debit_credit_print':
		include("modules/store/report_debit_credit_print.php");
	break;
}
?>
<?php include("include/header.php");?>
	<div class="container-widget row">
    	<div class="col-md-12">
		  <?php
            switch($tab){
                case 'list':
                    include("modules/store/list.php");
                break;
                case 'add':
                    include("modules/store/add.php");
                break;
                case 'edit':
                    include("modules/store/edit.php");
                break;
				case 'report_debit_credit':
					include("modules/store/report_debit_credit.php");
				break;
            }
          ?>
    	</div>
  	</div>
</div>
<?php include("include/footer.php");?>