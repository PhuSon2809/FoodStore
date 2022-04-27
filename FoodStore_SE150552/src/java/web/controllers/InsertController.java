/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controllers;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.models.tblProduct.ProductDAO;
import web.models.tblProduct.ProductDTO;
import web.models.tblProduct.ProductError;

/**
 *
 * @author Trần Phú Sơn
 */
@WebServlet(name = "InsertController", urlPatterns = {"/InsertController"})
public class InsertController extends HttpServlet {

    private static final String ERROR = "insertProduct.jsp";
    private static final String SUCCESS = "ViewAllProductController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ProductError productError = new ProductError();
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            String image = request.getParameter("image");
            String priceString = request.getParameter("price");
            String quantityString = request.getParameter("quantity");
            String categoryID = request.getParameter("categoryID");
            String importDateString = request.getParameter("importDate");
            String usingDateString = request.getParameter("usingDate");
            boolean status = true;
            float price = 0;
            int quantity = 0;
            LocalDate importDate = null;
            LocalDate usingDate = null;

            boolean checkValidation = true;
            ProductDAO dao = new ProductDAO();
            boolean checkDuplicate = dao.checkDuplicate(productID);
            if (checkDuplicate) {
                productError.setProductIDError("Duplicate !!!");
                checkValidation = false;
            }
            if (productID.length() < 3 || productID.length() > 10) {
                productError.setProductIDError("UserID length must be [3,10]");
                checkValidation = false;
            }
            if (productName.length() < 3 || productName.length() > 20) {
                productError.setProductNameError("Full Name length must be [3,20]");
                checkValidation = false;
            }
            if (image.trim().isEmpty()) {
                productError.setImageError("Please fill url an image!");
                checkValidation = false;
            }
            try {
                price = Float.parseFloat(priceString);
            } catch (NumberFormatException e) {
                productError.setPriceError("Price must be number!");
                checkValidation = false;
            }
            if (price <= 0) {
                productError.setPriceError("Price must bigger than 0!");
                checkValidation = false;
            }
            try {
                quantity = Integer.parseInt(quantityString);
            } catch (NumberFormatException e) {
                productError.setQuatityError("Quantity must be integer!");
                checkValidation = false;
            }
            if (quantity < 1) {
                productError.setQuatityError("Quantity must be at least 1!");
                checkValidation = false;
            }
            try {
                importDate = LocalDate.parse(importDateString, DateTimeFormatter.ISO_LOCAL_DATE);
            } catch (Exception e) {
                productError.setImportDateError("Invalid Date!");
                checkValidation = false;
            }
            try {
                usingDate = LocalDate.parse(usingDateString, DateTimeFormatter.ISO_LOCAL_DATE);
            } catch (Exception e) {
                productError.setUsingDateError("Invalid Date!");
                checkValidation = false;
            }
            if (usingDate.isBefore(importDate)) {
                productError.setUsingDateError("Using date must be than Import Date");
                checkValidation = false;
            }
            if (checkValidation) {
                ProductDTO product = new ProductDTO(productID, productName, image, price, quantity, categoryID, importDateString, usingDateString, status);
                boolean checkInsert = dao.insertProduct(product);
                if (checkInsert) {
                    url = SUCCESS;
                    request.setAttribute("PRODUCT_ERROR", "Insert successfull!");
                } else {
                    request.setAttribute("PRODUCT_ERROR", "Insert fail!");
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", productError);
            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
