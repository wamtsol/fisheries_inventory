<?php
if(!defined("APP_START")) die("No Direct Access");
?>
<div class="page-header">
	<h1 class="title">Edit Purchase</h1>
  	<ol class="breadcrumb">
    	<li class="active">Manage Purchase</li>
  	</ol>
  	<div class="right">
    	<div class="btn-group" role="group" aria-label="..."> <a href="purchase_manage.php" class="btn btn-light editproject">Back to List</a> </div>
  	</div>
</div>
<form action="purchase_manage.php?tab=edit" method="post" enctype="multipart/form-data" class="form-horizontal form-horizontal-left">
	<input type="hidden" name="id" value="<?php echo $id?>" />
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
                <label class="form-label" for="type">Type</label>
            </div>
            <div class="col-sm-10">
                <select name="type" id="type" class="margin-btm-5 selectbox">
                    <option value="0"<?php echo ($type=="0")? " selected":"";?>>Purchase</option>
                    <option value="1"<?php echo ($type=="1")? " selected":"";?>>Westage</option>
                </select>
            </div>
        </div>
  	</div>
    <div class="form-group">
    	<div class="row">
            <div class="col-sm-2 control-label">
                <label class="form-label" for="supplier_name">Supplier Name <span class="manadatory">*</span></label>
            </div>
            <div class="col-sm-10">
                <select name="supplier_id" id="supplier_id" class="margin-btm-5 selectbox">
                	<option value="">Select Supplier</option>
                    <?php
                    $rs = doquery( "select * from supplier where status=1 order by supplier_name", $dblink );
					if( numrows( $rs ) > 0 ) {
						while( $r = dofetch( $rs ) ) {
							?>
							<option value="<?php echo $r[ "id" ]?>" data-supplier_name="<?php echo htmlspecialchars(unslash($r[ "supplier_name" ]))?>" data-phone="<?php echo htmlspecialchars(unslash($r[ "phone" ]))?>" data-address="<?php echo htmlspecialchars(unslash($r[ "address" ]))?>" <?php echo $r["id"]==$supplier_id?" selected":""?>><?php echo unslash($r[ "supplier_name" ])?></option>
							<?php
						}
					}
					?>
                </select>
                <input type="text" title="Enter Supplier Name" value="<?php echo $supplier_name; ?>" name="supplier_name" id="supplier_name" class="form-control" >
            </div>
        </div>
  	</div>
    <div class="form-group">
    	<div class="row">
            <div class="col-sm-2 control-label">
                <label class="form-label" for="phone">Phone <span class="manadatory">*</span></label>
            </div>
            <div class="col-sm-10">
                <input type="text" title="Enter Contact Number" value="<?php echo $phone; ?>" name="phone" id="phone" class="form-control" >
            </div>
        </div>
  	</div>
    <div class="form-group">
    	<div class="row">
            <div class="col-sm-2 control-label">
                <label class="form-label" for="address">Address <span class="manadatory">*</span></label>
            </div>
            <div class="col-sm-10">
                <input type="text" title="Enter Address" value="<?php echo $address; ?>" name="address" id="address" class="form-control" >
            </div>
        </div>
  	</div>
    <div class="form-group">
    	<div class="row">
            <div class="col-sm-2 control-label">
                <label class="form-label" for="bill_image">Bill Image</label>
            </div>
            <div class="col-sm-10">
                <input type="file" title="Select Image" name="bill_image" id="bill_image" class="form-control">
                <?php if(!empty($bill_image)) { ?><a href="<?php echo $file_upload_root?>purchase_bill/<?php echo $bill_image; ?>" target="_blank"><img src="<?php echo $file_upload_root?>purchase_bill/<?php echo $bill_image; ?>"  alt="image" title="<?php echo $id;?>" style="width: 50px;margin-right: 10px;" /></a><input type="checkbox" name="delete_image" id="delete_image" class="delete-image" value="1" />&nbsp;<label for="delete_image">Delete This Image</label><?php } ?>
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
                      
                            <tr>
                                <th width="2%" class="text-center">S.no</th>
                                <th>Item</th>
                                <th width="10%" class="text-right">Unit Price / KG</th>
                                <th width="10%" class="text-right">Total Items</th>
                                <th width="10%" class="text-right">Total Price</th>
                                <th width="5%" class="text-center">Actions</th>
                            </tr>
                      
                      
                            <?php 
                            $sn=1;
                            if(count($items)>0){
                                foreach($items as $item){
                                    ?>
                                    <tr class="purchase_item">
                                        <td class="text-center serial_number"><?php echo $sn;?></td>
                                        <td>
                                            <select name="items[]" id="items<?php echo $sn?>" class="item_select">
                                                <option value="">Select Item</option>
                                                <?php
                                                $sql="select * from items where status=1 and type=0 order by title";
                                                $rs=doquery($sql, $dblink);
                                                if(numrows($rs)>0){
                                                    while($r=dofetch($rs)){
                                                        ?>
                                                        <option value="<?php echo $r["id"]?>"<?php if($items[$sn-1]==$r["id"]) echo ' selected="selected"';?>><?php echo unslash($r["title"])?></option>
                                                        <?php
                                                    }
                                                }
                                                ?>
                                            </select>
                                        </td>
                                        <td class="text-right"><input type="text" class="unit_price" name="unit_price[]" id="unit_price<?php echo $sn?>" value="<?php echo $unit_price[$sn-1]?>" /></td>
                                        <td class="text-right"><input type="number" class="quantity" name="quantity[]" id="quantity<?php echo $sn?>" value="<?php echo $quantity[$sn-1]?>" /></td>
                                        <td class="text-right"><input type="text" class="total_price"  id="total_price<?php echo $sn?>" value="" style="width: 100px;" /></td>
                                        <td class="text-center"><a href="#" data-id="<?php echo $sn?>" class="add_list_item" data-container_class="purchase_item">Add</a> - <a href="#" data-id="<?php echo $sn?>" class="delete_list_item" data-container_class="purchase_item">Delete</a></td>
                                    </tr>
                                    <?php 
                                    $sn++;
                                }
                            }
                            else{
                            ?>
                            <tr class="purchase_item">
                                <td class="text-center serial_number"><?php echo $sn;?></td>
                                <td>
                                    <select name="items[]" id="items<?php echo $sn?>"  class="item_select">
                                        <option value="">Select Item</option>
                                        <?php
                                        $sql="select * from items where status=1 and type=0 order by title";
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
                                <td class="text-right"><input type="text" id="unit_price<?php echo $sn?>"  name="unit_price[]" class="unit_price" value="" /></td>
                                <td class="text-right"><input type="number" class="quantity" name="quantity[]" id="quantity<?php echo $sn?>" value="1" /></td>
                                <td class="text-right"><input type="text" class="total_price" id="total_price<?php echo $sn?>" value="" /></td>
                                <td class="text-center"><a href="#" data-id="<?php echo $sn?>" class="add_list_item" data-container_class="purchase_item">Add</a> - <a href="#" data-id="<?php echo $sn?>" class="delete_list_item" data-container_class="purchase_item">Delete</a></td>
                            </tr>
                            <?php
                            }
                            ?>
                            <tr>
                                <th colspan="4" class="text-right">Total Items</th>
                                <th class="text-right grand_total_item"></th>
                                <th class="text-right">&nbsp;</th>
                            </tr>
                            <tr>
                                <th colspan="4" class="text-right">Discount</th>
                                <th class="text-right"><input type="number" class="discount" name="discount" id="discount" value="<?php echo $discount?>" style="text-align:right" data-container_class="purchase_item" /></th>
                                <th class="text-right">&nbsp;</th>
                            </tr>
                            <tr>
                                <th colspan="4" class="text-right">Total Price</th>
                                <th class="text-right grand_total_price"></th>
                                <th class="text-right">&nbsp;</th>
                            </tr>
                            <tr>
                                <th colspan="4" class="text-right">Payment Account</th>
                                <th class="text-right"><select name="payment_account_id">
                                	<option value="">Select Account</option>
                                    <?php
                                    $rs = doquery( "select * from account where status = 1 order by title", $dblink );
									if( numrows( $rs ) > 0 ) {
										while( $r = dofetch( $rs ) ) {
											?>
											<option value="<?php echo $r[ "id" ]?>"<?php echo $payment_account_id == $r[ "id" ]?" selected":""?>><?php echo unslash( $r[ "title" ] )?></option>
											<?php
										}
									}
									?>
                                </select></th>
                                <th class="text-right">&nbsp;</th>
                            </tr>
                            <tr>
                                <th colspan="4" class="text-right">Payment Amount</th>
                                <th class="text-right"><input type="text" class="payment_amount" name="payment_amount" id="payment_amount" value="<?php echo $payment_amount?>" style="text-align:right" /></th>
                                <th class="text-right">&nbsp;</th>
                            </tr>
                       
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
                <input type="submit" value="SUBMIT" class="btn btn-default btn-l" name="purchase_edit" title="Submit Record" />
            </div>
        </div>
  	</div>
</form>