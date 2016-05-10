<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	href="../resources/styles/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/styles/tyyli.css">

<!-- Custom styles for this template -->

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->	
<script src="../resources/js/ie-emulation-modes-warning.js"></script>

<script src="../resources/js/jquery-1.12.0.min.js"></script>
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
		var tableData = '<table><tr><th>ID</th><th>Fiilis 1</th><th>Fiilis 2</th><th>Fiilis 3</th><th>Fiilis 4</th><th>Fiilis 5</th><th>Keskiarvo</th><th>Äänet</th><th>Kyselyn nimi</th><th>Päivämäärä</th></tr>';
		$.each( data, function( key, val ) {
			//listaan uusi käyntikortti
			//nimi käyntikorttiin	
			tableData += '<tr><td>'+val.id+'</td><td>'+val.fiilis1+'</td><td>'+val.fiilis2+'</td><td>'+val.fiilis3+'</td><td>'+val.fiilis4+'</td><td>'+val.fiilis5+'</td><td>'+val.keskiarvo+'</td><td>'+val.aanet+'</td><td>'+val.nimi+'</td><td>'+val.pvm+'</td></tr>';
		//	$("<h2/>").text(val.id + " " +val.fiilis1 + " " +val.fiilis2 + " " +val.fiilis3 + " " +val.fiilis4 + " " +val.fiilis5 + " " +val.keskiarvo + " " +val.aanet + " " +val.nimi + " " +val.pvm + " ").appendTo(feels);
			$('#lista').html(tableData);
		});
	}).error(function() { //palvelinyhteys aiheutti virheen
		$("<p class='Error'>Virhe: Palvelin ei palauta JSON-dataa. Tarkista tietokantayhteys.</p>").appendTo("#lista");
	});
	
});

$("#uusi").click(function() {
	setCookie("keskiarvokeksi", 0, 365);
	setCookie("aanetkeksi", 0, 365);
	setCookie("pisteet1keksi", 0, 365);
	setCookie("pisteet2keksi", 0, 365);
	setCookie("pisteet3keksi", 0, 365);
	setCookie("pisteet4keksi", 0, 365);
	setCookie("pisteet5keksi", 0, 365);
	setCookie("yhteispisteetkeksi", 0,
			365);
	window.location.replace("fiilis");
});

function setCookie(cname, cvalue, exdays) {
	var d = new Date();
	d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
	var expires = "expires=" + d.toUTCString();
	document.cookie = cname + "=" + cvalue + "; " + expires;
}

});


</script>


</head>

<body>

<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="etusivulle">Etusivu</a></li>
						
					</ul>
					<!--Tämän kommentin alla ovat oikealla olevat linkit-->
					<ul class="nav navbar-nav navbar-right">
					<li><a>Sisäänkirjautuneena: <sec:authentication property="principal.username"/></a> </li>
					<li> <a href="loginsivulle"> Kirjaudu ulos</a></li>
				
					</ul>
				</div>
           </div> 
        <!-- /.container -->
    </nav>

<!-- Page Content -->
    <div class="container">
<br>
<br>
<br>
<h1>Profiili</h1>

<div class="profiili">
<table>
<tr>
<td>Käyttäjätunnus</td>
<td><sec:authentication property="principal.username"/></td>
</tr>
<tr>
<td>Tunnus luotu:</td>
<td></td>
</tr>
<tr>
<td>Fiilistestejä:</td>
<td></td>
</tr>
<tr>
<td>Viimeisin fiilistesti:</td>
<td></td>
</tr>

</table>

</div> <!-- /.profiili -->

<button type="button" class="btn btn-primary btn-block" id="uusi">Luo uusi fiiliskysely</button>

<br>
<br>


<br>
<br>

<a href="fiilissivulle">Takaisin</a>

<button id="latausnappi">Hae JSON</button> <button id="tyhjennysnappi">Tyhjenn&auml;</button>
<div id="lista"></div>




			
</div>
		<!-- /container -->



	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
