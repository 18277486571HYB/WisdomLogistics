
package com.buuhybWL.www.bean;


import jakarta.validation.constraints.*;

public class User {
    private Integer uId;
    //
//    let ex=/^[a-zA-Z0-9_-]{4,16}$/;
//    let alertText="用户名必须4-16位，可以字母数字下划线";
    @Pattern(regexp = "^[a-zA-Z0-9_-]{4,16}$",message = "用户名必须4-16位，可以字母数字下划线")
    private String username;

    //    let ex=/^\S*(?=\S{6,})(?=\S*\d)(?=\S*[A-Z])(?=\S*[a-z])(?=\S*[!@#$%^&*? ])\S*$/;
//    let alertText="最少六位，包括大小写字母，数字，特殊字符";
    @Pattern(regexp = "^\\S*(?=\\S{6,})(?=\\S*\\d)(?=\\S*[A-Z])(?=\\S*[a-z])(?=\\S*[!@#$%^&*? ])\\S*$",
            message = "最少六位，包括大小写字母，数字，特殊字符")
    private String password;

    //    let ex=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
//    let alertText="请输入带@的正确邮箱格式";
    @Pattern(regexp = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$",message ="请输入带@的正确邮箱格式" )
    private String email;

    //    let ex=/^(?:(?:\+|00)86)?1\d{10}$/;
//    let alertText="请输入正确的手机号码";
    @Pattern(regexp = "^(?:(?:\\+|00)86)?1\\d{10}$",message ="请输入正确的手机号码" )
    private String phone;

    private String status;

    public User() {
    }

    public User(Integer uId, String username, String password, String email, String phone, String status) {
        this.uId = uId;
        this.username = username;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.status = status;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}