<?php
if(!defined("APP_START")) die("No Direct Access");

?>
<div class="page-header">
	<h1 class="title">Manage Stock Issued</h1>
  	<ol class="breadcrumb">
    	<li class="active">Stock Issued</li>
  	</ol>
  	<div class="right">
    	<div class="btn-group" role="group" aria-label="..."> 
        	<a href="placement_manage.php?tab=addedit" class="btn btn-light editproject">Add New Record</a> 
            <a id="topstats" class="btn btn-light" href="#"><i class="fa fa-search"></i></a>
            <a class="btn print-btn" href="placement_manage.php?tab=report"><i class="fa fa-print" aria-hidden="true"></i></a>
        </div>
  	</div>
</div>
<ul class="topstats clearfix search_filter"<?php if($is_search) echo ' style="display: block"';?>>
	<li class="col-xs-12 col-lg-12 col-sm-12">
        <div>
        	<form class="form-horizontal" action="" method="get">
                <div class="col-sm-2">
                	<select name="trade_id" id="trade_id" class="custom_select">
                        <option value=""<?php echo ($trade_id=="")? " selected":"";?>>Select Trade</option>
                        <?php
							$res=doquery("select * from trade where status = 1 order by title",$dblink);
							if(numrows($res)>=0){
								while($rec=dofetch($res)){
								?>
								<option value="<?php echo $rec["id"]?>" <?php echo($trade_id==$rec["id"])?"selected":"";?>><?php echo unslash($rec["title"])?></option>
								<?php
								}
							}	
                        ?>
                    </select>
                </div>
                <div class="col-sm-2">
                	<select name="location_id" id="location_id" class="custom_select">
                        <option value=""<?php echo ($location_id=="")? " selected":"";?>>Select District</option>
                        <?php
							$res=doquery("select * from location where status = 1 order by title",$dblink);
							if(numrows($res)>=0){
								while($rec=dofetch($res)){
								?>
								<option value="<?php echo $rec["id"]?>" <?php echo($location_id==$rec["id"])?"selected":"";?>><?php echo unslash($rec["title"])?></option>
								<?php
								}
							}	
                        ?>
                    </select>
                </div>
                <div class="col-sm-2">
                    <input type="text" title="Enter Date From" name="date_from" id="date_from" placeholder="From" class="form-control date-picker"  value="<?php echo $date_from?>" autocomplete="off">
                </div>
                <div class="col-sm-2">
                    <input type="text" title="Enter Date To" name="date_to" id="date_to" placeholder="To" class="form-control date-picker" value="<?php echo $date_to?>" autocomplete="off">
                </div>
                <div class="col-sm-2">
                  <input type="text" title="Enter String" value="<?php echo $q;?>" name="q" id="search" class="form-control" >  
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
                <th width="2%" class="text-center">S.no</th>
                <th class="text-center" width="3%"><div class="checkbox checkbox-primary">
                    <input type="checkbox" id="select_all" value="0" title="Select All Records">
                    <label for="select_all"></label></div></th>
                <th class="text-center" width="5%">ID</th>
                <th width="8%">
                    <a href="placement_manage.php?order_by=date&order=<?php echo $order=="asc"?"desc":"asc"?>" class="sorting">
                        Date
                        <?php
                            if( $order_by == "date" ) {
                                ?>
                                <span class="sort-icon">
                                    <i class="fa fa-angle-<?php echo $order=="asc"?"up":"down"?>" data-hover_in="<?php echo $order=="asc"?"down":"up"?>" data-hover_out="<?php echo $order=="desc"?"down":"up"?>" aria-hidden="true"></i>
                                </span>
                                <?php
                            }
                            ?>
                     </a>
                </th>
                <th width="10%">Issued to</th>
                <th width="12%">Trade</th>
                <th width="12%">District</th>
                <th width="30%" colspan="3">Items</th>
                <th width="25%">Detail</th>
                <th class="text-center" width="5%">Status</th>
                <th class="text-center" width="5%">Actions</th>
            </tr>
    	</thead>
    	<tbody>
			<?php 
            $rs=show_page($rows, $pageNum, $sql);
            if(numrows($rs)>0){
                $sn=1;
                while($r=dofetch($rs)){             
                    ?>
                    <tr>
                        <td class="text-center"><?php echo $sn;?></td>
                        <td class="text-center"><div class="checkbox margin-t-0 checkbox-primary">
                            <input type="checkbox" name="id[]" id="<?php echo "rec_".$sn?>"  value="<?php echo $r["id"]?>" title="Select Record" />
                            <label for="<?php echo "rec_".$sn?>"></label></div>
                        </td>
                        <td class="text-center"><?php echo $r["id"]?></td>
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
                                        ?>
                                        <tr>
                                            <td width="50%"><?php echo get_field($placement_item["item_id"], "item", "title")?></td>
                                            <td width="25%" class="text-right"><?php echo unslash($placement_item["quantity"])?></td>
                                            <td width="25%" class="text-right"><?php echo unslash($placement_item["quantity"])?></td>
                                        </tr>
                                        <?php 
                                    }
                                    ?>
                                </table>
                                <?php
                            }
                            ?>
                        </td>
                        <td><?php echo unslash($r["note"]); ?></td>
                        <td class="text-center"><a href="placement_manage.php?id=<?php echo $r['id'];?>&tab=status&s=<?php echo ($r["status"]==0)?1:0;?>">
                            <?php
                            if($r["status"]==0){
                                ?>
                                <img src="images/offstatus.png" alt="Off" title="Set Status On">
                                <?php
                            }
                            else{
                                ?>
                                <img src="images/onstatus.png" alt="On" title="Set Status Off">
                                <?php
                            }
                            ?>
                        </a></td>
                        <td class="text-center">
                            <a href="placement_manage.php?tab=addedit&id=<?php echo $r['id'];?>"><img title="Edit Record" alt="Edit" src="images/edit.png"></a>&nbsp;&nbsp;
                            <a onclick="return confirm('Are you sure you want to delete')" href="placement_manage.php?id=<?php echo $r['id'];?>&amp;tab=delete"><img title="Delete Record" alt="Delete" src="images/delete.png"></a>
                        </td>
                    </tr>
                    <?php 
                    $sn++;
                }
                ?>
                <tr>
                    <td colspan="7" class="actions">
                        <select name="bulk_action" id="bulk_action" title="Choose Action">
                            <option value="null">Bulk Action</option>
                            <option value="delete">Delete</option>
                            <option value="statuson">Set Status On</option>
                            <option value="statusof">Set Status Off</option>
                        </select>
                        <input type="button" name="apply" value="Apply" id="apply_bulk_action" class="btn btn-light" title="Apply Action"  />
                    </td>
                    <td colspan="6" class="paging" title="Paging" align="right"><?php echo pages_list($rows, "placement", $sql, $pageNum)?></td>
                </tr>
                <?php	
            }
            else{	
                ?>
                <tr>
                    <td colspan="13"  class="no-record">No Result Found</td>
                </tr>
                <?php
            }
            ?>
    	</tbody>
  	</table>
</div>
