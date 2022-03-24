<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_POST["action"])){
	$response = array();
	switch($_POST["action"]){
		case 'get_date':
			$response = date_convert( date( "Y-m-d" ) );
		break;
		case "get_location":
			$rs = doquery( "select * from location where status = 1 order by title", $dblink );
			$locations = array();
			if( numrows( $rs ) > 0 ) {
				while( $r = dofetch( $rs ) ) {
					$locations[] = array(
						"id" => $r[ "id" ],
						"title" => unslash($r[ "title" ])
					);
				}
			}
			$response = $locations;
		break;
		case "get_item":
			$rs = doquery( "select * from item where status = 1 order by title", $dblink );
			$items = array();
			if( numrows( $rs ) > 0 ) {
				while( $r = dofetch( $rs ) ) {
					$items[] = array(
						"id" => $r[ "id" ],
						"title" => unslash($r[ "title" ]),
					);
				}
			}
			$response = $items;
		break;
		case "get_trade":
			$rs = doquery( "select * from trade where status = 1 order by title", $dblink );
			$trades = array();
			if( numrows( $rs ) > 0 ) {
				while( $r = dofetch( $rs ) ) {
					$trades[] = array(
						"id" => $r[ "id" ],
						"title" => unslash($r[ "title" ])
					);
				}
			}
			$response = $trades;
		break;
		case "get_purchase_items":
			$items = array();
			if( !empty( $_POST[ "id" ] ) ) {
				$rs = doquery( "select item_id, quantity from placement_item where placement_id = '".slash( $_POST[ "id" ] )."'", $dblink );
				if( numrows( $rs ) > 0 ) {
					while( $r = dofetch( $rs ) ){
						$items[ $r[ "item_id" ] ] = $r[ "quantity" ];
					}
				}
			}
			$rs = doquery( "SELECT a.*, b.title, b.id as itemID FROM `supply_item` a left join item b on a.item_id = b.id where b.status=1", $dblink );
			$purchase_items = array();
			if( numrows( $rs ) > 0 ) {
				while( $r = dofetch( $rs ) ) {
					$item_name = unslash($r[ "title" ]);
					$quantity = $r[ "quantity" ];
					if( isset( $items[ $r[ "id" ] ] ) ){
						// $quantity -= $items[ $r[ "id" ] ];
					}
					if( $quantity > 0 ) {
						$purchase_items[] = array(
							"id" => $r[ "id" ],
							"item_id" => $r[ "itemID" ],
							"item_name" => $item_name,
							"quantity" => $quantity,
						);
					}
				}
			}
			$response = $purchase_items;
		break;
		case "get_placement":
			$id = slash( $_POST[ "id" ] );
			$rs = doquery( "select * from placement where id='".$id."'", $dblink );
			if( numrows( $rs ) > 0 ) {
				$r = dofetch( $rs );
				$placement = array(
					"id" => $r[ "id" ],
					"date" => date_convert( $r[ "date" ] ),
					"location_id" => $r[ "location_id" ],
					"note" => unslash($r[ "note" ]),
					"trade_id" => $r[ "trade_id" ],
					"issued_to" => unslash($r[ "issued_to" ])
				);
				$items = array();
				$rs = doquery( "select * from placement_item where placement_id='".$id."' order by id", $dblink );
				if( numrows( $rs ) > 0 ) {
					while( $r = dofetch( $rs ) ) {
						$items[] = $r;
					}
				}
				$placement[ "items" ] = $items;
			}
			$response = $placement;
		break;
		case "save_placement":
			$err = array();
			$placement = json_decode( $_POST[ "placement" ] );
			if( empty( $placement->date )  ) {
				$err[] = "Fields with * are mandatory";
				
			}
			if( count( $placement->items ) == 0 ) {
				$err[] = "Add some items first.";
			}
			else {
				$i=1;
				foreach( $placement->items as $item ) {
					if( empty( $item->item_id ) || empty( $item->quantity ) ){
						$err[] = "Fill all the required fields on Row#".$i;
					}
					$i++;
				}
			}
			if( count( $err ) == 0 ) {
				if( !empty( $placement->id ) ) {
					doquery( "update placement set `date`='".slash(date_dbconvert(unslash($placement->date)))."', `trade_id`='".slash($placement->trade_id)."', `issued_to`='".slash($placement->issued_to)."', `location_id`='".slash($placement->location_id)."', `note`='".slash($placement->note)."' where id='".$placement->id."'", $dblink );
					$placement_id = $placement->id;
				}
				else {
					doquery( "insert into placement (date, location_id, issued_to, trade_id, note) VALUES ('".slash(date_dbconvert($placement->date))."', '".slash($placement->location_id)."', '".slash($placement->issued_to)."', '".slash($placement->trade_id)."', '".slash($placement->note)."')", $dblink );
					$placement_id = inserted_id();
				}
				$item_ids = array();
				foreach( $placement->items as $item ) {
					if( empty( $item->id ) ) {
						doquery( "insert into placement_item( placement_id, item_id, quantity, quantity_issued ) values( '".$placement_id."', '".$item->item_id."', '".$item->quantity."', '".$item->quantity_issued."' )", $dblink );
						$item_ids[] = inserted_id();
					}
					else {
						doquery( "update placement_item set `placement_id`='".$placement_id."', `item_id`='".$item->item_id."', `quantity`='".$item->quantity."', `quantity_issued`='".$item->quantity_issued."' where id='".$item->id."'", $dblink );
						$item_ids[] = $item->id;
					}
				}
				if( !empty( $placement->id ) && count( $item_ids ) > 0 ) {
					doquery( "delete from placement_item where placement_id='".$placement_id."' and id not in( ".implode( ",", $item_ids )." )", $dblink );
				}
				$response = array(
					"status" => 1,
					"id" => $placement_id
				);
			}
			else {
				$response = array(
					"status" => 0,
					"error" => $err
				);
			}
		break;
	}
	echo json_encode( $response );
	die;
}