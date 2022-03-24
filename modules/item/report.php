<?php
if(!defined("APP_START")) die("No Direct Access");
$rs = doquery( $sql, $dblink );
if(numrows($rs)>0){
    header('Content-Type: text/csv; charset=utf-8');
    header("Content-Disposition: attachment; filename=stock.csv");
    $fh = fopen( 'php://output', 'w' );
    if( !empty( $type ) ){
        if($type==1){
            $typeName = "Consumable";
        }
        elseif($type==2){
            $typeName = "Non Consumable";
        }
        else{
            $typeName = "--";
        }
        fputcsv($fh,array('Type:', $typeName));
    }
    if( !empty( $q ) ){
        fputcsv($fh,array('Title:', $q));
    }
    fputcsv($fh,array('S.no','ID','Title','Type','Unit','Purchased','Issued','Balance'));
    $sn=1;
    $total_p = $total_i = $total_b = 0;
    while($r=dofetch($rs)){
        $total_p += $r["purchased"];
        $total_i += $r["issued"];
        $total_b += $r["purchased"]-$r["issued"];
        if($r["type"]==1){
            $typename = "Consumable";
        }
        elseif($r["type"]==2){
            $typename = "Non Consumable";
        }
        else{
            $typename = "--";
        }
        if($r["unit"]==1){
            $unit = "PKT";
        }
        elseif($r["unit"]==2){
            $unit = "Nos";
        }
        else{
            $unit = "--";
        }
        fputcsv($fh,array(
            $sn++,
            $r["id"],
            unslash( $r[ "title" ] ),
            $typename,
            $unit,
            $r["purchased"],
            $r["issued"],
            $r["purchased"]-$r["issued"]
        ));
    }
    fputcsv($fh,array('','','','','Total:',$total_p,$total_i,$total_b));
    fclose($fh);
}
die;
?>
