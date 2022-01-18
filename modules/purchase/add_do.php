<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_POST["purchase_add"])){
	extract($_POST);
	$err="";
	if(empty($datetime_added) || empty($supplier_name) || count($items)==0)
		$err="Fields with (*) are Mandatory.<br />";
	$items_array=array();
	$i=0;
	foreach($items as $item){
		if(!empty($item)){
			if(array_key_exists($item, $items_array)){
				$items_array[$item]["quantity"]+=$quantity[$i];
			}
			else{
				$items_array[$item]=array(
					"unit_price" => $unit_price[$i],
					"hundred_pieces_kg" => $hundred_pieces_kg[$i],
					"unit" => $unit[$i],
					"total_kg" => $total_kg[$i],
					"quantity" => $quantity[$i]
				);
			}
		}
		$i++;
	}
	if(!empty($_FILES["bill_image"]["tmp_name"]) && !in_array($_FILES["bill_image"]["type"],$imagetypes)){
		$err.="Image format not supported. <br>";
	}
	if($err==""){
		$sql="INSERT INTO purchase (datetime_added, type, supplier_name, phone, address, supplier_id) VALUES ('".slash(datetime_dbconvert($datetime_added))."', '".slash($type)."', '".slash($supplier_name)."', '".slash($phone)."', '".slash($address)."', '".slash($supplier_id)."')";
		doquery($sql,$dblink);
		$purchase_id=inserted_id();
		$grand_total_price=$quantity=0;	
		foreach($items_array as $item_id=>$item){
			$r=dofetch(doquery("select unit_price from items where id='".slash($item_id)."'", $dblink));
			if($item["unit"]==1){
				$total_price=$item["unit_price"]*$item["total_kg"];
			}
			else{
				$total_price=$item["unit_price"]*$item["quantity"];
			}
			$quantity+=$item["quantity"];
			$grand_total_price+=$total_price;
			doquery("insert into purchase_items(purchase_id, item_id, unit_price, hundred_pieces_kg, unit, quantity, total_kg, total_price) values('".$purchase_id."', '".$item_id."', '".$item["unit_price"]."', '".$item["hundred_pieces_kg"]."', '".$item["unit"]."', '".$item["quantity"]."', '".$item["total_kg"]."', '".$total_price."')", $dblink);
			doquery("update items set quantity=quantity+".$item["quantity"]." where id='".slash($item_id)."'", $dblink);

		}
		doquery("update purchase set total_items=".$quantity.", discount='".$discount."', total_price='".$grand_total_price."', net_price='".($grand_total_price-$discount)."' where id='".$purchase_id."'", $dblink);
		if( !empty( $payment_account_id ) && $payment_amount > 0 ) {
			doquery( "insert into supplier_payment(supplier_id, account_id, datetime_added, amount, details) values( '".$supplier_id."', '".slash( $payment_account_id )."', '".datetime_dbconvert($datetime_added)."', '".slash($payment_amount)."', 'Payment againset Purchase #".$purchase_id."' )", $dblink );
			$supplier_payment_id = inserted_id();
			doquery( "update purchase set supplier_payment_id = '".$supplier_payment_id."' where id = '".$purchase_id."'", $dblink );
		}
		if(!empty($_FILES["bill_image"]["tmp_name"])){
			$bill_image=getFilename($_FILES["bill_image"]["name"], $purchase_id);
			move_uploaded_file($_FILES["bill_image"]["tmp_name"], $file_upload_root."purchase_bill/".$bill_image);
			$sql="Update purchase set bill_image='".$bill_image."' where id=$purchase_id";
			doquery($sql,$dblink);
		}
		unset($_SESSION["purchase_manage"]["add"]);
		header('Location: purchase_manage.php?tab=list&msg='.url_encode("Sucessfully Added"));
		die;
	}
	else{
		foreach($_POST as $key=>$value)
			$_SESSION["purchase_manage"]["add"][$key]=$value;
		header('Location: purchase_manage.php?tab=add&err='.url_encode($err));
		die;
	}
}