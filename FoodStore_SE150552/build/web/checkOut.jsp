<%-- 
    Document   : checkOut
    Created on : Mar 11, 2022, 6:46:41 PM
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
        <title>Food Store | Check Out</title>

        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

        <!--Bootstrap CSS--> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/checkOutStyle.css">

    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER==NULL || sessionScope.LOGIN_USER.roleID ne 'US'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <!-- header section starts  -->

        <header class="header">

            <a href="#" class="logo"> <i class="fas fa-shopping-basket"></i> food store </a>

            <nav class="navbar">
                <a href="MainController?action=LoadInfor">home</a>
                <a href="MainController?action=LoadInfor">products</a>
            </nav>

            <div class="icons">
                <div class="fas fa-bars" id="menu-btn"></div>
                <div class="fas fa-search" id="search-btn"></div>
                <a href="viewCart.jsp"><div class="fas fa-shopping-cart" id="cart-btn"></div></a>
                <form action="MainController" method="POST" style="display: inline">
                    <input type="submit" name="action" value="Logout" class="btn" style="margin-top: 0; margin-bottom: 1rem"/>
                </form>

            </div>

            <form action="MainController" class="search-form">
                <input type="text" name="search" value="${param.search}" required="" id="search-box" placeholder="search here...">
                <input type="submit" name="action" value="Search" class="btn" id="sub">
            </form>

        </header>

        <!-- header section ends -->

        <!-- Check out section-->
        <section class="py-5 check-out">

            <div class="container">
                <h1>Checkout</h1>
                <div class="row">
                    <div class="col-md-8 cart" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
                        <h3>List Products</h3>
                        <c:set var="cart" value="${sessionScope.CART}"/>
                        <c:choose>
                            <c:when test="${cart == null || cart.getCart().size() == 0}">
                                <h3 style="font-size: 1.5rem">There is no items in your cart!</h3>
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
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="product" varStatus="counter" items="${cart.getCart().values()}">
                                            <tr>
                                        <input type="hidden" name="productID" value="${product.productID}"/>
                                        <th scope="row">${counter.count}</th>
                                        <td>${product.productName}</td>
                                        <td>
                                            <img src="${product.image}" width="50" style="margin-top: 4px"/>
                                        </td>
                                        <td>$${product.price}</td>
                                        <td>${product.cartQuantity}</td>
                                        <td>$${product.price * product.cartQuantity}</td>
                                        </tr>
                                        <c:set var="total" value="${total + product.price * product.cartQuantity}"/>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>
                        
                        <h3>Total Amount: $${total}</h3>
                    </div>

                    <div class="col-md-4 infor" style="border: 1px solid #ccc; border-radius: 5px; padding: 1rem">
                        <h3>Information of customer</h3>
                        <form action="MainController" method="POST">
                            <div class="column text-left mb-5">
                                <a class="btn" href="MainController?action=LoadInfor"><i class="icon-arrow-left"></i>&nbsp;Back to Shopping</a>
                            </div>
                            <div class="mb-3" style="font-size: 1.8rem">
                                <label for="email" class="form-label">Email</label>
                                <input type="text" class="form-control" id="email" style="font-size: 1.3rem; text-transform: none;" name="txtEmail" value="${sessionScope.LOGIN_USER.email}" readonly="">
                            </div>
                            <div class="mb-3" style="font-size: 1.8rem">
                                <label for="fullName" class="form-label">Full Name</label>
                                <input type="text" class="form-control" id="fullName" style="font-size: 1.3rem" name="txtFullName" value="${sessionScope.LOGIN_USER.fullName}" readonly="">
                            </div>
                            <div class="mb-3" style="font-size: 1.8rem">
                                <label for="phone" class="form-label">Phone number</label>
                                <input type="text" class="form-control" id="phone" style="font-size: 1.3rem" name="txtPhone" value="${sessionScope.LOGIN_USER.phone}" readonly="">
                            </div>
                            <div class="mb-3" style="font-size: 1.8rem">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" class="form-control" id="address" style="font-size: 1.3rem" name="txtAddress" value="${sessionScope.LOGIN_USER.address}" readonly="">
                            </div>
                            <input type="hidden" name="total" value="${total}">
                            <input type="submit" class="btn" value="Checkout" name="action" style="margin: 0; height: 4.5rem"/>
                        </form>
                        <c:if test="${not empty requestScope.SUCCESS}">
                            <div class="alert alert-danger" role="alert">
                                ${requestScope.SUCCESS}
                            </div>
                        </c:if>
                            <c:if test="${not empty requestScope.ERROR}">
                            <div class="alert alert-danger" role="alert">
                                ${requestScope.ERROR}
                            </div>
                        </c:if>
                    </div>
                </div>
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
