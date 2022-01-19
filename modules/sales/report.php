<?php
if(!defined("APP_START")) die("No Direct Access");
$q="";
$extra='';
$is_search=false;
if(isset($_GET["date_from"])){
    $date_from=slash($_GET["date_from"]);
    $_SESSION["sales"]["list"]["date_from"]=$date_from;
}
if(isset($_SESSION["sales"]["list"]["date_from"]))
    $date_from=$_SESSION["sales"]["list"]["date_from"];
else
    $date_from="";
if($date_from != ""){
    $extra.=" and datetime_added>='".datetime_dbconvert($date_from)."'";
    $is_search=true;
}
if(isset($_GET["date_to"])){
    $date_to=slash($_GET["date_to"]);
    $_SESSION["sales"]["list"]["date_to"]=$date_to;
}
if(isset($_SESSION["sales"]["list"]["date_to"]))
    $date_to=$_SESSION["sales"]["list"]["date_to"];
else
    $date_to="";
if($date_to != ""){
    $extra.=" and datetime_added<'".datetime_dbconvert($date_to)."'";
    $is_search=true;
}
if(isset($_GET["town"])){
    $town=slash($_GET["town"]);
    $_SESSION["sales"]["list"]["town"]=$town;
}
if(isset($_SESSION["sales"]["list"]["town"])){
    $town=$_SESSION["sales"]["list"]["town"];
}
else
    $town='';
if($town != ""){
    $extra.=" and town='".slash($town)."'";
    $is_search=true;
}
if(isset($_GET["q"])){
    $q=slash($_GET["q"]);
    $_SESSION["sales"]["list"]["q"]=$q;
}
if(isset($_SESSION["sales"]["list"]["q"]))
    $q=$_SESSION["sales"]["list"]["q"];
else
    $q="";
if(!empty($q)){
    $extra.=" and (customer_name like '%".$q."%' or id='".$q."')";
    $is_search=true;
}
$order_by = "datetime_added";
$order = "desc";
if( isset($_GET["order_by"]) ){
    $_SESSION["sales"]["list"]["order_by"]=slash($_GET["order_by"]);
}
if( isset( $_SESSION["sales"]["list"]["order_by"] ) ){
    $order_by = $_SESSION["sales"]["list"]["order_by"];
}
if( isset($_GET["order"]) ){
    $_SESSION["sales"]["list"]["order"]=slash($_GET["order"]);
}
if( isset( $_SESSION["sales"]["list"]["order"] ) ){
    $order = $_SESSION["sales"]["list"]["order"];
}
$orderby = $order_by." ".$order;
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
                <h2>Sales</h2>
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
                        echo " Sales: ".$q;
                    }
                    ?>
                </p>
            </th>
        </tr>
        <tr>
            <th width="5%" align="center">S.no</th>
            <th>INVOICE #</th>
            <th align="right">Date</th>
            <th align="right">CUSTOMER NAME</th>
            <th align="right">TOTAL ITEMS</th>
            <th align="right">Total Price</th>
        </tr>
        <?php
        $sql="select * from sales where 1 $extra order by $orderby";
        $rs=doquery( $sql, $dblink );
        $sub_total_price=0;
        if(numrows($rs)>0){
            $sn=1;
            while($r=dofetch($rs)){
                $ts = strtotime( $r["datetime_added"] );
                $count = dofetch(doquery( "select count(1) from sales where datetime_added >= '".date("Y-m-01 00:00:00", $ts)."' and datetime_added<'".date("Y-m-d H:i:s", $ts)."'", $dblink ));
                $invoice_id = $count["count(1)"]+1;
                $sub_total_price+=$r["total_price"];
                ?>
                <tr>
                    <td class="text-center"><?php echo $sn;?></td>
                    <td><?php echo $invoice_id; ?></td>
                    <td><?php echo datetime_convert($r["ts"]); ?></td>
                    <td><?php echo unslash($r["customer_name"]); ?></td>
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