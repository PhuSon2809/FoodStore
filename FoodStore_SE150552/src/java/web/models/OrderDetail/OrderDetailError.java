/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.OrderDetail;

/**
 *
 * @author Trần Phú Sơn
 */
public class OrderDetailError {
    private String detailIDError;
    private String priceError;
    private String quantityError;
    private String orderIDError;
    private String productIDError;

    public OrderDetailError() {
    }

    public OrderDetailError(String detailIDError, String priceError, String quantityError, String orderIDError, String productIDError) {
        this.detailIDError = detailIDError;
        this.priceError = priceError;
        this.quantityError = quantityError;
        this.orderIDError = orderIDError;
        this.productIDError = productIDError;
    }

    public String getDetailIDError() {
        return detailIDError;
    }

    public void setDetailIDError(String detailIDError) {
        this.detailIDError = detailIDError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(String quantityError) {
        this.quantityError = quantityError;
    }

    public String getOrderIDError() {
        return orderIDError;
    }

    public void setOrderIDError(String orderIDError) {
        this.orderIDError = orderIDError;
    }

    public String getProductIDError() {
        return productIDError;
    }

    public void setProductIDError(String productIDError) {
        this.productIDError = productIDError;
    }

    
}
