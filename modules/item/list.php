<?php
if(!defined("APP_START")) die("No Direct Access");
?>
<div class="page-header">
	<h1 class="title">Manage Items</h1>
  	<ol class="breadcrumb">
    	<li class="active">
        	All Items
        </li>
  	</ol>
  	<div class="right">
    	<div class="btn-group" role="group" aria-label="..."> 
            
        	<?php if($admin_type["can_add"]==1){?><a href="item_manage.php?tab=add" class="btn btn-light editproject">Add New Item</a> <?php }?>
            <a id="topstats" class="btn btn-light" href="#"><i class="fa fa-search"></i></a> 
            <a class="btn print-btn" href="item_manage.php?tab=report"><i class="fa fa-print" aria-hidden="true"></i></a>
            <a class="btn print-btn" href="item_manage.php?tab=report_print">Print</a>
    	</div> 
    </div> 
</div>
<ul class="topstats clearfix search_filter"<?php if($is_search) echo ' style="display: block"';?>>
    <li class="col-xs-12 col-lg-12 col-sm-12">
    	<div>
        	<form class="form-horizontal" action="" method="get">
                <div class="col-sm-3">
                  <input type="text" title="Enter String" value="<?php echo $q;?>" name="q" id="search" class="form-control" >  
                </div>
                <div class="col-sm-3">
                    <select name="type" id="type">
                        <option value=""<?php echo $type==""?' selected="selected"':''?>>Select Type</option>
                        <option value="1"<?php echo $type=="1"?' selected="selected"':''?>>Consumable</option>
                        <option value="2"<?php echo $type=="2"?' selected="selected"':''?>>Non Consumable</option>
                    </select>
                </div>
                <div class="col-sm-2 col-xs-2 text-left">
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
                <th width="5%" class="text-center">S.No</th>
                <th class="text-center" width="5%"><div class="checkbox checkbox-primary">
                    <input type="checkbox" id="select_all" value="0" title="Select All Records">
                    <label for="select_all"></label></div></th>
                <th width="5%">ID</th>
                <th>Title</th>
                <th width="10%">Type</th>
                <th width="10%">Unit</th>
                <th width="15%">Quantity Purchased</th>
                <th width="12%">Quantity Issued</th>
                <th width="12%">Balance Stock</th>
                <th width="5%" class="text-center">Status</th>
                <th width="10%" class="text-center">Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $rs=show_page($rows, $pageNum, $sql);
            if(numrows($rs)>0){
                $sn=1;
                while($r=dofetch($rs)){       
                    // $supply_item = dofetch(doquery("select sum(quantity) as quantity from supply_item where item_id = '".$r["id"]."'", $dblink));
                    // $placement_item = dofetch(doquery("select sum(quantity) as quantity from placement_item where item_id = '".$r["id"]."'", $dblink));      
                    ?>
                    <tr>
                        <td class="text-center"><?php echo $sn;?></td>
                        <td class="text-center"><div class="checkbox margin-t-0 checkbox-primary">
                            <input type="checkbox" name="id[]" id="<?php echo "rec_".$sn?>"  value="<?php echo $r["id"]?>" title="Select Record" />
                            <label for="<?php echo "rec_".$sn?>"></label></div>
                        </td>
                        <td><?php echo $r["id"];?></td>
                        <td>
                            <?php echo unslash($r["title"]); ?>
                        </td>
                        <td>
                            <?php 
                                if($r["type"]==1){
                                    echo "Consumable";
                                }
                                elseif($r["type"]==2){
                                    echo "Non Consumable";
                                }
                                else{
                                    echo "--";
                                }
                            ?>
                        </td>
                        <td>
                            <?php 
                                if($r["unit"]==1){
                                    echo "PKT";
                                }
                                elseif($r["unit"]==2){
                                    echo "Nos";
                                }
                                else{
                                    echo "--";
                                }
                            ?>
                        </td>
                        <td>
                            <?php
                            echo $r["purchased"];
                            ?>
                        </td>
                        <td>
                            <?php
                            echo $r["issued"];
                            ?>
                        </td>
                        <td>
                            <?php
                            echo $r["purchased"]-$r["issued"];
                            ?>
                        </td>
                        <td class="text-center">
                            <a href="item_manage.php?id=<?php echo $r['id'];?>&tab=status&s=<?php echo ($r["status"]==0)?1:0;?>">
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
                            </a>
                        </td>
                        <td class="text-center">
                        <a href="item_manage.php?tab=print&id=<?php echo $r['id'];?>" class=""><img title="Print Label" alt="Print" src="images/view.png"></a>&nbsp;&nbsp;
                            <?php if($admin_type["can_edit"]==1){?><a href="item_manage.php?tab=edit&id=<?php echo $r['id'];?>"><img title="Edit Record" alt="Edit" src="images/edit.png"></a>&nbsp;&nbsp;<?php }?>
                            <?php if($admin_type["can_delete"]==1){?><a onclick="return confirm('Are you sure you want to delete')" href="item_manage.php?id=<?php echo $r['id'];?>&amp;tab=delete"><img title="Delete Record" alt="Delete" src="images/delete.png"></a><?php }?>
                        </td>
                    </tr>  
                    <?php 
                    $sn++;
                }
                ?>
                <tr>
                    <td colspan="6" class="actions">
                        <select name="bulk_action" class="" id="bulk_action" title="Choose Action">
                            <option value="null">Bulk Action</option>
                            <option value="delete">Delete</option>
                            <option value="statuson">Set Status On</option>
                            <option value="statusof">Set Status Off</option>
                        </select>
                        <input type="button" name="apply" value="Apply" id="apply_bulk_action" class="btn btn-light" title="Apply Action"  />
                    </td>
                    <td colspan="5" class="paging" title="Paging" align="right"><?php echo pages_list($rows, "item", $sql, $pageNum)?></td>
                </tr>
                <?php	
            }
            else{	
                ?>
                <tr>
                    <td colspan="11"  class="no-record">No Result Found</td>
                </tr>
                <?php
            }
            ?>
        </tbody>
     </table>
</div>
