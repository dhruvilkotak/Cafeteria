<%@page import="com.doa.cafe"%>
<%@page import="com.model.Cafeteria_retrive"%>
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
	        return;
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
                <div class="container">

                    <div class="container col-md-12">

                        <div class="header-text">
                            <!--<span class="glyphicon glyphicon-user col-md-1" aria-hidden="true"></span>-->
                            <div class="title-div">Add/Delete Cafeteria Name/Location</div>
                        </div>

                        <div class="well">
                            <form action="../cafeterialdetail" method="post">
                                <div class="reservation-page-input-box">
                                    <input class="form-control col-md-4" placeholder="Cafeteria Name" name="Cafeterianame" type="text">
                                </div>
                                <input name="action" value="addtotable" type="hidden">

                                <div class="reservation-page-input-box">
                                    <input class="form-control col-md-4" placeholder="Cafeteria Location" name="Cafeterialocation" type="text">
                                </div>
                                <button type="submit" class="book-now-btn disabled">Add Cafeteria</button>                                    
                            </form>

                            <%
                                List<Cafeteria_retrive> materiallist = new ArrayList<Cafeteria_retrive>();
                                Cafeteria_retrive rf = new Cafeteria_retrive();
                                cafe dao1 = new cafe();
                                materiallist = dao1.getMaterialFileList(rf);
                                //materiallist.toString();
                            %>
                            <table border="1px" align="center">						
                                <tr><td>Sr_no</td><td>Cafeteria Name</td><td>Cafeteria Location</td><td>Operations</td></tr>
                                <%  //ArrayList<Cafeteria_retrive> materiallist1 = (ArrayList<Cafeteria_retrive>) request.getAttribute("materiallist");
                                    if (materiallist != null) {
                                        for (int i = 0; i < materiallist.size(); i++) {
                                %>
                                <tr><td><%=materiallist.get(i).getSr_no()%></td><td><%=materiallist.get(i).getCafeName()%></td><td><%=materiallist.get(i).getCafeLocation()%></td>
                                    <td><a href="../cafeterialdetail?action=deltableentry&srno=<%=materiallist.get(i).getSr_no()%>"/><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></a></td></tr>
                                    <%}
                            }%>

                            </table>
                            ${errorMessage1} 
                        </div>

                        <!-- include messages.jsp -->
                        <jsp:include page="../inc/footer.jsp" />
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
