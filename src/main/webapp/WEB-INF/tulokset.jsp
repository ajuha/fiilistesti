<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Fiilissivu</title>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Bootstrap core CSS -->


<link rel="stylesheet" type="text/css"
	href="resources/styles/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/styles/tyyli.css">

<!-- Custom styles for this template -->

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="resources/js/ie-emulation-modes-warning.js"></script>

<script src="resources/js/jquery-1.12.0.min.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script>
	
//dokumentin latautuessa aktivoidaan tapahtumankuuntelijat
$(document).ready(function(){
	
	//tyhjennysnappia painettaessa
	$("#tyhjennysnappi").click(function() {
		$("#lista").empty();
	});

	
	
$("#latausnappi").click(function() {
	
	//ladataan JSON-dataa palvelimelta
	$.getJSON( "fiilikset.json", function( data ) {
		$.each( data, function( key, val ) {
			//listaan uusi käyntikortti
			var feels = $("<section class='Olio'/>").appendTo("#lista");
			//nimi käyntikorttiin
			
			$("<h2/>").text(val.id + " " +val.fiilis1 + " " +val.fiilis2 + " " +val.fiilis3 + " " +val.fiilis4 + " " +val.fiilis5 + " " +val.keskiarvo + " " +val.aanet + " " +val.alkuloppu + " " +val.pvm + " ").appendTo(feels);
			
		});
	}).error(function() { //palvelinyhteys aiheutti virheen
		$("<p class='Error'>Virhe: Palvelin ei palauta JSON-dataa. Tarkista tietokantayhteys.</p>").appendTo("#lista");
	});
	
});
});
</script>


</head>

<body>

<h1>Tulokset</h1>


<a href="fiilissivulle">Takaisin</a>

<button id="latausnappi">Hae JSON</button> <button id="tyhjennysnappi">Tyhjenn&auml;</button>
<div id="lista" ></div>




			<table>
				<thead>
					
						<tr>
							<th>ID</th>
							<th>Fiilis 1</th>
							<th>Fiilis 2</th>
							<th>Fiilis 3</th>
							<th>Fiilis 4</th>
							<th>Fiilis 5</th>
							<th>Keskiarvo</th>
							<th>Äänet</th>
							<th>Alku/Loppu</th>
							<th>Päivämäärä</th>


						</tr>
					
				</thead>

				<tbody>
				<c:forEach items="${tulokset}" var="tulos">
					<tr>
						<td><c:out value=" ${tulos.id}" /></td>
						<td><c:out value=" ${tulos.fiilis1}" /></td>
						<td><c:out value=" ${tulos.fiilis2}" /></td>
						<td><c:out value=" ${tulos.fiilis3}" /></td>
						<td><c:out value=" ${tulos.fiilis4}" /></td>
						<td><c:out value=" ${tulos.fiilis5}" /></td>
						<td><c:out value=" ${tulos.keskiarvo}" /></td>
						<td><c:out value=" ${tulos.aanet}" /></td>
						<td><c:out value=" ${tulos.alkuloppu}" /></td>
						<td><c:out value=" ${tulos.pvm}" /></td>
					</tr>
</c:forEach>															

<a href="fiilissivulle">Palaa takaisin</a>
				</tbody>
			</table>


		<!-- /container -->



	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
