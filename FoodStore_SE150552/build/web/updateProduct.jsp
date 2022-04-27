<%-- 
    Document   : updateProduct
    Created on : Mar 9, 2022, 3:11:25 PM
    Author     : Trần Phú Sơn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="web.models.tblProduct.ProductError"%>
<%@page import="web.models.tblUser.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food Store | Update Product</title>
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER==NULL || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <h1>Admin: ${sessionScope.LOGIN_USER.fullName}</h1>
        <h3 style="display: inline">Go back: </h3><a href="MainController?action=Manager">Click here</a>
        <h1>Update product:</h1>
        <table>
            <tbody>
                <c:set var="product" value="${requestScope.PRODUCT}"/>
                <c:set var="error" value="${requestScope.PRODUCT_ERROR}"/>
            <form action="MainController" method="POST">
                <tr>
                    <td style="color: red">Product ID:</td>
                    <td>
                        <input type="text" name="productID" value="${product.productID}" readonly=""/>
                    </td>
                </tr>
                <tr>
                    <td>Product Name:</td>
                    <td>
                        <input type="text" name="productName" value="${product.productName}" required=""/>
                        <c:if test="${not empty error.productNameError}">
                            ${error.productNameError}
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td style="color: red">Image Old:</td>
                    <td>
                        <img name="imageOld" src="${product.image}" style="width: 10rem"/>
                    </td>
                </tr>
                <tr>
                    <td>Image URL:</td>
                    <td>
                        <input type="url" name="image" value="${product.image}" required=""/>
                        <c:if test="${not empty error.imageError}">
                            ${error.imageError}
                        </c:if>

                    </td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td>
                        <input type="number" name="price" value="${product.price}" required=""/>
                        <c:if test="${not empty error.priceError}">
                            ${error.priceError}
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td>Quantity:</td>
                    <td>
                        <input type="number" name="quantity" value="${product.quantity}" required=""/>
                        <c:if test="${not empty error.quatityError}">
                            ${error.quatityError}
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td style="color: red">Category ID Old:</td>
                    <td>
                        ${product.categoryID}
                    </td>
                </tr>
                <tr>
                    <td>New Category ID:</td>
                    <td>
                        <select name="categoryID">
                            <option value="CG01">CG01-Vegetable</option>
                            <option value="CG02">CG02-Fresh Fruits</option>
                            <option value="CG03">CG03-Dairy Products</option>
                            <option value="CG04">CG04-Fresh Meat</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Import Date:</td>
                    <td>
                        <input type="date" name="importDate" value="${product.importDate}" required=""/>
                    </td>
                </tr>
                <tr>
                    <td>Using Date:</td>
                    <td>
                        <input type="date" name="usingDate" value="${product.usingDate}" required=""/>
                        <c:if test="${not empty error.usingDateError}">
                            ${error.usingDateError}
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td style="color: red">Status Old:</td>
                    <td>
                        ${product.status}
                    </td>
                </tr>
                <tr>
                    <td>New Status:</td>
                    <td>
                        <select name="status">
                            <option value="true">Available</option>
                            <option value="false">Deleted</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <a onclick="return cancelConfirm()" href="LoadProductUpdateController?productID=${product.productID}">Cancel</a>
                    </td>
                </tr>
            </form>
        </tbody>
    </table>
    <script>
        function cancelConfirm() {
            var r = confirm("Change will not be saved. Are you sure to cancel?");
            return r;
        }
    </script>
</body>
</html>
