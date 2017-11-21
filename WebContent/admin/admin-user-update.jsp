<%@page import="com.admin.Connect_db"%>
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
                            <form class='form-horizontal' method='POST' action="<%= request.getContextPath()%>/AdminActions">
                                <fieldset>

                                    <!-- Form Name -->
                                    <h3>Edit User Profile <%=request.getParameter("uid")%></h3>
                                    <!-- Text input-->
                                    <hr>
                                    <%
                                        Integer uid = Integer.parseInt(request.getParameter("uid"));
                                        //out.println(uid);
                                        //out.println(request.getParameter("action"));

                                        User u = new User(uid);
                                    %>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="name">Name</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="name" name="name" placeholder="" class="form-control" value="<%= u.getName()%>" type="text">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- File Button --> 

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="mobile_number">Mobile Number</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="mobile_number" name="mobile_number" placeholder="" class="form-control input-md" value="<%= u.getPhone()%>" type="text">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="email_id">Email ID</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="email-id" name="email-id" placeholder="" class="form-control input-md" value="<%= u.getEmailid()%>" type="text">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="userid">User ID</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="userid" name="userid" placeholder="" class="form-control input-md" value="<%= u.getUserid()%>" type="text" readonly="true">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="gender">Gender</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <input id="gender" name="gender" placeholder="" class="form-control input-md" value="<%= u.getGender()%>" type="text">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="role">Role</label>  
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <%
                                                    ArrayList<String> roles = new ArrayList();
                                                    roles.add("admin");
                                                    roles.add("vendor");
                                                    roles.add("user");
                                                    roles.remove(u.getRole().trim());
                                                %>
                                                <select name="role">
                                                    <% for(String s:roles){ %>
                                                            <option value="<%= s %>"><%= s %></option>
                                                    <% } %>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Text input-->
                                    <div class="form-group">
                                        <label class="col-md-4 control-label"></label>  
                                        <div class="col-md-4">
                                            <input type="submit" name="login" class="btn btn-success" value="Submit">
                                            <!--<input type="button" name="login" class="btn btn-danger" value="Clear">-->
                                            <!--<a href="#" class="btn btn-success" data-original-title="" title=""><span class="glyphicon glyphicon-thumbs-up"></span> Submit</a>-->
                                            <a href="<%=request.getContextPath() %>/admin/people.jsp" class="btn btn-danger" value="" data-original-title="" title=""><span class="glyphicon glyphicon-remove-sign"></span> Clear</a>
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
