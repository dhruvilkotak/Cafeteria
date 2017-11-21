<%@page import="com.doa.listdao"%>
<%@page import="com.model.ListOfOrders"%>
<%@page import="com.doa.FoodItem"%>
<%@page import="com.model.AddFoodItem"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.Menu"%>
<%@ page import="com.model.CartItemList"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Blob"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
    if (session.getAttribute("user_id") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>


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

                <link
                    href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css"
                    rel="stylesheet" media="screen">
                <div class="messages" style="text-align: center; color: red;">
                    <%  if (request.getAttribute("msg") != null) { %>
                    <div class="alert alert-success" role="alert">
                        <% out.println(request.getAttribute("msg")); %>
                    </div>
                    <% }%>
                </div>
                <div class="container">
                    <div class="container col-md-12">
                        <div class="header-text">
                            <!--<span class="glyphicon glyphicon-user col-md-1" aria-hidden="true"></span>-->
                            <div class="title-div">View List of Orders</div>
                        </div>
                        <div class="well">
                            <!--<legend>Table of Item List</legend>-->
                            <%
                                listdao Listdao = new listdao();
                                List<ListOfOrders> list = null;
                                try {
                                    list = Listdao.list();
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                                //System.out.println("list:" + list);
                                //request.setAttribute("listOrder", list);

                                //list = (List) request.getAttribute("listOrder");
                                if (list != null) {
                            %>
                            <table class='table table-striped'>
                                <thead>
                                <th>Order ID</th>
                                <th>User Id</th>
                                <th>Item Id</th>
                                <th>Quantity</th>
                                <th>Item Name</th>
                                <th>Description</th>
                                <th>Category</th>
                                <th>Price</th>
                                <th>Location ID</th>
                                <th>Status</th>
                                <th>Update</th>
                                <!--<th>Complete</th>-->
                                </thead>
                                <tbody>
                                    <%
                                        for (ListOfOrders obj : list) {

                                            out.print("<tr>"
                                                    + "</td><td>" + obj.getOrderid()
                                                    + "<th scope='row'>"+ obj.getUserid()
                                                    + "</th><td>" + obj.getItemId()
                                                    + "</td><td>" + obj.getItemquantity()
                                                    + "</th><td>" + obj.getItemName()
                                                    + "</td><td>" + obj.getItemDescription()
                                                    + "</td><td>" + obj.getItemCategory()
                                                    + "</td><td>" + obj.getItemPrice()
                                                    + "</td><td>" + obj.getLocationId()
                                                    + "</td><td>" + obj.getStatus()
                                                    + "</td><td><a class='edit-link' href='" + request.getContextPath() + "/admin/admin-order-item-update.jsp?order_id="+obj.getOrderid()+"&user_id="+obj.getUserid()+"&item_id="+obj.getItemId()+"&status="+obj.getStatus()+"&action=update'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></a>"
                                                    //+ "</td><td><a class='delete-link' href='" + request.getContextPath() + "/AdminMenuItemUpdate?order_id="+obj.getOrderid()+"&item_id=" + obj.getItemId() + "&action=delete'><span class='glyphicon glyphicon-send' aria-hidden='true'></span></a>"
                                            );
                                        }
                                        out.println("</tbody></table>");
                                    %>
                                </tbody>
                            </table>
                            <%
                                }
                            %>
                        </div>


                        <!-- include messages.jsp -->
                        <jsp:include page="../inc/footer.jsp" />
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
