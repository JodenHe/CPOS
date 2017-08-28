package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class SaleRejectOrderItem implements Serializable {
    //id标识
    private Long id;

    //退货订单号，参照sale_reject_order表
    private String rejectNo;

    //商品编号，条形码，参照goods表
    private String itemId;

    private Integer quantity;

    //退货单价
    private BigDecimal rejectPrice;

    //小计
    private BigDecimal subTotal;

    //退货理由
    private String rejectReason;

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
     * 获取退货订单号，参照sale_reject_order表
     *
     * @return rejectNo - 退货订单号，参照sale_reject_order表
     */
    public String getRejectNo() {
        return rejectNo;
    }

    /**
     * 设置退货订单号，参照sale_reject_order表
     *
     * @param rejectNo 退货订单号，参照sale_reject_order表
     */
    public void setRejectNo(String rejectNo) {
        this.rejectNo = rejectNo == null ? null : rejectNo.trim();
    }

    /**
     * 获取商品编号，条形码，参照goods表
     *
     * @return itemId - 商品编号，条形码，参照goods表
     */
    public String getItemId() {
        return itemId;
    }

    /**
     * 设置商品编号，条形码，参照goods表
     *
     * @param itemId 商品编号，条形码，参照goods表
     */
    public void setItemId(String itemId) {
        this.itemId = itemId == null ? null : itemId.trim();
    }

    /**
     * @return quantity
     */
    public Integer getQuantity() {
        return quantity;
    }

    /**
     * @param quantity
     */
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    /**
     * 获取退货单价
     *
     * @return rejectPrice - 退货单价
     */
    public BigDecimal getRejectPrice() {
        return rejectPrice;
    }

    /**
     * 设置退货单价
     *
     * @param rejectPrice 退货单价
     */
    public void setRejectPrice(BigDecimal rejectPrice) {
        this.rejectPrice = rejectPrice;
    }

    /**
     * 获取小计
     *
     * @return subTotal - 小计
     */
    public BigDecimal getSubTotal() {
        return subTotal;
    }

    /**
     * 设置小计
     *
     * @param subTotal 小计
     */
    public void setSubTotal(BigDecimal subTotal) {
        this.subTotal = subTotal;
    }

    /**
     * 获取退货理由
     *
     * @return rejectReason - 退货理由
     */
    public String getRejectReason() {
        return rejectReason;
    }

    /**
     * 设置退货理由
     *
     * @param rejectReason 退货理由
     */
    public void setRejectReason(String rejectReason) {
        this.rejectReason = rejectReason == null ? null : rejectReason.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", rejectNo=").append(rejectNo);
        sb.append(", itemId=").append(itemId);
        sb.append(", quantity=").append(quantity);
        sb.append(", rejectPrice=").append(rejectPrice);
        sb.append(", subTotal=").append(subTotal);
        sb.append(", rejectReason=").append(rejectReason);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}