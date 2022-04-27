<%-- 
    Document   : insertProduct
    Created on : Mar 5, 2022, 12:38:54 AM
    Author     : Trần Phú Sơn
--%>

<%@page import="web.models.tblUser.UserDTO"%>
<%@page import="web.models.tblProduct.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Food Store | Insert Product</title>
    </head>
    <body>

        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                response.sendRedirect("login.jsp");
                return;
            }
            ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
            if (productError == null) {
                productError = new ProductError();
            }
        %>
        <h1>Admin: <%= loginUser.getFullName()%></h1>
        <h1>Insert new product:</h1>
        <table>
            <tbody>
            <form action="MainController" method="POST">
                <tr>
                    <td>Product ID:</td>
                    <td>
                        <input type="text" name="productID" required=""/>
                        <%= productError.getProductIDError()%><br>
                    </td>
                </tr>
                <tr>
                    <td>Product Name:</td>
                    <td>
                        <input type="text" name="productName" required=""/>
                        <%= productError.getProductNameError()%><br>
                    </td>
                </tr>
                <tr>
                    <td>Image URL:</td>
                    <td>
                        <input type="url" name="image" required=""/>
                        <%= productError.getImageError()%><br>
                    </td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td>
                        <input type="number" name="price" required=""/>
                        <%= productError.getPriceError()%><br>
                    </td>
                </tr>
                <tr>
                    <td>Quantity:</td>
                    <td>
                        <input type="number" name="quantity" required=""/>
                        <%= productError.getQuatityError()%><br>
                    </td>
                </tr>
                <tr>
                    <td>Category ID:</td>
                    <td>
                        <select name="categoryID">
                            <option value="CG01">CG01-Vegetable</option>
                            <option value="CG02">CG02-Fresh Fruits</option>
                            <option value="CG03">CG03-Dairy Products</option>
                            <option value="CG04">CG04-Fresh Meat</option>
                        </select>
                        <%= productError.getCategoryIDError()%><br>
                    </td>
                </tr>
                <tr>
                    <td>Import Date:</td>
                    <td>
                        <input type="date" name="importDate" required=""/>
                        <%= productError.getImportDateError()%><br>
                    </td>
                </tr>
                <tr>
                    <td>Using Date:</td>
                    <td>
                        <input type="date" name="usingDate" required=""/>
                        <%= productError.getUsingDateError()%><br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="action" value="Insert"/>
                        <input type="reset" value="Reset"/>
                    </td>
                </tr>
            </form>
        </tbody>
    </table>
</body>
</html>
