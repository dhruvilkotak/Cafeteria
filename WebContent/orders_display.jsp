<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.model.Menu" %>
<%@ page import="com.model.CartItemList" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Blob"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.admin.Connect_db" %>
<html>
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

 <header>                
                <div class="header2-area">
                  
                    <div class="header-bottom-area" id="sticker">
                        <div class="container">
                            <div class="row">                         
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                    <div class="logo-area">
                                    	<span><h3>CafeTeria</h3></span>
                                        <a href="#">  <!--   <a href="index.html"><img class="img-responsive" src="img/cafeteria.jpg" alt="logo"></a> -->
                                   </a>
                                    </div>
                                </div>  
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                                    <div class="main-menu-area">
                                        <nav>
                                            <ul>
                                                <!--<li><a href="<%=request.getContextPath()%>/controller?actionCode=getItemsOfCart&page=home" class="col-xs-24">Home</a>-->
                                                    
                                                </li>
                                                <!--<li><a href="#" class="col-xs-24">About</a>-->
                                                    
                                                </li>
                                                <li><a href="<%=request.getContextPath()%>/controller?actionCode=doGetListofItems" class=" col-xs-24">Food Menu</a>
                                                </li>
                                                
                                                  <!--<li><a href="cafeterialdetail?action=viewtable" class="col-xs-24">Cafeteria Details</a></li>-->
                                                 
                                                 <!--<li><a href="Addfooditem.jsp" class="col-xs-24"> Menu Management</a></li>-->
                                                  <li class="active"><a href="<%=request.getContextPath()%>/orders_display.jsp" class="col-xs-24">Orders</a></li>
                                                <li><a href="<%=request.getContextPath()%>/my-profile.jsp" class="col-xs-24"><%=session.getAttribute("fname") %></a></li>
                                                
                                                 <li><a href="<%=request.getContextPath()%>/Logout" class="col-xs-24">Log-Out</a></li>
                                               
                                            </ul>
                                        </nav>
                                    </div>
                                </div>   
                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                    <ul class="header-cart-area">
                                      
                                        <li>
                                            <div class="cart-area">
                                             <%if (session.getAttribute("cartItemList") != null)
												{
                                            	 	List<CartItemList> cartItemLists=(List)session.getAttribute("cartItemList");
													%>
											    <a href="<%=request.getContextPath()%>/viewCart.jsp"><i aria-hidden="true" class="fa fa-shopping-cart"></i><span><%=cartItemLists.size() %></span></a>
                                                <ul>
                                             
                                             		<%
                                             			Double total=0.0;
                                             		for(CartItemList obj:cartItemLists)
                                             			{%>
                                             		<li>
                                                        <div class="cart-single-product">
                                                            <div class="media">
                                                                <div class="pull-left cart-product-img">
                                                                    <a href="#">
                                                                     <%
														    			   	byte[] image = null ;
														    				Blob blob=obj.getItemImage();
														    				image=blob.getBytes(1, (int)blob.length());
														    				String encode = Base64.getEncoder().encodeToString(image);
														    				request.setAttribute("imgBase", encode);
														    			%>
                                                                        <img src="data:image/jpeg;base64,${imgBase}" alt="product" class="img-responsive">
                                                                    </a>
                                                                </div>
                                                                <div class="media-body cart-content">
                                                                    <ul>
                                                                        <li>
                                                                            <h1><a href="#"><%=obj.getItemName() %></a></h1>
                                                                            <p width="40px"><span>Code:</span> <%= obj.getItemId() %></p>
                                                                        </li>
                                                                        
                                                                        <li>
                                                                            <p>$ <%=obj.getItemPrice() %></p>
                                                                        </li>
                                                                        
                                                                        <li>
                                                                            <p>X <%=obj.getQty() %></p>
                                                                         
                                                                        </li>
                                                                        
                                                                            <a href="<%=request.getContextPath()%>/controller?actionCode=deleteItemToCart&page=Menu2&itemId=<%=obj.getItemId() %>" class="trash"><i class="fa fa-trash-o"></i></a>
                                                                        </li>
                                                                        <li>
                                                                        <%Double t= Double.parseDouble(obj.getQty()) *  Double.parseDouble(obj.getItemPrice()); 
                                                                        	total=total+t;
                                                                        %>
                                                                            <p>$<%= t %></p>
                                                                        </li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </li>
                                             		<%} %>
                                                    <li>
                                                        <span><span>Sub Total</span></span><span>$<%=total %></span>
                                                        <!-- <span><span>Discount</span></span><span>$30</span>
                                                         --><%Double vat=0.2*total ;
                                                           DecimalFormat df2 = new DecimalFormat(".##");
                                                        %>
                                                         <span><span>Vat(20%)</span></span><span>$<%=df2.format(vat) %></span>
                                                         <%total=vat+total ; %>
                                                        <span><span>Sub Total</span></span><span>$<%=total %></span>
                                                    </li>
                                                    <li>
                                                        <ul class="checkout">
                                                            <li><a href="<%=request.getContextPath()%>/viewCart.jsp" class="default-btn">View Cart</a></li>
                                                     <!--        <li><a href="https://www.radiustheme.com/demo/html/redchili/redchili/check-out.html" class="default-btn">Checkout</a></li>
                                                     -->    </ul>
                                                    </li>
                                                </ul>
                                    
                                    		<%}else{ %>
                                    		
                                    		 <a href="#"><i aria-hidden="true" class="fa fa-shopping-cart"></i><span>0</span></a>
                                                <ul>
                                                    <li>
                                                        <span><span>Sub Total</span></span><span>$0</span>
                                                        <span><span>Vat(20%)</span></span><span>$0</span>
                                                        <span><span>Sub Total</span></span><span>$0</span>
                                                    </li>
                                                    <li>
                                                        <ul class="checkout">
                                                                 <li><a href="<%=request.getContextPath()%>/viewCart.jsp" class="default-btn ">View Cart</a></li>
                                                        </ul>
                                                    </li>
                                                </ul>
                     
                                    		
                                    		<%} %>
                                    
                                            </div>
                                        </li>
                                    </ul>
                                    
                                    
                                    
                                </div> 
                            </div>                          
                        </div> 
                    </div>
                </div>
            </header>

