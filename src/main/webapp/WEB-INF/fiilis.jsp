<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
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
	$(document)
			.ready(
					function() {

						var yhteispisteet = 0;
						var aanet = 0;
						var keskiarvo = 0;
						var esilla = 0;
						var pisteet1 = 0;
						var pisteet2 = 0;
						var pisteet3 = 0;
						var pisteet4 = 0;
						var pisteet5 = 0;
						keskiarvo = getCookie("keskiarvokeksi");
						pisteet1 = getCookie("pisteet1keksi");
						pisteet2 = getCookie("pisteet2keksi");
						pisteet3 = getCookie("pisteet3keksi");
						pisteet4 = getCookie("pisteet4keksi");
						pisteet5 = getCookie("pisteet5keksi");
						yhteispisteet = getCookie("yhteispisteetkeksi");
						aanet = getCookie("aanetkeksi")

						$("#tulos")
								.html(
										"Fiiliksiä annettu: "
												+ aanet
												+ "<br><br> Fiiliskeskiarvo on: "
												+ keskiarvo + "<br> <br> "
												+ pisteet1 + "<br>" + pisteet2
												+ "<br>" + pisteet3 + "<br>"
												+ pisteet4 + "<br>" + pisteet5);

						$("#tulos").hide();

						$('.fiilis')
								.click(
										function() {

											$('.fiilis').prop("disabled", true);

											yhteispisteet = Number(yhteispisteet)
													+ Number($(this).val());

											if (Number($(this).val()) === 1) {
												pisteet1 = Number(pisteet1) + 1;

											} else if (Number($(this).val()) === 2) {
												pisteet2 = Number(pisteet2) + 1;
											} else if (Number($(this).val()) === 3) {
												pisteet3 = Number(pisteet3) + 1;
											} else if (Number($(this).val()) === 4) {
												pisteet4 = Number(pisteet4) + 1;
											} else if (Number($(this).val()) === 5) {
												pisteet5 = Number(pisteet5) + 1;
											}
											$(".fiilis").hide();
											$("#numerorivi").hide();
											$(this).show();

											aanet = Number(aanet) + 1

											$("#kiitos").html("Kiitos!")
													.fadeIn("fast");
											$("#kiitos").css({
												"font-weight" : "bold",
												"font-size" : "80px",
												"color" : "red"
											});

											keskiarvo = yhteispisteet / aanet;
											keskiarvo = keskiarvo.toFixed(2);

											setCookie("keskiarvokeksi",
													keskiarvo, 365);
											setCookie("aanetkeksi", aanet, 365);
											setCookie("pisteet1keksi",
													pisteet1, 365);
											setCookie("pisteet2keksi",
													pisteet2, 365);
											setCookie("pisteet3keksi",
													pisteet3, 365);
											setCookie("pisteet4keksi",
													pisteet4, 365);
											setCookie("pisteet5keksi",
													pisteet5, 365);
											setCookie("yhteispisteetkeksi",
													yhteispisteet, 365);

											$("#tulos")
													.html(
															"Fiiliksiä annettu: "
																	+ aanet
																	+ "<br><br> Fiiliskeskiarvo on: "
																	+ keskiarvo
																	+ "<br> <br> "
																	+ pisteet1
																	+ "<br>"
																	+ pisteet2
																	+ "<br>"
																	+ pisteet3
																	+ "<br>"
																	+ pisteet4
																	+ "<br>"
																	+ pisteet5);
											setTimeout(vaihdaTeksti, 1000);

										});

						function vaihdaTeksti() {

							$("#kiitos").fadeOut(
									function() {
										$(this).text("Anna loppufiilis!")
												.fadeIn("fast");
										$("#kiitos").css({
											"font-weight" : "normal",
											"font-size" : "40px",
											"color" : "black"
										});
										$('.fiilis').prop("disabled", false);
									});
							$(".fiilis").fadeIn("slow");
							$("#numerorivi").fadeIn("slow");

						}

						$('#tulokset').click(function() {

							if (esilla == 1) {
								$("#tulos").hide();
								esilla = 0;
								$("#tulokset").text("Näytä tulokset");
							} else {
								$("#tulos").show();
								esilla = 1;
								$("#tulokset").text("Piilota tulokset");
							}

						});

						$('#nollaa')
								.click(
										function() {

											setCookie("keskiarvokeksi", 0, 365);
											setCookie("aanetkeksi", 0, 365);
											setCookie("pisteet1keksi", 0, 365);
											setCookie("pisteet2keksi", 0, 365);
											setCookie("pisteet3keksi", 0, 365);
											setCookie("pisteet4keksi", 0, 365);
											setCookie("pisteet5keksi", 0, 365);
											setCookie("yhteispisteetkeksi", 0,
													365);

											keskiarvo = getCookie("keskiarvokeksi");
											pisteet1 = getCookie("pisteet1keksi");
											pisteet2 = getCookie("pisteet2keksi");
											pisteet3 = getCookie("pisteet3keksi");
											pisteet4 = getCookie("pisteet4keksi");
											pisteet5 = getCookie("pisteet5keksi");
											yhteispisteet = getCookie("yhteispisteetkeksi");
											aanet = getCookie("aanetkeksi");

											$("#tulos")
													.html(
															"Fiiliksiä annettu: "
																	+ aanet
																	+ "<br><br> Fiiliskeskiarvo on: "
																	+ keskiarvo
																	+ "<br> <br> "
																	+ pisteet1
																	+ "<br>"
																	+ pisteet2
																	+ "<br>"
																	+ pisteet3
																	+ "<br>"
																	+ pisteet4
																	+ "<br>"
																	+ pisteet5);
										});

					});

	function setCookie(cname, cvalue, exdays) {
		var d = new Date();
		d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
		var expires = "expires=" + d.toUTCString();
		document.cookie = cname + "=" + cvalue + "; " + expires;
	}

	function getCookie(cname) {
		var name = cname + "=";
		var ca = document.cookie.split(';');
		for (var i = 0; i < ca.length; i++) {
			var c = ca[i];
			while (c.charAt(0) == ' ')
				c = c.substring(1);
			if (c.indexOf(name) == 0)
				return c.substring(name.length, c.length);
		}
		return "";
	}
