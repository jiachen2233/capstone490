$(function () {
    var loginForm = $("#Login_Form");
    var reviewForm = $("#Review_Form");
    var addListingForm = $("#AddListing_Form");
    var usertype = $('select[name=usertype]');
    var password = $("#password");

    var loginURL = "../Assets/jsp/login.jsp";
    var addListingURL = "../Assets/jsp/addlisting.jsp";
    var reviewURL = "../Assets/jsp/addreview.jsp";

    loginForm.submit(function (e) {
        e.preventDefault();
        $.ajax({
            url: loginURL,
            type: "POST",
            dataType: "json",
            data: "usertype=" + usertype.val() + "&password=" + password.val()

        }).done(function (result) {
            if (result['success'] === "0") {
                alert(result['message']);
            } else {
                window.location.assign("../Welcome")
            }
        });

    });

    addListingForm.submit(function (e) {
        e.preventDefault();
        var address = $("#address").val();
        var unit = $("#unit").val();
        var beds = $("#beds").val();
        var baths = $("#baths").val();
        var price = $("#price").val();
        $.ajax({
            url: addListingURL,
            type: "POST",
            dataType: "json",
            data: "address=" + address + "&unit=" + unit + "&beds=" + beds + "&baths=" + baths + "&price=" + price

        }).done(function (result) {
            alert(result['message']);
            if (result['success'] === 1) {
                $("#AddListing_Form")[0].reset();
            }
        });

    });

    reviewForm.submit(function (e) {
        e.preventDefault();
        var stars = $("#whatever1").val();
        var email = $("#email").val();
        var review = $("#review").val();
        var listing = getUrlParameter('ID');
        $.ajax({
            url: reviewURL,
            type: "POST",
            dataType: "json",
            data: "stars=" + stars + "&email=" + email + "&review=" + review+"&listing="+listing

        }).done(function (result) {
            alert(result['message']);
            if (result['success'] === 1) {
                $("#Review_Form")[0].reset();
            }
        });
    });

    function getUrlParameter(sParam) {
        var sPageURL = decodeURIComponent(window.location.search.substring(1)),
                sURLVariables = sPageURL.split('&'),
                sParameterName,
                i;

        for (i = 0; i < sURLVariables.length; i++) {
            sParameterName = sURLVariables[i].split('=');

            if (sParameterName[0] === sParam) {
                return sParameterName[1] === undefined ? true : sParameterName[1];
            }
        }
    }
    ;

});