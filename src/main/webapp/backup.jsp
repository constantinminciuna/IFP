<div class="content">
        <h2>Istituto di Formazione Professionale</h2>
    	<p>Benvenuti nel nostro sito dedicato a Corsocom! Qui troverete tutte le informazioni riguardanti il progetto, le sue sedi, i corsi offerti e i nostri docenti esperti.</p>
    	<p>Vi invitiamo a esplorare il nostro sito e a contattarci se avete domande o volete saperne di più. Siamo entusiasti di condividere con voi il nostro progetto innovativo e stimolante.</p>
    	
    	<div class="block-container">
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
					<c:forEach items="${listSede}" var="x">
						
						<div class="content-block-site">
						    <h2>${x.getCitta()}</h2>
						    <p>${x.getIndirizzo()}</p>
						    <p>${x.getTelefono()}</p>
						</div>
						
					</c:forEach>
				</div>
				
	    </div>	
	    <div id="corsiscroll">
	    	
	    	
	    	<h2>I nostri corsi</h2>
	    	
	    	<div class="block-container">
				<div class="content-block-course">
					<h2>Amministrazione Aziendale</h2>
					<p>Durata: 500 ore</p>
					<p>Docente: Mario Franceschini</p>
					<p>Titolo di studio: laurea</p>
					<p>
				</div>
					
				<div class="content-block-course">
				    <h2>Digital Marketing</h2>
				    <p>Durata: 500 ore</p>
					<p>Docente: Daniele Rossi</p>
					<p>Titolo di studio: diploma</p>
				</div>
					
				<div class="content-block-course">
				    <h2>Moda</h2>
				    <p>Durata: 500 ore</p>
					<p>Docente: Mario Bianchi</p>
					<p>Titolo di studio: laurea</p>
				</div>
				
				<div class="content-block-course">
				    <h2>Educazione dell’Infanzia</h2>
				    <p>Durata: 500 ore</p>
					<p>Docente: Sergio Russo</p>
					<p>Titolo di studio: laurea</p>
				</div>
			</div>
			
			<div class="block-container">
				<div class="content-block-course">
					<h2>Segreteria ed Amministrazione</h2>
					<p>Durata: 500 ore</p>
					<p>Docente: Laura Bianchi</p>
					<p>Titolo di studio: laurea</p>
				</div>
					
				<div class="content-block-course">
				    <h2>Web Design e Graphic Design</h2>
				    <p>Durata: 500 ore</p>
					<p>Docente: Giuseppe Altobelli</p>
					<p>Titolo di studio: diploma</p>
				</div>
					
				<div class="content-block-course">
				    <h2>Social Media Manager</h2>
				    <p>Durata: 500 ore</p>
					<p>Docente: Franco Rossi</p>
					<p>Titolo di studio: laurea</p>
				</div>
				
				<div class="content-block-course">
				    <h2>Animatore Sociale</h2>
				    <p>Durata: 500 ore</p>
					<p>Docente: Andrea Testini</p>
					<p>Titolo di studio: laurea</p>
				</div>
			</div>
	    </div>
	    <div id="docentiscroll">
	    	<h2>I nostri docenti</h2>
	    
	    	<div class="block-container">
				<div class="content-block-course">
					<h2>Segreteria ed Amministrazione</h2>
					<p>Durata: 500 ore</p>
					<p>Docente: Laura Bianchi</p>
					<p>Titolo di studio: laurea</p>
				</div>
					
				<div class="content-block-course">
				    <h2>Web Design e Graphic Design</h2>
				    <p>Durata: 500 ore</p>
					<p>Docente: Giuseppe Altobelli</p>
					<p>Titolo di studio: diploma</p>
				</div>
					
				<div class="content-block-course">
				    <h2>Social Media Manager</h2>
				    <p>Durata: 500 ore</p>
					<p>Docente: Franco Rossi</p>
					<p>Titolo di studio: laurea</p>
				</div>
				
				<div class="content-block-course">
				    <h2>Animatore Sociale</h2>
				    <p>Durata: 500 ore</p>
					<p>Docente: Andrea Testini</p>
					<p>Titolo di studio: laurea</p>
				</div>
			</div>
	    </div>
    </div>