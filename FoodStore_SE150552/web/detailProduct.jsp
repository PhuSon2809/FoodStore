<%-- 
    Document   : product
    Created on : Mar 6, 2022, 5:40:38 PM
    Author     : Trần Phú Sơn
--%>

<%@page import="web.models.tblProduct.ProductDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="web.models.tblCategory.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="web.models.tblUser.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Food Store | Product Detail</title>

        <!--Bootstrap CSS--> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

        <!--font awesome cdn link-->  
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!--custom css file link-->  
        <link rel="stylesheet" href="css/detailProduct.css">

    </head>

    <body>
        <c:if test="${sessionScope.LOGIN_USER==NULL || sessionScope.LOGIN_USER.roleID ne 'US'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <!--header section starts-->  

        <header class="header">

            <a href="#" class="logo"> <i class="fas fa-shopping-basket"></i> food store </a>

            <nav class="navbar">
                <a href="MainController?action=LoadInfor">home</a>
                <a href="#">categories</a>
                <a href="#">products</a>
            </nav>

            <div class="icons">
                <div class="fas fa-bars" id="menu-btn"></div>
                <div class="fas fa-search" id="search-btn"></div>
                <a href="viewCart.jsp">
                    <div class="fas fa-shopping-cart" id="cart-btn"></div>
                </a>
                <a href="login.jsp">
                    <div class="fas fa-user" id="login-btn"></div>
                </a>
                <form action="MainController" method="POST" style="display: inline">
                    <input type="submit" name="action" value="Logout" class="btn"/>
                </form>

            </div>

            <form action="MainController" class="search-form">
                <input type="text" name="search" value="${param.search}" required="" id="search-box" placeholder="search here...">
                <input type="submit" name="action" value="Search" class="btn" id="sub">
            </form>

        </header>

        <!--header section ends--> 

        <!-- Product section-->
        <c:set var="product" value="${requestScope.PRODUCT}"/>
        <c:set var="cate" value="${requestScope.CATEGORY}"/>
        <c:set var="productCart" value="${cart.getCart().values()}"/>
        <section class="py-5 product">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="image col-md-6"><img class="image_detail card-img-top mb-5 mb-md-0" src="${product.image}" alt="..." /></div>
                    <div class="col-md-6 content">
                        <h1 style="color: #ff7800; font-size: 4rem;"><i class="fas fa-shopping-basket"></i> food store</h1>
                        <h1 class="display-5 fw-bolder" style="font-size: 3rem">${product.productName}</h1>
                        <div class=" sale">
                            <span class="under text-decoration-line-through" style="color: lightslategrey; font-size: 1.7rem;">$20.00</span>
                            <span class="price" style="color: red; font-size: 2.2rem;">- $${product.price}</span>
                        </div>
                        <c:forEach items="${cate}" var="dto">
                            <c:if test="${product.categoryID eq dto.categoryID}">
                                <p style="font-size: 1.8rem; margin-bottom: 0; padding-bottom: 0;">Category: ${dto.categoryName}</p>
                            </c:if>
                        </c:forEach>
                        <p style="font-size: 1.7rem; margin-bottom: 0; padding-bottom: 1rem;">Available in stock: ${product.quantity}</p>
                        <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?</p>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                        <div class="add d-flex" style="margin-bottom: 1rem">
                            <%--<c:forEach items="${productCart}" var="cart">--%>
                            <c:url var="addToCartLink" value="MainController">
                                <c:param name="action" value="AddToCart"></c:param>
                                <c:param name="productID" value="${product.productID}"></c:param>
                            </c:url>
                            <%--<c:if test="${cart.cartQuantity < product.quantity}">--%>
                            <a href="${addToCartLink}" class="btn" style="margin-right: 2rem">add to cart</a>
                            <a href="MainController?action=LoadInfor" class="btn">buy more</a>
                            <%--</c:if>--%>
                            <%--<c:if test="${cart.cartQuantity >= product.quantity}">--%>
                            <!--                                    <a href="#" class="btn" style="margin-right: 2rem">add to cart</a>
                                                                <a href="LoadInformationController" class="btn">buy now</a>
                                                                <h4 style="color: red">Product is out of stock</h4>-->
                            <%--</c:if>--%>
                            <%--</c:forEach>--%>
                        </div>
                        <h4 style="color: red"><i class="fas fa-bell"></i> ${requestScope.CART_ERROR}</h4>
                    </div>
                </div>
            </div>
        </section>

        <!--footer section starts-->  

        <section class="footer">

            <div class="box-container">

                <div class="box">
                    <h3> food store <i class="fas fa-shopping-basket"></i> </h3>
                    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aliquam, saepe.</p>
                    <div class="share">
                        <a href="#" class="fab fa-facebook-f"></a>
                        <a href="#" class="fab fa-twitter"></a>
                        <a href="#" class="fab fa-instagram"></a>
                        <a href="#" class="fab fa-linkedin"></a>
                    </div>
                </div>

                <div class="box">
                    <h3>contact info</h3>
                    <a href="#" class="links"> <i class="fas fa-phone"></i> +914-360-736 </a>
                    <a href="#" class="links"> <i class="fas fa-envelope"></i> NongsanDalat@gmail.com </a>
                    <a href="#" class="links"> <i class="fas fa-map-marker-alt"></i> Dalat, Lamdong - 23 </a>
                </div>

                <div class="box">
                    <h3>quick links</h3>
                    <a href="#home" class="links"> <i class="fas fa-arrow-right"></i> home </a>
                    <a href="#products" class="links"> <i class="fas fa-arrow-right"></i> products </a>
                </div>

                <div class="box">
                    <h3>newsletter</h3>
                    <p>subscribe for latest updates</p>
                    <input type="email" placeholder="your email" class="email">
                    <input type="submit" value="subscribe" class="btn">
                    <img src="image/payment.png" class="payment-img" alt="">
                </div>

            </div>

            <div class="credit"> created by <span> SonTP - SE150552 </span> | all rights reserved </div>

        </section>

        <!--footer section ends--> 

        <!--Optional JavaScript--> 
        <!--jQuery first, then Popper.js, then Bootstrap JS--> 
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

        <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

        <!--custom js file link-->  
        <script src="js/script.js"></script>

    </body>

</html>
