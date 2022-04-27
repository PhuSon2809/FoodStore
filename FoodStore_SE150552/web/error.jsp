<%-- 
    Document   : error
    Created on : Mar 4, 2022, 8:05:34 PM
    Author     : Trần Phú Sơn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>ERROR: <%= session.getAttribute("ERROR")%></h1>
    </body>
</html>
