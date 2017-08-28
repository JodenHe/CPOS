package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class SaleRejectOrder implements Serializable {
    //id标记
    private Long id;

    //退货单号
    private String rejectNo;

    //源订单号，参照sale_order表
    private String rejectOrderNo;

    //退货时间
    private Date rejectDateTime;

    //退货总金额
    private BigDecimal total;

    //操作员id，参照user表
    private Long operatorId;

    //店铺id
    private Long shopId;

    private static final long serialVersionUID = 1L;

    /**
     * 获取id标记
     *
     * @return id - id标记
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置id标记
     *
     * @param id id标记
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取退货单号
     *
     * @return rejectNo - 退货单号
     */
    public String getRejectNo() {
        return rejectNo;
    }

    /**
     * 设置退货单号
     *
     * @param rejectNo 退货单号
     */
    public void setRejectNo(String rejectNo) {
        this.rejectNo = rejectNo == null ? null : rejectNo.trim();
    }

    /**
     * 获取源订单号，参照sale_order表
     *
     * @return rejectOrderNo - 源订单号，参照sale_order表
     */
    public String getRejectOrderNo() {
        return rejectOrderNo;
    }

    /**
     * 设置源订单号，参照sale_order表
     *
     * @param rejectOrderNo 源订单号，参照sale_order表
     */
    public void setRejectOrderNo(String rejectOrderNo) {
        this.rejectOrderNo = rejectOrderNo == null ? null : rejectOrderNo.trim();
    }

    /**
     * 获取退货时间
     *
     * @return rejectDateTime - 退货时间
     */
    public Date getRejectDateTime() {
        return rejectDateTime;
    }

    /**
     * 设置退货时间
     *
     * @param rejectDateTime 退货时间
     */
    public void setRejectDateTime(Date rejectDateTime) {
        this.rejectDateTime = rejectDateTime;
    }

    /**
     * 获取退货总金额
     *
     * @return total - 退货总金额
     */
    public BigDecimal getTotal() {
        return total;
    }

    /**
     * 设置退货总金额
     *
     * @param total 退货总金额
     */
    public void setTotal(BigDecimal total) {
        this.total = total;
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
        sb.append(", rejectNo=").append(rejectNo);
        sb.append(", rejectOrderNo=").append(rejectOrderNo);
        sb.append(", rejectDateTime=").append(rejectDateTime);
        sb.append(", total=").append(total);
        sb.append(", operatorId=").append(operatorId);
        sb.append(", shopId=").append(shopId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}