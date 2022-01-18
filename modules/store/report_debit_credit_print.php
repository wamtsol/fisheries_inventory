<?php
if(!defined("APP_START")) die("No Direct Access");
include("report_debit_credit_do.php");
?>
<style>
h1, h2, h3, p {
    margin: 0 0 10px;
}

body {
    margin:  0;
    font-family:  Arial;
    font-size:  11px;
}
.head th, .head td{ border:0;}
th, td {
    border: solid 1px #000;
    padding: 5px 5px;
    font-size: 11px;
	vertical-align:top;
}
table table th, table table td{
	padding:3px;
}
table {
    border-collapse:  collapse;
	max-width:900px;
	margin:0 auto;
}
</style>
<table width="100%" cellspacing="0" cellpadding="0">
<tr class="head">
	<th colspan="6">
    	<h1><?php echo get_config( 'site_title' )?></h1>
    	<h2>Store Ledger</h2>
        <p>
			<?php echo $store["title"]?>
        </p>
    </th>
</tr>
<tr>
    <th width="5%" align="center">S.no</th>
    <th>Date</th>
    <th>Details</th>                
    <th align="right">Debit</th>
	<th align="right">Credit</th>
    <th align="right">Balance</th>
</tr>
<?php 
$rs=doquery( $sql, $dblink );
if(numrows($rs)>0){
	$sn=1;
	?>
	<tr>
		<td colspan="2"></td>
		<td><?php echo $order == 'desc'?'Closing':'Opening'?> Balance</td>
		<td></td>
		<td></td>
		<td align="right"><?php echo curr_format( $balance )?></td>
	</tr>
	<?php
	while($r=dofetch($rs)){
		?>
		<tr>
			<td class="text-center"><?php echo $sn;?></td>
			<td><?php echo datetime_convert($r["date"]); ?></td>
			<td><?php echo unslash($r["details"]); ?></td>
			<td align="right"><?php echo curr_format($r["debit"]); ?></td>
			<td align="right"><?php echo curr_format($r["credit"]); ?></td>
			<td align="right"><?php if($order == 'asc'){$balance += ($r["credit"])-$r["debit"]*($order == 'desc'?'-1':1);} echo curr_format( $balance ); if($order == 'desc'){$balance += ($r["credit"]-$r["debit"])*($order == 'desc'?'-1':1);} ?></td>
		</tr>
		<?php
	}
	?>
	<tr>
		<td colspan="2"></td>
		<td><?php echo $order != 'desc'?'Closing':'Opening'?> Balance</td>
		<td></td>
		<td></td>
		<td align="right"><?php echo curr_format( $balance )?></td>
	</tr>
	<?php
}
else{	
	?>
	<tr>
		<td colspan="6"  class="no-record">No Result Found</td>
	</tr>
	<?php
}
?>
</table>
<?php
die;