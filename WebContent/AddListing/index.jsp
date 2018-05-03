<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("user") == null){
        response.sendRedirect("../Login");
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
                        <li class="nav-item">
                            <a class="nav-link" href="../Welcome">Welcome</a>
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
            <div class="">
                <div class="row">
                    <div class="offset-md-4 col-md-4 content">
                        <h4 class="heading" >Add Listing</h4>
                        <form method="POST" action="" id="AddListing_Form">
                            <label>Address</label>
                            <input type="text" id="address" class="form-control" placeholder="Address" required=""/>
                            <label>Unit</label>
                            <input type="text" id="unit" class="form-control" placeholder="Unit" required=""/>
                            <label>Beds</label>
                            <input type="number" id="beds" class="form-control" placeholder="Beds" required=""/>
                            <label>Baths</label>
                            <input type="number" id="baths" class="form-control" placeholder="Baths" required=""/>
                            <label>Price</label>
                            <input type="number" id="price" class="form-control" placeholder="Price" required=""/>
                            <p id="error"></p>
                            <button type="submit" class="btn btn-primary btn-block">Add Listing</button>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src="../Assets/js/index.js"></script>
    </body>
</html>