package com.buuhybWL.www.bean;


import jakarta.validation.constraints.*;

public class Logistics {
    private Integer lId;

    @NotBlank(message = "收件人地址不能为空")
    private String toAddress;

    @NotBlank(message = "收件人姓名不能为空")
    private String toName;

    @Pattern(regexp = "^(?:(?:\\+|00)86)?1\\d{10}$",message ="请输入正确的手机号码" )
    private String toPhone;

    @NotBlank(message ="寄件人地址不能为空")
    private String address;

    @NotBlank(message ="收件人姓名不能为空")
    private String name;

    @Pattern(regexp = "^(?:(?:\\+|00)86)?1\\d{10}$",message ="请输入正确的手机号码" )
    private String phone;

    @NotBlank(message = "快递员取件方式不能为空")
    private String way;

    @Min(value = 1,message = "重量最小必须为1")
    private Integer weight;

    private Double money;

    @NotBlank(message = "种类不能为空")
    private String kinds;

    private String lNumber;

    Orders orders;

    public Logistics() {
    }

    public Logistics(Integer lId, String toAddress, String toName, String toPhone, String address, String name, String phone, String way, Integer weight, Double money, String kinds, String lNumber,Orders orders) {
        this.lId = lId;
        this.toAddress = toAddress;
        this.toName = toName;
        this.toPhone = toPhone;
        this.address = address;
        this.name = name;
        this.phone = phone;
        this.way = way;
        this.weight = weight;
        this.money = money;
        this.kinds = kinds;
        this.lNumber = lNumber;
        this.orders=orders;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public Integer getlId() {
        return lId;
    }

    public void setlId(Integer lId) {
        this.lId = lId;
    }

    public String getToAddress() {
        return toAddress;
    }

    public void setToAddress(String toAddress) {
        this.toAddress = toAddress == null ? null : toAddress.trim();
    }

    public String getToName() {
        return toName;
    }

    public void setToName(String toName) {
        this.toName = toName == null ? null : toName.trim();
    }

    public String getToPhone() {
        return toPhone;
    }

    public void setToPhone(String toPhone) {
        this.toPhone = toPhone == null ? null : toPhone.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way == null ? null : way.trim();
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public String getKinds() {
        return kinds;
    }

    public void setKinds(String kinds) {
        this.kinds = kinds == null ? null : kinds.trim();
    }

    public String getlNumber() {
        return lNumber;
    }

    public void setlNumber(String lNumber) {
        this.lNumber = lNumber == null ? null : lNumber.trim();
    }
}