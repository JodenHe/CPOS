package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;

public class MemberKey implements Serializable {
    //id标识
    private Long id;

    //手机
    private String telephone;

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
     * 获取手机
     *
     * @return telephone - 手机
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * 设置手机
     *
     * @param telephone 手机
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", telephone=").append(telephone);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}