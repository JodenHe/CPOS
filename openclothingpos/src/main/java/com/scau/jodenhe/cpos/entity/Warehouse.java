package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;

public class Warehouse implements Serializable {
    //ID标识
    private Long id;

    //仓库名称
    private String name;

    //仓库负责人
    private String manager;

    //联系电话
    private String telephone;

    //仓库地址
    private String address;

    //描述，可为空
    private String script;

    //店铺id
    private Long shopId;

    private static final long serialVersionUID = 1L;

    /**
     * 获取ID标识
     *
     * @return id - ID标识
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置ID标识
     *
     * @param id ID标识
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取仓库名称
     *
     * @return name - 仓库名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置仓库名称
     *
     * @param name 仓库名称
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * 获取仓库负责人
     *
     * @return manager - 仓库负责人
     */
    public String getManager() {
        return manager;
    }

    /**
     * 设置仓库负责人
     *
     * @param manager 仓库负责人
     */
    public void setManager(String manager) {
        this.manager = manager == null ? null : manager.trim();
    }

    /**
     * 获取联系电话
     *
     * @return telephone - 联系电话
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * 设置联系电话
     *
     * @param telephone 联系电话
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    /**
     * 获取仓库地址
     *
     * @return address - 仓库地址
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置仓库地址
     *
     * @param address 仓库地址
     */
    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    /**
     * 获取描述，可为空
     *
     * @return script - 描述，可为空
     */
    public String getScript() {
        return script;
    }

    /**
     * 设置描述，可为空
     *
     * @param script 描述，可为空
     */
    public void setScript(String script) {
        this.script = script == null ? null : script.trim();
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
        sb.append(", name=").append(name);
        sb.append(", manager=").append(manager);
        sb.append(", telephone=").append(telephone);
        sb.append(", address=").append(address);
        sb.append(", script=").append(script);
        sb.append(", shopId=").append(shopId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}