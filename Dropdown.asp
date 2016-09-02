<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
 <head>
  <title>Dynamic DropDowns with US States & Counties</title>

<!-- Style -->

<link rel="stylesheet" type="text/css" href="css/style.css" />

<!-- JQuery JS -->
<script type="text/javascript" src="js/jquery-1.2.6.min.js"></script>

<!-- Drop Down JS -->
<script type="text/javascript" src="js/drop_down.js"></script>

<!-- Preload Images -->

<script type="text/javascript">

<!--
pic1 = new Image(16, 16);
pic1.src="img/loading.gif";
//-->
</script>

</head>

<BODY>

<div align="center">

<strong>DEMO</strong>

</div><br />
<form name="form">
<table width="317" border="0" align="center">

   <tr>
     <td width="100">State</td>
     <td width="217">
<select id="state" name="state">

<option value='AL'>Alabama</option>
<option value='AK'>Alaska</option>
<option value='AZ'>Arizona</option>
<option value='AR'>Arkansas</option>
<option value='CA'>California</option>

<option value='CO'>Colorado</option>
<option value='CT'>Connecticut</option>
<option value='DE'>Delaware</option>
<option value='DC'>District of Columbia</option>
<option value='FL'>Florida</option>

<option value='GA'>Georgia</option>
<option value='HI'>Hawaii</option>
<option value='ID'>Idaho</option>
<option value='IL'>Illinois</option>
<option value='IN'>Indiana</option>

<option value='IA'>Iowa</option>
<option value='KS'>Kansas</option>
<option value='KY'>Kentucky</option>
<option value='LA'>Louisiana</option>
<option value='ME'>Maine</option>

<option value='MD'>Maryland</option>
<option value='MA'>Massachusetts</option>
<option value='MI'>Michigan</option>
<option value='MN'>Minnesota</option>
<option value='MS'>Mississippi</option>

<option value='MO'>Missouri</option>
<option value='MT'>Montana</option>
<option value='NE'>Nebraska</option>
<option value='NV'>Nevada</option>
<option value='NH'>New Hampshire</option>

<option value='NJ'>New Jersey</option>
<option value='NM'>New Mexico</option>
<option value='NY'>New York</option>
<option value='NC'>North Carolina</option>
<option value='ND'>North Dakota</option>

<option value='OH'>Ohio</option>
<option value='OK'>Oklahoma</option>
<option value='OR'>Oregon</option>
<option value='PA'>Pennsylvania</option>
<option value='RI'>Rhode Island</option>

<option value='SC'>South Carolina</option>
<option value='SD'>South Dakota</option>
<option value='TN'>Tennessee</option>
<option value='TX'>Texas</option>
<option value='UT'>Utah</option>

<option value='VT'>Vermont</option>
<option value='VA'>Virginia</option>
<option value='WA'>Washington</option>
<option value='WV'>West Virginia</option>
<option value='WI'>Wisconsin</option>

<option value='WY'>Wyoming</option>
</select>
	 </td>
   </tr>
   <tr>
     <td height="33">County</td>

     <td><div id="county_drop_down">
	 <select id="county" name="county"><option value="">County...</option></select>
	 </div>

	 <span id="loading_county_drop_down">
	 <img src="img/loading.gif" width="16" height="16" align="absmiddle">&nbsp;Loading...
	 </span>

	 <div id="no_county_drop_down">This state has no counties.</div></td>
   </tr>
 </table>
 </form>
</body>

</html>