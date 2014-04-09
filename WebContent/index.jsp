<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
    
<%@ page import="java.io.File" %>
<%@ page import="java.io.*"  %>
<%@ page import = "java.lang.management.ThreadInfo"  %>
<%@ page import = "java.lang.management.ManagementFactory" %>

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

      <div class="starter-template">
        <img src="images/newreliclogo.jpg" width="230" height="200"/>
      
        <h1>Java Agent's Diagnostics Tool</h1>
        <p>This tool will help you with installing and troubleshooting your New Relic Java agent.</p>
    
        <h2>Thank you for choosing New Relic!</h2>
          <p>If you have any questions or concerns about New Relic or any of its features please let us know by opening a ticket with us by selecting contact us in the upper right.</p>
          <br>
          <p><a class="btn btn-primary btn-lg" onClick="isRunning()">Start Diagnostics Now!</a></p>
	 
	 <script>
	 
	 var x = <% ThreadInfo[] dumpAllThreads = ManagementFactory.getThreadMXBean().dumpAllThreads(false, false);
     boolean isRunning = false;
     		
		for (ThreadInfo info : dumpAllThreads){ 	
			if (info.getThreadName().contains("New Relic")) {
				isRunning = true;
			}
		}
		out.println(isRunning);%>
		
		function isRunning()
		{
			if(x == true){
				window.location.href = "working.jsp";
			}
			else{
				window.location.href = "diagStart.jsp";
			}
		}
		
	 </script>
	</div>
    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
  </body>
</html>
