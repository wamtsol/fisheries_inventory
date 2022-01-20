<?php
if(!defined("APP_START")) die("No Direct Access");
$q="";
$extra='';
$is_search=false;
if(isset($_GET["q"])){
    $q=slash($_GET["q"]);
    $_SESSION["items"]["list"]["q"]=$q;
}
if(isset($_SESSION["items"]["list"]["q"]))
    $q=$_SESSION["items"]["list"]["q"];
else
    $q="";
if(!empty($q)){
    $extra.=" and title like '%".$q."%'";
    $is_search=true;
}
if(isset($_GET["stock"])){
    $stock=slash($_GET["stock"]);
    $_SESSION["items"]["list"]["stock"]=$stock;
}
if(isset($_SESSION["items"]["list"]["stock"]))
    $stock=$_SESSION["items"]["list"]["stock"];
else
    $stock="";
if($stock != ""){
    if( $stock == "0" ){
        $extra.=" and quantity>low_stock_quantity";
    }
    if( $stock == "1" ){
        $extra.=" and quantity<=low_stock_quantity";
    }
    if( $stock == "2" ){
        $extra.=" and quantity=0";
    }
    $is_search=true;
}
$order_by = "title";
$order = "asc";
if( isset($_GET["order_by"]) ){
    $_SESSION["items"]["list"]["order_by"]=slash($_GET["order_by"]);
}
if( isset( $_SESSION["items"]["list"]["order_by"] ) ){
    $order_by = $_SESSION["items"]["list"]["order_by"];
}
if( isset($_GET["order"]) ){
    $_SESSION["items"]["list"]["order"]=slash($_GET["order"]);
}
if( isset( $_SESSION["items"]["list"]["order"] ) ){
    $order = $_SESSION["items"]["list"]["order"];
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
                <h2>Items</h2>
                <p>
                    <?php
                        echo "List of";
                        if( !empty( $stock ) ){
                            if( $stock == "0" ){
                                echo " In Stock <br>";
                            }
                            if( $stock == "1" ){
                                echo " Low Stock <br>";
                            }
                            if( $stock == "2" ){
                                echo " Out Of Stock <br>";
                            }
                        }
                        if( !empty( $q ) ){
                            echo " Item: ".$q;
                        }
                    ?>
                </p>
            </th>
        </tr>
        <tr>
            <th width="5%" align="center">S.no</th>
            <th align="right">Title</th>
            <th align="right">Unit Price</th>
            <th align="right">Quantity</th>
        </tr>
        <?php
        $sql="select * from items where 1 $extra order by $orderby";
        $rs=doquery( $sql, $dblink );
        $total_unit_price=0;
        $total_quantity=0;
        if(numrows($rs)>0){
            $sn=1;
            while($r=dofetch($rs)){
                $total_unit_price+=$r["unit_price"];
                $total_quantity+=$r["quantity"];
                ?>
                <tr>
                    <td class="text-center"><?php echo $sn;?></td>
                    <td><?php echo unslash($r["title"]); ?></td>
                    <td><?php echo curr_format($r["unit_price"]); ?></td>
                    <td><?php echo curr_format($r["quantity"]); ?></td>
                </tr>
                <?php
                $sn++;
            }
            ?>
            <tr>
                <td colspan="1"></td>
                <td align="right">Total</td>
                <td><?php echo curr_format( $total_unit_price )?></td>
                <td><?php echo curr_format( $total_quantity )?></td>
            </tr>
            <?php
        }
        else{
            ?>
            <tr>
                <td colspan="3"  class="no-record">No Result Found</td>
            </tr>
            <?php
        }
        ?>
    </table>
<?php
die;