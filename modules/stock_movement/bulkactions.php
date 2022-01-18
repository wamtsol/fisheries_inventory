<?php
if(!defined("APP_START")) die("No Direct Access");

if(isset($_GET["action"]) && $_GET["action"]!=""){
	$bulk_action=$_GET["action"];
	$id=explode(",",urldecode($_GET["Ids"]));	
	$err="";
	if($bulk_action=="null"){
		$err.="Select Action. <br>";
	}
	if(!isset($_GET["Ids"]) || $_GET["Ids"]==""){
		$err.="Select Records. <br>";	
	}
	if(empty($err)){
		if($bulk_action=="delete"){
			$i=0;
			while($i<count($id)){
				$stock_movement = doquery( "select * from stock_movement where id = '".$id[$i]."' ", $dblink );
				if( numrows( $stock_movement ) > 0 ) {
					$stock_movement = dofetch( $stock_movement );
					if( $stock_movement[ "status" ]==1 ) {
						$rs=doquery("select * from stock_movement_items where stock_movement_id='".$id[$i]."'", $dblink);
						if(numrows($rs)){
							while($r=dofetch($rs)){
								$quantity=$r["quantity"];
								$GrpItems=doquery("select * from item_group where group_item_id='".slash($deleted_item[ "item_id" ])."'", $dblink);
								if(numrows($GrpItems) > 0){
									while($grpItemData=dofetch($GrpItems)){
										doquery("update items set quantity=quantity+".($grpItemData['quantity']*$deleted_item[ "quantity" ])." where id='".slash($grpItemData['item_id'])."'", $dblink);
									}
								}
								doquery("update items set quantity=quantity+".$quantity." where id='".slash($r["item_id"])."'", $dblink);
							}
						}
					}
					doquery("delete from stock_movement_items where stock_movement_id='".$id[$i]."'",$dblink);
					doquery("delete from stock_movement where id='".$id[$i]."'",$dblink);
				}
				$i++;
			}
			header("Location: stock_movement_manage.php?tab=list&msg=".url_encode("Records Deleted."));
			die;
		}
		if($bulk_action=="statuson"){
			$i=0;
			while($i<count($id)){
				$rec = doquery( "select * from stock_movement where id='".$id[$i]."'", $dblink );
				if( numrows( $rec ) > 0 ) {
					$rec = dofetch( $rec );
					if( $rec[ "status" ] == 0 ) { //Add Stock
						$rs=doquery("select * from stock_movement_items where stock_movement_id='".$id[$i]."'", $dblink);
						if(numrows($rs)){
							while($r=dofetch($rs)){
								$quantity=$r["quantity"];
								doquery("update items set quantity=quantity-".$quantity." where id='".slash($r["item_id"])."'", $dblink);
							}
						}
					}
				}
				doquery("update stock_movement set status=1 where id='".$id[$i]."'",$dblink);
				$i++;
			}
			header("Location: stock_movement_manage.php?tab=list&msg=".url_encode("Records Status On."));
			die;
		}
		if($bulk_action=="statusof"){
			$i=0;
			while($i<count($id)){
				$rec = doquery( "select * from stock_movement where id='".$id[$i]."'", $dblink );
				if( numrows( $rec ) > 0 ) {
					$rec = dofetch( $rec );
					if( $rec[ "status" ] == 1 ) { //Remove Stock
						$rs=doquery("select * from stock_movement_items where stock_movement_id='".$id[$i]."'", $dblink);
						if(numrows($rs)){
							while($r=dofetch($rs)){
								$quantity=$r["quantity"];
								doquery("update items set quantity=quantity+".$quantity." where id='".slash($r["item_id"])."'", $dblink);
							}
						}
					}
				}
				doquery("update stock_movement set status=0 where id='".$id[$i]."'",$dblink);
				$i++;
			}
			header("Location: stock_movement_manage.php?tab=list&msg=".url_encode("Records Status Off."));
			die;
		}
	}
	else{
		header("Location: stock_movement_manage.php?tab=list&err=".url_encode($err));
		die;					
	}
}
else{
	header("Location: index.php");
	die;	
}