/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.controllers;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.models.Cart.Cart;
import web.models.OrderDetail.OrderDetailDAO;
import web.models.OrderDetail.OrderDetailDTO;
import web.models.tblOrder.OrderDAO;
import web.models.tblOrder.OrderDTO;
import web.models.tblProduct.ProductDAO;
import web.models.tblProduct.ProductDTO;
import web.models.tblUser.UserDTO;

/**
 *
 * @author Trần Phú Sơn
 */
public class CheckOutController extends HttpServlet {
    
    private static final String ERROR = "checkOut.jsp";
    private static final String SUCCESS = "checkOut.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            
            String orderID = UUID.randomUUID().toString();
            float totalPay = Float.parseFloat(request.getParameter("total"));
            String userID = user.getUserID();
            OrderDAO orderDAO = new OrderDAO();
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            
            OrderDTO orderDTO = new OrderDTO(orderID, LocalDateTime.now().toString(), totalPay, userID);
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) {
                Map<String, ProductDTO> items = cart.getCart();
                boolean check = orderDAO.addOrder(orderDTO);
                if (check) {
                    for (ProductDTO value : items.values()) {
                        String productID = value.getProductID();
                        float price = value.getPrice();
                        int quantity = value.getCartQuantity();
                        OrderDetailDTO orderDetailDTO = new OrderDetailDTO(userID, price, quantity, orderID, productID);
                        check = orderDetailDAO.saveOrderDetail(orderDetailDTO);
                        if (check) {
                            int newQuantity = value.getQuantity() - quantity;
                            ProductDAO productDAO = new ProductDAO();
                            check = productDAO.updateQuantity(productID, newQuantity);
                            if (check) {
                                request.setAttribute("SUCCESS", "Your order has been created successfully");
                                url = SUCCESS;
                                session.removeAttribute("CART");
                            }
                        }
                    }
                } else {
                    request.setAttribute("ERROR", "Your order has been created fail! Please try again!");
                    url = ERROR;
                }
            }
        } catch (Exception e) {
            log("Error at CheckOutServlet: " + e.toString());
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
