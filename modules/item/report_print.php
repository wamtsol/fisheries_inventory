<?php
if(!defined("APP_START")) die("No Direct Access");
$rs = doquery( $sql, $dblink );
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Item List</title>
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
	<h3>Item List</h3>
    <p>
        <?php
        if( !empty( $type ) ){
            if($type==1){
                echo "Consumable";
            }
            elseif($type==2){
                echo "Non Consumable";
            }
            else{
                echo "--";
            }
        }
        if( !empty( $q ) ){
            echo " Title: ".$q;
        }
        ?>
    </p>
	<table class="table table-hover list">
            <tr>
                <th width="5%" style="text-align:center">S#</th>
                <th style="text-align:center" width="5%">ID</th>
                <th>Title</th>
                <th width="10%">Type</th>
                <th width="10%">Unit</th>
                <th width="10%">Purchased</th>
                <th width="10%">Issued</th>
                <th width="10%">Balance</th>
            </tr>
            <?php
            $total_p = $total_i = $total_b = 0;
            if(numrows($rs)>0){
                $sn=1;
                while($r=dofetch($rs)){
                    $total_p += $r["purchased"];
                    $total_i += $r["issued"];
                    $total_b += $r["purchased"]-$r["issued"];
                    if($r["type"]==1){
                        $typename = "Consumable";
                    }
                    elseif($r["type"]==2){
                        $typename = "Non Consumable";
                    }
                    else{
                        $typename = "--";
                    }
                    if($r["unit"]==1){
                        $unit = "PKT";
                    }
                    elseif($r["unit"]==2){
                        $unit = "Nos";
                    }
                    else{
                        $unit = "--";
                    }
                    ?>
                    <tr>
                    	<td style="text-align:center"><?php echo $sn++?></td>
                        <td style="text-align:center"><?php echo $r["id"]?></td>
                        <td><?php echo unslash($r["title"]); ?></td>
                        <td><?php echo $typename; ?></td>
                        <td><?php echo $unit; ?></td>
                        <td><?php echo $r["purchased"]; ?></td>
                        <td><?php echo $r["issued"]; ?></td>
                        <td><?php echo $r["purchased"]-$r["issued"]; ?></td>
                    </tr>
                    <?php
                }
                ?>
                <tr>
                    <th style="text-align:right" colspan="5">Total</th>
                    <th><?php echo $total_p?></th>
                    <th><?php echo $total_i?></th>
                    <th><?php echo $total_b?></th>
                </tr>
                <?php
            }
            ?>
        </table>
</div>
</body>
</html>
<?php
die;
//}