<?php 
include("include/db.php");
include("include/utility.php");
include("include/session.php");
$customers = doquery("select * from customer where status = 1", $dblink);
if(numrows($customers)>0){
    while($customer = dofetch($customers)){
       // print_r($customer);
       $balance = get_customer_balance($customer["id"], $dt = 0);
       //echo $balance."<br>";
       if($balance>0 || $balance<0){
        doquery( "insert into customer_payment(customer_id, datetime_added, amount, account_id, details) values('".slash( $customer["id"] )."', NOW(), '".$balance."', 4, 'Balance 0')", $dblink );
       }
       
    }
}
?>
	