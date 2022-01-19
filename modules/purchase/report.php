<?php
if(!defined("APP_START")) die("No Direct Access");
$q="";
$extra='';
$is_search=false;
if(isset($_GET["date_from"])){
    $date_from=slash($_GET["date_from"]);
    $_SESSION["purchase"]["list"]["date_from"]=$date_from;
}
if(isset($_SESSION["purchase"]["list"]["date_from"]))
    $date_from=$_SESSION["purchase"]["list"]["date_from"];
else
    $date_from="";
if($date_from != ""){
    $extra.=" and datetime_added>='".datetime_dbconvert($date_from)."'";
    $is_search=true;
}
if(isset($_GET["date_to"])){
    $date_to=slash($_GET["date_to"]);
    $_SESSION["purchase"]["list"]["date_to"]=$date_to;
}
if(isset($_SESSION["purchase"]["list"]["date_to"]))
    $date_to=$_SESSION["purchase"]["list"]["date_to"];
else
    $date_to="";
if($date_to != ""){
    $extra.=" and datetime_added<'".datetime_dbconvert($date_to)."'";
    $is_search=true;
}
if(isset($_GET["item_id"])){
    $item_id=slash($_GET["item_id"]);
    $_SESSION["purchase"]["list"]["item_id"]=$item_id;
}
if(isset($_SESSION["purchase"]["list"]["item_id"]))
    $item_id=$_SESSION["purchase"]["list"]["item_id"];
else
    $item_id="";
if($item_id!=""){
    $extra.=" and id in (select purchase_id from purchase_items where item_id = '".$item_id."')";
    $is_search=true;
}
if(isset($_GET["q"])){
    $q=slash($_GET["q"]);
    $_SESSION["purchase"]["list"]["q"]=$q;
}
if(isset($_SESSION["purchase"]["list"]["q"]))
    $q=$_SESSION["purchase"]["list"]["q"];
else
    $q="";
if(!empty($q)){
    $extra.=" and (supplier_name like '%".$q."%')";
    $is_search=true;
}
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
            max-width:1200px;
            margin:0 auto;
        }
    </style>
    <table width="100%" cellspacing="0" cellpadding="0">
        <tr class="head">
            <th colspan="6">
                <h1><?php echo get_config( 'site_title' )?></h1>
                <h2>Purchase</h2>
                <p>
                    <?php
                    echo "List of";
                    if( !empty( $date_from ) || !empty( $date_to ) ){
                        echo "<br />Date";
                    }
                    if( !empty( $date_from ) ){
                        echo " from ".$date_from;
                    }
                    if( !empty( $date_to ) ){
                        echo " to ".$date_to."<br>";
                    }
                    if( !empty( $q ) ){
                        echo " Purchase: ".$q;
                    }
                    ?>
                </p>
            </th>
        </tr>
        <tr>
            <th width="5%" align="center">S.no</th>
            <th>Date</th>
            <th>Type</th>
            <th align="right">Purchase</th>
            <th align="right">Total Item</th>
            <th align="right">Total Price</th>
        </tr>
        <?php
        $sql = "select * from purchase where 1 $extra order by datetime_added desc, ts desc";
        $rs=doquery( $sql, $dblink );
        $sub_total_price=0;
        if(numrows($rs)>0){
            $sn=1;
            while($r=dofetch($rs)){
                $sub_total_price+=$r["total_price"];
                ?>
                <tr>
                    <td class="text-center"><?php echo $sn;?></td>
                    <td><?php echo datetime_convert($r["ts"]); ?></td>
                    <td>
                        <?php
                        if($r["type"]==1){
                            echo "Wastage";
                        }
                        else{
                            echo "Purchase";
                        }
                        ?>
                    </td>
                    <td><?php echo unslash($r["supplier_name"]); ?></td>
                    <td><?php echo curr_format($r["total_items"]); ?></td>
                    <td><?php echo curr_format($r["total_price"]); ?></td>
                </tr>
                <?php
                $sn++;
            }
            ?>
            <tr>
                <td colspan="4"></td>
                <td align="right">Grand Total Price</td>
                <td><?php echo curr_format( $sub_total_price )?></td>
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