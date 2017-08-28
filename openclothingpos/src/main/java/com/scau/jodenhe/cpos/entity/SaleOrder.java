package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class SaleOrder implements Serializable {
    //id标识
    private Long id;

    //订单编号
    private String saleOrderNo;

    //客户编号
    private String customerNo;

    //下单时间
    private Date saleDateTime;

    private BigDecimal total;

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
     * 获取订单编号
     *
     * @return saleOrderNo - 订单编号
     */
    public String getSaleOrderNo() {
        return saleOrderNo;
    }

    /**
     * 设置订单编号
     *
     * @param saleOrderNo 订单编号
     */
    public void setSaleOrderNo(String saleOrderNo) {
        this.saleOrderNo = saleOrderNo == null ? null : saleOrderNo.trim();
    }

    /**
     * 获取客户编号
     *
     * @return customerNo - 客户编号
     */
    public String getCustomerNo() {
        return customerNo;
    }

    /**
     * 设置客户编号
     *
     * @param customerNo 客户编号
     */
    public void setCustomerNo(String customerNo) {
        this.customerNo = customerNo == null ? null : customerNo.trim();
    }

    /**
     * 获取下单时间
     *
     * @return saleDateTime - 下单时间
     */
    public Date getSaleDateTime() {
        return saleDateTime;
    }

    /**
     * 设置下单时间
     *
     * @param saleDateTime 下单时间
     */
    public void setSaleDateTime(Date saleDateTime) {
        this.saleDateTime = saleDateTime;
    }

    /**
     * @return total
     */
    public BigDecimal getTotal() {
        return total;
    }

    /**
     * @param total
     */
    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    /**
     * @return operatorId
     */
    public Long getOperatorId() {
        return operatorId;
    }

    /**
     * @param operatorId
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
        sb.append(", saleOrderNo=").append(saleOrderNo);
        sb.append(", customerNo=").append(customerNo);
        sb.append(", saleDateTime=").append(saleDateTime);
        sb.append(", total=").append(total);
        sb.append(", operatorId=").append(operatorId);
        sb.append(", shopId=").append(shopId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}