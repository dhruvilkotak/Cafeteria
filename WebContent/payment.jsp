<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.model.Menu" %>
<%@ page import="com.model.CartItemList" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Blob"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.DecimalFormat"%>

 <%if (session.getAttribute("user_id") == null)
	{
		response.sendRedirect(request.getContextPath()+ "/login.jsp");
	}%>
	
<html>
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>CafeTeria |Payment</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

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

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Modernizr Js -->
        <script src="js/modernizr-2.8.3.min.js"></script>
		<link rel="stylesheet" href="css/payment1.css">
		
    </head>

<body>

        <!-- Header Area Start Here -->
  <header>                
                <div class="header2-area">
                  
                    <div class="header-bottom-area" id="sticker">
                        <div class="container">
                            <div class="row">                         
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                    <div class="logo-area">
                                    	<span><h3>CafeTeria</h3></span>
                                        <a href="#">  <!--   <a href="index.html"><img class="img-responsive" src="img/cafeteria.jpg" alt="logo"></a> -->
                                   </a>
                                    </div>
                                </div>  
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                    <div class="main-menu-area">
                                        <nav>
                                            <ul>
                                                <!--<li><a href="<%=request.getContextPath()%>/controller?actionCode=getItemsOfCart&page=home" class="col-xs-24">Home</a>-->
                                                    
                                                </li>
                                                <!--<li><a href="#" class="col-xs-24">About</a>-->
                                                    
                                                </li>
                                                <li class="active"><a href="<%=request.getContextPath()%>/controller?actionCode=doGetListofItems" class=" col-xs-24">Food Menu</a>
                                                </li>
                                                
                                                  <!--<li><a href="cafeterialdetail?action=viewtable" class="col-xs-24">Cafeteria Details</a></li>-->
                                                 
                                                 <!--<li><a href="Addfooditem.jsp" class="col-xs-24"> Menu Management</a></li>-->
                                                  <li><a href="<%=request.getContextPath()%>/orders_display.jsp" class="col-xs-24">Orders</a></li>
                                                <li><a href="<%=request.getContextPath()%>/my-profile.jsp" class="col-xs-24">My Profile</a></li>
                                                
                                                 <li><a href="<%=request.getContextPath()%>/Logout" class="col-xs-24">Log-Out</a></li>
                                               
                                            </ul>
                                        </nav>
                                    </div>
                                </div>   
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                    <ul class="header-cart-area">
                                      
                                        <li>
                                            <div class="cart-area">
                                             <%if (session.getAttribute("cartItemList") != null)
												{
                                            	 	List<CartItemList> cartItemLists=(List)session.getAttribute("cartItemList");
													%>
											    <a href="<%=request.getContextPath()%>/viewCart.jsp"><i aria-hidden="true" class="fa fa-shopping-cart"></i><span><%=cartItemLists.size() %></span></a>
                                                <ul>
                                             
                                             		<%
                                             			Double total=0.0;
                                             		for(CartItemList obj:cartItemLists)
                                             			{%>
                                             		<li>
                                                        <div class="cart-single-product">
                                                            <div class="media">
                                                                <div class="pull-left cart-product-img">
                                                                    <a href="#">
                                                                     <%
														    			   	byte[] image = null ;
														    				Blob blob=obj.getItemImage();
														    				image=blob.getBytes(1, (int)blob.length());
														    				String encode = Base64.getEncoder().encodeToString(image);
														    				request.setAttribute("imgBase", encode);
														    			%>
                                                                        <img src="data:image/jpeg;base64,${imgBase}" alt="product" class="img-responsive">
                                                                    </a>
                                                                </div>
                                                                <div class="media-body cart-content">
                                                                    <ul>
                                                                        <li>
                                                                            <h1><a href="#"><%=obj.getItemName() %></a></h1>
                                                                            <p width="40px"><span>Code:</span> <%= obj.getItemId() %></p>
                                                                        </li>
                                                                        
                                                                        <li>
                                                                            <p>$ <%=obj.getItemPrice() %></p>
                                                                        </li>
                                                                        
                                                                        <li>
                                                                            <p>X <%=obj.getQty() %></p>
                                                                         
                                                                        </li>
                                                                        
                                                                            <a href="<%=request.getContextPath()%>/controller?actionCode=deleteItemToCart&page=Menu2&itemId=<%=obj.getItemId() %>" class="trash"><i class="fa fa-trash-o"></i></a>
                                                                        </li>
                                                                        <li>
                                                                        <%Double t= Double.parseDouble(obj.getQty()) *  Double.parseDouble(obj.getItemPrice()); 
                                                                        	total=total+t;
                                                                        %>
                                                                            <p>$<%= t %></p>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                             		<%} %>
                                                    <li>
                                                        <span><span>Sub Total</span></span><span>$<%=total %></span>
                                                        <!-- <span><span>Discount</span></span><span>$30</span>
                                                         --><%Double vat=0.2*total ;
                                                           DecimalFormat df2 = new DecimalFormat(".##");
                                                        %>
                                                         <span><span>Vat(20%)</span></span><span>$<%=df2.format(vat) %></span>
                                                         <%total=vat+total ; %>
                                                        <span><span>Sub Total</span></span><span>$<%=total %></span>
                                                    </li>
                                                    <li>
                                                        <ul class="checkout">
                                                            <li><a href="<%=request.getContextPath()%>/viewCart.jsp" class="default-btn">View Cart</a></li>
                                                     <!--        <li><a href="https://www.radiustheme.com/demo/html/redchili/redchili/check-out.html" class="default-btn">Checkout</a></li>
                                                     -->    </ul>
                                                    </li>
                                                </ul>
                                    
                                    		<%}else{ %>
                                    		
                                    		 <a href="#"><i aria-hidden="true" class="fa fa-shopping-cart"></i><span>0</span></a>
                                                <ul>
                                                    <li>
                                                        <span><span>Sub Total</span></span><span>$0</span>
                                                        <span><span>Vat(20%)</span></span><span>$0</span>
                                                        <span><span>Sub Total</span></span><span>$0</span>
                                                    </li>
                                                    <li>
                                                        <ul class="checkout">
                                                                 <li><a href="<%=request.getContextPath()%>/viewCart.jsp" class="default-btn ">View Cart</a></li>
                                                        </ul>
                                                    </li>
                                                </ul>
                     
                                    		
                                    		<%} %>
                                    
                                            </div>
                                        </li>
                                    </ul>
                                    
                                    
                                    
                                </div> 
                            </div>                          
                        </div> 
                    </div>
                </div>
            </header>

            <!-- Header Area End Here -->
