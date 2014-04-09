<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
    
<%@ page import="java.io.File" %>
<%@ page import="java.io.*"  %>
<%@ page import="java.util.*"  %>
<%@ page import="java.io.*"  %>

<%@ page import = "java.lang.management.ThreadInfo"  %>
<%@ page import = "java.lang.management.ManagementFactory" %>
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

      <div>
      <br>
      <br>
      <center>
		<img src="images/newreliclogo.jpg" width="230" height="200"/>
		<div id="selectedServer"></div>
	</center>
	<br>
		<h2> Looks like your agent is not Running </h2>
		<p> Thats not a problem we will help you get this up and running.  Here is a little information to help get you started.</p>
		<p>It looks like you are running <%out.println(application.getServerInfo()); %>, we are going to help you with some common troubleshooting techniques to try and get this up and running.  We are also including a list of your system information so that after we go through all of these steps you can
			send us this information to help streamline your troubleshooting process.  Once you have completed the steps below restart had run this again, if you get back to this page hit the next button on the bottom to continue.</p>
		
		<div id="troubleOne"></div>
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
		<div id="troubleTwo"></div>
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
		
		<div id="troubleThree"></div>
		<p>Once you have collected all of this information please bundle all of it and start a support ticket with us here at <a herf="www.support.newrelic.com">support.newrelic.com</a>.  When you do please make sure to attach what you have collected along with letting us know you have used the diagnostics tool, this will help us streamline your issue
		 and hopefully cut down on resolution time with you.</p>
		 <br>
		 <br>	


		
		<h4>System Information</h4>
		<br>
		
		<p><b>Application Server :</b>  <span id="serverType"><%out.println(application.getServerInfo()); %></span></p>
		
		<p><b>Current Directory : </b><%File file = new File("."); out.println(file.getCanonicalPath());%> </p>
		
		<p> <b>CL Path Set : </b><% out.println("-s " + file.getCanonicalPath());%></p> 
		
		<p> <b>OS Arch :</b><% out.println(System.getProperty("os.arch")); %></p>
		
		<p> <b>Java Class Path :</b><% out.println(System.getProperty("java.class.path")); %></p>
		
		<p> <b>Java Home :</b><% out.println(System.getProperty("java.home")); %></p>
		
		<p> <b>Vendor :</b><% out.println(System.getProperty("java.vendor")); %></p>
	
		<p> <b>Java Version :</b><% out.println(System.getProperty("java.version")); %></p>
		
		<p> <b>OS Name :</b><% out.println(System.getProperty("os.name")); %></p>

		<p> <b>Directory :</b><% out.println(System.getProperty("user.dir")); %></p>
	
		<p> <b>Host :</b><% out.println(request.getServerName()); %></p>

		<p> <b>Port :</b><% out.println(request.getServerPort()); %></p>
		
		
		<p><b>Command Line Arguments : </b><% 

			strarray = arguments.toArray(new String[0]);

		  
		  	for(String s : strarray)
			  out.println(s);
			  
			  %>
		 </p> 
		<br><br>
		
		<script>
		
		    	var x = <% ThreadInfo[] dumpAllThreads = ManagementFactory.getThreadMXBean().dumpAllThreads(false, false);
		    	boolean isRunning = false;
		    	
				for (ThreadInfo info : dumpAllThreads){ 	
					if (info.getThreadName().contains("New Relic")) {
						isRunning = true;
					}
				}
				out.println(isRunning);%>
				
				function nextPage()
				{
						window.location.href = "final.jsp";
				}
				
				
		</script>
		<p><a class="btn btn-primary btn-lg" onClick="nextPage()">Continue to Next Step</a></p>
	</div>
    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="diagtool.js"></script>
    
    <script src="../../dist/js/bootstrap.min.js"></script>
  </body>
</html>
