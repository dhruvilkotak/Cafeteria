<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

        <!-- Normalize CSS --> 
        <link rel="stylesheet" href="css/normalize.css">

        <!-- Main CSS -->         
        <link rel="stylesheet" href="css/main.css">

        <!-- Bootstrap CSS --> 
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Animate CSS --> 
        <link rel="stylesheet" href="css/animate.min.css">

        <!-- Font-awesome CSS-->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        
        <!-- Owl Caousel CSS -->
        <link rel="stylesheet" href="vendor/OwlCarousel/owl.carousel.min.css">
        <link rel="stylesheet" href="vendor/OwlCarousel/owl.theme.default.min.css">
        
        <!-- Main Menu CSS -->      
        <link rel="stylesheet" href="css/meanmenu.min.css">

        <!-- nivo slider CSS -->
        <link rel="stylesheet" href="vendor/slider/css/nivo-slider.css" type="text/css" />
        <link rel="stylesheet" href="vendor/slider/css/preview.css" type="text/css" media="screen" />

        <!-- Switch Style CSS -->
        <link rel="stylesheet" href="css/switch-style.css">
        
         <link rel="stylesheet" href="css/payment1.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Modernizr Js -->
        <script src="js/modernizr-2.8.3.min.js"></script>


</head>
<body>

<div class="container">
	<div class="row">
		<div class="paymentCont">
						<div class="headingWrap">
								<h3 class="headingTop text-center">Select Your Payment Method</h3>	
								
						</div>
						<div class="paymentWrap">
							<div class="btn-group paymentBtnGroup btn-group-justified" data-toggle="buttons">
					            <label class="btn paymentMethod ">
					            	<div class="method visa"></div>
					                <input type="radio" name="options" > 
					            </label>
					            <label class="btn paymentMethod">
				            		<div class="method discover"></div>
					                <input type="radio" name="options"> 
					            </label>
					            <label class="btn paymentMethod">
					            	<div class="method master-card"></div>
					                <input type="radio" name="options"> 
					            </label>
					            <label class="btn paymentMethod">
				            		<div class="method amex"></div>
					                <input type="radio" name="options">
					            </label>
					             <label class="btn paymentMethod">
				             		<div class="method vishwa"></div>
					                <input type="radio" name="options"> 
					            </label>
					            
					            
					         
					        </div>        
						</div>
						<div class="footerNavWrap clearfix">
							<div class="btn btn-success pull-left btn-fyi"><span class="glyphicon glyphicon-chevron-left"></span> CONTINUE SHOPPING</div>
						<a href="payment.jsp"><div class="btn btn-success pull-right btn-fyi">CHECKOUT<span class="glyphicon glyphicon-chevron-right"></span></div></a>	
						</div>
					</div>
		
	</div>
</div>

</body>
</html>