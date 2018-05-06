<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    if (session.getAttribute("user") != null){
        response.sendRedirect("../Welcome");
        return;
    }
%>
<html>
    <head>
        <title>RE Rating System</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
        <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css"/>
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
        <link rel='stylesheet prefetch' href='https://raw.githubusercontent.com/kartik-v/bootstrap-star-rating/master/css/star-rating.min.css'>
        <script src="../Assets/js/js.js"></script>
        <link href="../Assets/css/style.css" rel="stylesheet">
        <link rel="icon" href="../Assets/image/favicon.png">
                
    </head>
    <body>
        <header>  
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
                <a class="navbar-brand" href="#">RE Rating System</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="https://sites.google.com/site/reratingsys/home">Website</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

		<header>Find Your New Home, Today!</header>
		
        <!-- Begin page content -->
        <main role="main" class="container">
            <div class="">
                <div class="row">
                    <div class="offset-lg-4 col-lg-6 content">
                    	<h1 class="heading" >Find Your New Home!</h1>
                    	<h2 class="heading" >Visit-Review-Purchase</h2>
                    	<br>
                        <h4 class="heading" >Log in to the RE Rating System</h4>
                        <form method="POST" action="" id="Login_Form">
                            <label>Username</label>
                            <select name="usertype" id="usertype" class="form-control" required="">
                                <option ></option>
                                <option value="Manager">Admin/Manager</option> 
                                <option value="Broker">Broker/Agent</option>                          
                                <option value="Guest">Guest User (PW: Guest)</option>
                            </select>
                            <label>Password</label>
                            <input type="password" id="password" name="password" class="form-control" placeholder="Password" required><br>
                            <p id="error"></p>
                            <button type="submit" class="btn btn-primary btn-block">Login</button>
                        </form>
                    </div>
                </div>
            </div>
			<div class="w3-display-bottomleft w3-text-grey w3-large" style="padding:24px 48px">
			    <i class="fa fa-facebook-official w3-hover-opacity"></i>
			    <i class="fa fa-instagram w3-hover-opacity"></i>
			    <i class="fa fa-snapchat w3-hover-opacity"></i>
			    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
			    <i class="fa fa-twitter w3-hover-opacity"></i>
			    <i class="fa fa-linkedin w3-hover-opacity"></i>
			</div>
        </main>

        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src="../Assets/js/index.js"></script>
    </body>
</html>
