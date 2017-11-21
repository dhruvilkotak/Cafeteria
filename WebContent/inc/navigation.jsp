<%@page import="com.controller.User"%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <%
        Integer user_id = (Integer) session.getAttribute("user_id");
        //out.println(user_id);
        
        User u = new User(user_id);
        String role = u.getRole();
    %>
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
                    
                        <%
                            String href_str;
                            
                            if(role.equalsIgnoreCase("admin")){
                                href_str = "/admin-home.jsp";
                            }
                            else if(role.equalsIgnoreCase("vendor")){
                                href_str = "/vendor-home.jsp";
                            }
                            else{
                                href_str = "/admin-home.jsp";
                            }
                        %>
			<a class="navbar-brand" href="<%=request.getContextPath()+href_str %>">
                            <%
                            if(role.equalsIgnoreCase("admin")){
                                out.print("Admin Menu");
                            }
                            else if(role.equalsIgnoreCase("vendor")){
                                out.print("Vendor Menu");
                            }
                            else{
                                out.print("Test Menu");
                            }
                            %>
                        </a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			
			<ul class="nav navbar-nav pull-right">
				<!--<li><a href="#">My Profile</a></li>-->
				<li><a href="<%=request.getContextPath() %>/Logout">Logout</a></li>

			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>