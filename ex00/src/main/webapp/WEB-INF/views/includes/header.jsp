<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <!-- jQuery -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
            $( function() {
              $( "#accordion" ).accordion();
            } );
            </script>
          </head>
          <body>
    <title>링컨코리아 홈페이지</title>
    <style>
        *{padding:0;margin:0;}
        ul, li{list-style: none;}
        .container{padding:0;overflow: hidden;}
        .navbar {margin-bottom: 0;background-color: white;z-index: 9999;border: 0;font: 15px bold black;line-height: 1.42857143 !important;letter-spacing: 4px;border-radius: 0;}
        .navbar li a, .navbar .navbar-brand {color: black;}
        .nav li{padding-left:50px;}
        .navbar-toggler {background-color:darkgray;color: #fff !important;}
        .carousel-inner img {width: 100%;height: 100%;}
        .col-md-6, .col-sm-4{width:100%;box-sizing: border-box;padding:0;overflow: hidden;float:left;position:relative;}
        /* .col-md-6{max-height:771px;} */
        /* .col-sm-3{height:524px;} */
        /* .col-sm-4{height:500px;} */
        .caption{width:100%;position: absolute;bottom:20px;text-align:center;color:white;font-size:1vw;}
        /* .row1, .row2{padding-top:10px;}
        .row1 img{transform:scale(1);transition: 0.5s;height:100%}
        .row1 img:hover{transform: scale(1.05);}
        .row2 img{transform:scale(1);transition: 0.8s;height:100%}
        .row2 img:hover{transform: scale(1.1);}*/

        .s-img-2{display: none;}

        #caption2{position:absolute;top:32%;}
        #caption3{position:absolute;top:70%;right:5%;text-align: right;}
        #caption4{position:absolute;top:30%;right:-62%;}
        #caption5{position:absolute;top:25%;right:5%;text-align: right;}

        #box1,#box2{padding-top:10px;box-sizing: border-box;}
        #box-left{box-sizing: border-box !important;height: 700px;}
        #box-right1, #box-right2{box-sizing: border-box !important;height:500px;overflow: hidden;}
        #box-bottom{box-sizing: border-box !important;height:200px;}
        #box1 img{transform:scale(1);transition:0.5s;height:100%;}
        #box1 img:hover{transform:scale(1.05);}
        #box2 .image{transform:scale(1);transition:0.8s;height:100%;}
        #box2 .image:hover{transform:scale(1.1);}
        
        .modal-body{float:left;}
        .modal-content{width:900px;height:700px;box-sizing: border-box;}
        .modal-header img{width:100%;}
        #myModal2 .modal-body div{height:30px;}
        #board{padding:50px 0;}
        #bottom-menu{padding-left:50px;margin:30px;}
        #bottom-menu a, .accordion a{text-decoration:none;font-size:14px;color:darkgray;margin:5px 0;transition: 0.5s;}
        #bottom-menu a:hover{color:#C55F07;}
        .accordion a:hover{color:#C55F07;}
        .accordion {display: none;background-color: white;color: #444;cursor: pointer;padding: 18px;width: 100%;border: none;text-align: left;outline: none;font-size: 15px;transition: 0.4s;}
        .panel {padding: 0 18px;background-color: white;max-height: 0;overflow: hidden;transition: max-height 0.2s ease-out;}
        .panel a{padding-left:40px;text-decoration: none;color:darkgray;font-size:14px;transition: 0.5s;}
        .panel a:hover{color:#C55F07;}
        footer .container{background:black; color:darkgray;margin:auto;text-align: center;font-size:14px;padding:10px 0;}
        .container span{padding-left:20px;padding-right:30px;outline: none;}
        footer a{text-decoration: none;color:darkgray;}
        footer a:hover{text-decoration: none;color:darkgray;}
        footer a:active{text-decoration: none;color:darkgray;}

        @media screen and (max-width:768px){
            #box-left, #box-right1, #box-right2, #box-bottom{width:100px;height:400px;}
            .s-img-1{display: none;}
            .s-img-2{display: block;}
            #caption2{position:absolute;top:75%;}
            #caption4{position:absolute;top:86%;right:15%;}
            #caption5{position:absolute;top:12%;}
            .accordion{display: block;padding-left:30px;}
            #bottom-menu{display:none;}
            .caption{bottom:30%;}
            #bottom-menu h5{padding-top:30px;}
            .btn-block{text-align: left;color:black;}
        }
    </style>

    <script>
        // iframe resize
        function autoResize(i)
        {
            (i).height=0;
            var iframeHeight=
            (i).contentWindow.document.body.scrollHeight;
            (i).height=iframeHeight+20;
        }
    </script>

<script>
    $(document).ready(function(){
        $ ("html,body").animate({scrollTop : 0}, "slow");

    //  $( ".delegate_update_success" ).click(function() {
    //      location.reload(true);
    //      document.body.scrollTop=0
    // });
        // Add smooth scrolling to all links
        $("a").on('click', function(event) {

          // Make sure this.hash has a value before overriding default behavior
          if (this.hash !== "") {
            // Prevent default anchor click behavior
            event.preventDefault();

            // Store hash
            var hash = this.hash;

            // Using jQuery's animate() method to add smooth page scroll
            // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
            $('html, body').animate({
              scrollTop: $(hash).offset().top
            }, 800, function(){

              // Add hash (#) to URL when done scrolling (default click behavior)
              window.location.hash = hash;
            });
          } // End if
        });
      });
      </script>
</head>
