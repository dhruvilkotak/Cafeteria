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
    ArrayList<User> userList = new ArrayList<User>(); //holds user objects

    PrintWriter writer = response.getWriter();

    try {
        Statement stmt = Connect_db.getConnection().createStatement();
        
        ResultSet rs = stmt.executeQuery("select * from register");

        writer.print("<table class='table table-striped'>"
                + "<thead>"
                + "<tr>"
                + "<th>#</th>"
                + "<th>Name</th>"
                + "<th>Gender</th>"
                + "<th>Phone</th>"
                + "<th>Email-ID</th>"
                + "<th>Userid</th>"
                + "<th>Role</th>"
                + "<th>Edit</th>"
                + "<th>Delete</th>"
                + "</tr>"
                + "</thead>"
                + "<tbody>");

        while (rs.next()) {

            writer.print("<tr><th scope='row'>" + rs.getRow()
                    + "</th><td>" + rs.getString("firstname")
                    + "</td><td>" + rs.getString("gender")
                    + "</td><td>" + rs.getString("mobile_number")
                    + "</td><td>" + rs.getString("email_id")
                    + "</td><td>" + rs.getString("userid")
                    + "</td><td>" + rs.getString("role")
                    + "</td><td><a class='edit-link' href='" + request.getContextPath() + "/admin/admin-user-update.jsp?uid=" + rs.getString("userid").trim() + "&action=edit'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span></a>"
                    + "</td><td><a class='delete-link' href='" + request.getContextPath() + "/AdminDeleteUser?userid=" + rs.getString("userid").trim() + "&action=delete'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></a>"
            );
        }

        writer.println("</tbody></table>");

        //rs.last();
        //int reccount = (int) rs.getRow();
        //con.close();
        //writer.println(reccount); //remove later

    } catch (Exception e) {
        System.err.println(e);
    }
%>
