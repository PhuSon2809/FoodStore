/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblOrder;

/**
 *
 * @author Trần Phú Sơn
 */
public class OrderError {
    private String orderIDError;
    private String orderDateError;
    private String totalError;
    private String userIDError;

    public OrderError() {
    }

    public OrderError(String orderIDError, String orderDateError, String totalError, String userIDError) {
        this.orderIDError = orderIDError;
        this.orderDateError = orderDateError;
        this.totalError = totalError;
        this.userIDError = userIDError;
    }

    public String getOrderIDError() {
        return orderIDError;
    }

    public void setOrderIDError(String orderIDError) {
        this.orderIDError = orderIDError;
    }

    public String getOrderDateError() {
        return orderDateError;
    }

    public void setOrderDateError(String orderDateError) {
        this.orderDateError = orderDateError;
    }

    public String getTotalError() {
        return totalError;
    }

    public void setTotalError(String totalError) {
        this.totalError = totalError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }
    
}
