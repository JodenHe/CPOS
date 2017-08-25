package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class SaleOrder implements Serializable {
    private Long id;

    private String saleorderno;

    private String customerno;

    private Date saledatetime;

    private BigDecimal total;

    private Long operatorid;

    private Long shopid;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSaleorderno() {
        return saleorderno;
    }

    public void setSaleorderno(String saleorderno) {
        this.saleorderno = saleorderno == null ? null : saleorderno.trim();
    }

    public String getCustomerno() {
        return customerno;
    }

    public void setCustomerno(String customerno) {
        this.customerno = customerno == null ? null : customerno.trim();
    }

    public Date getSaledatetime() {
        return saledatetime;
    }

    public void setSaledatetime(Date saledatetime) {
        this.saledatetime = saledatetime;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public Long getOperatorid() {
        return operatorid;
    }

    public void setOperatorid(Long operatorid) {
        this.operatorid = operatorid;
    }

    public Long getShopid() {
        return shopid;
    }

    public void setShopid(Long shopid) {
        this.shopid = shopid;
    }
}