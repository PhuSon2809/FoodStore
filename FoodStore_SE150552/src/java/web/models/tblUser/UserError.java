/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web.models.tblUser;

/**
 *
 * @author Trần Phú Sơn
 */
public class UserError {
    
    private String userIDError;
    private String fullNameError;
    private String passwordError;
    private String roleIDError;
    private String addressError;
    private String confirmError;
    private String birthdayError;
    private String phoneError;
    private String emailError;

    public UserError() {
        this.userIDError = "";
        this.fullNameError = "";
        this.passwordError = "";
        this.confirmError = "";
        this.roleIDError = "";
        this.addressError = "";
        this.birthdayError = "";
        this.phoneError = "";
        this.emailError = "";
    }

    public UserError(String userIDError, String fullNameError, String passwordError, String roleIDError, String addressError, String confirmError, String birthdayError, String phoneError, String emailError) {
        this.userIDError = userIDError;
        this.fullNameError = fullNameError;
        this.passwordError = passwordError;
        this.roleIDError = roleIDError;
        this.addressError = addressError;
        this.confirmError = confirmError;
        this.birthdayError = birthdayError;
        this.phoneError = phoneError;
        this.emailError = emailError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    public String getAddressError() {
        return addressError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

    public String getBirthdayError() {
        return birthdayError;
    }

    public void setBirthdayError(String birthdayError) {
        this.birthdayError = birthdayError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

    public String getEmailError() {
        return emailError;
    }

    public void setEmailError(String emailError) {
        this.emailError = emailError;
    }
}
