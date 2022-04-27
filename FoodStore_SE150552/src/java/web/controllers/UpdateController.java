/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "UpdateController", urlPatterns = {"/UpdateController"})
public class UpdateController extends HttpServlet {

    private static final String ERROR = "updateProduct.jsp";
//    private static final String ERROR = "ViewAllProductController";
    private static final String SUCCESS = "ViewAllProductController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            ProductError productError = new ProductError();
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            String image = request.getParameter("image");
            float price = Float.parseFloat(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String categoryID = request.getParameter("categoryID");
            String importDateString = request.getParameter("importDate");
            String usingDateString = request.getParameter("usingDate");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            LocalDate importDate = LocalDate.parse(importDateString, DateTimeFormatter.ISO_LOCAL_DATE);
            LocalDate usingDate = LocalDate.parse(usingDateString, DateTimeFormatter.ISO_LOCAL_DATE);
ProductDTO product = new ProductDTO(productID, productName, image, price, quantity, categoryID, importDateString, usingDateString, status);
            boolean checkValidation = true;
            ProductDAO dao = new ProductDAO();
            if (productName.length() < 3 || productName.length() > 20) {
                productError.setProductNameError("Full Name length must be [3,20]");
                checkValidation = false;
            }
            if (image.trim().isEmpty()) {
                productError.setImageError("Please fill url an image!");
                checkValidation = false;
            }
            if (price < 0) {
                productError.setPriceError("Price must bigger than 0!");
                checkValidation = false;
            }
            if (quantity < 1) {
                productError.setQuatityError("Quantity must be at least 1!");
                checkValidation = false;
            }
            if (usingDate.isBefore(importDate)) {
                productError.setUsingDateError("Using date must be than Import Date");
                checkValidation = false;
            }
            if (checkValidation) {
//                ProductDTO product = new ProductDTO(productID, productName, image, price, quantity, categoryID, importDateString, usingDateString, status);
                boolean check = dao.updateProduct(product);
                if (check) {
                    url = SUCCESS;
                    request.setAttribute("ERROR", "Update Successfull.");
                } else {
                    request.setAttribute("ERROR", "Can not update! Try again.");
                }
            } else {
                request.setAttribute("PRODUCT_ERROR", productError);
                request.setAttribute("PRODUCT", product);
            }
        } catch (Exception e) {
            log("Error at UpdateController: " + e.toString());
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