</script>


</head>

<body>

	<div class="container-full">



		<!-- Main component for a primary marketing message or call to action -->
		<br> <br> <a href="tuloksiin">Näytä tulokset</a>
		<div id="tyhjatila">
			<h1 id="kiitos" class="text-center">Anna loppufiilis</h1>
		</div>
		<br>



		<div class="row">
			<div class="col-md-2 col-xs-2 col-md-offset-1 col-xs-offset-1">
				<button class="btn-block fiilis" value="1">
					<img src="resources/images/1.png" class="img-responsive"
						alt="Smiley face">
				</button>
			</div>
			<div class="col-md-2 col-xs-2">
				<button class="btn-block fiilis" value="2">
					<img src="resources/images/2.png" class="img-responsive"
						alt="Smiley face">
				</button>
			</div>
			<div class="col-md-2 col-xs-2">
				<button class="btn-block fiilis" value="3">
					<img src="resources/images/3.png" class="img-responsive"
						alt="Smiley face">
				</button>
			</div>
			<div class="col-md-2 col-xs-2">
				<button class="btn-block fiilis" value="4">
					<img src="resources/images/4.png" class="img-responsive"
						alt="Smiley face">
				</button>
			</div>
			<div class="col-md-2 col-xs-2">
				<button class="btn-block fiilis" value="5">
					<img src="resources/images/5.png" class="img-responsive"
						alt="Smiley face">
				</button>
			</div>
		</div>
		<div id="tyhjatila">
			<div class="row" id="numerorivi">
				<div class="col-md-2 col-xs-2 col-md-offset-1 col-xs-offset-1">
					<h3 class="text-center">1</h3>
				</div>
				<div class="col-md-2 col-xs-2">
					<h3 class="text-center">2</h3>
				</div>
				<div class="col-md-2 col-xs-2">
					<h3 class="text-center">3</h3>
				</div>
				<div class="col-md-2 col-xs-2">
					<h3 class="text-center">4</h3>
				</div>
				<div class="col-md-2 col-xs-2">
					<h3 class="text-center">5</h3>
				</div>
			</div>
		</div>




		<div class="row">
			<div class="col-md-6 col-xs-10 col-md-offset-3 col-xs-offset-1">
				<button id="tulokset" class="btn-block">Näytä tulokset</button>

				<h2 id="tulos" class="text-center"></h2>

				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br>
				<button id="nollaa" class="btn-block">Nollaa</button>
			</div>
			</div>
			<!-- row päättyy -->




		</div>
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
