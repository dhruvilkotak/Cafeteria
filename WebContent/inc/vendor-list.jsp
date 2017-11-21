<%@page import="com.admin.Connect_db"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.controller.User"%>

<%
    //check for valid session
    Integer user_id = (Integer) session.getAttribute("user_id");
    if (user_id == null) {
        //request.setAttribute("errormsg", "Session has ended. Please login.");
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
%>
<%
    ArrayList<User> userList = new ArrayList<User>();

    PrintWriter writer = response.getWriter();

    try {
        Statement stmt = Connect_db.getConnection().createStatement();
        
        ResultSet rs = stmt.executeQuery("select * from vendor");

        writer.print("<table class='table table-striped'>"
                + "<thead>"
                + "<tr>"
                + "<th>Vendor ID</th>"
                + "<th>Vendor Name</th>"
                //+ "<th>Edit</th>"
                + "<th>Delete</th>"
                + "</tr>"
                + "</thead>"
                + "<tbody>");

        while (rs.next()) {

            writer.print("<tr><th scope='row'>" + rs.getInt("vid")
                    + "</th><td>" + rs.getString("name")
                    //+ "</td><td><a class='edit-link' href='" + request.getContextPath() + "/AdminVendorUpdate?vid=" + rs.getInt("vid") + "&action=edit'>Edit</a>"
                    + "</td><td><a class='delete-link' href='" + request.getContextPath() + "/AdminVendorUpdate?vid=" + rs.getInt("vid") + "&action=delete'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></a>"
            );
        }

        writer.println("</tbody></table>");

        //con.close();

    } catch (Exception e) {
        System.err.println(e);
    }
%>
