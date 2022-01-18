<?php
if(!defined("APP_START")) die("No Direct Access");
if(isset($_SESSION["expense_manage"]["add"])){
	extract($_SESSION["expense_manage"]["add"]);	
}
else{
	$employee_id="";
	$month="";
	$year="";
	$datetime_added=date("d/m/Y H:i A");
	$amount="";
}
?>
<div class="page-header">
	<h1 class="title">Add New Salary</h1>
  	<ol class="breadcrumb">
    	<li class="active">Manage Salary</li>
  	</ol>
  	<div class="right">
    	<div class="btn-group" role="group" aria-label="..."> <a href="salary_manage.php" class="btn btn-light editproject">Back to List</a> </div>
  	</div>
</div>
<form class="form-horizontal form-horizontal-left form-salary" role="form" action="salary_manage.php?tab=add" method="post" enctype="multipart/form-data" name="frmAdd"  onSubmit="return checkFields();">
    <?php
        $i=0;
    ?>
    <div class="form-group">
        <div class="row">
            <label class="col-sm-2 control-label no-padding-right" for="employee_id">Employee <span class="red">*</span></label>
            <div class="col-sm-10">
                <select name="employee_id" id="employee_id" class="col-xs-12" title="Choose Option">
                    <option value="0">Select Employee</option>
                    <?php
                    $res=doquery("Select * from admin order by name",$dblink);
                    if(numrows($res)>0){
                        while($rec=dofetch($res)){
                        ?>
                        <option value="<?php echo $rec["id"]?>"<?php echo($employee_id==$rec["id"])?"selected":"";?>><?php echo unslash($rec["name"]); ?></option>
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
            <label class="col-sm-2 control-label no-padding-right" for="month">Month </label>
            <div class="col-sm-10">
                <select name="month" title="Choose Option">
                    <option value="0">Select Month</option>
                    <?php
                    foreach ($month_array as $key=>$value) {
                        ?>
                        <option value="<?php echo $key?>"<?php echo $key==$month?' selected="selected"':""?>><?php echo $value ?></option>
                        <?php
                    }
                    ?>
                </select>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="row">
            <label class="col-sm-2 control-label no-padding-right" for="year">Year</label>
            <div class="col-sm-10">
                <input type="text" title="Enter Year" value="<?php echo $year; ?>" name="year" id="year" class="form-control" />
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="row">
            <div class="col-sm-2 control-label no-padding-right">
                <label class="form-label" for="datetime_added">DateTime</label>
            </div>
            <div class="col-sm-10">
                <input type="text" title="Enter DateTime" value="<?php echo $datetime_added; ?>" name="datetime_added" id="datetime_added" class="form-control date-timepicker" >
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="row">
            <label class="col-sm-2 control-label no-padding-right" for="amount">Amount</label>
            <div class="col-sm-10">
                <input type="text" title="Enter Amount" value="<?php echo $amount; ?>" name="amount" id="amount" class="form-control" />
            </div>
        </div>
    </div>
    <!--<div class="form-group">
    	<div class="row">
            <div class="col-md-2">
            	<div class="user-tabs">
                    <ul>
                        <li><a href="#">Admin</a></li>
                        <li><a href="#">Fayyaz Rao</a></li>
                        <li><a href="#">Waqar Memon</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-10">
            	<div class="user-tabs-inline">
                	<ul>
                        <li><a href="#">Summary</a></li>
                        <li><a href="#">Details</a></li>
                    </ul>
                </div>
                <div id="summary">
                	<div class="clearfix margin-btm-5">
                        <div class="col-md-6">
                            <div class="no-padding-right">
                                <label>Returned</label>
                            </div>
                            <div>
                                <input type="text" title="Enter Year" value="" name="" id="" class="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="no-padding-right">
                                <label>Returned</label>
                            </div>
                            <div class="">
                                <input type="text" title="Enter Year" value="" name="" id="" class="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="clearfix margin-btm-10">
                        <div class="col-md-6">
                            <div class="no-padding-right">
                                <label>Returned</label>
                            </div>
                            <div>
                                <input type="text" title="Enter Year" value="" name="" id="" class="form-control" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="no-padding-right">
                                <label>Returned</label>
                            </div>
                            <div class="">
                                <input type="text" title="Enter Year" value="" name="" id="" class="form-control" />
                            </div>
                        </div>
                    </div>
                </div>
                <div id="details">
                	<table class="table table-hover list sales-table">
                        <thead>
                            <tr>
                                <th class="text-center" width="5%">S.NO</th>
                                <th width="15%">Date</th>
                                <th>&nbsp;</th>
                                <th>&nbsp;</th>
                                <th>&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-center">1</td>
                                <td>08-06-2017-Thu</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </tbody>
                	</table>
                </div>
            </div>
            <table class="table table-hover list sales-table">
                    <thead>
                        <tr>
                            <th class="text-center" width="5%">S.NO</th>
                            <th width="15%">Date</th>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="text-center">1</td>
                            <td>08-06-2017-Thu</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr bgcolor="#fff">
                            <td class="text-center">2</td>
                            <td>09-06-2017-Fri</td>
                            <th colspan="3" class="text-center">Holiday</th>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td>08-06-2017-Thu</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td>08-06-2017-Thu</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td>08-06-2017-Thu</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr bgcolor="#fff">
                            <td class="text-center">2</td>
                            <td>09-06-2017-Fri</td>
                            <th colspan="3" class="text-center">Holiday</th>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td>08-06-2017-Thu</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="text-center">1</td>
                            <td>08-06-2017-Thu</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <th colspan="2" class="text-right">Advance</th>
                            <td colspan="3"><input type="text" title="Enter Advance" value="" name="" id="" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th colspan="2" class="text-right">Total Amount</th>
                            <td colspan="3"><input type="text" title="Enter Total Amount" value="" name="" id="" class="form-control" /></td>
                        </tr>
                    </tbody>
                </table>
    	</div>
    </div>-->
    <div class="form-group">
    	<div class="row">
            <div class="col-sm-10">
                <input type="submit" value="SUBMIT" class="btn btn-default btn-l" name="salary_add" title="Submit Record" />
            </div>
        </div>
  	</div>  
</form>