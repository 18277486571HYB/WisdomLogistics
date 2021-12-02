package com.buuhybWL.www.bean;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Orders {
    private Integer oId;

    private String oNumber;


    private Date oDate;

    private String oStatus;

    private Integer oSId;

    private Double oPrice;

    private Integer oUid;

    public Orders() {
    }

    public Orders(Integer oId, String oNumber, Date oDate, String oStatus, Integer oSId, Double oPrice, Integer oUid) {
        this.oId = oId;
        this.oNumber = oNumber;
        this.oDate = oDate;
        this.oStatus = oStatus;
        this.oSId = oSId;
        this.oPrice = oPrice;
        this.oUid = oUid;
    }

    public Integer getoId() {
        return oId;
    }

    public void setoId(Integer oId) {
        this.oId = oId;
    }

    public String getoNumber() {
        return oNumber;
    }

    public void setoNumber(String oNumber) {
        this.oNumber = oNumber == null ? null : oNumber.trim();
    }

    public Date getoDate() {
        return oDate;
    }

    public void setoDate(Date oDate) {
        this.oDate = oDate;
    }

    public String getoStatus() {
        return oStatus;
    }

    public void setoStatus(String oStatus) {
        this.oStatus = oStatus == null ? null : oStatus.trim();
    }

    public Integer getoSId() {
        return oSId;
    }

    public void setoSId(Integer oSId) {
        this.oSId = oSId;
    }

    public Double getoPrice() {
        return oPrice;
    }

    public void setoPrice(Double oPrice) {
        this.oPrice = oPrice;
    }

    public Integer getoUid() {
        return oUid;
    }

    public void setoUid(Integer oUid) {
        this.oUid = oUid;
    }


}