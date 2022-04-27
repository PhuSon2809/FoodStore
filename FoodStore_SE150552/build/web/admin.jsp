<%-- 
    Document   : admin
    Created on : Mar 4, 2022, 8:17:54 PM
    Author     : Trần Phú Sơn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="web.models.tblUser.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="web.models.tblProduct.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food Store | Admin</title>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER==NULL || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <h2>Welcome Admin:</h2>
        <h1>${sessionScope.LOGIN_USER.fullName}</h1>

        <form action="MainController" method="POST" style="line-height: 2rem">
            Logout: <input type="submit" name="action" value="Logout"/>
        </form>

        Insert New Product: <a href="insertProduct.jsp" style="line-height: 2rem">Click here</a>
        <br>
        <c:if test="${requestScope.LIST_PRODUCT != null}">
            <c:if test="${not empty requestScope.LIST_PRODUCT}">
                <table border="1" style="text-align: center">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th style="padding: 0 1rem">Product ID</th>
                            <th style="padding: 0 1rem">Product Name</th>
                            <th>Image</th>
                            <th style="padding: 0 1rem">Price</th>
                            <th style="padding: 0 1rem">Quantity</th>
                            <th style="padding: 0 1rem">Category ID</th>
                            <th style="padding: 0 1rem">Import Date</th>
                            <th style="padding: 0 1rem">Using Date</th>
                            <th style="padding: 0 1rem">Status</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" varStatus="counter" items="${requestScope.LIST_PRODUCT}">
                        <form action="MainController">
                            <tr>
                                <td>${counter.count}</td>
                                <td>
                                    <div>${product.productID}</div>
                                </td>
                                <td>
                                    <div>${product.productName}</div>
                                </td>
                                <td>
                                    <img name="image" src="${product.image}" style="width: 10rem"/>
                                </td>
                                <td>
                                    <div>$${product.price}</div>
                                </td>
                                <td>
                                    <div>${product.quantity}</div>
                                </td>
                                <td>
                                   <div>${product.categoryID}</div>
                                </td>
                                <td>
                                    <div>${product.importDate}</div>
                                </td>
                                <td>
                                    <div>${product.usingDate}</div>
                                </td>
                                <td>
                                    <div>${product.status}</div>
                                </td>
                                <!--delete-->
                                <td>
                                    <c:if test="${product.status == true}">
                                        <a href="MainController?action=Delete&productID=${product.productID}">Delete</a>
                                    </c:if>
                                    <c:if test="${product.status != true}">
                                        <a href="#">Deleted</a>
                                    </c:if>
                                </td>
                                <!--update-->
                                <td>
                                    <a href="MainController?action=LoadUpdate&productID=${product.productID}">Update</a>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
            <h4 style="color: red">${requestScope.ERROR}</h4>
            <h4 style="color: red">${requestScope.PRODUCT_ERROR}</h4>
        </c:if>
    </c:if>
    <c:if test="${requestScope.LIST_PRODUCT == null}">
        <c:if test="${empty requestScope.LIST_PRODUCT}">
            <h4 style="color: red">List product is empty!</h4>
        </c:if>
    </c:if>
</body>
</html>

