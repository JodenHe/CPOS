package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Goods implements Serializable {
    //id标识
    private Long id;

    //款式id，参照style表
    private Long categoryId;

    //颜色id，参照color表
    private Long colorId;

    private Long brandId;

    private Long sizeId;

    //条形码，非空
    private String barcode;

    //名称，非空
    private String name;

    //款式
    private String style;

    //售价
    private BigDecimal price;

    //描述
    private String script;

    private Date createTime;

    //状态,"0"为下架，"1"为上架，"2"为删除废弃
    private Byte state;

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
     * 获取款式id，参照style表
     *
     * @return categoryId - 款式id，参照style表
     */
    public Long getCategoryId() {
        return categoryId;
    }

    /**
     * 设置款式id，参照style表
     *
     * @param categoryId 款式id，参照style表
     */
    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    /**
     * 获取颜色id，参照color表
     *
     * @return colorId - 颜色id，参照color表
     */
    public Long getColorId() {
        return colorId;
    }

    /**
     * 设置颜色id，参照color表
     *
     * @param colorId 颜色id，参照color表
     */
    public void setColorId(Long colorId) {
        this.colorId = colorId;
    }

    /**
     * @return brandId
     */
    public Long getBrandId() {
        return brandId;
    }

    /**
     * @param brandId
     */
    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    /**
     * @return sizeId
     */
    public Long getSizeId() {
        return sizeId;
    }

    /**
     * @param sizeId
     */
    public void setSizeId(Long sizeId) {
        this.sizeId = sizeId;
    }

    /**
     * 获取条形码，非空
     *
     * @return barcode - 条形码，非空
     */
    public String getBarcode() {
        return barcode;
    }

    /**
     * 设置条形码，非空
     *
     * @param barcode 条形码，非空
     */
    public void setBarcode(String barcode) {
        this.barcode = barcode == null ? null : barcode.trim();
    }

    /**
     * 获取名称，非空
     *
     * @return name - 名称，非空
     */
    public String getName() {
        return name;
    }

    /**
     * 设置名称，非空
     *
     * @param name 名称，非空
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * 获取款式
     *
     * @return style - 款式
     */
    public String getStyle() {
        return style;
    }

    /**
     * 设置款式
     *
     * @param style 款式
     */
    public void setStyle(String style) {
        this.style = style == null ? null : style.trim();
    }

    /**
     * 获取售价
     *
     * @return price - 售价
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     * 设置售价
     *
     * @param price 售价
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
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

    /**
     * 获取状态,"0"为下架，"1"为上架，"2"为删除废弃
     *
     * @return state - 状态,"0"为下架，"1"为上架，"2"为删除废弃
     */
    public Byte getState() {
        return state;
    }

    /**
     * 设置状态,"0"为下架，"1"为上架，"2"为删除废弃
     *
     * @param state 状态,"0"为下架，"1"为上架，"2"为删除废弃
     */
    public void setState(Byte state) {
        this.state = state;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", categoryId=").append(categoryId);
        sb.append(", colorId=").append(colorId);
        sb.append(", brandId=").append(brandId);
        sb.append(", sizeId=").append(sizeId);
        sb.append(", barcode=").append(barcode);
        sb.append(", name=").append(name);
        sb.append(", style=").append(style);
        sb.append(", price=").append(price);
        sb.append(", script=").append(script);
        sb.append(", createTime=").append(createTime);
        sb.append(", state=").append(state);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}