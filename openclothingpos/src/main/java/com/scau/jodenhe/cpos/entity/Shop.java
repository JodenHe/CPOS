package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;
import java.util.Date;

public class Shop implements Serializable {
    //id标识
    private Long id;

    //店铺名称，非空
    private String name;

    //负责人，非空
    private String manager;

    //负责人，非空
    private String telephone;

    //住址
    private String address;

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
     * 获取店铺名称，非空
     *
     * @return name - 店铺名称，非空
     */
    public String getName() {
        return name;
    }

    /**
     * 设置店铺名称，非空
     *
     * @param name 店铺名称，非空
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * 获取负责人，非空
     *
     * @return manager - 负责人，非空
     */
    public String getManager() {
        return manager;
    }

    /**
     * 设置负责人，非空
     *
     * @param manager 负责人，非空
     */
    public void setManager(String manager) {
        this.manager = manager == null ? null : manager.trim();
    }

    /**
     * 获取负责人，非空
     *
     * @return telephone - 负责人，非空
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * 设置负责人，非空
     *
     * @param telephone 负责人，非空
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    /**
     * 获取住址
     *
     * @return address - 住址
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置住址
     *
     * @param address 住址
     */
    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
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
        sb.append(", name=").append(name);
        sb.append(", manager=").append(manager);
        sb.append(", telephone=").append(telephone);
        sb.append(", address=").append(address);
        sb.append(", script=").append(script);
        sb.append(", createTime=").append(createTime);
        sb.append(", state=").append(state);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}