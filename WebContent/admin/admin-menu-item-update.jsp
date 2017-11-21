<%@page import="com.doa.FoodItem"%>
<%@page import="com.model.AddFoodItem"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.Menu"%>
<%@ page import="com.model.CartItemList"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Blob"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.controller.User"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        <link rel="stylesheet" href="../css/bootstrap.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="../css/style.css">

        <!-- Home page CSS -->
        <link rel="stylesheet" href="../css/admin.css">

        <!-- People page styles CSS -->
        <link rel="stylesheet" href="../css/people.css">
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
        <jsp:include page="../inc/navigation.jsp" />

        <!-- Add your site or application content here -->
        <div class="wrapper">

            <!-- Include shopping cart -->
            <jsp:include page="../inc/menus.jsp" />

            <div class="single-menu-area">

                <link href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css" rel="stylesheet" media="screen">	
                <div class="messages" style="text-align:center; color:red;">
                    <% if (session.getAttribute("errormsg") != null) {%>
                    <%= session.getAttribute("errormsg")%>   
                    <% }%>
                </div>
                <div class="messages" style="text-align:center; color:red;">
                    <% if (session.getAttribute("successmsg") != null) {%>
                    <%= session.getAttribute("successmsg")%>   
                    <% }%>
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col-md-10 ">
                            <form class='form-horizontal' method='POST' action="<%=request.getContextPath()%>/AdminMenuItemUpdate?action=edit">
                                <fieldset>

                                    <!-- Form Name -->
                                    <h3>Edit Menu Item <%=request.getParameter("item_id")%></h3>
                                    <!-- Text input-->
                                    <hr>
                                    <%
                                        Integer item_id = Integer.parseInt(request.getParameter("item_id"));
                                        //out.println(item_id);
                                        //out.println(request.getParameter("action"));

                                        FoodItem f = new FoodItem(item_id);
                                    %>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="item_id">Item ID</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="item_id" name="item_id" placeholder="" class="form-control" value="<%= f.getItem_id()%>" type="text" readonly="true">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- File Button --> 

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="item_name">Item Name</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="item_name" name="item_name" placeholder="" class="form-control input-md" value="<%= f.getItem_name()%>" type="text">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="item_category">Item Category</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="item_category" name="item_category" placeholder="" class="form-control input-md" value="<%= f.getItem_category()%>" type="text">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="item_description">Item Description</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="item_description" name="item_description" placeholder="" class="form-control input-md" value="<%= f.getItem_description()%>" type="text">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="item_price">Item Price</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="item_price" name="item_price" placeholder="" class="form-control input-md" value="<%= f.getItem_price()%>" type="text">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label"></label>  
                                        <div class="col-md-4">
                                            <input type="submit" name="login" class="btn btn-success" value="Update Menu Item">
                                            <a href="<%= request.getContextPath()%>/admin/admin-maintain-menus.jsp" class="btn btn-danger" data-original-title="" title=""><span class="glyphicon glyphicon-remove-sign"></span> Cancel</a>
                                        </div>
                                    </div>

                                </fieldset>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- jquery-->
        <script src="../js/jquery-2.2.4.min.js" type="text/javascript"></script>

        <!-- Plugins js -->
        <!--<script src="js/plugins.js" type="text/javascript"></script>-->

        <!-- Bootstrap js -->
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>

        <!-- WOW JS -->
        <script src="../js/wow.min.js"></script>

        <!-- Meanmenu Js -->
        <script src="../js/jquery.meanmenu.min.js" type="text/javascript"></script>

        <!-- Srollup js -->
        <script src="../js/jquery.scrollUp.min.js" type="text/javascript"></script>

        <!-- Custom Js -->
        <script src="../js/main.js" type="text/javascript"></script>

        <!-- people Js -->
        <script src="../js/people.js" type="text/javascript"></script>

    </body>
</html>