<br>
<br>

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
				<!--  	<div class="footerNavWrap clearfix">
							<div class="btn btn-success pull-left btn-fyi"><span class="glyphicon glyphicon-chevron-left"></span> CONTINUE SHOPPING</div>
						<a href="payment.jsp"><div class="btn btn-success pull-right btn-fyi">CHECKOUT<span class="glyphicon glyphicon-chevron-right"></span></div></a>	
						</div>
					</div>-->	
		
	</div>
</div>




<center><legend>Payment Information</legend></center>

<div class="container">
    <div class='row'>
        <div class='col-md-4'></div>
        <div class='col-md-4'>
          <script src='https://js.stripe.com/v2/' type='text/javascript'></script>
          
          
          <form accept-charset="UTF-8" action="Payment" class="require-validation" data-cc-on-file="false" data-stripe-publishable-key="pk_bQQaTxnaZlzv4FnnuZ28LFHccVSaj" id="payment-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="âœ“" /><input name="_method" type="hidden" value="PUT" /><input name="authenticity_token" type="hidden" value="qLZ9cScer7ZxqulsUWazw4x3cSEzv899SP/7ThPCOV8=" /></div>
            
               <div class='form-row'>
              <div class='col-xs-12 form-group required'>
                <label class='control-label'>Name on Card</label>
                <input class='form-control' size='4' type='text' name="name" required value="Cynthia Connors">
              </div>
            </div>
            <div class='form-row'>
              <div class='col-xs-12 form-group card required'>
                <label class='control-label'>Card Number</label>
                <input autocomplete='off' class='form-control card-number' name="card" size='20' type='text' required value="1111555566667777">
              </div>
            </div>
            <div class='form-row'>
              <div class='col-xs-4 form-group cvv required'>
                <label class='control-label'>CVV</label>
                <input autocomplete='off' class='form-control card-cvv' name="cvv" placeholder='ex. 311' size='4' type='text' required value="311">
              </div>
              <div class='col-xs-4 form-group expiration required'>
                <label class='control-label'>Expiration</label>
                <input class='form-control card-expiry-month' name="mm" placeholder='MM' size='2' type='text' required value="06">
              </div>
              <div class='col-xs-4 form-group expiration required'>
                <label class='control-label'>Year </label>
                <input class='form-control card-expiry-year' name="yy" placeholder='YYYY' size='4' type='text' required value="2018">
              </div>
            </div>
            
            <div class='form-row'>
              <div class='col-xs-12 form-group card required'>
                <input type="checkbox" name="card" checked>Save this card<br>
              </div>
            </div>
            <div class='form-row'>
              <div class='col-md-12'>
                <div class='form-control total btn btn-info'>
                  Total:
                  <span class='amount'><%=request.getSession().getAttribute("total") %></span>
                </div>
              </div>
               
            
            <a href="finalpage.jsp">
            </div>
            <div class='form-row'>
            
              <div class='col-md-12 form-group'>
                <button class='form-control btn btn-primary submit-button' type='submit'>Pay »</button>
              </div>
              </a>
            </div>
            </a>
            <div class='form-row'>
              <div class='col-md-12 error form-group hide'>
                <div class='alert-danger alert'>
                  Please correct the errors and try again.
                </div>
              </div>
            </div>
          </form>
        </div>
        <div class='col-md-4'></div>
    </div>
</div>

</body>
</html>