<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIN-SIVU</title>

<!-- Bootstrap core CSS -->


<link rel="stylesheet" type="text/css"
	href="../../resources/styles/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../../resources/styles/tyyli.css">

<!-- Custom styles for this template -->

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->	
<script src="../../resources/js/ie-emulation-modes-warning.js"></script>

<script src="../../resources/js/jquery-1.12.0.min.js"></script>
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
		var tableData = '<table><tr><th>ID</th><th>Fiilis 1</th><th>Fiilis 2</th><th>Fiilis 3</th><th>Fiilis 4</th><th>Fiilis 5</th><th>Keskiarvo</th><th>Äänet</th><th>Kyselyn nimi</th><th>Päivämäärä</th><th>Käyttäjäid</th><th>Poista</th></tr>';
		$.each( data, function( key, val ) {
			//listaan uusi käyntikortti
			//nimi käyntikorttiin	
			tableData += '<tr><td>'+val.id+'</td><td>'+val.fiilis1+'</td><td>'+val.fiilis2+'</td><td>'+val.fiilis3+'</td><td>'+val.fiilis4+'</td><td>'+val.fiilis5+'</td><td>'+val.keskiarvo+'</td><td>'+val.aanet+'</td><td>'+val.nimi+'</td><td>'+val.pvm+'</td><td>'+val.kayttajaid+'</td><td><button class="btn btn-danger">Poista</button></td></td></tr>';
		//	$("<h2/>").text(val.id + " " +val.fiilis1 + " " +val.fiilis2 + " " +val.fiilis3 + " " +val.fiilis4 + " " +val.fiilis5 + " " +val.keskiarvo + " " +val.aanet + " " +val.nimi + " " +val.pvm + " ").appendTo(feels);
			$('#lista').html(tableData);
		});
	}).error(function() { //palvelinyhteys aiheutti virheen
		$("<p class='Error'>Virhe: Palvelin ei palauta JSON-dataa. Tarkista tietokantayhteys.</p>").appendTo("#lista");
	});
	
});

$("#latausnappi2").click(function() {
	
	//ladataan JSON-dataa palvelimelta
	$.getJSON( "kayttajat.json", function( data ) {
		var tableData = '<table><tr><th>ID</th><th>Tunnus</th><th>Enabled</th><th>Etunimi</th><th>Sukunimi</th><th>Anna banaania</th></tr>';
		$.each( data, function( key, val ) {
			//listaan uusi käyntikortti
			//nimi käyntikorttiin	
			tableData += '<tr><td>'+val.id+'</td><td>'+val.username+'</td><td>'+val.enabled+'</td><td>'+val.firstname+'</td><td>'+val.lastname+'</td><td><button class="btn btn-danger">BANNAA</button></td></tr>';
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
<h1 class="text-center">EXTREME SUOJATTU ADMIN-SIVU</h1>


<div class="row">
  <div class="col-md-6"><button class="btn btn-success btn-block testinappula"id="latausnappi">Hae kaikki fiilistestit</button></div>
  <div class="col-md-6"><button class="btn btn-success btn-block" id="latausnappi2" >Hae kaikki käyttäjät</button></div>
</div>
<br>
<button class="btn btn-danger btn-block" id="tyhjennysnappi" >Tyhjennä</button>
<br>
<a href="../tulokset">Takaisin</a>



<div id="lista"></div>


<p><a href="../../j_spring_security_logout" > Kirjaudu ulos</a></p>
</body>
</html>