<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<script src="scripts/main.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>Insert title here</title>
</head>

<body>
	<form id="tiedot">
		<table>
			<thead>
				<tr>
					<th colspan="6" class="oikealle"><span id="takaisin">Takaisin
							listaukseen</span></th>
				</tr>
				<tr>
					<th>Nimi</th>
					<th>Merkki ja malli</th>
					<th>Pituus</th>
					<th>Leveys</th>
					<th>Hinta</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" name="nimi" id="nimi"></td>
					<td><input type="text" name="merkkimalli" id="merkkimalli"></td>
					<td><input type="text" name="pituus" id="pituus"></td>
					<td><input type="text" name="leveys" id="leveys"></td>
					<td><input type="text" name="hinta" id="hinta"></td>
					<td><input type="submit" id="tallenna" value="Lis��"></td>
				</tr>
			</tbody>
		</table>
	</form>
	<span id="ilmo"></span>
</body>
<script>
	$(document).ready(function() {
		jQuery.validator.addMethod('integer', function(value, element, param) {
			return (value != 0) && (value == parseInt(value, 10));
		}, 'Hinnan tulee olla kokonaisluku');

		$("#takaisin").click(function() {
			document.location = "listaaveneet.jsp";
		});
		$("#tiedot").validate({
			rules : {
				nimi : {
					required : true,
					minlength : 2
				},
				merkkimalli : {
					required : true,
					minlength : 2
				},
				pituus : {
					required : true,
					number : true,
					min : 1.50
				},
				leveys : {
					required : true,
					number : true,
					min : 0.4
				},
				hinta : {
					required : true,
					integer : true,
					min : 0
				}
			},
			messages : {
				nimi : {
					required : "Puuttuu",
					minlength : "Liian lyhyt"
				},
				merkkimalli : {
					required : "Puuttuu",
					min : "Liian lyhyt"
				},
				pituus : {
					required : "Puuttuu",
					min : "Liian lyhyt",
					number : "Piituuden on oltava numeromuodossa"
				},
				leveys : {
					required : "Puuttuu",
					min : "Liian kapea",
					number : "Leveyden on oltava numeromuodossa"
				},
				hinta : {
					required : "Puuttuu",
					number : "Hinnan tulee olla kokonaisluku",
					min : "Hinnan tulee olla positiivinen",
				}
			},
			submitHandler : function(form) {
				lisaaTiedot();
			}
		});
	});
	//funktio tietojen lis��mist� varten. Kutsutaan backin POST-metodia ja v�litet��n kutsun mukana uudet tiedot json-stringin�.
	//POST /veneet/
	function lisaaTiedot() {

		var formJsonStr = formDataJsonStr($("#tiedot").serializeArray()); //muutetaan lomakkeen tiedot json-stringiksi
		$.ajax({
			url : "veneet",
			data : formJsonStr,
			type : "POST",
			dataType : "json",
			success : function(result) { //result on joko {"response:1"} tai {"response:0"}       
				if (result.response == 0) {
					$("#ilmo").html("Veneen lis��minen ep�onnistui.");
				} else if (result.response == 1) {
					$("#nimi").val("");
					$("#merkkimalli").val("");
					$("#pituus").val("");
					$("#leveys").val("");
					$("#hinta").val("");
					$("#ilmo").html("Veneen lis��minen onnistui.");

				}
			}
		});
	}
</script>
</html>