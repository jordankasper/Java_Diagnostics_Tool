$(document).ready(function() {

	var server = $("#serverType").text().trim();
		
	 
	if(server.match(/tomcat/i)){
		console.log(server);
		$("#selectedServer").html("<h1>Tomcat Installation Troubleshooting</h1>");
		$("#troubleOne").html("<h2>Step 1 </h2>" +
				"<p> First lets make sure you are installing using the correct steps, with Tomcat you can use the auto installer which should be the easiest way to do this.  These steps can be found here <a href='https://docs.newrelic.com/docs/java/java-agent-self-installer'>Java Agent self installer</a>" +
				"<p> Unless you have special install considerations, you should be able to complete your New Relic install by following the directions on Get started with Web App Monitoring. This page provides additional information on the install process." +
				"</h2>");
		$("#troubleTwo").html("<h2>Step 2</h2>" +
				"The Tomcat startup script (catalina.sh) can be configured to use the New Relic agent using the JAVA_OPTS environment variable: export JAVA_OPTS='$JAVA_OPTS -javaagent:/full/path/to/newrelic.jar' The -javaagent switch should reference the full path to the newrelic.jar file." +
				"" +
				"");
		$("#troubleThree").html("<h2>Step 3</h2>" +
				"<p>Once you have that set up make sure you have read and write permissions to the folders New Relic needs to access.  Once you have that restart your application server and try running New Relic again.  If this does not work after running this continue to the next page so we can continue to troubleshoot this with you.");

	}
	
	
	else if(server.match(/jetty/i)){
		$("#selectedServer").html("<h1>Jetty Installation Troubleshooting</h1>");
		$("#troubleOne").html("<h2>Step 1 </h2>" +
				"<p> First lets make sure you are installing using the correct steps, with Jetty you can use the auto installer which should be the easiest way to do this.  These steps can be found here <a href='https://docs.newrelic.com/docs/java/java-agent-self-installer'>Java Agent self installer</a>" +
				"<p> Unless you have special install considerations, you should be able to complete your New Relic install by following the directions on Get started with Web App Monitoring. This page provides additional information on the install process." +
				"</h2>");
		$("#troubleTwo").html("<h2>Step 2</h2>" +
				"The Jetty startup script (jetty.sh) can be configured using the JAVA_OPTIONS environment variable: export JAVA_OPTIONS='${JAVA_OPTIONS} -javaagent:/full/path/to/newrelic.jar' The -javaagent switch should reference the full path to the newrelic.jar file.");
		$("#troubleThree").html("<h2>Step 3</h2>" +
				"<p>Once you have that set up make sure you have read and write permissions to the folders New Relic needs to access.  Once you have that restart your application server and try running New Relic again.  If this does not work after running this continue to the next page so we can continue to troubleshoot this with you.");
	}
	
	
	else if(server.match(/jboss/i)){
		$("#selectedServer").html("<h1>Jboss Installation Troubleshooting</h1>");
		$("#troubleOne").html("<h2>Step 1 </h2>" +
				"<p> First lets make sure you are installing using the correct steps, with Jboss you can use the auto installer which should be the easiest way to do this.  These steps can be found here <a href='https://docs.newrelic.com/docs/java/java-agent-self-installer'>Java Agent self installer</a>" +
				"<p> Unless you have special install considerations, you should be able to complete your New Relic install by following the directions on Get started with Web App Monitoring. This page provides additional information on the install process." +
				"</h2>");
		$("#troubleTwo").html("<h2>Step 2</h2>" +
				"<p>With manual installation for Jboss there are two ways you can do it, first is Domain mode and the second is Standalone mode.  For Domain mode The domain mode directions are relevant to JBoss versions 6.x EAP or 7.0.x AS and above.  The JVM properties for each server group are found in domain/configuration/domain.xml." +
				"The JVM properties for each server group must be modified to include the -javaagent flag.  Be sure the -javaagent switch references the full path to the newrelic.jar file.  If you are installing on Windows, be sure to use forward slashes. For example: C:/newrelic/newrelic.jar.</p>" +
				"<p> With stand alone mode there are a few different ways you can do it depending on what Platform you are using.  These can be viewed here <a href='https://docs.newrelic.com/docs/java/jboss-installation-for-java'>Jboss Stand Alone Configuration </a> </p> ");
		$("#troubleThree").html("<h2>Step 3</h2>" +
				"<p>Once you have that set up make sure you have read and write permissions to the folders New Relic needs to access.  Once you have that restart your application server and try running New Relic again.  If this does not work after running this continue to the next page so we can continue to troubleshoot this with you.");
	}
	
	
	else if(server.match(/glassfish/i)){
		$("#selectedServer").html("<h1>Glashfish Installation Troubleshooting</h1>");
		$("#troubleOne").html("<h2>Step 1 </h2>" +
				"<p> First lets make sure you are installing using the correct steps, with Glassfish you can use the auto installer which should be the easiest way to do this.  These steps can be found here <a href='https://docs.newrelic.com/docs/java/java-agent-self-installer'>Java Agent self installer</a>" +
				"<p> Unless you have special install considerations, you should be able to complete your New Relic install by following the directions on Get started with Web App Monitoring. This page provides additional information on the install process." +
				"</h2>");
		$("#troubleTwo").html("<h2>Step 2</h2>" +
				"<p>To install the New Relic java agent on Glassfish:</p>" +
				"<p>Access the Glassfish console, in the left hand tree, select Application Server > JVM Settings tab > JVM Options.  In the left hand tree, select Application Server > JVM Settings tab > JVM Options.  On the JVM Options page, select Add JVM Option.  Add an entry for the -javaagent switch. -javaagent:/full/path/to/newrelic.jar Select Save. Restart Glassfish.</p>");
		$("#troubleThree").html("<h2>Step 3</h2>" +
				"<p>Once you have that set up make sure you have read and write permissions to the folders New Relic needs to access.  Once you have that restart your application server and try running New Relic again.  If this does not work after running this continue to the next page so we can continue to troubleshoot this with you.");
	}
	else{
		$("#selectedServer").html("<h1>Unknown Application or Web Server</h1>");
		$("#troubleOne").html("<h2>Step 1 </h2>" +
				"<p> It looks like we do not reconize the application or webserver you are trying to run this on, make sure you are using either Tomcat, Jetty, Jboss or Glassfish.  If you are not using on of those please feel free to access our community forum at <a href='http://discuss.newrelic.com/'>New Relic Community Forums </a> </p>");
	}
      
      
  
});