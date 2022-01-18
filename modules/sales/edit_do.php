<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_POST["sales_edit"])){
	extract($_POST);
	$err="";
	if(empty($datetime_added) || empty($customer_name) || empty($phone) || count($items)==0){
		$err="Fields with (*) are Mandatory.<br />";
	}
	if(!empty($_FILES["bill_image"]["tmp_name"]) && !in_array($_FILES["bill_image"]["type"],$imagetypes)){
		$err.="Image format not supported. <br>";
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
					"quantity" => $quantity[$i],
					//"unit_price" => $unit_price[$i],
					//"total_price" => $total_price[$i]
				);
			}
		}
		$i++;
	}
	foreach($items_array as $item_id=>$item){
		$quantity=$item['quantity'];
		$sale_ItemQty = doquery("select  quantity from sales_items where sales_id='".slash($id)."' AND item_id='".slash($item_id)."'", $dblink);
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
		$sql="Update sales set `datetime_added`='".slash(datetime_dbconvert($datetime_added))."',`customer_name`='".slash($customer_name)."', phone='".slash($phone)."', address='".slash($address)."', customer_id='".slash($customer_id)."', town='".slash($town)."', type='".slash($type)."' where id='".$id."'";
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
			$sale_item = doquery( "select id, quantity from sales_items where sales_id='".slash($id)."' and item_id='".$item_id."'", $dblink );
			if( numrows($sale_item) > 0 ) {
				$sale_item = dofetch( $sale_item );
				$quantity_to_update -= $sale_item[ "quantity" ];
				doquery( "update sales_items set quantity='".$item[ "quantity" ]."', unit_price='".$item['unit_price']."', unit='".$item['unit']."', total_kg='".$item['total_kg']."', total_price='".($item_price)."' where id='".$sale_item[ "id" ]."'", $dblink );
			}
			else {
				doquery("insert into sales_items(sales_id, item_id, unit_price, unit, total_kg, quantity, total_price) values('".$id."', '".$item_id."', '".$item['unit_price']."', '".$item['unit']."', '".$item['total_kg']."', '".$item['quantity']."', '".$item_price."')", $dblink);
			}
			$GrpItems=doquery("select * from item_group where group_item_id='".slash($item_id)."'", $dblink);
			if(numrows($GrpItems) > 0){
				while($grpItemData=dofetch($GrpItems)){
					doquery("update items set quantity=quantity-".($grpItemData['quantity']*$quantity_to_update)." where id='".slash($grpItemData['item_id'])."'", $dblink);
				}
			}
			doquery("update items set quantity=quantity-".$quantity_to_update." where id='".slash($item_id)."'", $dblink);
		}
		$deleted_items = doquery( "select item_id, quantity from sales_items where sales_id='".$id."' and item_id not in (".implode(",", $item_ids).")", $dblink );
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
		doquery( "delete from sales_items where sales_id='".$id."' and item_id not in (".implode(",", $item_ids).")", $dblink );
		doquery("update sales set total_items=".$total_quantity.",total_price='".$grand_total_price."', discount='".$discount."', net_price='".($grand_total_price-$discount)."', cash_receive='".$cash_receive."', cash_return='".$cash_return."' where id='".$id."'", $dblink);
		$sales = dofetch( doquery( "select * from sales where id = '".$id."' ", $dblink ) );
		if( $payment_account_id > 0 ) {
			if( $sales[ "customer_payment_id" ] == 0 ) {
				doquery( "insert into customer_payment(customer_id, datetime_added, amount, account_id, details) values('".slash( $customer_id )."', '".datetime_dbconvert($datetime_added)."', '".$payment_amount."', '".$payment_account_id."', 'Receiving against Sales ID: #".$id."')", $dblink );
				$customer_payment_id = inserted_id();
				doquery( "update sales set customer_payment_id = '".$customer_payment_id."' where id ='".$id."'", $dblink);
			}
			else {
				$customer_payment = doquery( "select * from customer_payment where id = '".$sales[ "customer_payment_id" ]."'", $dblink );
				if( numrows( $customer_payment ) > 0 ) {
					$customer_payment = dofetch( $customer_payment );
					doquery( "update customer_payment set amount = '".$payment_amount."', account_id='".$payment_account_id."', datetime_added='".datetime_dbconvert($datetime_added)."' where id = '".$customer_payment[ "id" ]."'", $dblink );
				}
				else {
					doquery( "update sales set customer_payment_id = 0 where id = '".$id."'", $dblink );
				}
			}
		}
		else {
			if( $sales[ "customer_payment_id" ] > 0 ) {
				doquery( "delete from customer_payment where id = '".$sales[ "customer_payment_id" ]."'", $dblink );
				doquery( "update sales set customer_payment_id = 0 where id = '".$id."'", $dblink );
			}
		}
		if(!empty($_FILES["bill_image"]["tmp_name"]) || isset($delete_image)){
			$prev_icon=doquery("select bill_image from sales where id=$id",$dblink);
			if(numrows($prev_icon)>0){
				$p_icon=dofetch($prev_icon);
				deleteFile($file_upload_root."sale_bill/".$p_icon["bill_image"]);
				$sql="Update sales set bill_image='' where id='".$id."'";
				doquery($sql,$dblink);
			}
			if(!empty($_FILES["bill_image"]["tmp_name"])){
				$bill_image=getFilename($_FILES["bill_image"]["name"], $id);
				move_uploaded_file($_FILES["bill_image"]["tmp_name"], $file_upload_root."sale_bill/".$bill_image);
				$sql="Update sales set bill_image='".slash($bill_image)."' where id='".$id."'";
				doquery($sql,$dblink);
			}
		}
		unset($_SESSION["sales_manage"]["edit"]);
		header('Location: sales_manage.php?tab=list'.($_POST["sales_edit"]!='SAVE'?'&print='.$id:'').'&msg='.url_encode("Sucessfully Added"));
		die;
	}
	else{
		foreach($_POST as $key=>$value)
			$_SESSION["sales_manage"]["edit"][$key]=$value;
		header('Location: sales_manage.php?tab=edit&err='.url_encode($err)."&id=".$id);
		die;
	}
}
/*----------------------------------------------------------------------------------*/
if(isset($_GET["id"]) && $_GET["id"]!=""){
	$rs=doquery("select * from sales where id='".slash($_GET["id"])."'",$dblink);
	if(numrows($rs)>0){
		$r=dofetch($rs);
		foreach($r as $key=>$value)
			$$key=htmlspecialchars(unslash($value));
		$datetime_added=datetime_convert($datetime_added);
		$items=$quantity=array();
		$rs=doquery("select * from sales_items where sales_id='".$id."'", $dblink);
		if(numrows($rs)){
			while($r=dofetch($rs)){
				$items[]=$r["item_id"];
				$unit[]=$r["unit"];
				$total_kg[]=$r["total_kg"];
				$quantity[]=$r["quantity"];
				// $unit_price[]=$r["unit_price"];
				// $total_p[]=$r["total_price"];
			}
		}
		$payment_account_id = 0;
		$payment_amount = 0;
		if( $customer_payment_id > 0 ) {
			$customer_payment = doquery( "select * from customer_payment where id = '".$customer_payment_id."'", $dblink );
			if( numrows( $customer_payment ) > 0 ) {
				$customer_payment = dofetch( $customer_payment );
				$payment_account_id = $customer_payment[ "account_id" ];
				$payment_amount = $customer_payment[ "amount" ];
			}
		}
		if(isset($_SESSION["sales_manage"]["edit"]))
			extract($_SESSION["sales_manage"]["edit"]);
	}
	else{
		header("Location: sales_manage.php?tab=list");
		die;
	}
}
else{
	header("Location: sales_manage.php?tab=list");
	die;
}