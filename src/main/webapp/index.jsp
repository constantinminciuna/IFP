<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="it.betacom.dao.*, it.betacom.bean.*, java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" type="text/javascript"></script>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/index.css">
	<title>Home page</title>
</head>
<body>
    <div id="home"></div>
    <nav>
        <div class="nav-left">
            <a class="nav-link" onclick="auto_scroll('home')">HOME</a>
			<a class="nav-link" onclick="auto_scroll('sediscroll')">SEDI</a>
			<a class="nav-link" onclick="auto_scroll('corsiscroll')">CORSI</a>
			<a class="nav-link" onclick="auto_scroll('docentiscroll')">DOCENTI</a>
        </div>
        	
        <div class="nav-center">
        	<h1 class="site-title"><strong>CORSOCOM</strong></h1>
        </div>
        
        <div class="nav-right">
            <a href="jsp/user/signupform.jsp" class="nav-link">SIGNUP</a>
            <a href="jsp/user/loginform.jsp" class="nav-link">LOGIN</a>
            <!-- Aggiungi qui il nome dell'utente loggato, se presente -->
        </div>
    </nav>
    
    <div class="content">
        <h2>Istituto di Formazione Professionale</h2>
    	<p>Benvenuti nel nostro sito dedicato a Corsocom! Qui troverete tutte le informazioni riguardanti il progetto, le sue sedi, i corsi offerti e i nostri docenti esperti.</p>
    	<p>Vi invitiamo a esplorare il nostro sito e a contattarci se avete domande o volete saperne di più. Siamo entusiasti di condividere con voi il nostro progetto innovativo e stimolante.</p>
    	
    	<div class="block-container-home">
	    	<div class="content-block">
			    <h2>Come si svolgono</h2>
			    <p>I nostri corsi si svolgono attraverso lezioni frontali con professionisti e docenti certificati.</p>
			</div>
			
			<div class="content-block">
			    <h2>Quanto durano</h2>
			    <p>La durata della formazione varia a seconda del corso e richiedono un impegno full-time di alcuni mesi.</p>
			</div>
			
			<div class="content-block">
			    <h2>A chi si rivolgono</h2>
			    <p>Cerchiamo neodiplomati e laureati proattivi e con una vera passione per la tecnologia.</p>
			</div>
    	</div>
    	
	    <div id="sediscroll">
	    	<h2>Le nostre sedi</h2>
			
			<div class="block-container">
				<div class="content-block-site">	
					<h2>Roma</h2>
					<h3>Sede principale</h3>
					<p>Via Cantore 55</p>
					<p>06888444</p>
				</div>
				<button class="button-42" id="sedi">Visualizza Sedi</button>
				<br>
				<div id="risp1"></div>
				<div id="err1"></div>
				<div id="empty"></div>
			</div>
			
	    </div>	
	    <div id="corsiscroll">
	    	<h2>I nostri corsi</h2>
	    	
	    	<div class="block-container">
				<button class="button-42" id="corsi">Visualizza Corsi</button>
				<br>
				<div id="risp2"></div>
				<div id="err2"></div>
				<div id="empty"></div>
			</div>
	    	
	    </div>
	    <div id="docentiscroll">
	    	<h2>I nostri docenti</h2>
	    	
	    	<div class="block-container">
				<button class="button-42" id="docenti">Visualizza Docenti</button>
				<br>
				<div id="risp3"></div>
				<div id="err3"></div>
				<div id="empty"></div>
			</div>
			
	    </div>
    </div>
    
    <footer class="site-footer">
	    <div class="footer-content">
	        <p>&copy; 2023 Corsocom. Tutti i diritti riservati.</p>
	    </div>
	</footer>
	<script>
		window.addEventListener('scroll', function() {
			var navbar = document.querySelector('.navbar');
			if (window.scrollY > 100)
				navbar.classList.add('fixed')
			else
				navbar.classList.remove('fixed')
		})

		function auto_scroll(classe) {
			const y = document.getElementById(classe).getBoundingClientRect().top
					+ window.pageYOffset;

			window.scrollTo({
				top : y,
				behavior : 'smooth'
			});
		}
		
		$(function() {
			$('#sedi').click(function() {
				$.ajax({
					url : 'http://localhost:8080/IFP/restapi/sedi',
					success : function(risposte) {
						var html = ""; // Creo una variabile per costruire il contenuto HTML
						risposte.forEach(function(risposta) { // Itero attraverso tutte le risposte
							if (risposta.citta != "Roma")
								html += "<div class='content-block-site'><h2>"+ risposta.citta+ "</h2><p>"+ risposta.indirizzo
								+ "</p><p>Tel: "+ risposta.telefono+ "</p></div>";
						});
						$('#risp1').html(html);
					},
					error : function(error) {
						if (error.status == 404) {
							console.log("Risorsa non trovata: error status = " + error.status);
							$('#err1').html("<div style='color: red'> errore: risorsa non trovata</div>");
						}
					}
				})
			})
			$('#corsi').click(function() {
				$.ajax({
					url : 'http://localhost:8080/IFP/restapi/corsi',
					success : function(risposte) {
						var html = ""; // Creo una variabile per costruire il contenuto HTML
						risposte.forEach(function(risposta) { // Itero attraverso tutte le risposte
							if (risposta.citta != "Roma")
								html += "<div class='content-block-course'><h2>"+ risposta.nome + "</h2><p>Durata: "+ risposta.durata + 
								" ore</p><p>Docente: "+ risposta.docente.nome+ " "+ risposta.docente.cognome + "</p></div>";
						});
						$('#risp2').html(html);
					},
					error : function(error) {
						if (error.status == 404) {
							console.log("Risorsa non trovata: error status = "+ error.status);
							$('#err2').html("<div style='color: red'> errore: risorsa non trovata</div>");
						}
					}
				})
			})
			$('#docenti').click(function() {
				$.ajax({
					url : 'http://localhost:8080/IFP/restapi/docenti',
					success : function(risposte) {
						var html = ""; // Creo una variabile per costruire il contenuto HTML
						risposte.forEach(function(risposta) { // Itero attraverso tutte le risposte
							if (risposta.citta != "Roma")
								html += "<div class='content-block-teacher'><h2>" + risposta.nome+ " "+ risposta.cognome + "</h2>" +
								"<p>Tel: " + risposta.telefono + "</p>" +
								"<p>Titolo di studio: " + risposta.titolo_di_studio + "</p></div>";
							
						});
						$('#risp3').html(html);
					},
					error : function(error) {
						if (error.status == 404) {
							console.log("Risorsa non trovata: error status = "+ error.status);
							$('#err3').html("<div style='color: red'> errore: risorsa non trovata</div>");
						}
					}
				})
			})
			$('#empty').click().html("")
		})
	</script>
</body>
</html>