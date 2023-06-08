<?php
	include "conn3.php";  // untuk fungsi: "$db_host", "$db_login", "$db_password"
   	$aSQL = "SELECT idx, name, price from t_buy_now";
	$aQResult=mysqli_query($connect, $aSQL);
?>



<?php
$script_name=trim($_SERVER["SCRIPT_NAME"]);
//echo "script_name=".$script_name."<br>";
?>



 
 
<html>
<head>
	<title>Administrasi >> user</title>
	<LINK href="style2.css" type=text/css rel=STYLESHEET>		
</head>

<body bgcolor="#D8D8D8">

<center>

<table align="center" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFC68C" height="100%" width="100%">
<tr><td align="center" bgcolor="FFFFFF"  background="../../images/background.jpg" valign="top">


<br>
<font color="black" size="4" face="Verdana, Arial, Helvetica"><b>PAYMENT SHOPPING</b></font>
<br><br>	
<br>



<table border="0" cellpadding="1" cellspacing="1" bgColor=#cccccc>
	<tr class="head">
		<td align="center" width="40"><b><font color="blue" size="4" face="Verdana, Arial, Helvetica">NO</font></b></td>
		<td align="center" width="80"><b><font color="blue" size="4" face="Verdana, Arial, Helvetica">IDX</font></b></td>
		<td align="left" width="100"><b><font color="blue" size="4" face="Verdana, Arial, Helvetica">NAME</font></b></td>
		<td align="right" width="70"><b><font color="blue" size="4" face="Verdana, Arial, Helvetica">PRICE ($/USD)</font></b></td>
	</tr>
	
<?php
       $no=0;
	   $total=0;
       while ($aRow = mysqli_fetch_array($aQResult))
       {
	   $no++;	
	   $total+=+$aRow["price"];
?>

	
	
	<tr class="isi">
		<td align="center"><font color="blue" size="4" face="Verdana, Arial, Helvetica"><?php echo $no;?></font></td>
		<td align="left"><font color="blue" size="4" face="Verdana, Arial, Helvetica"><?php print $aRow["idx"];?></font></td>
		<td align="left"><font color="blue" size="4" face="Verdana, Arial, Helvetica"><?php print $aRow["name"];?></font></td>
		<td align="right"><font color="blue" size="4" face="Verdana, Arial, Helvetica"><?php print $aRow["price"];?></font></td>
	</tr>
	

<?php
}
?>



	<?php
       	{
	?>
	
	<tr class="isi">
		<td align="right" bgcolor="lime"></td>

		<td align="left" bgcolor="lime"><b><font color="black" size="6" face="Verdana, Arial, Helvetica">TOTAL</font></b></td>
		<td align="right" bgcolor="lime"></td>
		<td align="right" bgcolor="lime"><b><font color="black" size="6" face="Verdana, Arial, Helvetica"><?php echo number_format($total,0);?></font></b></td>
	</tr>

	<tr class="isi">
		<td align="right" bgcolor="blue"></td>
		<td align="right" bgcolor="blue"><b><font color="white" size="2" face="Verdana, Arial, Helvetica">PAYMENT STATUS</font></b></td>
		<td align="right" bgcolor="blue"></td>
		<td align="right" bgcolor="blue"><b><font color="white" size="2" face="Verdana, Arial, Helvetica">NOT PAY YET</font></b></td>
	</tr>


<?php
}
?>



</table>

<br><br><br>
<b>
<font color="black" size="6" face="Verdana, Arial, Helvetica">
<input type="Submit" name="Submit" value="PLEASE TAP HERE FOR PAYMENT">
</font>
</b>

</body>
</html>
