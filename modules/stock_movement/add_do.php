<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_POST["stock_movement_add"])){
	extract($_POST);
	$err="";
	if(empty($datetime_added) || count($items)==0)
		$err="Fields with (*) are Mandatory.<br />";
	$items_array=array();
	$i=0;
	foreach($items as $item){
		if(!empty($item)){
			if(array_key_exists($item, $items_array)){
				$items_array[$item][ "quantity" ] += $quantity[$i];
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
	//quantityquantity
	foreach($items_array as $item_id=>$item){
		$quantity=$item['quantity'];
		$r=dofetch(doquery("select title, quantity from items where id='".slash($item_id)."'", $dblink));
		if($r["quantity"]<$quantity || $quantity <= 0){
			$err.=unslash($r["title"]).' is out of stock. Quantity available: '.$r["quantity"].'<br />';
		}
	}
	if($err==""){
		$sql="INSERT INTO stock_movement (datetime_added, store_id) VALUES ('".slash(datetime_dbconvert($datetime_added))."','".slash($store_id)."')";
		doquery($sql,$dblink);
		$stock_movement_id=inserted_id();
		$grand_total_price=$total_quantity=0;
		foreach($items_array as $item_id=>$items){
			$quantity = $items['quantity'];
			$unit_price = $items['unit_price'];
			$total_kg = $items['total_kg'];
			$unit = $items['unit'];
			//$total_price = $unit_price*$quantity;
			if($unit==1){
				$total_price=$unit_price*$total_kg;
			}
			else{
				$total_price = $unit_price*$quantity;
			}
			$grand_total_price += $total_price;
			$total_quantity += $quantity;
			doquery("insert into stock_movement_items(stock_movement_id, item_id, unit_price, unit, quantity, total_kg, total_price) values('".$stock_movement_id."', '".$item_id."', '".$unit_price."', '".$unit."', '".$quantity."', '".$total_kg."', '".$total_price."')", $dblink);
			
			$GrpItems=doquery("select * from item_group where group_item_id='".slash($item_id)."'", $dblink);
			if(numrows($GrpItems) > 0){
				while($grpItemData=dofetch($GrpItems)){
					doquery("update items set quantity=quantity-".($grpItemData['quantity']*$quantity)." where id='".slash($grpItemData['item_id'])."'", $dblink);
				}
			}	
			doquery("update items set quantity=quantity-".$quantity." where id='".slash($item_id)."'", $dblink);
		}
		doquery("update stock_movement set total_items=".$total_quantity.",total_price='".$grand_total_price."', discount='".$discount."', net_price='".($grand_total_price-$discount)."' where id='".$stock_movement_id."'", $dblink);
		
		
		unset($_SESSION["stock_movement_manage"]["add"]);
		header('Location: stock_movement_manage.php?tab=list'.($_POST["stock_movement_add"]!='SAVE'?'&print='.$sale_id:'').'&msg='.url_encode("Sucessfully Added"));
		die;
	}
	else{
		foreach($_POST as $key=>$value)
			$_SESSION["stock_movement_manage"]["add"][$key]=$value;
		header('Location: stock_movement_manage.php?tab=add&err='.url_encode($err));
		die;
	}
}