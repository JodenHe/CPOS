package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;
import java.util.Date;

public class Inventory implements Serializable {
    //id标识
    private Long id;

    //商品id，参照goods表
    private Long goodsId;

    //仓库id，参照warehouse表
    private Long warehouseId;

    //库存数量
    private Integer quantity;

    //批发价
    private Long amount;

    //描述
    private String script;

    private Date createTime;

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
     * 获取商品id，参照goods表
     *
     * @return goodsId - 商品id，参照goods表
     */
    public Long getGoodsId() {
        return goodsId;
    }

    /**
     * 设置商品id，参照goods表
     *
     * @param goodsId 商品id，参照goods表
     */
    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    /**
     * 获取仓库id，参照warehouse表
     *
     * @return warehouseId - 仓库id，参照warehouse表
     */
    public Long getWarehouseId() {
        return warehouseId;
    }

    /**
     * 设置仓库id，参照warehouse表
     *
     * @param warehouseId 仓库id，参照warehouse表
     */
    public void setWarehouseId(Long warehouseId) {
        this.warehouseId = warehouseId;
    }

    /**
     * 获取库存数量
     *
     * @return quantity - 库存数量
     */
    public Integer getQuantity() {
        return quantity;
    }

    /**
     * 设置库存数量
     *
     * @param quantity 库存数量
     */
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    /**
     * 获取批发价
     *
     * @return amount - 批发价
     */
    public Long getAmount() {
        return amount;
    }

    /**
     * 设置批发价
     *
     * @param amount 批发价
     */
    public void setAmount(Long amount) {
        this.amount = amount;
    }

    /**
     * 获取描述
     *
     * @return script - 描述
     */
    public String getScript() {
        return script;
    }

    /**
     * 设置描述
     *
     * @param script 描述
     */
    public void setScript(String script) {
        this.script = script == null ? null : script.trim();
    }

    /**
     * @return createTime
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", goodsId=").append(goodsId);
        sb.append(", warehouseId=").append(warehouseId);
        sb.append(", quantity=").append(quantity);
        sb.append(", amount=").append(amount);
        sb.append(", script=").append(script);
        sb.append(", createTime=").append(createTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}