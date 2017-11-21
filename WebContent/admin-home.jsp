<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.Menu"%>
<%@ page import="com.model.CartItemList"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Blob"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

   <%if (session.getAttribute("user_id") == null)
	{
		response.sendRedirect(request.getContextPath()+ "/login.jsp");
	}%>

<html class="no-js" lang="">
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

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Home page CSS -->
        <link rel="stylesheet" href="css/admin.css">

    </head>
    <body>
        
	
        <!-- Include navigation.jsp -->
        <jsp:include page="inc/navigation.jsp" />

        <!-- Add your site or application content here -->
        <div class="wrapper">

            <!-- Include shopping cart -->
            <jsp:include page="/inc/menus.jsp" />

            <div class="single-menu-area">
                <div class="container">

                    <div class="container col-md-12">
                        <div class="header-text">
                            <span class="glyphicon glyphicon-user col-md-1" aria-hidden="true"></span>
                            <div class="title-div">Hello Administrator</div>
                        </div>
                        <div class="well">
                            <a href="admin/admin-add-delete-vendor.jsp">Add/Delete Vendor</a><br>
                            <a href="admin/people.jsp">Maintain Users Role and Profile</a><br>
                            <a href="admin/admin-maintain-menus.jsp">Maintain Menu items</a><br>
                            <a href="admin/admin-cafeteria-update.jsp">Maintain Cafeteria Name and Location</a><br>
                            <a href="<%=request.getContextPath() %>/admin/view-list-of-orders.jsp">View List of Orders</a><br>
                        </div>

                        <!-- include messages.jsp -->
                        <jsp:include page="inc/footer.jsp" />
                    </div>
                </div>
            </div>
        </div>

        <!-- jquery-->
        <script src="js/jquery-2.2.4.min.js" type="text/javascript"></script>

        <!-- Plugins js -->
        <!--<script src="js/plugins.js" type="text/javascript"></script>-->

        <!-- Bootstrap js -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>

        <!-- WOW JS -->
        <script src="js/wow.min.js"></script>

        <!-- Meanmenu Js -->
        <script src="js/jquery.meanmenu.min.js" type="text/javascript"></script>

        <!-- Srollup js -->
        <script src="js/jquery.scrollUp.min.js" type="text/javascript"></script>

        <!-- Custom Js -->
        <script src="js/main.js" type="text/javascript"></script>

    </body>
</html>
