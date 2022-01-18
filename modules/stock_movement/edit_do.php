<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_POST["stock_movement_edit"])){
	extract($_POST);
	$err="";
	if(empty($datetime_added) || count($items)==0){
		$err="Fields with (*) are Mandatory.<br />";
	}
	$items_array=array();
	$i=0;
	$total_quantity=0;
	foreach($items as $item){
		if(!empty($item)){
			if(array_key_exists($item, $items_array)){
				$items_array[ $item ][ "quantity" ] += $quantity[$i];
			}
			else{
				$items_array[$item]=array(
				    "unit_price" => $unit_price[$i],
					"unit" => $unit[$i],
					"total_kg" => $total_kg[$i],
					"quantity" => $quantity[$i]
				);
			}
		}
		$i++;
	}
	foreach($items_array as $item_id=>$item){
		$quantity=$item['quantity'];
		$sale_ItemQty = doquery("select quantity from stock_movement_items where stock_movement_id='".slash($id)."' AND item_id='".slash($item_id)."'", $dblink);
		if( numrows( $sale_ItemQty ) > 0 ){
			$sale_ItemQty = dofetch( $sale_ItemQty );
			$ItemQty = $sale_ItemQty["quantity"];
		}
		else{
			$ItemQty=0;
		}
        $r=dofetch(doquery("select title, quantity from items where id='".slash($item_id)."'", $dblink));
		if(($r["quantity"] + $ItemQty)<$quantity || $quantity <= 0){
			$err.= unslash($r["title"]).' is out of stock. Quantity available: '.$r["quantity"].'<br />';
		}
	}
	if($err==""){
		$sql="Update stock_movement set `datetime_added`='".slash(datetime_dbconvert($datetime_added))."', store_id='".slash($store_id)."' where id='".$id."'";
		doquery($sql,$dblink);
		
		$grand_total_price=$total_quantity=0;
		$item_ids = array();
		foreach($items_array as $item_id=>$item){
			$item_ids[] = $item_id;
			$total_quantity += $item[ "quantity" ];
			if($item["unit"]==1){
				$item_price=$item["unit_price"]*$item["total_kg"];
			}
			else{
				$item_price = $item[ "quantity" ] * $item['unit_price'];
			}
			//$item_price = $item[ "quantity" ] * $item['unit_price'];
			$grand_total_price += $item_price;
			$quantity_to_update = $item[ "quantity" ];
			$sale_item = doquery( "select id, quantity from stock_movement_items where stock_movement_id='".slash($id)."' and item_id='".$item_id."'", $dblink );
			if( numrows($sale_item) > 0 ) {
				$sale_item = dofetch( $sale_item );
				$quantity_to_update -= $sale_item[ "quantity" ];
				doquery( "update stock_movement_items set quantity='".$item[ "quantity" ]."', unit_price='".$item['unit_price']."', unit='".$item['unit']."', total_kg='".$item['total_kg']."', total_price='".($item_price)."' where id='".$sale_item[ "id" ]."'", $dblink );
			}
			else {
				doquery("insert into stock_movement_items(stock_movement_id, item_id, unit_price, unit, total_kg, quantity, total_price) values('".$id."', '".$item_id."', '".$item['unit_price']."', '".$item['unit']."', '".$item['total_kg']."', '".$item['quantity']."', '".$item_price."')", $dblink);
			}
			$GrpItems=doquery("select * from item_group where group_item_id='".slash($item_id)."'", $dblink);
			if(numrows($GrpItems) > 0){
				while($grpItemData=dofetch($GrpItems)){
					doquery("update items set quantity=quantity-".($grpItemData['quantity']*$quantity_to_update)." where id='".slash($grpItemData['item_id'])."'", $dblink);
				}
			}
			doquery("update items set quantity=quantity-".$quantity_to_update." where id='".slash($item_id)."'", $dblink);
		}
		$deleted_items = doquery( "select item_id, quantity from stock_movement_items where stock_movement_id='".$id."' and item_id not in (".implode(",", $item_ids).")", $dblink );
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
		doquery( "delete from stock_movement_items where stock_movement_id='".$id."' and item_id not in (".implode(",", $item_ids).")", $dblink );
		doquery("update stock_movement set total_items=".$total_quantity.",total_price='".$grand_total_price."', discount='".$discount."', net_price='".($grand_total_price-$discount)."' where id='".$id."'", $dblink);
		$stock_movement = dofetch( doquery( "select * from stock_movement where id = '".$id."' ", $dblink ) );
		
		
		unset($_SESSION["stock_movement_manage"]["edit"]);
		header('Location: stock_movement_manage.php?tab=list'.($_POST["stock_movement_edit"]!='SAVE'?'&print='.$id:'').'&msg='.url_encode("Sucessfully Added"));
		die;
	}
	else{
		foreach($_POST as $key=>$value)
			$_SESSION["stock_movement_manage"]["edit"][$key]=$value;
		header('Location: stock_movement_manage.php?tab=edit&err='.url_encode($err)."&id=".$id);
		die;
	}
}
/*----------------------------------------------------------------------------------*/
if(isset($_GET["id"]) && $_GET["id"]!=""){
	$rs=doquery("select * from stock_movement where id='".slash($_GET["id"])."'",$dblink);
	if(numrows($rs)>0){
		$r=dofetch($rs);
		foreach($r as $key=>$value)
			$$key=htmlspecialchars(unslash($value));
		$datetime_added=datetime_convert($datetime_added);
		$items=$quantity=array();
		$rs=doquery("select * from stock_movement_items where stock_movement_id='".$id."'", $dblink);
		if(numrows($rs)){
			while($r=dofetch($rs)){
				$items[]=$r["item_id"];
				$unit[]=$r["unit"];
				$total_kg[]=$r["total_kg"];
				$quantity[]=$r["quantity"];
			}
		}
		if(isset($_SESSION["stock_movement_manage"]["edit"]))
			extract($_SESSION["stock_movement_manage"]["edit"]);
	}
	else{
		header("Location: stock_movement_manage.php?tab=list");
		die;
	}
}
else{
	header("Location: stock_movement_manage.php?tab=list");
	die;
}