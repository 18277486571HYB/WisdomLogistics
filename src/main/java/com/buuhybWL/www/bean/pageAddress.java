package com.buuhybWL.www.bean;


import jakarta.validation.constraints.*;

public class pageAddress {
    private Integer id;

    @NotBlank(message = "姓名不能为空")
    private String pName;

    @NotBlank(message = "地址不能为空")
    private String pAddress;

    @Pattern(regexp = "^(?:(?:\\+|00)86)?1\\d{10}$",message ="请输入正确的手机号码" )
    private String phone;

    private String status;

    private Integer uId;

    public pageAddress() {
    }

    public pageAddress(Integer id, @NotBlank(message = "姓名不能为空") String pName, @NotBlank(message = "地址不能为空") String pAddress, @Pattern(regexp = "^(?:(?:\\+|00)86)?1\\d{10}$", message = "请输入正确的手机号码") String phone, String status, Integer uId) {
        this.id = id;
        this.pName = pName;
        this.pAddress = pAddress;
        this.phone = phone;
        this.status = status;
        this.uId = uId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName == null ? null : pName.trim();
    }

    public String getpAddress() {
        return pAddress;
    }

    public void setpAddress(String pAddress) {
        this.pAddress = pAddress == null ? null : pAddress.trim();
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

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }
}