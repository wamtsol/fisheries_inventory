<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_SESSION["store_payment_manage"]["add"])){
	extract($_SESSION["store_payment_manage"]["add"]);	
}
else{
	$store_id="";
	$datetime_added=date("d/m/Y H:i A");
	$amount="";
	$account_id="";
	$details="";
}
?>
<div class="page-header">
	<h1 class="title">Add New Store Payment</h1>
  	<ol class="breadcrumb">
    	<li class="active">Manage Store Payment</li>
  	</ol>
  	<div class="right">
    	<div class="btn-group" role="group" aria-label="..."> <a href="store_payment_manage.php" class="btn btn-light editproject">Back to List</a> </div>
  	</div>
</div>
<form action="store_payment_manage.php?tab=add" method="post" enctype="multipart/form-data" name="frmAdd"  onSubmit="return checkFields();" class="form-horizontal form-horizontal-left">
  	<div class="form-group">
    	<div class="row">
            <div class="col-sm-2 control-label">
                <label class="form-label" for="store_id">Store <span class="manadatory">*</span></label>
            </div>
            <div class="col-sm-10">
                <select name="store_id" title="Choose Option">
                    <option value="0">Select Store</option>
                    <?php
                    $res=doquery("select * from store where status=1 order by title", $dblink);
                    if(numrows($res)>0){
                        while($rec=dofetch($res)){
                        ?>
                        <option value="<?php echo $rec["id"]?>"<?php echo($store_id==$rec["id"])?"selected":"";?>><?php echo unslash($rec["title"]); ?></option>
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
                <label class="form-label" for="datetime_added">Datetime</label>
            </div>
            <div class="col-sm-10">
                <input type="text" title="Enter datetime" value="<?php echo $datetime_added; ?>" name="datetime_added" id="datetime_added" class="form-control date-timepicker" >
            </div>
        </div>
  	</div>
  	<div class="form-group">
    	<div class="row">
            <div class="col-sm-2 control-label">
                <label class="form-label" for="amount">Amount</label>
            </div>
            <div class="col-sm-10">
                <input type="text" title="Enter amount" value="<?php echo $amount; ?>" name="amount" id="amount" class="form-control" >
            </div>
        </div>
  	</div>
    <div class="form-group">
    	<div class="row">
            <div class="col-sm-2 control-label">
                <label class="form-label" for="account_id">Paid By </label>
            </div>
            <div class="col-sm-10">
                <select name="account_id" id="account_id" title="Choose Option" class="select_search">
                    <option value="">Select Account</option>
                    <?php
                    $res=doquery("select * from account where status=1 order by id", $dblink);
                    if(numrows($res)>0){
                        while($rec=dofetch($res)){
                        ?>
                        <option value="<?php echo $rec["id"]?>"<?php echo($rec["is_petty_cash"] == 1)?"selected":"";?>><?php echo unslash($rec["title"]); ?></option>
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
            	<label class="form-label" for="details">Details </label>
            </div>
            <div class="col-sm-10">
                 <textarea title="Enter Details" value="" name="details" id="details" class="form-control" /><?php echo $details; ?></textarea>
            </div>
        </div>
    </div>
    <div class="form-group">
    	<div class="row">
            <div class="col-sm-2 control-label">
                <label class="form-label" for="payment_image">Payment Image</label>
            </div>
            <div class="col-sm-10">
                <input type="file" title="Select Image" name="payment_image" id="payment_image" class="form-control">
            </div>
        </div>
  	</div>
  	<div class="form-group">
    	<div class="row">
            <div class="col-sm-2 control-label">
                <label for="company" class="form-label"></label>
            </div>
            <div class="col-sm-10">
                <input type="submit" value="SUBMIT" class="btn btn-default btn-l" name="store_payment_add" title="Submit Record" />
            </div>
        </div>
  	</div>
</form>