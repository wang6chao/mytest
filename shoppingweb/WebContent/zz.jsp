<html>
<head>
<script type="text/javascript">
function getInnerHTML()
  {
  alert(document.getElementById("tr1").innerHTML);
  }
</script>
</head>
<body>

<table border="1">
<tr id="tr1">
<th>Firstname</th>
<th>Lastname</th>
</tr>
<tr id="tr2">
<td>Peter</td>
<td>Griffin</td>
</tr>
</table>
<br />
<input type="button" onclick="getInnerHTML()" 
value="Alert innerHTML of table row" />

</body>
</html>