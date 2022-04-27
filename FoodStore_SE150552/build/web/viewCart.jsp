<%-- 
    Document   : viewCart
    Created on : Mar 6, 2022, 11:19:29 PM
    Author     : Trần Phú Sơn
--%>

<%@page import="web.models.tblProduct.ProductDTO"%>
<%@page import="web.models.Cart.Cart"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Food Store | Cart</title>

        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/viewCartStyle.css">

    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER==NULL || sessionScope.LOGIN_USER.roleID ne 'US'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <!-- header section starts  -->

        <header class="header">

            <a href="#" class="logo"> <i class="fas fa-shopping-basket"></i> food store </a>

            <nav class="navbar">
                <a href="LoadInformationController">home</a>
                <a href="LoadInformationController">products</a>
            </nav>

            <div class="icons">
                <div class="fas fa-bars" id="menu-btn"></div>
                <div class="fas fa-search" id="search-btn"></div>
                <a href="viewCart.jsp"><div class="fas fa-shopping-cart" id="cart-btn"></div></a>
                <form action="MainController" method="POST" style="display: inline">
                    <input type="submit" name="action" value="Logout" class="btn" style="margin-top: 0; margin-bottom: 1rem"/>
                </form>
            </div>

            <form action="MainController" class="search-form" style="line-height: 6.2rem;">
                <input type="text" name="search" value="${param.search}" required="" id="search-box" placeholder="search here...">
                <input type="submit" name="action" value="Search" class="btn" id="sub" style="width: 40%; margin-right: 0.8rem; margin-bottom: 1rem;">
            </form>

        </header>

        <!-- header section ends -->

        <!-- Product section-->

        <section class="cart">
            <div class="box-container">
                <h3>List Products</h3>  
                <c:set var="cart" value="${sessionScope.CART}"/>
                <c:choose>
                    <c:when test="${cart == null || cart.getCart().size() == 0}">
                        <h3 style="font-size: 1.8rem">There is no items in your cart!</h3>
                    </c:when>
                    <c:otherwise>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">No</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Total Price</th>
                                    <th scope="col">Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="product" varStatus="counter" items="${cart.getCart().values()}">
                                <form action="MainController">
                                    <tr>
                                    <input type="hidden" name="productID" value="${product.productID}"/>
                                    <th scope="row">${counter.count}</th>
                                    <td>${product.productName}</td>
                                    <td>
                                        <img src="${product.image}" width="70" style="margin-top: 4px"/>
                                    </td>
                                    <td>${product.price}</td>
                                    <td>
                                        <div class="count-input">
                                            <c:if test="${product.cartQuantity != 1}">
                                                <a href="MainController?action=Decrease&productID=${product.productID}"><span class="fa fa-minus mr-2 btn" style="padding: .8rem .8rem; margin-top: 0;"></span></a>
                                                </c:if>
                                                <c:if test="${product.cartQuantity eq 1}">
                                                <span class="fa fa-minus mr-2 btn" style="padding: .8rem .8rem; margin-top: 0;"></span>
                                            </c:if>
                                            ${product.cartQuantity}
                                            <c:if test="${product.cartQuantity < product.quantity}">
                                                <a href="MainController?action=Plus&productID=${product.productID}&url=viewCart.jsp"><span class="fa fa-plus ml-2 btn" style="padding: .8rem .8rem; margin-top: 0;"></span></a>
                                                </c:if>
                                                <c:if test="${product.cartQuantity >= product.quantity}">
                                                <span class="fa fa-plus ml-2 btn" style="padding: .8rem .8rem; margin-top: 0;"></span>
                                            </c:if>
                                        </div>
                                    </td>
                                    <td>$${product.price * product.cartQuantity}</td>
                                    <td>
                                        <a href="MainController?action=Remove&productID=${product.productID}">
                                            <i class="fas fa-trash btn" style="margin-top: 0"></i>
                                        </a>
                                    </td>
                                    </tr>
                                </form>
                                <c:set var="total" value="${total + product.price * product.cartQuantity}"/>
                            </c:forEach>
                            </tbody>
                        </table>

                    </c:otherwise>
                </c:choose>
                <c:if test="${not empty requestScope.ORDERDETAIL_ERROR.quantityError}">
                    <div class="alert alert-danger" role="alert" style="font-size: 2rem; color: red">
                        ${requestScope.ORDERDETAIL_ERROR.quantityError}
                    </div>
                </c:if>
                <h3>Total Amount: $${total}</h3>
                <a href="MainController?action=LoadInfor" class="btn">Add more</a>
                <a href="checkOut.jsp" class="btn">Check out</a>
            </div>
        </section>


        <!-- footer section starts  -->

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

        <!-- footer section ends -->

        <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

        <!-- custom js file link  -->
        <script src="js/script.js"></script>

    </body>
</html>
