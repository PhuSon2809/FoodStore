/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.Cart.Cart;
import web.models.tblProduct.ProductDAO;
import web.models.tblProduct.ProductDTO;

/**
 *
 * @author Trần Phú Sơn
 */
public class AddToCartController extends HttpServlet {

//    private static final String SUCCESS = "LoadInformationController";
//    private static final String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        String url = ERROR;
        HttpSession session = request.getSession();
        try {
            String productID = request.getParameter("productID");
            if (productID != null) {
                ProductDAO dao = new ProductDAO();
                ProductDTO productInfor = dao.getProductById(productID);
                ProductDTO product = new ProductDTO(productInfor.getProductID(),
                        productInfor.getProductName(),
                        productInfor.getImage(),
                        productInfor.getPrice(),
                        productInfor.getQuantity(),
                        productInfor.getCategoryID(),
                        productInfor.getImportDate(),
                        productInfor.getUsingDate(),
                        productInfor.isStatus(),
                        1);
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart == null) {
                    cart = new Cart();
                }
                boolean check = cart.addProduct(product);
                if (check) {
                    session.setAttribute("CART", cart);
                    request.setAttribute("CART_ERROR", "Add to cart Sucessfully.");
//                    url = SUCCESS;
                } else {
                    request.setAttribute("CART_ERROR", "Add to cart Fail!");
                }
            }
        } catch (Exception e) {
            log("Error at AddToCartController: " + e.toString());
        } finally {
            String urlHistory = (String) session.getAttribute("URL_HISTORY");
            if (urlHistory == null) {
                urlHistory = "LoadInformationController";
            }
            request.getRequestDispatcher(urlHistory).forward(request, response);
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
