<?php
include("include/db.php");
include("include/utility.php");
include("include/session.php");
include("include/paging.php");
define("APP_START", 1);
$filename = 'sales_manage.php';
include("include/admin_type_access.php");
$tab_array=array("list", "add", "edit", "status", "delete", "bulk_action", "get_unit_price","get_quantity", "print","report","town_csv","print_invoice");
if(isset($_REQUEST["tab"]) && in_array($_REQUEST["tab"], $tab_array)){
	$tab=$_REQUEST["tab"];
}
else{
	$tab="list";
}
$q="";
$extra='';
$is_search=false;
if(isset($_GET["date_from"])){
	$date_from=slash($_GET["date_from"]);
	$_SESSION["sales"]["list"]["date_from"]=$date_from;
}
if(isset($_SESSION["sales"]["list"]["date_from"]))
	$date_from=$_SESSION["sales"]["list"]["date_from"];
else
	$date_from="";
if($date_from != ""){
	$extra.=" and datetime_added>='".datetime_dbconvert($date_from)."'";
	$is_search=true;
}
if(isset($_GET["date_to"])){
	$date_to=slash($_GET["date_to"]);
	$_SESSION["sales"]["list"]["date_to"]=$date_to;
}
if(isset($_SESSION["sales"]["list"]["date_to"]))
	$date_to=$_SESSION["sales"]["list"]["date_to"];
else
	$date_to="";
if($date_to != ""){
	$extra.=" and datetime_added<'".datetime_dbconvert($date_to)."'";
	$is_search=true;
}
if(isset($_GET["town"])){
	$town=slash($_GET["town"]);
	$_SESSION["sales"]["list"]["town"]=$town;
}
if(isset($_SESSION["sales"]["list"]["town"])){
	$town=$_SESSION["sales"]["list"]["town"];	
}
else
	$town='';
if($town != ""){
	$extra.=" and town='".slash($town)."'";
	$is_search=true;
}
if(isset($_GET["q"])){
	$q=slash($_GET["q"]);
	$_SESSION["sales"]["list"]["q"]=$q;
}
if(isset($_SESSION["sales"]["list"]["q"]))
	$q=$_SESSION["sales"]["list"]["q"];
else
	$q="";
if(!empty($q)){
	$extra.=" and (customer_name like '%".$q."%' or id='".$q."')";
	$is_search=true;
}
$order_by = "datetime_added";
$order = "desc";
if( isset($_GET["order_by"]) ){
	$_SESSION["sales"]["list"]["order_by"]=slash($_GET["order_by"]);
}
if( isset( $_SESSION["sales"]["list"]["order_by"] ) ){
	$order_by = $_SESSION["sales"]["list"]["order_by"];
}
if( isset($_GET["order"]) ){
	$_SESSION["sales"]["list"]["order"]=slash($_GET["order"]);
}
if( isset( $_SESSION["sales"]["list"]["order"] ) ){
	$order = $_SESSION["sales"]["list"]["order"];
}
$orderby = $order_by." ".$order;
$sql="select * from sales where 1 $extra order by $orderby";
switch($tab){
	case 'add':
		include("modules/sales/add_do.php");
	break;
	case 'edit':
		include("modules/sales/edit_do.php");
	break;
	case 'delete':
		include("modules/sales/delete_do.php");
	break;
	case 'status':
		include("modules/sales/status_do.php");
	break;
	case 'bulk_action':
		include("modules/sales/bulkactions.php");
	break;
	case "get_unit_price":
		if(isset($_GET["id"])){
			$not_found = true;
			if(isset($_GET['transcationid']) && $_GET['transcationid'] > 0){
				$getSaleItemPrice=doquery("select unit_price from sales_items where item_id='".slash($_GET["id"])."' and sales_id = '".slash($_GET[ "transcationid" ])."'", $dblink);
				if(numrows($getSaleItemPrice) > 0){
					$not_found = false;
					$salItemsPrice=dofetch($getSaleItemPrice);	
					echo $salItemsPrice['unit_price'];
				}
			}
			if($not_found){
			  $r=dofetch(doquery("select unit_price from items where id='".slash($_GET["id"])."'", $dblink));
				echo $r["unit_price"];
			}
		}
		die;
	break;
	case "get_quantity":
		if(isset($_GET["id"])){
			if(isset($_GET['transcationid']) && $_GET['transcationid'] > 0){
				$r=dofetch(doquery("select quantity from items where id='".slash($_GET["id"])."'", $dblink));
				$quantity = $r["quantity"];	
				$getSaleitemQty=doquery("select quantity from sales_items where item_id='".slash($_GET["id"])."' and sales_id = '".$_GET['transcationid']."'", $dblink);
				if(numrows($getSaleitemQty) > 0){
					$SaleItemQty=dofetch($getSaleitemQty);
					$quantity += $SaleItemQty[ "quantity" ];
				}
				echo $quantity;
			}
			else{
			   $r=dofetch(doquery("select quantity from items where id='".slash($_GET["id"])."'", $dblink));
				echo $r["quantity"];
			}
		}
		die;
	break;
	case "print":
		include("modules/sales/print.php");
	break;
	case 'report':
		include("modules/sales/report.php");
		die;
	break;
	case 'town_csv':
		include("modules/sales/town_csv.php");
	break;
	case "print_invoice":
		include("modules/sales/print_invoice.php");
	break;
}
?>
<?php include("include/header.php");?>
  <div class="container-widget row">
    <div class="col-md-12">
      <?php
		switch($tab){
			case 'list':
				include("modules/sales/list.php");
			break;
			case 'add':
				include("modules/sales/add.php");
			break;
			case 'edit':
				include("modules/sales/edit.php");
			break;
		}
      ?>
    </div>
  </div>
</div>
<?php if( isset( $_GET[ "print" ]) ){
	?>
	<iframe style="display:none" src="sales_manage.php?tab=print&id=<?php echo $_GET[ "print" ]?>"></iframe>
	<?php
}?> 
<?php include("include/footer.php");?>