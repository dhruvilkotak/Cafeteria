<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.Menu"%>
<%@ page import="com.model.CartItemList"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Blob"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.DecimalFormat"%>


<%
	if (session.getAttribute("user_id") == null) {
		response.sendRedirect(request.getContextPath() + "/login.jsp");
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>CafeTeria |Final</title>
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
<link rel="stylesheet"
	href="vendor/OwlCarousel/owl.theme.default.min.css">

<!-- Main Menu CSS -->
<link rel="stylesheet" href="css/meanmenu.min.css">

<!-- nivo slider CSS -->
<link rel="stylesheet" href="vendor/slider/css/nivo-slider.css"
	type="text/css" />
<link rel="stylesheet" href="vendor/slider/css/preview.css"
	type="text/css" media="screen" />

<!-- Switch Style CSS -->
<link rel="stylesheet" href="css/switch-style.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="css/style.css">

<!-- Modernizr Js -->
<script src="js/modernizr-2.8.3.min.js"></script>

</head>
<body>



	<%
		String fn = (String) request.getAttribute("fname");
		String ln = (String) request.getAttribute("lname");
		String email = (String) request.getAttribute("em");
		String phn = (String) request.getAttribute("phone");
	%>
	<br>
	<br>
	<br>
	<div class="container">
		<!-- Header Area Start Here -->
		<header>
		<div class="header2-area">

			<div class="header-bottom-area" id="sticker">
				<div class="container">
					<div class="row">
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
							<div class="logo-area">
								<span><h3>CafeTeria</h3></span> <a href="#"> <!--   <a href="index.html"><img class="img-responsive" src="img/cafeteria.jpg" alt="logo"></a> -->
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
									<li class="active"><a
										href="<%=request.getContextPath()%>/controller?actionCode=doGetListofItems"
										class=" col-xs-24">Food Menu</a></li>

									<!--<li><a href="cafeterialdetail?action=viewtable" class="col-xs-24">Cafeteria Details</a></li>-->

									<!--<li><a href="Addfooditem.jsp" class="col-xs-24"> Menu Management</a></li>-->
									<li><a
										href="<%=request.getContextPath()%>/orders_display.jsp"
										class="col-xs-24">Orders</a></li>
									<li><a href="<%=request.getContextPath()%>/my-profile.jsp"
										class="col-xs-24">My Profile</a></li>

									<li><a href="<%=request.getContextPath()%>/Logout"
										class="col-xs-24">Log-Out</a></li>

								</ul>
								</nav>
							</div>
						</div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
							<ul class="header-cart-area">

								<li>
									<div class="cart-area">
										<%
											if (session.getAttribute("cartItemList") != null) {
												List<CartItemList> cartItemLists = (List) session.getAttribute("cartItemList");
										%>
										<a href="<%=request.getContextPath()%>/viewCart.jsp"><i
											aria-hidden="true" class="fa fa-shopping-cart"></i><span><%=cartItemLists.size()%></span></a>
										<ul>

											<%
												Double total = 0.0;
													for (CartItemList obj : cartItemLists) {
											%>
											<li>
												<div class="cart-single-product">
													<div class="media">
														<div class="pull-left cart-product-img">
															<a href="#"> <%
 	byte[] image = null;
 			Blob blob = obj.getItemImage();
 			image = blob.getBytes(1, (int) blob.length());
 			String encode = Base64.getEncoder().encodeToString(image);
 			request.setAttribute("imgBase", encode);
 %> <img src="data:image/jpeg;base64,${imgBase}" alt="product"
																class="img-responsive">
															</a>
														</div>
														<div class="media-body cart-content">
															<ul>
																<li>
																	<h1>
																		<a href="#"><%=obj.getItemName()%></a>
																	</h1>
																	<p width="40px">
																		<span>Code:</span>
																		<%=obj.getItemId()%></p>
																</li>

																<li>
																	<p>
																		$
																		<%=obj.getItemPrice()%></p>
																</li>

																<li>
																	<p>
																		X
																		<%=obj.getQty()%></p>

																</li>



																<a
																	href="<%=request.getContextPath()%>/controller?actionCode=deleteItemToCart&page=Menu2&itemId=<%=obj.getItemId()%>"
																	class="trash"><i class="fa fa-trash-o"></i></a>
											</li>
											<li>
												<%
													Double t = Double.parseDouble(obj.getQty()) * Double.parseDouble(obj.getItemPrice());
															total = total + t;
												%>
												<p>
													$<%=t%></p>
											</li>
										</ul>
									</div>
						</div>
					</div>
					</li>
					<%
						}
					%>
					<li><span><span>Sub Total</span></span><span>$<%=total%></span>
						<!-- <span><span>Discount</span></span><span>$30</span>
                                                         --> <%
 	Double vat = 0.2 * total;
 		DecimalFormat df2 = new DecimalFormat(".##");
 %> <span><span>Vat(20%)</span></span><span>$<%=df2.format(vat)%></span>
						<%
							total = vat + total;
						%> <span><span>Sub Total</span></span><span>$<%=total%></span></li>
					<li>
						<ul class="checkout">
							<li><a href="<%=request.getContextPath()%>/viewCart.jsp"
								class="default-btn">View Cart</a></li>
							<!--        <li><a href="https://www.radiustheme.com/demo/html/redchili/redchili/check-out.html" class="default-btn">Checkout</a></li>
                                                     -->
						</ul>
					</li>
					</ul>

					<%
						} else {
					%>

					<a href="#"><i aria-hidden="true" class="fa fa-shopping-cart"></i><span>0</span></a>
					<ul>
						<li><span><span>Sub Total</span></span><span>$0</span> <span><span>Vat(20%)</span></span><span>$0</span>
							<span><span>Sub Total</span></span><span>$0</span></li>
						<li>
							<ul class="checkout">
								<li><a href="<%=request.getContextPath()%>/viewCart.jsp"
									class="default-btn ">View Cart</a></li>
							</ul>
						</li>
					</ul>


					<%
						}
					%>

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
	<div class="panel panel-danger"">
		<h4 style="color: red;">User details</h4>
		<hr style="border-width: 2px";>
		First Name:
		<%
			out.println(fn);
		%>
		<br> Last Name:
		<%
			out.println(ln);
		%>
		<br> Email :
		<%
			out.println(email);
		%>
		<br> Phone :
		<%=phn%>
		<br>
	</div>
	<hr style="border-width: 4px";>




	<h4 style="color: red;">Review Food items</h4>

	<%
		List<CartItemList> cartItemLists = (List) session.getAttribute("cartItemList");
		if (cartItemLists != null && cartItemLists.size() > 0) {
	%>
	<div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
		<!--  <table style="border-collapse: separate;border-spacing: 2em;"> -->
		<table  class="table table-bordered">
		<thead>
		<th class="success">Image</th>
		<th class="success">Name</th>
		<th class="success">Price</th>
		<th class="success">Quantity</th>
		<th class="success"></th>
		<th class="success"></th>
		<th class="success">Location</th>
		
		
		</thead>
			<tbody>

				<%
					Double total = 0.0;
						for (CartItemList obj : cartItemLists) {
				%>
				<tr>
					<td class="col-xs-2"><a href="#"> <%
 	byte[] image = null;
 			Blob blob = obj.getItemImage();
 			image = blob.getBytes(1, (int) blob.length());
 			String encode = Base64.getEncoder().encodeToString(image);
 			request.setAttribute("imgBase", encode);
 %> <img src="data:image/jpeg;base64,${imgBase}" alt="product"
							class="img-responsive"
							style="max-height: 100px; max-width: 100px;">
					</a></td>
					<td class="col-xs-2">
						<h4><%=obj.getItemName()%></h4>
					</td>
					
					<td class="col-xs-2">
						<p id="<%=obj.getItemId()%>">
							$
							<%=obj.getItemPrice()%></p>
					</td>
					<td class="col-xs-2">
						<%-- <input id="after" name="after" class="form-control" type="number" value="<%=obj.getQty() %>" min="1" max="10" onchange="myFunction(this.value,'<%= obj.getItemId() %>')"/> --%>
						<p>
							X
							<%=obj.getQty()%></p>
					</td>
					<td class="col-xs-2"><a
						href="<%=request.getContextPath()%>/controller?actionCode=deleteItemToCart&page=viewCart&itemId=<%=obj.getItemId()%>"
						class="trash"> <i class="fa fa-trash-o"></i>
					</a></td>
					<%
						Double t = Double.parseDouble(obj.getQty()) * Double.parseDouble(obj.getItemPrice());
								total = total + t;
					%>
					<td class="col-xs-2">
						<p>
							$<%=t%></p>
					</td>
					<td class="col-xs-2">
					<h5><%=obj.getCafeteriaName()%> </h5>
					</td>
					
				</tr>
				<%
					}
				%>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>Sub Total:</td>
					<!--  <td><%=request.getSession().getAttribute("subtotal")%></td> -->
                     <td><%=total%></td>

				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>Vat:</td>


					
					<!--  <td><%=request.getSession().getAttribute("vat")%></td>  -->
                    <% Double vat = 0.2 * total;
             		DecimalFormat df2 = new DecimalFormat(".##"); %>
                     <td><%=df2.format(vat)%></td>
				</tr>

				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>

					<td>Order Total:</td>
					<td><%=request.getSession().getAttribute("total")%></td>
				</tr>

			</tbody>
		</table>

		<%
			}
		%>

		<hr style="border-width: 2px">






		<br>
		<form action="Order" method="post">
			<center>
				Pickup time: <input type="text" name="pickup" vaule="5:00PM" />
			</center>
			<br> <br> <br> <input type="hidden" name="mail"
				value="<%=email%>">
			<center>
				<input type="submit" value="Confirm order">
			</center>
		</form>
		<br> <br> <br>
	</div>

</body>
</html>