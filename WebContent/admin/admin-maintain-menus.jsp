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

                    <div class="container col-md-12">
                        <div class="header-text">
                            <!--<span class="glyphicon glyphicon-user col-md-1" aria-hidden="true"></span>-->
                            <div class="title-div">Menu Items</div>
                        </div>

                        <div class="well">
                            <legend>Update Menu Items</legend>
                            <%

                                List<AddFoodItem> materiallist = new ArrayList<AddFoodItem>();
                                AddFoodItem rf = new AddFoodItem();
                                FoodItem dao1 = new FoodItem();
                                materiallist = dao1.getMaterialFileList(rf);
                                //out.println(materiallist.toString());
                                out.print("<table class='table table-striped'>"
                                        + "<thead>"
                                        + "<tr>"
                                        + "<th>Item ID</th>"
                                        + "<th>Item Name</th>"
                                        + "<th>Item Category</th>"
                                        + "<th>Item Description</th>"
                                        + "<th>Item Price</th>"
                                        //+ "<th>Location ID</th>"
                                        + "<th>Edit</th>"
                                        + "<th>Delete</th>"
                                        + "</tr>"
                                        + "</thead>"
                                        + "<tbody>");

                                for (AddFoodItem item : materiallist) {

                                    out.print("<tr><th scope='row'>" + item.getItemId()
                                            + "</th><td>" + item.getFoodItemName()
                                            + "</td><td>" + item.getItemCategory()
                                            + "</td><td>" + item.getItemDescription()
                                            + "</td><td>" + item.getItemPrice()
                                            + "</td><td><a class='edit-link' href='" + request.getContextPath() + "/admin/admin-menu-item-update.jsp?item_id=" + item.getItemId() + "&action=edit'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></a>"
                                            + "</td><td><a class='delete-link' href='" + request.getContextPath() + "/AdminMenuItemUpdate?item_id=" + item.getItemId() + "&action=delete'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></a>"
                                    );
                                }

                                out.println("</tbody></table>");

                            %>
                        </div>

                        <div class="well"  style="margin-top:2%">
                            <legend>Create New Menu Item</legend>

                            <form action="../FoodItemDetail" method="post" enctype="multipart/form-data">
                                <table align="center" >
                                    <tr >
                                        <td padding="5px">ITEM ID: </td>
                                        <td padding="5px"><input class="form-control" placeholder="" name="ItemId"  type="number" min="1" max="50000" required> </td>
                                    </tr>
                                    <tr>
                                        <td> FOOD ITEM NAME: </td>
                                        <td><input class="form-control" placeholder="" name="FoodItemName"  type="text" required></td>
                                    </tr>
                                    <tr>
                                        <td>ITEM CATEGORY:</td>
                                        <td><input class="form-control" placeholder="" name="ItemCategory"  type="text" required></td>
                                    </tr>
                                    <tr>
                                        <td>ITEM PRICE:</td>
                                        <td><input class="form-control" placeholder="9.99" name="ItemPrice"  type="text" required></td>
                                    </tr>
                                    
                                    <tr>
                                        <td>Cafeteria location:</td>
                                        <td><input class="form-control" placeholder="" name="srNo"  type="text" required></td>
                                    </tr>
                                    <tr>
                                        <td>ITEM IMAGE: (<= 4 M)</td>
                                        <td><input class="form-control" placeholder="Item Image" name="ItemImage"  type="file" required></td>
                                    </tr>
                                    <tr>
                                    <tr>
                                    <input type="hidden" name="action1" value="addtotable" />
                                    <td></td>
                                    <td><button type="submit" style="padding:none;" class="ghost-on-hover-btn col-md-12">Add Item</button></td>
                                    </tr>
                                    <tr>
                                </table> 

                                <%                                    ArrayList<AddFoodItem> materiallist1 = (ArrayList<AddFoodItem>) request.getAttribute("materiallist");
                                    if (materiallist1 != null) {
                                %>	<table border="1px" align="center">						
                                    <tr><td>Item Id</td><td>Food Item Name</td><td>Item Category</td> <td>Item Description</td><td>Item Price</td><td>Item Image</td><td>Operations</td></tr>

                                    <%
                                        for (int i = 0; i < materiallist1.size(); i++) {
                                    %>

                                    <tr><td><%=materiallist1.get(i).getItemId()%></td>
                                        <td><%=materiallist1.get(i).getFoodItemName()%></td>
                                        <td><%=materiallist1.get(i).getItemCategory()%></td>
                                        <td><%=materiallist1.get(i).getItemDescription()%></td>
                                        <td><%=materiallist1.get(i).getItemPrice()%></td>
                                        <td><%=materiallist1.get(i).getItemImage()%></td>



                                        <td><a href="FoodItemDetail?action1=deltableentry&ItemId=<%=materiallist1.get(i).getItemId()%>"/>Delete</a></td></tr>
                                        <%}
                                        %>
                                </table>
                                <%
                                    }%> 


                            </form>
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
