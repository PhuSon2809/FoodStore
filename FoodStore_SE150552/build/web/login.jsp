<%-- 
    Document   : login.jsp
    Created on : Mar 4, 2022, 12:32:41 PM
    Author     : Trần Phú Sơn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Food Store | Login</title>

        <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/loginStyle.css">

    </head>
    <body>
        <header class="header">

            <a href="#" class="logo"> <i class="fas fa-shopping-basket"></i> food store </a>

        </header>
        <!-- home section starts  -->

        <section class="home" id="home">

            <div class="content">
                <h3><span>welcome to</span> food store</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
            </div>

        </section>
        <%
            String userID = request.getParameter("userID");
            if (userID == null) {
                userID = "";
            }
        %>
        <form action="MainController" method="POST" class="login-form">
            <h3>login now</h3>
            <input type="text" name="userID" placeholder="user ID" value="<%= userID %>" required="" class="box">
            <input type="password" name="password" placeholder="your password" required="" class="box">
            <%
                String error = (String) request.getAttribute("ERROR");
                if (error == null) {
                    error = "";
                }
                String errorUser = (String) request.getAttribute("USER_ERROR");
                if (errorUser == null) {
                    errorUser = "";
                }
            %>
            <p class="error" style="color: red;"><%= error%></p>
            <p class="error" style="color: red;"><%= errorUser%></p>
            <p>forget your password <a href="#">click here</a></p>
            <p>don't have an account <a href="creatUser.jsp">create now</a></p>
            <input type="submit" name="action" value="Login" class="btn">
            <a type="submit" value="login with google" class="btn">Login With Google</a>
        </form>

        <!-- footer section starts  -->

        <section class="footer">

            <div class="credit"> created by <span> SonTP - SE150552 </span> | all rights reserved </div>

        </section>

        <!-- footer section ends -->

        <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>

        <!-- custom js file link  -->
        <script src="js/script.js"></script>

    </body>
</html>
