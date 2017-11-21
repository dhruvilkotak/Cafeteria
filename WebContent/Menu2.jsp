<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.Menu" %>
<%@ page import="com.model.CartItemList" %>
<%@ page import="com.model.CafeteriaDetails" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Blob"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- 
 <%if (session.getAttribute("user_id") == null)
	{
		response.sendRedirect(request.getContextPath()+ "/login.jsp");
		return;
	}%>
	 --%>

<html class="no-js" lang="">
    
<!-- Mirrored from radiustheme.com/demo/html/redchili/redchili/food-menu-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 24 Feb 2017 22:05:18 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>CafeTeria | Food Menu</title>
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

    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!-- Add your site or application content here -->
        <div class="wrapper">
            <!-- Header Area Start Here -->
  <header>                
         <% DecimalFormat df2 = new DecimalFormat(".##");
         CafeteriaDetails cafe=(CafeteriaDetails)request.getAttribute("cafeName");%>
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
                                                 <li class="active"><a href="<%=request.getContextPath()%>/controller?actionCode=doGetListofItems" class=" col-xs-24">Food Menu</a>
                                                </li>
                                                <li><a href="<%=request.getContextPath()%>/orders_display.jsp" class="col-xs-24">Orders</a></li>
                                        
                                                <li><a href="<%=request.getContextPath()%>/my-profile.jsp" class="col-xs-24"><%=session.getAttribute("fname") %></a></li>
                                               
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
                                                                        <%-- &srNo=""<%=obj.getSrNo() %> --%>
                                                                            <a href="<%=request.getContextPath()%>/controller?actionCode=deleteItemToCart&page=Menu2&itemId=<%=obj.getItemId() %>" class="trash">
		                                                                          <i class="fa fa-trash-o"></i>
		                                                                          </a>
                                                                        </li>
                                                                        <li>
                                                                        <%Double t= Double.parseDouble(obj.getQty()) *  Double.parseDouble(obj.getItemPrice()); 
                                                                        	total=total+t;
                                                                        %>
                                                                            <p>$<%= df2.format(t) %></p>
                                                                        </li>
                                                                         <li>
                                                                        
                                                                            <p><%= obj.getCafeteriaName()%></p>
                                                                        </li> 
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                             		<%} %>
                                                    <li>
                                                        <span><span>Sub Total</span></span><span>$<%=df2.format(total) %></span>
                                                        <!-- <span><span>Discount</span></span><span>$30</span>
                                                         --><%Double vat=0.2*total ;
                                                          
                                                        %>
                                                         <span><span>Vat(20%)</span></span><span>$<%=df2.format(vat) %></span>
                                                         <%total=vat+total ; %>
                                                        <span><span> Total</span></span><span>$<%=df2.format(total) %></span>
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
            <!-- Inner Page Banner Area Start Here -->
            <div class="inner-page-banner-area">
                <div class="container">
                    <div class="pagination-area">
                        <div class="row">
	                        <div class="col-xs-4"> <h2> Menu</h2> </div>
	                        <div class="col-xs-4"><h3 style="color:white"><%= cafe.getCafeteriaName() %></h3></div>
                        </div>
                        <ul>
                            <li><a href="#">Home -</a> /</li>
                            <li>Menu</li>
                        </ul>
                    </div>
                </div>  
            </div> 
            <!-- Inner Page Banner Area End Here -->
            <!-- Single Menu Area Start Here -->
            <%List<CafeteriaDetails> cafeteriaList = (List)request.getAttribute("cafeteriaList");
            if(cafeteriaList!=null)
            {
            	for(CafeteriaDetails obj:cafeteriaList)
            	{%>
            		 <div class="form-group">
				      	 <a href="<%=request.getContextPath()%>/controller?actionCode=doGetListofItems&menu=<%=obj.getSrNo() %>" class="btn btn-link" role="button" aria-disabled="true"> <%=obj.getCafeteriaName() %></a> 
			          </div>
            <%	}
            } %>
         
         <% List<Menu> itemList=(List)request.getAttribute("menuItemList");
		    if(itemList != null)
		    {%>
            
            <div class="single-menu-area">
                <div class="container">
               
               <% int count=1;
		    	for(Menu obj:itemList)
		    	{   
		    		if(count%2==0)
		    		{%>
               			<div class="row">
               			<%} %>
               			  <form action="<%=request.getContextPath()%>/controller" method="post">
   
                        <div class="col-xs-4">
                            <div class="single-menu-inner">
                                <div class="single-menu-inner-tab">
                                    <div class="tab-content">
                                    <%
						    			   	byte[] image = null ;
						    				Blob blob=obj.getItemImage();
						    				image=blob.getBytes(1, (int)blob.length());
						    				String encode = Base64.getEncoder().encodeToString(image);
						    				request.setAttribute("imgBase", encode);
						    			%>
                                            <img src="data:image/jpeg;base64,${imgBase}" class="img-responsive" alt="Menu Details" width="200px" height="200px">
                                    </div>
                                </div>
                                <div class="single-menu-inner-content">
                                    <h2 class="inner-sub-title"><%=obj.getItemName() %></h2>
                                    <span class="price" style="position: initial;">$<%= obj.getItemPrice() %></span>
                                    <p><%= obj.getItemDescription() %></p>
                                    
                                    <ul class="single-menu-inner-cart">
                                    
                                        <li>
                                        <div class="input-group quantity-holder" id="quantity-holder">
                                             <!--    <input type="text" name='qty' class="form-control quantity-input" placeholder="1" value="1">
                                           	 -->	
                                             <!--    <div class="input-group-btn-vertical">
                                                    <button class="btn btn-default quantity-plus" type="button"><i class="fa fa-plus" aria-hidden="true"></i></button>
                                                    <button class="btn btn-default quantity-minus" type="button"><i class="fa fa-minus" aria-hidden="true"></i></button>
                                                </div>
                                                 -->
                                                 <input id="after" name='qty' class="form-control" type="number" value="1" min="1" max="10" />
                                                 
    	                          </div>
                                        </li>
                                       <input type="hidden"  name="actionCode" value="addItemToCart" />
                                        <input type="hidden" name="itemId" value="<%=obj.getItemId()%>">
                                        <input type="hidden" name="srNo" value="<%=obj.getSrNo()%>">
                                         <input type="hidden" name="cafeteriaName" value="<%=cafe.getCafeteriaName()%>">
                                         <input type="submit"  value="Add To Cart" class="ghost-on-hover-btn">
                                        
                                    </ul>
                                </div>
                              </div>
                        </div>
                        <div class="col-xs-2">
                        </div>
                        </form>
                     <%  if(count%2==0)
		    		{%>
               			</div>
               			<%} %>
            			                    
                    <%count++;
                    } %>
                </div>
            </div>
            
            
            <%} %>
            
            <!-- Single Menu Area End Here -->
            <!-- Footer Area Start Here -->
           
            <!-- Footer Area End Here -->
        </div>
        <!-- Style Switch Start Here -->
        <link id="switch_style" href="#" rel="stylesheet" type="text/css">
        <div class="style-switch left" id="switch-style">
            
        </div>
        <!-- Style Switch End Here -->
        <!-- Preloader Start Here -->
        <div id="preloader"></div>
        <!-- Preloader End Here -->
        <!-- jquery-->  
     
     <script src="js/bootstrap-number-input.js" ></script>
     
        <script src="js/jquery-2.2.4.min.js" type="text/javascript"></script>

        <!-- Plugins js -->
        <script src="js/plugins.js" type="text/javascript"></script>
        
        <!-- Bootstrap js -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>

        <!-- WOW JS -->     
        <script src="js/wow.min.js"></script>

        <!-- Nivo slider js -->     
        <script src="vendor/slider/js/jquery.nivo.slider.js" type="text/javascript"></script>
        <script src="vendor/slider/home.js" type="text/javascript"></script>

        <!-- Owl Cauosel JS -->
        <script src="vendor/OwlCarousel/owl.carousel.min.js" type="text/javascript"></script>
        
        <!-- Meanmenu Js -->
        <script src="js/jquery.meanmenu.min.js" type="text/javascript"></script>

        <!-- Srollup js -->
        <script src="js/jquery.scrollUp.min.js" type="text/javascript"></script>

         <!-- jquery.counterup js -->
        <script src="js/jquery.counterup.min.js"></script>
        <script src="js/waypoints.min.js"></script>

        <!-- Switch js -->
        <script src="js/switch-style.js" type="text/javascript"></script>
        
        <!-- Custom Js -->
        <script src="js/main.js" type="text/javascript"></script>

    </body>

<!-- Mirrored from radiustheme.com/demo/html/redchili/redchili/food-menu-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 24 Feb 2017 22:05:24 GMT -->
</html>
