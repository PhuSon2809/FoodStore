/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblProduct;

/**
 *
 * @author Trần Phú Sơn
 */
public class ProductError {
    
    private String productIDError;
    private String productNameError;
    private String imageError;
    private String priceError;
    private String quatityError;
    private String categoryIDError;
    private String importDateError;
    private String usingDateError;
    private String statusError;

    public ProductError() {
        this.productIDError = "";
        this.productNameError = "";
        this.imageError = "";
        this.priceError = "";
        this.quatityError = "";
        this.categoryIDError = "";
        this.importDateError = "";
        this.usingDateError = "";
        this.statusError = "";
    }

    public ProductError(String productIDError, String productNameError, String imageError, String priceError, String quatityError, String categoryIDError, String importDateError, String usingDateError, String statusError) {
        this.productIDError = productIDError;
        this.productNameError = productNameError;
        this.imageError = imageError;
        this.priceError = priceError;
        this.quatityError = quatityError;
        this.categoryIDError = categoryIDError;
        this.importDateError = importDateError;
        this.usingDateError = usingDateError;
        this.statusError = statusError;
    }

    public String getProductIDError() {
        return productIDError;
    }

    public void setProductIDError(String productIDError) {
        this.productIDError = productIDError;
    }

    public String getProductNameError() {
        return productNameError;
    }

    public void setProductNameError(String productNameError) {
        this.productNameError = productNameError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getQuatityError() {
        return quatityError;
    }

    public void setQuatityError(String quatityError) {
        this.quatityError = quatityError;
    }

    public String getCategoryIDError() {
        return categoryIDError;
    }

    public void setCategoryIDError(String categoryIDError) {
        this.categoryIDError = categoryIDError;
    }

    public String getImportDateError() {
        return importDateError;
    }

    public void setImportDateError(String importDateError) {
        this.importDateError = importDateError;
    }

    public String getUsingDateError() {
        return usingDateError;
    }

    public void setUsingDateError(String usingDateError) {
        this.usingDateError = usingDateError;
    }

    public String getStatusError() {
        return statusError;
    }

    public void setStatusError(String statusError) {
        this.statusError = statusError;
    }

    

}
