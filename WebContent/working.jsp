<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
    
<%@ page import="java.io.File" %>
<%@ page import="java.io.*"  %>
<%@ page import = "java.lang.management.ThreadInfo"  %>
<%@ page import = "java.lang.management.ManagementFactory" %>
<%@ page import="java.util.*"  %>
<%@ page import = "java.lang.management.RuntimeMXBean;"  %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

    <title>New Relic Java Diagnostics Tool</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/template.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
      <script>
		
		    	var x = <% ThreadInfo[] dumpAllThreads = ManagementFactory.getThreadMXBean().dumpAllThreads(false, false);
		    	boolean isRunning = false;
		    	
				for (ThreadInfo info : dumpAllThreads){ 	
					if (info.getThreadName().contains("New Relic")) {
						isRunning = true;
					}
				}
				out.println(isRunning);%>
				
				
		</script>
    <![endif]-->
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">New Relic Java Diagnostics Tool</a>
        </div>
        <div class="navbar-collapse collapse">

          <ul class="nav navbar-nav navbar-right">

            <li><a href="https://newrelic.com/docs/java/new-relic-for-java">Agent Documentation</a></li>
            <li><a href="https://support.newrelic.com/anonymous_requests/new">Contact Support</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>

    <div class="container">

      <div class="">
      <br><br>
      <center>
      	<img src="images/newreliclogo.jpg" width="230" height="200"/>
        <h1>Congratulations!  Your New Relic Agent is running</h1>
	</center>
        <br>
        <p> Now that you have your application running you are almost done!  Now you will want to make sure it is reporting to New Relic correctly by logging into your New Relic dash board and viewing your application.  If you are seeing data coming in for your application
        	you can scroll below to see some of the options offered to help customize your New Relic experience or just start playing around with it on your own!  If you have gotten to this page but you are still not seeing anything in your New Relic dash board we will want to 
        	collect some information for us and try a few more steps to help get this resolved.  
        </p>
        
		<h1>Configuring your New Relic Experience</h1>	
		<p> The information below can all be found in our Java agent configuration documentation <a herf="https://docs.newrelic.com/docs/java/java-agent-configuration">https://docs.newrelic.com/docs/java/java-agent-configuration</a>.  However below there are a few key or most commonly used configurations that should help in getting you started with your monitoring.</p>

		<h3>app_name</h3>
		<p><b>Type:</b> String</p>
		<p><b>Default:</b>	(none)</p>
		<p>This setting is required. It contains the application name used to report data to New Relic.
			If enable_auto_app_naming is false, the agent reports all data to this application. Otherwise, the agent reports only background tasks (transactions for non-web applications) to this application.
			To report data to more than one application, separate the application names with a semicolon. For example, to report data to "My Application" and "My Application 2" use this:</p>
		<p>
			app_name: My Application;My Application 2
		</p>

				
		<h3>agent_enabled</h3>
		<p><b>Type:</b> Boolean</p>
		<p><b>Default:</b> True</p>
		<p>Flag to enable the agent. Use this setting to force the agent to run or not run.</p>

		
		<h3>enable_auto_app_naming</h3>
		<p><b>Type:</b> Boolean</p>
		<p><b>Default:</b> False</p>
		<p>Enables the reporting of data separately for each web application (version 1.2.008 or higher). Set to true to enable support for auto app naming. The name of each web app is detected automatically and the agent reports data separately for each one. This provides a finer-grained performance breakdown for Web apps in New Relic.
			See <a herf="https://docs.newrelic.com/docs/java/multiple-application-names">Java agent configuration - multiple applications</a>.</p>


		<h3>Custom instrumentation</h3>
		<p>These options set in the class_transformer stanza and can be overridden by using a newrelic.config.class_transformer prefixed system property.</p>
		<p><b>Type:</b> String</p>
		<p><b>Default:</b> (none)</p>
		<p>String containing the full class name of the annotation class the agent uses to determine which user-specified methods to instrument. For more information about custom annotations, see <a herf="https://docs.newrelic.com/docs/java/custom-instrumentation-with-the-java-agent">Java custom metric collection</a>.</p>

		
		<h1>Application Not Reporting Data</h1>	
		       <h2>Step 1</h2>
        <p>Please save this information below and send to us after you complete the following steps.</p>
        <p><b>Application Server :</b>  <%out.println(application.getServerInfo()); %></p>
        <p> <b>OS Arch :</b><% out.println(System.getProperty("os.arch")); %></p>
        <p><b>Command Line Arguments : </b><% 

			  RuntimeMXBean runtimeMxBean = ManagementFactory.getRuntimeMXBean();
			  List<String> arguments = runtimeMxBean.getInputArguments(); 
			  String[] strarray = arguments.toArray(new String[0]);

			  
			  for(String s : strarray)
				  out.println(s);
			  %>
		</p>
		<h2>Step 2</h2>
		<p>Next you are going to need to collect your New Relic log file for use.  For this we would apperciate seeing a JVM restart or start up for this to see what happens when it starts.  Along with that setting them to finer level will also be extremely helpful in seeing what the
			agent is doing.  Once you have collected about 5 minutes of logs you can turn finer off and then save them and send us this file along with the info from above.<p>
		<p>To do this please perform the following:</p>
		<ol>
			<li>Open your newrelic.yml file</li>
			<li>find the setting log_level:info</li>
			<li>change this to: log_level:finer</li>
			<li>save and exit newrelic.yml</li>
			<li>exercise your app for a couple minutes.</li>
			<li>send the newly generated log to us (The name of the log file is newrelic_agent.log and is generally in the "logs" directory which is created by the Agent in the same location as the newrelic.jar in the -javaagent switch (as long as that directory is writable by the JVM process)</li>
		</ol>
		<p>*note* Keep an eye on the log file size.  this can generate a lot of information very quickly, so it is best not to keep the agent at this level for longer than it takes to reproduce the problem you are experiencing.</p>
		
		<h2>Step 3</h2>
		<p>Once you have collected all of this information please bundle all of it and start a support ticket with us here at <a herf="www.support.newrelic.com">support.newrelic.com</a>.  When you do please make sure to attach what you have collected along with letting us know you have used the diagnostics tool, this will help us streamline your issue
		 and hopefully cut down on resolution time with you.</p>
		 <br>
		 <br>
		 
		
	</div>
    </div><!-- /.container -->




    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
  </body>
</html>
