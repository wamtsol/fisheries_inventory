<?php
if(!defined("APP_START")) die("No Direct Access");
$q="";
$extra='';
$is_search=false;
if(isset($_GET["start_date"])){
	$start_date=slash($_GET["start_date"]);
	$_SESSION["supplier_manage"]["report"][ "start_date" ]=$start_date;
}
if(isset($_SESSION["supplier_manage"]["report"][ "start_date" ]))
	$start_date=$_SESSION["supplier_manage"]["report"][ "start_date" ];
else
	$start_date=date("01/m/Y");
if(!empty($start_date)){
	$extra.=" and datetime_added>='".date('Y-m-d',strtotime(date_dbconvert($start_date)))." 00:00:00'";
	$is_search=true;
}
if(isset($_GET["end_date"])){
	$end_date=slash($_GET["end_date"]);
	$_SESSION["supplier_manage"]["report"][ "end_date" ]=$end_date;
}
if(isset($_SESSION["supplier_manage"]["report"][ "end_date" ]))
	$end_date=$_SESSION["supplier_manage"]["report"][ "end_date" ];
else
	$end_date=date("d/m/Y");
if(!empty($end_date)){
	$extra.=" and datetime_added<'".date('Y-m-d',strtotime(date_dbconvert($end_date)))." 23:59:59'";
	$is_search=true;
}
?>
<div class="page-header">
	<h1 class="title"><?php echo $supplier["supplier_name"]?></h1>
  	<ol class="breadcrumb">
    	<li class="active"><?php echo $supplier["phone"]?></li>
  	</ol>
  	<div class="right">
    	<div class="btn-group" role="group" aria-label="..."> 
        	<a href="supplier_manage.php?tab=list" class="btn btn-light editproject">Back to List</a> 
            <a id="topstats" class="btn btn-light" href="#"><i class="fa fa-search"></i></a>
        </div>
  	</div>
</div>
<ul class="topstats clearfix search_filter"<?php if($is_search) echo ' style="display: block"';?>>
	<li class="col-xs-12 col-lg-12 col-sm-12">
        <div>
        	<form class="form-horizontal" action="" method="get">
                <input type="hidden" name="tab" value="report" />
                <input type="hidden" name="id" value="<?php echo $supplier["id"]?>" />
                <span class="col-sm-2 text-to">Date From</span>
                <div class="col-sm-3">
                    <input type="text" title="Enter Date From" name="start_date" id="start_date" placeholder="" class="form-control date-picker"  value="<?php echo $start_date?>" >
                </div>
                <span class="col-sm-2 text-to">Date To</span>
                <div class="col-sm-3">
                    <input type="text" title="Enter Date To" name="end_date" id="end_date" placeholder="" class="form-control date-picker"  value="<?php echo $end_date?>" >
                </div>
                
                <div class="col-sm-2 text-left">
                    <input type="button" class="btn btn-danger btn-l reset_search" value="Reset" alt="Reset Record" title="Reset Record" />
                    <input type="submit" class="btn btn-default btn-l" value="Search" alt="Search Record" title="Search Record" />
                </div>
          	</form>
        </div>
  	</li>
</ul>
<div class="panel-body table-responsive">
	<table class="table table-hover list">
    	<thead>
            <tr>
                <th width="5%" class="text-center">S.no</th>
                <th>Date</th>
                <th>Transaction</th>
                <th>Details</th>
                <th class="text-right">Amount</th>
                <th class="text-right">Balance</th>
            </tr>
    	</thead>
    	<tbody>
			<?php 
            $sql="select id, datetime_added, 'Purchase' as type, '' as details, net_price as amount from purchase where supplier_id='".$supplier[ "id" ]."' $extra union select id, datetime_added, 'Payment' as type, details, -amount from supplier_payment where supplier_id='".$supplier["id"]."' ".str_replace( "datetime_added", "datetime_added", $extra)." order by datetime_added";
			$balance = 0;
			$rs = dofetch(doquery( "select sum(amount) as user_balance from (select datetime_added, net_price as amount from purchase where supplier_id='".$supplier[ "id" ]."' and datetime_added<'".date('Y-m-d',strtotime(date_dbconvert($start_date)))." 00:00:00' union select datetime_added, -amount from supplier_payment where supplier_id='".$supplier["id"]."' and datetime_added<'".date('Y-m-d',strtotime(date_dbconvert($start_date)))." 00:00:00') as transaction", $dblink ));
			$balance = $rs[ "user_balance" ];
            $rs1=show_page($rows, $pageNum, $sql);
            ?>
			<tr>
                <td class="text-right" colspan="4"><strong>Opening Balance</strong></td>
                <td class="text-right"><?php echo curr_format($balance); ?></td>
            </tr>
			<?php
			if(numrows($rs1)>0){
                $sn=1;
                while($r=dofetch($rs1)){             
					$balance+=$r["amount"];
                    ?>
                    <tr>
                        <td class="text-center"><?php echo $sn;?></td>
                        <td><?php echo datetime_convert($r["datetime_added"]); ?></td>
                        <td><?php echo unslash($r["type"]); ?></td>
                        <td><?php echo unslash($r["details"]); ?></td>
                        <td class="text-right"><?php echo curr_format($r["amount"]); ?></td>
                        <td class="text-right"><?php echo curr_format($balance); ?></td>
                    </tr>
                    <?php 
                    $sn++;
                }
                ?>
                <tr>
                    <td colspan="6" class="paging" title="Paging" align="right"><?php echo pages_list($rows, "supplier", $sql, $pageNum)?></td>
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
    	</tbody>
  	</table>
</div>
