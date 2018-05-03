<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   if (session.getAttribute("user") == null){
        response.sendRedirect("../Login");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>RE Rating System</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css"/>
        <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css'>
        <link rel='stylesheet prefetch' href='https://raw.githubusercontent.com/kartik-v/bootstrap-star-rating/master/css/star-rating.min.css'>
        <script src="../Assets/js/js.js"></script>
        <link href="../Assets/css/style.css" rel="stylesheet">
        <link rel="icon" href="../Assets/image/favicon.png">

    </head>
    <body>
        <header>
			<div class="w3-display-bottomleft w3-text-grey w3-large" style="padding:24px 48px">
			    <i class="fa fa-facebook-official w3-hover-opacity"></i>
			    <i class="fa fa-instagram w3-hover-opacity"></i>
			    <i class="fa fa-snapchat w3-hover-opacity"></i>
			    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
			    <i class="fa fa-twitter w3-hover-opacity"></i>
			    <i class="fa fa-linkedin w3-hover-opacity"></i>
			</div>
            <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
                <a class="navbar-brand" href="#">RE Rating System</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Welcome</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../Logout">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <!-- Begin page content -->
        <main role="main" class="container">
            <div class="content">

                <div class="row">
                    <div class="col-sm-0 col-xs-0 col-lg-3"></div>
                    <div class="col-lg-7 home listing-big">
                        <div class="">
                            <h4 class="" >Welcome <%out.print(session.getAttribute("user"));%>!</h4>
                        </div>
                        <div class="row">
                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 listing-welcome">
                            <a href="../ReadReviews" class="btn btn-xs btn-block btn-primary btn-view">Read Reviews</a>
                        </div>
                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 listing-welcome">
                            <a href="../" class="btn btn-xs btn-block btn-primary btn-view">View Listings</a>
                        </div>
                        <%if (session.getAttribute("user").equals("Broker")) {%>
                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 listing-welcome">
                            <a href="../AddListing" class="btn btn-xs btn-block btn-primary btn-view">Add Listing</a>
                        </div>
                        <%} else {%>
                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 listing-welcome">
                            <button class="btn btn-xs btn-block btn-gray btn-view disabled">Add Listing</button>
                        </div>
                        <% } %>
                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 listing-welcome">
                            <a href="../Logout" class="btn btn-xs btn-block btn-primary btn-view">Logout</a>
                        </div>
                        </div>
                    </div>
                </div>

            </div>
        </main>

        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script  src="../Assets/js/index.js"></script>
    </body>
</html>
