package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Payment implements Serializable {
    //id标识
    private Long id;

    //支付编号
    private String paymentNo;

    //订单号，参照sale_order表
    private String saleOrderNo;

    //支付金额
    private BigDecimal amount;

    //支付方式，0代表现金支付
    private Byte payType;

    //支付交易号，现金支付为空
    private String payTransactionNo;

    //支付时间
    private Date payDateTime;

    //操作员id，参照user表
    private Long operatorId;

    //店铺id
    private Long shopId;

    private static final long serialVersionUID = 1L;

    /**
     * 获取id标识
     *
     * @return id - id标识
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置id标识
     *
     * @param id id标识
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取支付编号
     *
     * @return paymentNo - 支付编号
     */
    public String getPaymentNo() {
        return paymentNo;
    }

    /**
     * 设置支付编号
     *
     * @param paymentNo 支付编号
     */
    public void setPaymentNo(String paymentNo) {
        this.paymentNo = paymentNo == null ? null : paymentNo.trim();
    }

    /**
     * 获取订单号，参照sale_order表
     *
     * @return saleOrderNo - 订单号，参照sale_order表
     */
    public String getSaleOrderNo() {
        return saleOrderNo;
    }

    /**
     * 设置订单号，参照sale_order表
     *
     * @param saleOrderNo 订单号，参照sale_order表
     */
    public void setSaleOrderNo(String saleOrderNo) {
        this.saleOrderNo = saleOrderNo == null ? null : saleOrderNo.trim();
    }

    /**
     * 获取支付金额
     *
     * @return amount - 支付金额
     */
    public BigDecimal getAmount() {
        return amount;
    }

    /**
     * 设置支付金额
     *
     * @param amount 支付金额
     */
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    /**
     * 获取支付方式，0代表现金支付
     *
     * @return payType - 支付方式，0代表现金支付
     */
    public Byte getPayType() {
        return payType;
    }

    /**
     * 设置支付方式，0代表现金支付
     *
     * @param payType 支付方式，0代表现金支付
     */
    public void setPayType(Byte payType) {
        this.payType = payType;
    }

    /**
     * 获取支付交易号，现金支付为空
     *
     * @return payTransactionNo - 支付交易号，现金支付为空
     */
    public String getPayTransactionNo() {
        return payTransactionNo;
    }

    /**
     * 设置支付交易号，现金支付为空
     *
     * @param payTransactionNo 支付交易号，现金支付为空
     */
    public void setPayTransactionNo(String payTransactionNo) {
        this.payTransactionNo = payTransactionNo == null ? null : payTransactionNo.trim();
    }

    /**
     * 获取支付时间
     *
     * @return payDateTime - 支付时间
     */
    public Date getPayDateTime() {
        return payDateTime;
    }

    /**
     * 设置支付时间
     *
     * @param payDateTime 支付时间
     */
    public void setPayDateTime(Date payDateTime) {
        this.payDateTime = payDateTime;
    }

    /**
     * 获取操作员id，参照user表
     *
     * @return operatorId - 操作员id，参照user表
     */
    public Long getOperatorId() {
        return operatorId;
    }

    /**
     * 设置操作员id，参照user表
     *
     * @param operatorId 操作员id，参照user表
     */
    public void setOperatorId(Long operatorId) {
        this.operatorId = operatorId;
    }

    /**
     * 获取店铺id
     *
     * @return shopId - 店铺id
     */
    public Long getShopId() {
        return shopId;
    }

    /**
     * 设置店铺id
     *
     * @param shopId 店铺id
     */
    public void setShopId(Long shopId) {
        this.shopId = shopId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", paymentNo=").append(paymentNo);
        sb.append(", saleOrderNo=").append(saleOrderNo);
        sb.append(", amount=").append(amount);
        sb.append(", payType=").append(payType);
        sb.append(", payTransactionNo=").append(payTransactionNo);
        sb.append(", payDateTime=").append(payDateTime);
        sb.append(", operatorId=").append(operatorId);
        sb.append(", shopId=").append(shopId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}