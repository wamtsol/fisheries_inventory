<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_GET["id"]) && !empty($_GET["id"])){
	$id=slash($_GET["id"]);
	$stock_movement = dofetch(doquery( "select * from stock_movement where id = '".$id."' ", $dblink ));
	$deleted_items = doquery( "select item_id, quantity from stock_movement_items where stock_movement_id='".$id."'", $dblink );
	if( numrows( $deleted_items ) > 0 ) {
		while( $deleted_item = dofetch( $deleted_items ) ) {
			$GrpItems=doquery("select * from item_group where group_item_id='".slash($deleted_item[ "item_id" ])."'", $dblink);
			if(numrows($GrpItems) > 0){
				while($grpItemData=dofetch($GrpItems)){
					doquery("update items set quantity=quantity+".($grpItemData['quantity']*$deleted_item[ "quantity" ])." where id='".slash($grpItemData['item_id'])."'", $dblink);
				}
			}	
			doquery("update items set quantity=quantity+".$deleted_item[ "quantity" ]." where id='".slash($deleted_item["item_id"])."'", $dblink);
		}
	}
	doquery("delete from stock_movement_items where stock_movement_id='".$id."'",$dblink);
	doquery("delete from stock_movement where id='".$id."'",$dblink);
	header("Location: stock_movement_manage.php");
	die;
}


