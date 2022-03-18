<?php
if(!defined("APP_START")) die("No Direct Access");
$rs = doquery( $sql, $dblink );
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Stock Issued List</title>
<style>
body{
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px;
}
.print-list{
}
.print-list h3{
	font-size:20px;
	text-transform:uppercase;
	text-align:center;
	margin: 10px 0 0;
}
.print-list p{
	font-size:16px;
	text-align:center;
	margin: 10px 0 10px;
}
.print-list table{
	width:100%;
	border-collapse: collapse;
	text-align:left;
}
.print-list table th,.print-list table td{
	border:1px solid #000;
	padding: 5px;
	font-size: 14px;
}
</style>
</head>
<body>
<div class="print-list">
	<h3>Stock Issued List</h3>
    <p>
        <?php
        if( !empty( $date_from ) || !empty( $date_to ) ){
            echo "<br />Date";
        }
        if( !empty( $date_from ) ){
            echo " from ".$date_from;
        }
        if( !empty( $date_to ) ){
            echo " to ".$date_to;
        }
        if( !empty( $q ) ){
            echo " Detail: ".$q;
        }
        if( !empty( $trade_id ) ){
            echo " Trade: ".get_field($trade_id, "trade", "title");
        }
        if( !empty( $location_id ) ){
            echo " Location: ".get_field($location_id, "location", "title");
        }
        ?>
    </p>
	<table class="table table-hover list">
            <tr>
                <th width="5%" style="text-align:center">S#</th>
                <th style="text-align:center" width="5%">ID</th>
                <th width="15%">Date</th>
                <th width="10%">Issued to</th>
                <th width="12%">Trade</th>
                <th width="12%">District</th>
                <th width="30%" colspan="3">Items</th>
                <th width="25%">Detail</th>
            </tr>
            <?php
            if(numrows($rs)>0){
                $sn=1;
                while($r=dofetch($rs)){
                    $total_qty = $total_qty_issued = 0;
                    ?>
                    <tr>
                    	<td style="text-align:center"><?php echo $sn++?></td>
                        <td style="text-align:center"><?php echo $r["id"]?></td>
                        <td><?php echo date_convert($r["date"]); ?></td>
                        <td><?php echo unslash($r["issued_to"]); ?></td>
                        <td><?php echo get_field($r["trade_id"], "trade", "title"); ?></td>
                        <td><?php echo get_field($r["location_id"], "location", "title"); ?></td>
                        <td colspan="3">
                            <?php 
                            $placement_items = doquery("select * from placement_item where placement_id = '".$r["id"]."'", $dblink);
                            if(numrows($placement_items)>0){
                                ?>
                                <table width="100%" class="items_col">
                                    <!-- <tr>
                                        <th width="75%">Item</th>
                                        <th width="25%">Quantity</th>
                                    </tr> -->
                                    <?php 
                                    while($placement_item=dofetch($placement_items)){
                                        $total_qty += $placement_item["quantity"];
					                    $total_qty_issued += $placement_item["quantity_issued"];
                                        ?>
                                        <tr>
                                            <td width="50%"><?php echo get_field($placement_item["item_id"], "item", "title")?></td>
                                            <td width="25%" class="text-right"><?php echo unslash($placement_item["quantity"])?></td>
                                            <td width="25%" class="text-right"><?php echo unslash($placement_item["quantity_issued"])?></td>
                                        </tr>
                                        <?php 
                                    }
                                    ?>
                                    <tr>
                                        <th>Total</th>
                                        <th><?php echo $total_qty?></th>
                                        <th><?php echo $total_qty_issued?></th>
                                    </tr>
                                </table>
                                <?php
                            }
                            ?>
                        </td>
                        <td><?php echo unslash($r["note"]); ?></td>
                    </tr>
                    <?php
                }
            }
            ?>
        </table>
</div>
</body>
</html>
<?php
die;
//}