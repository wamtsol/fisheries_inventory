<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_POST["sales_add"])){
	extract($_POST);
	$err="";
	if(empty($datetime_added) || empty($customer_name) || empty($phone) || count($items)==0)
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
					"quantity" => $quantity[$i]
				);
			}
		}
		$i++;
	}
	//quantityquantity
	if(!empty($_FILES["bill_image"]["tmp_name"]) && !in_array($_FILES["bill_image"]["type"],$imagetypes)){
		$err.="Image format not supported. <br>";
	}
	foreach($items_array as $item_id=>$item){
		$quantity=$item['quantity'];
		$r=dofetch(doquery("select title, quantity from items where id='".slash($item_id)."'", $dblink));
		if($r["quantity"]<$quantity || $quantity <= 0){
			$err.=unslash($r["title"]).' is out of stock. Quantity available: '.$r["quantity"].'<br />';
		}
	}
	if($err==""){
		$sql="INSERT INTO sales (datetime_added, customer_name, phone, address, customer_id, town, type) VALUES ('".slash(datetime_dbconvert($datetime_added))."','".slash($customer_name)."','".slash($phone)."','".slash($address)."','".slash($customer_id)."','".slash($town)."','".slash($type)."')";
		doquery($sql,$dblink);
		$sale_id=inserted_id();
		$grand_total_price=$total_quantity=0;
		foreach($items_array as $item_id=>$items){
			$quantity = $items['quantity'];
			$unit_price = $items['unit_price'];
            $total_price = $unit_price*$quantity;
			$grand_total_price += $total_price;
			$total_quantity += $quantity;
			doquery("insert into sales_items(sales_id, item_id, unit_price, quantity, total_price) values('".$sale_id."', '".$item_id."', '".$unit_price."', '".$quantity."', '".$total_price."')", $dblink);
			
			$GrpItems=doquery("select * from item_group where group_item_id='".slash($item_id)."'", $dblink);
			if(numrows($GrpItems) > 0){
				while($grpItemData=dofetch($GrpItems)){
					doquery("update items set quantity=quantity-".($grpItemData['quantity']*$quantity)." where id='".slash($grpItemData['item_id'])."'", $dblink);
				}
			}	
			doquery("update items set quantity=quantity-".$quantity." where id='".slash($item_id)."'", $dblink);
		}
		doquery("update sales set total_items=".$total_quantity.",total_price='".$grand_total_price."', discount='".$discount."', net_price='".($grand_total_price-$discount)."', cash_receive='".$cash_receive."', cash_return='".$cash_return."' where id='".$sale_id."'", $dblink);
		if( !empty( $payment_account_id ) && $payment_amount > 0 ) {
			doquery( "insert into customer_payment(customer_id, account_id, datetime_added, amount, details) values( '".slash( $customer_id )."', '".slash( $payment_account_id )."', '".datetime_dbconvert($datetime_added)."', '".slash($payment_amount)."', 'Payment againset Sales #".$sale_id."' )", $dblink );
			$customer_payment_id = inserted_id();
			doquery( "update sales set customer_payment_id = '".slash( $customer_payment_id )."' where id = '".$sale_id."'", $dblink );
		}
		if(!empty($_FILES["bill_image"]["tmp_name"])){
			$bill_image=getFilename($_FILES["bill_image"]["name"], $sale_id);
			move_uploaded_file($_FILES["bill_image"]["tmp_name"], $file_upload_root."sale_bill/".$bill_image);
			$sql="Update sales set bill_image='".$bill_image."' where id=$sale_id";
			doquery($sql,$dblink);
		}
		unset($_SESSION["sales_manage"]["add"]);
		header('Location: sales_manage.php?tab=list'.($_POST["sales_add"]!='SAVE'?'&print='.$sale_id:'').'&msg='.url_encode("Sucessfully Added"));
		die;
	}
	else{
		foreach($_POST as $key=>$value)
			$_SESSION["sales_manage"]["add"][$key]=$value;
		header('Location: sales_manage.php?tab=add&err='.url_encode($err));
		die;
	}
}