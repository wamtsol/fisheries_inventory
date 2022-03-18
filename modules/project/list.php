<?php
if(!defined("APP_START")) die("No Direct Access");
?>
<div class="page-header">
	<h1 class="title">Manage Project</h1>
  	<ol class="breadcrumb">
    	<li class="active">All Projects</li>
  	</ol>
  	<div class="right">
    	<div class="btn-group" role="group" aria-label="..."> 
        	<a href="project_manage.php?tab=add" class="btn btn-light editproject">Add New Project</a> 
            <a id="topstats" class="btn btn-light" href="#"><i class="fa fa-search"></i></a>
            <a class="btn print-btn" href="project_manage.php?tab=report"><i class="fa fa-print" aria-hidden="true"></i></a>
    	</div> 
    </div> 
</div>
<ul class="topstats clearfix search_filter"<?php if($is_search) echo ' style="display: block"';?>>
    <li class="col-xs-12 col-lg-12 col-sm-12">
    	<div>
        	<form class="form-horizontal" action="" method="get">
            	<div class="col-sm-2">
                	<select name="client_id" id="client_id" class="custom_select">
                        <option value=""<?php echo ($client_id=="")? " selected":"";?>>Select Client</option>
                        <?php
                            $res=doquery("select * from client order by client_name",$dblink);
                            if(numrows($res)>=0){
                                while($rec=dofetch($res)){
                                ?>
                                <option value="<?php echo $rec["id"]?>" <?php echo($client_id==$rec["id"])?"selected":"";?>><?php echo unslash($rec["client_name"])?></option>
                            	<?php
                                }
                            }	
                        ?>
                    </select>
                </div>
            	<span class="col-sm-1">Start Date</span>
            	<div class="col-sm-2">
                  <input type="text" title="Enter String" value="<?php echo $start_date;?>" name="start_date" id="search" class="form-control date-picker" >  
                </div>
                <span class="col-sm-1">End Date</span>
            	<div class="col-sm-2">
                  <input type="text" title="Enter String" value="<?php echo $end_date;?>" name="end_date" id="search" class="form-control date-picker" >  
                </div>
                <div class="col-sm-2">
                  <input type="text" title="Enter String" value="<?php echo $q;?>" name="q" id="search" class="form-control" >  
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
                <th width="15%">Title</th>
                <th width="15%">Client</th>
                <th width="12%">Start Date</th>
                <th width="12%">End Date</th>
                <th width="16%" class="text-right">Expected Revenue</th>
                <th width="10%" class="text-center">Status</th>
                <th width="10%" class="text-center">Actions</th>
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
                        <td><?php echo unslash($r["title"]); ?></td>
                        <td><?php echo get_field( unslash($r["client_id"]), "client", "client_name" ); ?></td>
                        <td><?php echo date_convert($r["start_date"]); ?></td>
                        <td><?php echo date_convert($r["end_date"]); ?></td>
                        <td class="text-right"><?php echo curr_format(unslash($r["expected_revenue"])); ?></td>
                        <td class="text-center">
                            <a href="project_manage.php?id=<?php echo $r['id'];?>&tab=status&s=<?php echo ($r["status"]==0)?1:0;?>">
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

                            	<a href="project_manage.php?tab=edit&id=<?php echo $r['id'];?>"><img title="Edit Record" alt="Edit" src="images/edit.png"></a>&nbsp;&nbsp;

                            	<a onclick="return confirm('Are you sure you want to delete')" href="project_manage.php?id=<?php echo $r['id'];?>&amp;tab=delete"><img title="Delete Record" alt="Delete" src="images/delete.png"></a>

                        </td>

                    </tr>  

                    <?php 

                    $sn++;

                }

                ?>

                <tr>

                    <td colspan="5" class="actions">

                        <select name="bulk_action" class="" id="bulk_action" title="Choose Action">

                            <option value="null">Bulk Action</option>

                            <option value="delete">Delete</option>

                            <option value="statuson">Set Status On</option>

                            <option value="statusof">Set Status Off</option>

                        </select>

                        <input type="button" name="apply" value="Apply" id="apply_bulk_action" class="btn btn-light" title="Apply Action"  />

                    </td>

                    <td colspan="4" class="paging" title="Paging" align="right"><?php echo pages_list($rows, "project", $sql, $pageNum)?></td>

                </tr>

                <?php	

            }

            else{	

                ?>

                <tr>

                    <td colspan="9"  class="no-record">No Result Found</td>

                </tr>

                <?php

            }

            ?>

        </tbody>

     </table>

</div>