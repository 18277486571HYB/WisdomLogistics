package com.buuhybWL.www.bean;

public class OrderPrice {
    private Integer opId;

    private Integer opWeight;

    private String opKinds;

    private Double opPrice;

    public Integer getOpId() {
        return opId;
    }

    public void setOpId(Integer opId) {
        this.opId = opId;
    }

    public Integer getOpWeight() {
        return opWeight;
    }

    public void setOpWeight(Integer opWeight) {
        this.opWeight = opWeight;
    }

    public String getOpKinds() {
        return opKinds;
    }

    public void setOpKinds(String opKinds) {
        this.opKinds = opKinds == null ? null : opKinds.trim();
    }

    public Double getOpPrice() {
        return opPrice;
    }

    public void setOpPrice(Double opPrice) {
        this.opPrice = opPrice;
    }
}