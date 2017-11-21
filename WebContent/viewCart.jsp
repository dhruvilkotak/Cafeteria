<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.Menu" %>
<%@ page import="com.model.CartItemList" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Blob"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

 <%if (session.getAttribute("user_id") == null)
	{
		response.sendRedirect(request.getContextPath()+ "/login.jsp");
		return;
	}%>


<html class="no-js" lang="">
    
<!-- Mirrored from radiustheme.com/demo/html/redchili/redchili/food-menu-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 24 Feb 2017 22:05:18 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>CafeTeria | View Cart</title>
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
    <% DecimalFormat df2 = new DecimalFormat(".##"); %>
  
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        <!-- Add your site or application content here -->
        <div class="wrapper">
            <!-- Header Area Start Here -->
            <header>                
                <div class="header2-area">
                  
                    <div class="header-bottom-area" id="sticker">
                        <div class="container">
                            <div class="row">                         
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                    <div class="logo-area">
                                     
                                     <span><h3>CafeTeria</h3></span>
                                     <!--    <a href="index.html"><img class="img-responsive" src="img/logo-color.png" alt="logo"></a>
                                    --> </div>
                                </div>  
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                    <div class="main-menu-area">
                                        <nav>
                                            <ul>
                                             <%--  <li><a href="<%=request.getContextPath()%>/controller?actionCode=getItemsOfCart&page=home" class="col-xs-24">Home</a>
                                                    
                                                </li>
                                                <li><a href="#" class="col-xs-24">About</a>
                                                    
                                                </li>
                                              --%>
                                                 <li><a href="<%=request.getContextPath()%>/controller?actionCode=doGetListofItems" class=" col-xs-24">Food Menu</a>
                                                </li>
                                                
                                              <!--     <li><a href="cafeterialdetail?action=viewtable" class="col-xs-24">Cafeteria Details</a></li>
                                                 
                                                 <li><a href="Addfooditem.jsp" class="col-xs-24"> Menu Management</a></li>
                                                 
                                                <li><a href="#" class="col-xs-24">Contact</a></li>
                                               -->  
                                                <li><a href="<%=request.getContextPath()%>/my-profile.jsp" class="col-xs-24">My Profile</a></li>
                                               
                                                 <li><a href="<%=request.getContextPath()%>/Logout" class="col-xs-24">Log-Out</a></li>
                                                    </ul>
                                        </nav>
                                    </div>
                                </div>   
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
                        <h2>ViewCart</h2>
                       <!--  <ul>
                            <li><a href="#">Home -</a> /</li>
                            <li>View Cart</li>
                        </ul> -->
                    </div>
                </div>  
            </div> 
            <!-- Inner Page Banner Area End Here -->
            <!-- Single Menu Area Start Here -->
            
            <div class="cart-single-product" style="width:90%">
            
            <div class="row">
                                             <%
                                             List<CartItemList> cartItemLists=(List)session.getAttribute("cartItemList");
                                             if (cartItemLists!= null && cartItemLists.size()>0)
												{
                                            	 	
													%>
							<div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">						
								               <table style="border-collapse: separate;border-spacing: 2em;">
                    								<tbody> 
                        
                                             		<%
                                             			Double total=0.0;
                                             		for(CartItemList obj:cartItemLists)
                                             			{%>
                                                              <tr> <td class="col-xs-2">     <a href="#">
                                                                     <%
														    			   	byte[] image = null ;
														    				Blob blob=obj.getItemImage();
														    				image=blob.getBytes(1, (int)blob.length());
														    				String encode = Base64.getEncoder().encodeToString(image);
														    				request.setAttribute("imgBase", encode);
														    			%>
                                                                        <img src="data:image/jpeg;base64,${imgBase}" alt="product" class="img-responsive">
                                                                    </a>
                                                                    </td>
                                                                      <td class="col-xs-2">      <h4><a href="#"><%=obj.getItemName() %></a></h4>
                                                                    </td>
                                                                    <td class="col-xs-2">       <p><%= obj.getCafeteriaName()%></p>
                                             							</td>	
                                                                        <td class="col-xs-2">    <p id="<%= obj.getItemId() %>" >$ <%=obj.getItemPrice() %></p>
                                                                        </td>
                                                                        <td class="col-xs-2">     <input id="after" name="after" class="form-control" type="number" value="<%=obj.getQty() %>" min="1" max="10" onchange="myFunction(this.value,'<%= obj.getItemId() %>'<%-- ,'<%=obj.getSrNo()%>' --%>)"/>
                                                                        <%-- <p>X <%=obj.getQty() %></p> --%>
                                                                          </td>
                                                                          <td class="col-xs-2">  
		                                                                          <a href="<%=request.getContextPath()%>/controller?actionCode=deleteItemToCart&page=viewCart&itemId=<%=obj.getItemId() %><%-- &srNo=""<%=obj.getSrNo() %> --%>" class="trash">
		                                                                          <i class="fa fa-trash-o"></i>
		                                                                          </a>
                                                                     </td>
                                                                        <%Double t= Double.parseDouble(obj.getQty()) *  Double.parseDouble(obj.getItemPrice()); 
                                                                        	total=total+t;
                                                                        %>
                                                                     <td class="col-xs-2">       <p>$<%= df2.format(t) %></p>
                                             							</td>
                                             							
                                             							</tr>
                                             		<%} %>
                               		            </tbody>
            					        	</table>
            				</div>
            				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12" style="margin-top: 40px;align-items: center;">
            				<div class="form-group">
            				
								  <label for="comment">Comment:</label>
								  <%if(request.getSession().getAttribute("comment")!=null){ %>
								  	<textarea class="form-control" rows="5" id="comment" name="comment" onchange="myComment(this.value)" >
								  	<%=request.getSession().getAttribute("comment") %></textarea>
								  <%}
								  else
								  { %>
								  	<textarea class="form-control" rows="5" id="comment" name="comment" onchange="myComment(this.value)"></textarea>
								  <%} %>
								</div>
            								<table align="center" style="border-collapse: separate;border-spacing: 2em;">	
                                    		   <tbody>
                                    		   <tr>
                                    		   <td class="col-xs-10" align="center">  
            										 <span><span><strong>Sub Total</strong></span></span>
                                                </td>        
                                                </td><td class="col-xs-4" align="center">
                                                        <span id="subtotal">$<%=df2.format(total) %></span>
                                                </td></tr>        <!-- <span><span>Discount</span></span><span>$30</span>
                                                         -->
                                                  <tr><td class="col-xs-10" align="center"> 
                                                          <%Double vat=0.2*total ;
                                                         
                                                          %>
                                                         <span><span><strong>Vat(20%)</strong></span></span>
                                                     </td>
                                                  </td><td class="col-xs-4" align="center">
                                                         <span id="vat">$<%=df2.format(vat)%></span>
                                                  </td></tr>
                                                         <%total=vat+total ; %>
                                                     <tr><td class="col-xs-10" align="center"> 
                                                        <span><span><strong>Total</strong></span></span>
                                                       </td>
                                                       </td><td class="col-xs-4" align="center">
                                                        <span id="total">$<%=df2.format(total) %></span>
                                                        <%request.getSession().setAttribute("total", df2.format(total)); %>
                                                        </td></tr>
                                                        <tr>
                                                  	<td align="center" colspan="2">
                                                  		 <a href="<%=request.getContextPath()%>/payment.jsp" class="default-btn ">place order</a>
                                                  	</td>
                                                  </tr>
 												</tbody>
 												</table>
 		                           </div>
                                    		<%}else{ %>
                                    		<table align="center">	
                                    		   <tbody>
                                    		   <tr>
                                    		   <td class="col-xs-10" align="center">           <span><span>Sub Total</span></span>
                                    		   </td ><td class="col-xs-4" align="center"><span>$0</span>
                                                
                                                </td>
                                                </tr><tr><td class="col-xs-10" align="center">        <span><span>Vat(20%)</span></span>
                                                </td><td class="col-xs-4" align="center"><span>$0</span>
                                                  </td></tr>
                                                  <tr><td class="col-xs-10" align="center">      <span><span>Total</span></span>
                                                  </td><td class="col-xs-4" align="center"><span>$0</span>
                                                  </td></tr>
                                                  
		                                   	</tbody>
		                                </table>
                                    		<%} %>
                                    
        		</div>                           
            </div>        
            <!-- Single Menu Area End Here -->
            <!-- Footer Area Start Here -->
           
            <!-- Footer Area End Here -->
        
        <!-- Style Switch Start Here -->
        <link id="switch_style" href="#" rel="stylesheet" type="text/css">
        <div class="style-switch left" id="switch-style">
            
        </div>
        <!-- Style Switch End Here -->
        <!-- Preloader Start Here -->
        
        <!-- Preloader End Here -->
        <!-- jquery-->  
     	<script>
			function myFunction(qty,itemid) {
			       $.ajax({
					type:"POST",
					url : 'controller?actionCode=updateItemToCart',
					data : {
						itemid :itemid,
						qty: qty,
					/* 	srNo: srNo
					 */},
					dataType:"json",
					success : function(responseText) {
						var list=responseText;
						 $.each(list, function (index, item) {
								
							}); 
						 location.reload(true);	
					}
				});		 
			 	 

			}
			function myComment(comment) {
			       $.ajax({
					type:"POST",
					url : 'controller?actionCode=updateComment',
					data : {
						comment:comment
						},
					dataType:"json",
					success : function(responseText) {
						var list=responseText;
						 $.each(list, function (index, item) {
								
							}); 
						 location.reload(true);	
					}
				});		 
			 	 

			}
		</script>
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
