$(document).ready(function() {

	var server = $("#serverType").text().trim();
		
	 
	if(server.match(/tomcat/i)){
		console.log(server);
		$("#selectedServer").html("<h1>Tomcat Installation Troubleshooting</h1>");
		$("#troubleOne").html("<h2>Step 1</h2>");
		$("#troubleTwo").html("<h2>Step 2</h2>");
		$("#troubleThree").html("<h2>Step 3</h2>");

	}
	else if(server.match(/jetty/i)){
		
	}
	else if(server.match(/jboss/i)){
		
	}
	else if(server.match(/glassfish/i)){
		
	}
	else{
		
	}
      
      
  
});