<header>
    <div class="header2-area">

        <div class="header-bottom-area" id="sticker">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                        <div class="logo-area">
                            <span><h3>CafeTeria</h3></span> <a href="#"> <!--   <a href="index.html"><img class="img-responsive" src="img/cafeteria.jpg" alt="logo"></a> -->
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                        <div class="main-menu-area">
                            <nav>
                                <ul>
                                    <!--<li class="active"><a href="<%=request.getContextPath()%>/controller?actionCode=getItemsOfCart&page=home" class="col-xs-24">Home</a></li>-->
                                    <li><a href="#" class="col-xs-24">About</a></li>
                                    <li><a href="<%=request.getContextPath()%>/controller?actionCode=doGetListofItems" class=" col-xs-24">Food Menu</a></li>
                                    <li><a href="#" class="col-xs-24">Contact</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <!-- Include shopping cart -->
                    <%--<jsp:include page="inc/cart-area.jsp" />--%>
                </div>
            </div>
        </div>
    </div>
</header>