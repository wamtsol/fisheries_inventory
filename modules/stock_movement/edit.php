<?php
if(!defined("APP_START")) die("No Direct Access");
?>
<div class="page-header">
	<h1 class="title">Edit Stock Movement</h1>
  	<ol class="breadcrumb">
    	<li class="active">Manage Stock Movement</li>
  	</ol>
  	<div class="right">
    	<div class="btn-group" role="group" aria-label="..."> <a href="stock_movement_manage.php" class="btn btn-light editproject">Back to List</a> </div>
  	</div>
</div>
<form action="stock_movement_manage.php?tab=edit" method="post" enctype="multipart/form-data" name="frmAdd"  onSubmit="return checkFields();" class="form-horizontal form-horizontal-left">
	<input type="hidden" name="id" value="<?php echo $id?>" id="transaction_id" />
	<?php
    	$i=0;
  	?>
  	<div class="form-group">
    	<div class="row">
            <div class="col-sm-2 control-label">
                <label class="form-label" for="datetime_added">Date <span class="manadatory">*</span></label>
            </div>
            <div class="col-sm-10">
                <input type="text" title="Enter Date" value="<?php echo $datetime_added; ?>" name="datetime_added" id="datetime_added" class="form-control date-timepicker" >
            </div>
        </div>
  	</div>
    <div class="form-group">
    	<div class="row">
            <div class="col-sm-2 control-label">
                <label class="form-label" for="store_id">Store<span class="manadatory">*</span></label>
            </div>
            <div class="col-sm-10">
                <select name="store_id" id="store_id" class="margin-btm-5 selectbox">
                	<option value="">Select Store</option>
                    <?php
                    $rs = doquery( "select * from store where status=1 order by title", $dblink );
					if( numrows( $rs ) > 0 ) {
						while( $r = dofetch( $rs ) ) {
							?>
							<option value="<?php echo $r[ "id" ]?>"<?php echo $store_id==$r["id"]?" selected":""?>><?php echo unslash($r[ "title" ])?></option>
							<?php
						}
					}
					?>
                </select>
            </div>
        </div>
  	</div>
    <div class="form-group">
    	<div class="row">
            <div class="col-sm-2 control-label">
                <label class="form-label">Items <span class="manadatory">*</span></label>
            </div>
            <div class="col-sm-10">
                <div class="panel-body table-responsive">
                    <table class="table table-hover list">
                        <thead>
                            <tr>
                                <th width="2%" class="text-center">S.no</th>
                                <th>Item</th>
                                <th width="10%" class="text-right">Unit Price</th>
                                <th width="10%">Unit</th>
                                <th width="12%" class="text-right">Total Items</th>
                                <th width="10%" class="text-right">Total KG</th>
                                <th width="12%" class="text-right">Total Price</th>
                                <th width="5%">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $sn=1;
                            if(count($items)>0){
                                foreach($items as $item){
                                    ?>
                                    <tr class="sale_item">
                                        <td class="text-center serial_number"><?php echo $sn;?></td>
                                        <td>
                                          <?php
											$groupItem='';
											$singleItem='';
                                        	$sql="select * from items where status=1 order by title";
                                        	$rs=doquery($sql, $dblink);
                                        	if(numrows($rs)>0){
                                            	/*while($r=dofetch($rs)){
													if($r['type']==1)
														$groupItem .='<option value="'. $r["id"].'"'.($items[$sn-1]==$r["id"] ? ' selected="selected"':'').'> '. unslash($r["title"]) .'  </option>';
													else
														$singleItem .='<option value="'. $r["id"].'"'.($items[$sn-1]==$r["id"] ? ' selected="selected"':'').'> '. unslash($r["title"]) .'  </option>';																
                                                	
                                            	}*/
												while($r=dofetch($rs)){
														if($r['type']==1)
															$groupItem .='<option value="'.$r["id"].'"'.($item==$r["id"]?" selected":"").'>'. unslash($r["title"]) .'  </option>';
														else
															$singleItem .='<option value="'.$r["id"].'"'.($item==$r["id"]?" selected":"").'> '. unslash($r["title"]) .'  </option>';  
                                                    }
                                        	}
                                        	?>  
                                      		<select name="items[]" id="items<?php echo $sn?>"  class="item_select">
                                        		<option value="">Select Item</option>  
                                        		<optgroup label="GroupItems">
                                                	<?php echo $groupItem;?>
                                                </optgroup>
                                                <optgroup label="Single Items">
                                                	<?php echo $singleItem;?>
                                                </optgroup>
                                        
                                    		</select>
                                        </td>
                                        <td><input type="text" class="unit_price1" name="unit_price[]" id="unit_price<?php echo $sn?>" value="" /></td>
                                        <td>
                                            <select name="unit[]" id="unit" class="unit">
                                                <option value="0"<?php echo ($unit[$sn-1]=="0")? " selected":"";?>>Unit Price</option>
                                                <option value="1"<?php echo ($unit[$sn-1]=="1")? " selected":"";?>>KG</option>       
                                            </select>
                                        </td>
                                        <td class="text-right"><input type="text" class="quantity" name="quantity[]" id="quantity<?php echo $sn?>" value="<?php echo $quantity[$sn-1]?>" /></td>
                                        <td class="text-right"><input type="number" class="total_kg" name="total_kg[]" id="total_kg<?php echo $sn?>" value="<?php echo $total_kg[$sn-1]?>" style="width: 72px;" /></td>
                                        <td class="text-right"><input type="text" class="total_price1"  id="total_price<?php echo $sn?>" value="" /></td>                        
                                         <td class="text-center"><a href="#" data-id="<?php echo $sn?>" class="add_list_item" data-container_class="sale_item">Add</a> - <a href="#" data-id="<?php echo $sn?>" class="delete_list_item" data-container_class="sale_item">Delete</a></td>
                                    </tr>
                                    <?php 
                                    $sn++;
                                }
                            }
                            else{
                            ?>
                            <tr class="sale_item">
                                <td class="text-center serial_number"><?php echo $sn;?></td>
                                <td>
                                    <select name="items[]" id="items<?php echo $sn?>"  class="item_select">
                                        <option value="">Select Item</option>
                                        <?php
                                        $sql="select * from items where status=1 order by title";
                                        $rs=doquery($sql, $dblink);
                                        if(numrows($rs)>0){
                                            while($r=dofetch($rs)){
                                                ?>
                                                <option value="<?php echo $r["id"]?>"><?php echo unslash($r["title"])?></option>
                                                <?php
                                            }
                                        }
                                        ?>
                                    </select>
                                </td>
                                <td><input type="text"  name="unit_price[]" id="unit_price<?php echo $sn?>" class="unit_price1"  readonly="readonly" value="" /></td>
                                <td>
                                    <select name="unit[]" id="unit" class="unit">
                                        <option value="0"<?php echo ($unit=="0")? " selected":"";?>>Unit Price</option>
                                        <option value="1"<?php echo ($unit=="1")? " selected":"";?>>KG</option>       
                                    </select>
                                </td>
                                <td class="text-right"><input type="text" class="quantity" name="quantity[]" id="quantity<?php echo $sn?>" value="1" /></td>
                                <td class="text-right"><input type="number" class="total_kg" name="total_kg[]" id="total_kg<?php echo $sn?>" value="0" style="width: 72px;" /></td>
                                <td class="text-right"><input type="text" class="total_price1" id="total_price<?php echo $sn?>" value="" /></td>                        
                                <td class="text-center"><a href="#" data-id="<?php echo $sn?>" class="add_list_item" data-container_class="sale_item">Add</a> - <a href="#" data-id="<?php echo $sn?>" class="delete_list_item" data-container_class="sale_item">Delete</a></td>
                            </tr>
                            <?php
                            }
                            ?>
                            <tr>
                                <th colspan="6" class="text-right">Total Items</th>
                                <th class="text-right grand_total_item"></th>
                                <th class="text-right">&nbsp;</th>
                            </tr>
                            <tr>
                                <th colspan="6" class="text-right">Discount</th>
                                <th class="text-right"><input type="number" class="discount" name="discount" id="discount" value="<?php echo $discount?>" style="text-align:right" data-container_class="sale_item" /></th>
                                <th class="text-right">&nbsp;</th>
                            </tr>
                            <tr>
                                <th colspan="6" class="text-right">Total Price</th>
                                <th class="text-right grand_total_price1"></th>
                                <th class="text-right">&nbsp;</th>
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
            </div>
    	</div>
    </div>
  	<div class="form-group">
    	<div class="row">
            <div class="col-sm-2 control-label">
                <label for="company" class="form-label"></label>
            </div>
            <div class="col-sm-10">
                <input type="submit" value="SAVE AND PRINT" class="btn btn-default btn-l" name="stock_movement_edit" title="Submit Record" />
                <input type="submit" value="SAVE" class="btn btn-success btn-l" name="stock_movement_edit" title="Submit Record" />
            </div>
        </div>
  	</div>
</form>