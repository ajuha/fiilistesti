<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>

    <!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/styles/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/styles/tyyli.css">

    <!-- Custom styles for this template -->
    <link href="navbar.css" rel="stylesheet">

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






</script>


  </head>

  <body>

           
       
 <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="loginsivulle">Etusivu</a></li>
						
					</ul>
					<!--Tämän kommentin alla ovat oikealla olevat linkit-->
					<ul class="nav navbar-nav navbar-right">
					<li> <a href="pyydatunnus"> Pyydä tunnus</a></li>
				
					</ul>
				</div>
           </div> 
        <!-- /.container -->
    </nav>
<br>
    <!-- Page Content -->
    <div class="container">
<br>
<br>
<br>
        <!-- Jumbotron Header -->
        <header class="jumbotron hero-spacer">
        	<c:if test="${not empty loggedout}">
		<p class="Info text-success text-center">Uloskirjautuminen onnistui</p>
	</c:if>
        
        
            <h1 style="text-align: center; font-family: 'Montserrat', sans-serif;">Tervetuloa fiilissivulle!</h1>
             <div id="sisalto">
	<h2 class="text-center" style="font-family: 'Montserrat', sans-serif;">KIRJAUDU SISÄÄN</h2>

	<c:if test="${not empty loginerror}">
		<p class="Error text-danger" style="text-align: center;">Sisäänkirjautuminen epäonnistui. Käyttäjätunnus tai salasana on syötetty väärin.</p>
	</c:if>


	
	<form action="j_spring_security_check" method="post">
	<fieldset>
		<table>
		<tr><td>USERNAME: (matti)</td><td><input type='text' name='j_username' value=''></td></tr>
		<tr><td>PASSWORD: (masanpassu)</td><td><input type='password' name='j_password' /></td></tr>
		
		</table>
		<button class="center-block btn btn-primary"type="submit">Kirjaudu</button>
	</fieldset>
	</form>
	
	 
	</div>
	
	
        </header>

        <hr>


  


 

      
      
      




    </div> <!-- /container -->



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
