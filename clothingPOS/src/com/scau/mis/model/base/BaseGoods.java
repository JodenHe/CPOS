package com.scau.mis.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseGoods<M extends BaseGoods<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Long id) {
		set("id", id);
	}

	public java.lang.Long getId() {
		return get("id");
	}

	public void setStyleId(java.lang.Long styleId) {
		set("styleId", styleId);
	}

	public java.lang.Long getStyleId() {
		return get("styleId");
	}

	public void setColorId(java.lang.Long colorId) {
		set("colorId", colorId);
	}

	public java.lang.Long getColorId() {
		return get("colorId");
	}

	public void setBarcode(java.lang.String barcode) {
		set("barcode", barcode);
	}

	public java.lang.String getBarcode() {
		return get("barcode");
	}

	public void setName(java.lang.String name) {
		set("name", name);
	}

	public java.lang.String getName() {
		return get("name");
	}

	public void setOriginalPrice(java.math.BigDecimal originalPrice) {
		set("originalPrice", originalPrice);
	}

	public java.math.BigDecimal getOriginalPrice() {
		return get("originalPrice");
	}

	public void setPrice(java.math.BigDecimal price) {
		set("price", price);
	}

	public java.math.BigDecimal getPrice() {
		return get("price");
	}

	public void setScript(java.lang.String script) {
		set("script", script);
	}

	public java.lang.String getScript() {
		return get("script");
	}

	public void setCreateTime(java.util.Date createTime) {
		set("createTime", createTime);
	}

	public java.util.Date getCreateTime() {
		return get("createTime");
	}

}