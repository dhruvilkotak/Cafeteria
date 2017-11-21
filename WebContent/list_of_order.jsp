<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.ListOfOrders" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>
    </head>
    <body>

        <h1>Table of Item List</h1>
        <%List<ListOfOrders> list = (List) request.getAttribute("listOrder");
            if (list != null) {
        %>
        <table border="1">
            <thead>
            <th>UserId</th>
            <th>orderid</th>
            <th>ItemId</th>
            <th>ItemName</th>
            <th>Quantity</th>
            <th>price</th>

        </thead>
        <tbody>
            <% for (ListOfOrders obj : list) {%>
            <tr>
                <td><%=obj.getUserid()%></td>
                <td><%=obj.getOrderid()%></td>
                <td><%=obj.getItemId()%></td>
                <td><%=obj.getItemName()%></td>
                <td><%=obj.getItemquantity()%></td>
                <td><%=obj.getItemPrice()%> </td>  
            </tr> 

            <% }
            %>
        </tbody>
    </table>
    <%}%>
</body>
</html>