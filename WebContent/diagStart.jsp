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
		
		
		<div id="troubleOne"><span id="serverType"><%out.println(application.getServerInfo()); %></span></div>
       
		<div id="troubleTwo"></div>
		
		<div id="troubleThree"></div>
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
