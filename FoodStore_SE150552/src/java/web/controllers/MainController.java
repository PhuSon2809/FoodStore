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

/**
 *
 * @author Trần Phú Sơn
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteController";
    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLER = "UpdateController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String LOAD_INFOR = "LoadInfor";
    private static final String LOAD_INFOR_CONTROLLER = "LoadInformationController";
    private static final String LOAD_UPDATE = "LoadUpdate";
    private static final String LOAD_UPDATE_CONTROLLER = "LoadProductUpdateController";
    private static final String FILTER_CATEGORY = "Filter";
    private static final String FILTER_CATEGORY_CONTROLLER = "FilterCategoryController";
    private static final String DETAIL_PRODUCT = "Detail";
    private static final String DETAIL_PRODUCT_CONTROLLER = "ProductDetailController";
    private static final String MANAGE_PRODUCT = "Manager";
    private static final String MANAGE_PRODUCT_CONTROLLER = "ViewAllProductController";
    private static final String INSERT = "Insert";
    private static final String INSERT_CONTROLLER = "InsertController";
    private static final String ADD = "AddToCart";
    private static final String ADD_CONTROLLER = "AddToCartController";
    private static final String DECREASE_POPDUCT = "Decrease";
    private static final String DECREASE_POPDUCT_CONTROLLER = "DecreaseProductController";
    private static final String PLUS_POPDUCT = "Plus";
    private static final String PLUS_POPDUCT_CONTROLLER = "PlusProductController";
    private static final String REMOVE = "Remove";
    private static final String REMOVE_CART_CONTROLLER = "RemoveCartController";
    private static final String VERIFY = "Checkout";
    private static final String VERIFY_CONTROLLER = "VerifyOrderController";
    private static final String CHECKOUT = "Checkout";
    private static final String CHECKOUT_CONTROLLER = "CheckOutController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLLER;
            } else if (DELETE.equals(action)) {
                url = DELETE_CONTROLLER;
            } else if (UPDATE.equals(action)) {
                url = UPDATE_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (LOAD_INFOR.equals(action)) {
                url = LOAD_INFOR_CONTROLLER;
            } else if (FILTER_CATEGORY.equals(action)) {
                url = FILTER_CATEGORY_CONTROLLER;
            } else if (DETAIL_PRODUCT.equals(action)) {
                url = DETAIL_PRODUCT_CONTROLLER;
            } else if (MANAGE_PRODUCT.equals(action)) {
                url = MANAGE_PRODUCT_CONTROLLER;
            } else if (INSERT.equals(action)) {
                url = INSERT_CONTROLLER;
            } else if (LOAD_UPDATE.equals(action)) {
                url = LOAD_UPDATE_CONTROLLER;
            } else if (ADD.equals(action)) {
                url = ADD_CONTROLLER;
            } else if (DECREASE_POPDUCT.equals(action)) {
                url = DECREASE_POPDUCT_CONTROLLER;
            } else if (PLUS_POPDUCT.equals(action)) {
                url = PLUS_POPDUCT_CONTROLLER;
            } else if (REMOVE.equals(action)) {
                url = REMOVE_CART_CONTROLLER;
            } else if (CHECKOUT.equals(action)) {
                url = CHECKOUT_CONTROLLER;
            } else if (VERIFY.equals(action)) {
                url = VERIFY_CONTROLLER;
            } else {
                session.setAttribute("ERROR", "Function is not supported !");
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
