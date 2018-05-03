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
            <div class="content">

                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-6 home listing-big">
                        <h4 class="heading" >Write Your Review</h4>
                        <div class="your-review">
                            <form method="POST" action="" id="Review_Form">
                            <p class="p-rate">Your email:</p>
                            <input type="email" id="email" name="email" class="form-control" required=""/>
                            <p class="p-rate">Your review:</p>
                            <textarea class="form-control" maxlength="250" rows="3" required="" id="review"></textarea>
                            <p class="p-rate">Rate:</p>
                            <div class="star-rating">
                                <span class="btn btn-sm btn-primary fa fa-lg fa-star-o" data-rating="1"></span>
                                <span class="btn btn-sm btn-primary fa fa-lg fa-star-o" data-rating="2"></span>
                                <span class="btn btn-sm btn-primary fa fa-lg fa-star-o" data-rating="3"></span>
                                <span class="btn btn-sm btn-primary fa fa-lg fa-star-o" data-rating="4"></span>
                                <span class="btn btn-sm btn-primary fa fa-lg fa-star-o" data-rating="5"></span>
                                <input type="hidden" name="whatever1" id="whatever1" class="rating-value" value="1">
                            </div>
                            <button class="btn btn-xs btn-block btn-primary">Submit Review</button>
                            </form>
                        </div>

                        <hr class="line">

                        </div>
                    </div>
                </div>
            </div>
        </main>

        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src="../Assets/js/index.js"></script>
    </body>
</html>

