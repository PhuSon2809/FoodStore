/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controllers;

import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.Cart.Cart;
import web.models.OrderDetail.OrderDetailError;
import web.models.tblProduct.ProductDTO;
import web.models.tblUser.UserDTO;
import web.utils.SendEmailUtil;

/**
 *
 * @author Trần Phú Sơn
 */
@WebServlet(name = "VerifyOrderController", urlPatterns = {"/VerifyOrderController"})
public class VerifyOrderController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String CART_PAGE = "viewCart.jsp";
    private static final String CHECKOUT_PAGE = "checkOut.jsp";
    private static final String VERIFY = "verifyOrder.jsp";
    private static final String LOGIN = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            OrderDetailError orderDetailError = new OrderDetailError();
            
            boolean error = false;
            String email = request.getParameter("txtEmail");
            if (user == null) {
                request.setAttribute("DID_LOGIN", "You need to login to do this action");
                url = LOGIN;
            } else {
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart != null) {
                    Map<String, ProductDTO> items = cart.getCart();
                    for (ProductDTO value : items.values()) {
                        int cartQuantity = value.getCartQuantity();
                        int quantity = value.getQuantity();
                        if (cartQuantity > quantity) {
                            error = true;
                            orderDetailError.setQuantityError("The number of cars in cart is more than the number in stock.");
                        }
                    }
                }
                if (error) {
                    request.setAttribute("ORDERDETAIL_ERROR", orderDetailError);
                    url = CART_PAGE;
                } else {
                    SendEmailUtil sm = new SendEmailUtil();
                    String code = sm.getRandom();
                    boolean result = sm.sendEmail(code, email);
                    if (result) {
                        session.setAttribute("AUTH_CODE", code);
                        url = VERIFY;
                    } else {
                        url = CHECKOUT_PAGE;
                        request.setAttribute("SEND_ERROR", "Cannot send confirmation to email" + email);
                    }
                }
            }
        } catch (Exception e) {
            log("Error at VerifyOrderController: " + e.toString());
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