<br>
<br>
<h2>Your previous orders</h2>
<div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">	
            <!-- Header Area End Here -->	
         
            
            <br>
            
            <%
           
           int i=1,j=1;
           int a[]=new int[10];
               try {
            	   String sql3="select distinct orderid from order1";
            	   Statement stmt2 = Connect_db.getConnection().createStatement();
            	   ResultSet rs = stmt2.executeQuery(sql3);
            	   while(rs.next()) {
            		   a[i]=rs.getInt("orderid");
            		 
            		   i++;
            	   }
               }catch(Exception e) {
            	    e.printStackTrace();   
               }
            
            //for(j=1;j<i;j++) {
           int id=(Integer)session.getAttribute("user_id");
            %>
            
        
            <%
            while(j<i) 
            {
            %>
            
            <div class="panel panel-info" >
            <table class='table table-striped'>
            <thead>
            <th colspan="3"> Order <%=j%></th>  
            </thead>
           <tbody>
            <tr>
             <td class="warning">Image</td>
             <td class="warning">Item Name</td>
             <td class="warning">Quantity</td>
            </tr>
                  
                 
                       
<%
try {
String sql22="select o.userid, o.item_id, o.qty, o.orderid, o.status, m.item_name, m.item_price, m.item_description, m.item_category,m.item_image from order1 as o join menu m on m.item_id=o.item_id where o.orderid="+a[j]+" and userid="+id+";";
Statement stmt2 = Connect_db.getConnection().createStatement();
ResultSet rs2 = stmt2.executeQuery(sql22);

while(rs2.next()) 
{
%>

<tr>
<td class="col-xs-2">     <a href="#">
   <%
	byte[] image = null ;
    Blob blob=rs2.getBlob("item_image");
	image=blob.getBytes(1, (int)blob.length());
	String encode = Base64.getEncoder().encodeToString(image);
    request.setAttribute("imgBase", encode);
	%>
   <img src="data:image/jpeg;base64,${imgBase}" alt="product" class="img-responsive" style="max-height: 50px;max-width: 50px;">
    </a>
    </td>
<td><%out.print(rs2.getString("item_name"));%></td>

<td><%out.print(rs2.getString("qty"));%></td>


</tr>

<%
}
%>
</tbody> 
</table>

</div>


<% 
            
}catch(Exception e1) {
    e1.printStackTrace();
}
            
          
j++;
 }
%>

</div>
</body>
</html>