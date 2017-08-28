package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class SaleOrderItem implements Serializable {
    //id标记
    private Long id;

    //订单号，参照sale_order表订单编号
    private String saleOrderNo;

    //商品编号，即条形码，参照goods表
    private String itemId;

    //数量
    private Integer quantity;

    //单价
    private BigDecimal salePrice;

    //小计
    private BigDecimal subTotal;

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
     * 获取订单号，参照sale_order表订单编号
     *
     * @return saleOrderNo - 订单号，参照sale_order表订单编号
     */
    public String getSaleOrderNo() {
        return saleOrderNo;
    }

    /**
     * 设置订单号，参照sale_order表订单编号
     *
     * @param saleOrderNo 订单号，参照sale_order表订单编号
     */
    public void setSaleOrderNo(String saleOrderNo) {
        this.saleOrderNo = saleOrderNo == null ? null : saleOrderNo.trim();
    }

    /**
     * 获取商品编号，即条形码，参照goods表
     *
     * @return itemId - 商品编号，即条形码，参照goods表
     */
    public String getItemId() {
        return itemId;
    }

    /**
     * 设置商品编号，即条形码，参照goods表
     *
     * @param itemId 商品编号，即条形码，参照goods表
     */
    public void setItemId(String itemId) {
        this.itemId = itemId == null ? null : itemId.trim();
    }

    /**
     * 获取数量
     *
     * @return quantity - 数量
     */
    public Integer getQuantity() {
        return quantity;
    }

    /**
     * 设置数量
     *
     * @param quantity 数量
     */
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    /**
     * 获取单价
     *
     * @return salePrice - 单价
     */
    public BigDecimal getSalePrice() {
        return salePrice;
    }

    /**
     * 设置单价
     *
     * @param salePrice 单价
     */
    public void setSalePrice(BigDecimal salePrice) {
        this.salePrice = salePrice;
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

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", saleOrderNo=").append(saleOrderNo);
        sb.append(", itemId=").append(itemId);
        sb.append(", quantity=").append(quantity);
        sb.append(", salePrice=").append(salePrice);
        sb.append(", subTotal=").append(subTotal);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}