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
        
        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

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
                <form action="MainController" method="POST" style="display: inline">
                    <input type="submit" name="action" value="Logout" class="btn" style="margin-top: 0; margin-bottom: 1rem"/>
                </form>

            </div>
        </header>

        <!-- header section ends -->

        <!-- Check out section-->
        <div class="container" style="height: 300px">
            <div class="row mt-5">
                <div class="col-md-4">
                    <img src="image/blog-2.jpg" alt="" class="img-fluid" style="width: 100%"/>
                </div>
                <div class="col-md-8 contents">
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <div class="mb-4">
                                <h3>Confirmation code has been sent to your email. Please check it out.</h3>
                            </div>
                            <form action="MainController" method="post">
                                <div class="form-group first">
                                    <label for="code" style="font-size: 2.5rem; color: #ff7800">Confirmation Code</label>
                                    <input type="text" name="code" value="" required="true" class="form-control" style="height: 3rem">
                                </div>

                                <c:set var="WRONG_CODE" value="${requestScope.WRONG_CODE}"/>
                                <c:if test="${WRONG_CODE!=null}">
                                    <div class="alert alert-danger" role="alert">
                                        ${requestScope.WRONG_CODE}
                                    </div>
                                </c:if>
                                <input type="hidden" name="txtFullName" value="${param.txtFullName}">
                                <input type="hidden" name="txtPhone" value="${param.txtPhone}">
                                <input type="hidden" name="txtAddress" value="${param.txtAddress}">
                                <input type="hidden" name="totalPay" value="${param.totalPay}">    
                                <input type="submit" class="btn btn-success" value="Confirm" name="btAction" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
