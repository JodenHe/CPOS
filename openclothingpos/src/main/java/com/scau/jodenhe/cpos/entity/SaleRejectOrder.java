package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class SaleRejectOrder implements Serializable {
    private Long id;

    private String rejectno;

    private String rejectorderno;

    private Date rejectdatetime;

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

    public String getRejectno() {
        return rejectno;
    }

    public void setRejectno(String rejectno) {
        this.rejectno = rejectno == null ? null : rejectno.trim();
    }

    public String getRejectorderno() {
        return rejectorderno;
    }

    public void setRejectorderno(String rejectorderno) {
        this.rejectorderno = rejectorderno == null ? null : rejectorderno.trim();
    }

    public Date getRejectdatetime() {
        return rejectdatetime;
    }

    public void setRejectdatetime(Date rejectdatetime) {
        this.rejectdatetime = rejectdatetime;
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