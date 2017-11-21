<%@ page import="com.model.Menu" %>
<%@ page import="com.model.CartItemList" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Blob"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>


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
                                                <li><a href="#" class="col-xs-24">About</a>
                                                    
                                                </li>
                                                <li class="active"><a href="<%=request.getContextPath()%>/controller?actionCode=doGetListofItems" class=" col-xs-24">Food Menu</a>
                                                </li>
                                                
                                                  <!--<li><a href="cafeterialdetail?action=viewtable" class="col-xs-24">Cafeteria Details</a></li>-->
                                                 
                                                 <!--<li><a href="Addfooditem.jsp" class="col-xs-24"> Menu Management</a></li>-->
                                                 
                                                <!--<li><a href="contact.html" class="col-xs-24">Contact</a></li>-->
                                                
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
											    <a href="#"><i aria-hidden="true" class="fa fa-shopping-cart"></i><span><%=cartItemLists.size() %></span></a>
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
                                                                        
                                                                            <a href="<%=request.getContextPath()%>/controller?actionCode=deleteItemToCart&itemId=<%=obj.getItemId() %>" class="trash"><i class="fa fa-trash-o"></i></a>
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
                                                         --><%Double vat=0.2*total ; %>
                                                         <span><span>Vat(20%)</span></span><span>$<%=vat%></span>
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
                                                                 <li><a href="<%=request.getContextPath()%>/viewCart.jsp" class="default-btn">View Cart</a></li>
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
