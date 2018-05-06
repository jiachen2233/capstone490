<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("Login");
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
        <script src="Assets/js/js.js"></script>
        <link href="Assets/css/style.css" rel="stylesheet">
        <link rel="icon" href="Assets/image/favicon.png">
        <link rel='stykesheet' href=""/>
        <script type="">
            $(document).ready(function() {
			                        
                $("#getAll").click(function () {
                    loadData();
                });
                
                $("#beds").click(function () {
                    filterData();
                });
                $("#baths").click(function () {
                    filterData();
                });
                $("#price").click(function () {
                    filterData();
                });
                $('select[name=priceSelect]').click(function(){
                    filterData();
                });
                $("#beds").keyup(function () {
                    filterData();
                });
                $("#baths").keyup(function () {
                    filterData();
                });
                $("#price").keyup(function () {
                    filterData();
                });
                                
                $("#filter").click(function(){
                    filterData();
                });
                
                function filterData(){
                    var hasBeds = "no", beds = "", hasBaths = "no", baths = "", hasPrice = "no", priceSign = "=", price = "0";
                    var beds = $("#beds").val();
                    var baths = $("#baths").val();
                    if(beds !== ""){
                        hasBeds = "yes";
                    }
                    if(baths !== ""){
                        hasBaths = "yes";
                    }
                    
                    var price = $("#price").val();
                    if(price === ""){
                        hasPrice = "no";
                    }else{
                        hasPrice = "yes";
                        priceSign = $('select[name=priceSelect]').val();
                    }
                    
                    $.ajax({
                        url: "Assets/jsp/filterListing.jsp",
                        type: "POST",
                        dataType: "json",
                        data: "hasBeds="+hasBeds+"&beds="+beds+"&hasBaths="+hasBaths+"&baths="+baths+"&hasPrice="+hasPrice+"&priceSign="+priceSign+"&price="+price
                    }).done(function(results) { 
                          console.log(results);
                        $('#dataTable').DataTable( {
                                destroy: true,
                                data: results,
                                columns: [
                                {data: 'address'},
                                {data: "unit"},
                                {data: "beds"},
                                {data: "baths"},
                                {data: "price"},
                                {data: "buildingID"},
                                {data: "link"}
                                ]
                        } );
                    });
                };

                loadData();
                
                function loadData(){
                    
                    $.ajax({
                        url: "Assets/jsp/getListing.jsp",
                        type: "POST",
                        dataType: "json"
                    }).done(function(results) { 
                          console.log(results);
                        $('#dataTable').DataTable( {
                                destroy: true,
                                data: results,
                                columns: [
                                {data: 'address'},
                                {data: "unit"},
                                {data: "beds"},
                                {data: "baths"},
                                {data: "price"},
                                {data: "buildingID"},
                                {data: "link"}
                                ]
                        } );
                    });
                }
            });
        </script>

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
                            <a class="nav-link" href="Welcome">Welcome</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Logout">Logout</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="https://sites.google.com/site/reratingsys/home">Google Site</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <!-- Begin page content -->
        <main role="main" class="container">
            <div class="content">

                <div class="row">
                    <div class="col-md-6 home heading">
                        <h4 class="" >View Listings</h4>
                    </div>
                </div>
                <div class="row home">
                    <div class="col-xs-12">
                        <p class="p-view" ><button class="btn-primary" id="getAll">Show All Listings</button></p>
                        <div class="input-group">
                            <p class="p-view">Show listings with <input type="number" id="beds" class="txt"> Beds,
                                <input type="number" id="baths"  class="txt"> Baths, 
                                Price <select name="priceSelect">  
                                    <option value="=">=</option>
                                    <option value=">">></option>
                                    <option value="<"><</option>
                                </select>
                                <input type="number" id="price" placeholder="Price">
                            <div class="input-group-append">
                                <button class="btn-primary" id="filter">
                                    <span class="fa fa-search">GO</span>
                                </button>
                            </div>
                        </div>
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12 table-responsive">
                        <table id="dataTable" class="table table-striped table-bordered" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Address</th>
                                    <th>Unit</th>
                                    <th>Beds</th>
                                    <th>Baths</th>
                                    <th>Price</th>
                                    <th>Listing ID</th>
                                    <th>Leave a review</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Address</th>
                                    <th>Unit</th>
                                    <th>Beds</th>
                                    <th>Baths</th>
                                    <th>Price</th>
                                    <th>Listing ID</th>
                                    <th>Leave a review</th>
                                </tr>
                            </tfoot>

                        </table>
                    </div>
                </div>
            </div>
        </main>

        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src="Assets/js/index.js"></script>
        <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
        <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css'>
        <link rel='stylesheet prefetch' href='https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css'>

    </body>
</html>