<%@page import="com.admin.Connect_db"%>
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
                            <form class='form-horizontal' method='POST' action="<%=request.getContextPath()%>/AdminOrderUpdate">
                                <fieldset>
                                    <h3>Edit Order ID: <%=request.getParameter("order_id")%>, Item id: <%=request.getParameter("item_id")%></h3>
                                    <hr>
                                    <%
                                        Integer order_id = Integer.parseInt(request.getParameter("order_id"));
                                        Integer item_id = Integer.parseInt(request.getParameter("item_id"));
                                        Integer order_uid = Integer.parseInt(request.getParameter("user_id"));
                                        String status = request.getParameter("status");
                                        String qty = "";
                                        String item_name = "";
                                        String description = "";
                                        String category = "";
                                        String price = "";
                                        Integer Sr_no = 0;

                                        Statement stmt = Connect_db.getConnection().createStatement();
                                        ResultSet rs = stmt.executeQuery("select * from order1 o, menu m where o.item_id=m.item_id and o.orderid=" + order_id + " and o.userid=" + order_uid + " and o.item_id=" + item_id + " and o.status like '" + status + "'");

                                        if (rs.next()) {
                                            qty = rs.getString("qty");
                                            item_name = rs.getString("item_name");
                                            description = rs.getString("item_description");
                                            category = rs.getString("item_category");
                                            price = rs.getString("item_price");
                                            Sr_no = Integer.parseInt(rs.getString("Sr_no"));
                                        }
                                    %>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="item_id">Order ID</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="order_id" name="order_id" placeholder="" class="form-control" value="<%= order_id%>" type="text" readonly="true">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="user_id">User Id</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="user_id" name="user_id" placeholder="" class="form-control input-md" value="<%= order_uid%>" type="text" readonly="true">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="item_id">Item Id</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="item_id" name="item_id" placeholder="" class="form-control input-md" value="<%= item_id%>" type="text" readonly="true">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="qty">Quantity</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="qty" name="qty" placeholder="" class="form-control input-md" value="<%=qty%>" type="text" readonly="true">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="item_name">Item Name</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="item_name" name="item_name" placeholder="" class="form-control input-md" value="<%=item_name%>" type="text" readonly="true">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="description">Description</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="description" name="description" placeholder="" class="form-control input-md" value="<%=description%>" type="text" readonly="true">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="category">Category</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="category" name="category" placeholder="" class="form-control input-md" value="<%=category%>" type="text" readonly="true">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="price">Price</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="price" name="price" placeholder="" class="form-control input-md" value="<%=price%>" type="text" readonly="true">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="Sr_no">Location ID</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="Sr_no" name="Sr_no" placeholder="" class="form-control input-md" value="<%=Sr_no%>" type="text" readonly="true">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="status">Status</label>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <%
                                                    ArrayList<String> sl = new ArrayList();
                                                    sl.add("Pending");
                                                    sl.add("Completed");
                                                    sl.add("In Progress");
                                                    sl.add("Cancelled");

                                                    out.println("<select name='status'>");
                                                    for (String str : sl) {
                                                        if (!str.equalsIgnoreCase(status.trim())) {
                                                            out.println("<option value='" + str + "'>" + str + "</option>");
                                                        }
                                                    }
                                                    out.println("</select>");
                                                %>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- submit button-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label"></label>  
                                        <div class="col-md-4">
                                            <input type="submit" name="login" class="btn btn-success" value="Update Order Id">
                                            <!--<a type="submit" href="<%= request.getContextPath()%>/AdminOrderUpdate" class="btn btn-success" data-original-title="" title=""><span class="glyphicon glyphicon-remove-sign"></span> Update Order Id</a>-->
                                            <a href="<%= request.getContextPath()%>/admin/view-list-of-orders.jsp" class="btn btn-danger" data-original-title="" title=""><span class="glyphicon glyphicon-remove-sign"></span> Cancel</a>
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
