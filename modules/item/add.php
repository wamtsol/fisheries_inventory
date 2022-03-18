<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_SESSION["item_manage"]["add"])){
	extract($_SESSION["item_manage"]["add"]);	
}
else{
	$title="";
    $type="";
    $unit="";
}
?>
<div class="page-header">
	<h1 class="title">Add New Item</h1>
  	<ol class="breadcrumb">
    	<li class="active">
        	Manage Item
        </li>
  	</ol>
  	<div class="right">
    	<div class="btn-group" role="group" aria-label="..."> <a href="item_manage.php" class="btn btn-light editproject">Back to List</a> </div>
  	</div>
</div>
<form class="form-horizontal form-horizontal-left" role="form" action="item_manage.php?tab=add" method="post" enctype="multipart/form-data" name="frmAdd"  onSubmit="return checkFields();">
    <div class="form-group">
        <div class="row">
        	<div class="col-sm-2 control-label">
            	<label class="form-label" for="type">Type </label>
            </div>
            <div class="col-sm-10">
                <select name="type" id="type">
                    <option value=""<?php echo $type==""?' selected="selected"':''?>>Select Type</option>
                    <option value="1"<?php echo $type=="1"?' selected="selected"':''?>>Consumable</option>
                    <option value="2"<?php echo $type=="2"?' selected="selected"':''?>>Non Consumable</option>
                </select>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="row">
        	<div class="col-sm-2 control-label">
            	<label class="form-label" for="title">Title <span class="manadatory">*</span> </label>
            </div>
            <div class="col-sm-10">
                <input type="text" title="Enter Title" value="<?php echo $title; ?>" name="title" id="title" class="form-control" />
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="row">
        	<div class="col-sm-2 control-label">
            	<label class="form-label" for="unit">Unit </label>
            </div>
            <div class="col-sm-10">
                <select name="unit" id="unit">
                    <option value="0"<?php echo $unit=="0"?' selected="selected"':''?>>Select Unit</option>
                    <option value="1"<?php echo $unit=="1"?' selected="selected"':''?>>PKT</option>
                    <option value="2"<?php echo $unit=="2"?' selected="selected"':''?>>Nos</option>
                </select>
            </div>
        </div>
    </div>

    <div class="form-group">
    	<div class="row">
            <div class="col-sm-2 control-label">
                <label for="company" class="form-label"></label>
            </div>
            <div class="col-sm-10">
                <input type="submit" value="SUBMIT" class="btn btn-default btn-l" name="item_add" title="Submit Record" />
            </div>
        </div>
  	</div>  
</form>