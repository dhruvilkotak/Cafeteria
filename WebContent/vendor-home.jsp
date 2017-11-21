<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.Menu"%>
<%@ page import="com.model.CartItemList"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Blob"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="">

    <!-- Mirrored from radiustheme.com/demo/html/redchili/redchili/food-menu-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 24 Feb 2017 22:05:18 GMT -->
    <!-- Added by HTTrack -->
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <!-- /Added by HTTrack -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Red Chili | Single Menu</title>
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

        <!-- Home page CSS -->
        <link href="css/admin.css" rel="stylesheet">

    </head>
    <body>
        <%
            //check for valid session
            Integer user_id = (Integer) session.getAttribute("user_id");
            if (user_id == null) {
                //request.setAttribute("errormsg", "Session has ended. Please login.");
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            }
        %>
        <!-- Include navigation.jsp -->
        <jsp:include page="inc/navigation.jsp" />

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
                                        <span><h3>CafeTeria</h3></span> <a href="#"> <!--   <a href="index.html"><img class="img-responsive" src="img/cafeteria.jpg" alt="logo"></a> -->
                                        </a>
                                    </div>
                                </div>
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                    <div class="main-menu-area">
                                        <nav>
                                            <ul>
                                                <li class="active"><a
                                                        href="<%=request.getContextPath()%>/controller?actionCode=getItemsOfCart&page=home"
                                                        class="col-xs-24">Home</a></li>
                                                <li><a href="#" class="col-xs-24">About</a></li>
                                                <li><a
                                                        href="<%=request.getContextPath()%>/controller?actionCode=doGetListofItems"
                                                        class=" col-xs-24">Food Menu</a></li>

                                                <!--<li><a href="#" class="col-xs-24">Contact</a></li>-->
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
                                                <a href="#"><i aria-hidden="true"
                                                               class="fa fa-shopping-cart"></i><span><%=cartItemLists.size()%></span></a>
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
                                                                            href="<%=request.getContextPath()%>/controller?actionCode=deleteItemToCart&itemId=<%=obj.getItemId()%>"
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
                                                        %> <span><span>Vat(20%)</span></span><span>$<%=vat%></span> <%
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
                                                                   class="default-btn">View Cart</a></li>
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
            <!-- Inner Page Banner Area Start Here -->
            <!-- <div class="inner-page-banner-area">
                    <div class="container">
                            <div class="pagination-area">
                                    <h2>Menu</h2>
                                    <ul>
                                            <li>Home</li>

                                    </ul>
                            </div>
                    </div>
            </div> -->
            <!-- Inner Page Banner Area End Here -->
            <!-- Single Menu Area Start Here -->

            <div class="single-menu-area">
                <div class="container">

                    <div class="container col-md-12">
                        <div class="header-text">
                            <span class="glyphicon glyphicon-user col-md-1" aria-hidden="true"></span>
                            <div class="title-div">Hello Vendor</div>
                        </div>
                        <div class="well">
                            <a href="admin/admin-maintain-menus.jsp">Maintain Menu items</a><br>
                            <a href="admin/admin-cafeteria-update.jsp">Maintain Cafeteria Name and Location</a><br>
                            <a href="/WEB-INF/admin/view-list-of-orders.jsp">View List of Orders</a><br><br>
                        </div>


                        <!-- include messages.jsp -->
                        <jsp:include page="inc/footer.jsp" />
                    </div>
                </div>
            </div>

            <!-- Single Menu Area End Here -->
            <!-- Footer Area Start Here -->


            <!-- Footer Area End Here -->
        </div>
        <!-- Style Switch Start Here -->
    <link id="switch_style" href="#" rel="stylesheet" type="text/css">
    <div class="style-switch left" id="switch-style"></div>
    <!-- Style Switch End Here -->
    <!-- Preloader Start Here -->
    <div id="preloader"></div>
    <!-- Preloader End Here -->
    <!-- jquery-->

    <script src="js/jquery-2.2.4.min.js" type="text/javascript"></script>

    <!-- Plugins js -->
    <script src="js/plugins.js" type="text/javascript"></script>

    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

    <!-- WOW JS -->
    <script src="js/wow.min.js"></script>

    <!-- Nivo slider js -->
    <script src="vendor/slider/js/jquery.nivo.slider.js"
    type="text/javascript"></script>
    <script src="vendor/slider/home.js" type="text/javascript"></script>

    <!-- Owl Cauosel JS -->
    <script src="vendor/OwlCarousel/owl.carousel.min.js"
    type="text/javascript"></script>

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
