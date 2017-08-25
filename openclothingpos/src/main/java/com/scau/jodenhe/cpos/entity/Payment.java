package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Payment implements Serializable {
    private Long id;

    private String paymentno;

    private String saleorderno;

    private BigDecimal amount;

    private Byte paytype;

    private String paytransactionno;

    private Date paydatetime;

    private Long operatorid;

    private Long shopid;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPaymentno() {
        return paymentno;
    }

    public void setPaymentno(String paymentno) {
        this.paymentno = paymentno == null ? null : paymentno.trim();
    }

    public String getSaleorderno() {
        return saleorderno;
    }

    public void setSaleorderno(String saleorderno) {
        this.saleorderno = saleorderno == null ? null : saleorderno.trim();
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Byte getPaytype() {
        return paytype;
    }

    public void setPaytype(Byte paytype) {
        this.paytype = paytype;
    }

    public String getPaytransactionno() {
        return paytransactionno;
    }

    public void setPaytransactionno(String paytransactionno) {
        this.paytransactionno = paytransactionno == null ? null : paytransactionno.trim();
    }

    public Date getPaydatetime() {
        return paydatetime;
    }

    public void setPaydatetime(Date paydatetime) {
        this.paydatetime = paydatetime;
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