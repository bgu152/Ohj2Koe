<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Listaa veneet</title>
</head>
<body>
<table id="listaus">
	<thead>				
		<tr>
			<th>Tunnus</th>
			<th>Nimi</th>
			<th>Merkki ja malli</th>
			<th>Pituus</th>
			<th>Leveys</th>			
			<th>Hinta</th>							
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<script>
$(document).ready(function(){
	$.ajax({url:"veneet", type:"GET", dataType:"json", success:function(result){//Funktio palauttaa tiedot json-objektina		
		$.each(result.veneet, function(i, field){  
        	var htmlStr;
        	htmlStr+="<tr>";
        	htmlStr+="<td>"+field.tunnus+"</td>";
        	htmlStr+="<td>"+field.nimi+"</td>";
        	htmlStr+="<td>"+field.merkkimalli+"</td>";
        	htmlStr+="<td>"+field.pituus+"</td>";
        	htmlStr+="<td>"+field.leveys+"</td>";  
        	htmlStr+="<td>"+field.hinta+"</td>";  
        	htmlStr+="</tr>";
        	$("#listaus tbody").append(htmlStr);
        });	
    }});
});	

</script>
</body>
</html>