package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class SaleRejectOrderItem implements Serializable {
    private Long id;

    private String rejectno;

    private String itemid;

    private Integer quantity;

    private BigDecimal rejectprice;

    private BigDecimal subtotal;

    private String rejectreason;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRejectno() {
        return rejectno;
    }

    public void setRejectno(String rejectno) {
        this.rejectno = rejectno == null ? null : rejectno.trim();
    }

    public String getItemid() {
        return itemid;
    }

    public void setItemid(String itemid) {
        this.itemid = itemid == null ? null : itemid.trim();
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getRejectprice() {
        return rejectprice;
    }

    public void setRejectprice(BigDecimal rejectprice) {
        this.rejectprice = rejectprice;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }

    public String getRejectreason() {
        return rejectreason;
    }

    public void setRejectreason(String rejectreason) {
        this.rejectreason = rejectreason == null ? null : rejectreason.trim();
    }
}