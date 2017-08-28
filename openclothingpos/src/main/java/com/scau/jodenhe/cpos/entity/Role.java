package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;

public class Role implements Serializable {
    //角色id
    private Long id;

    //角色名
    private String roleName;

    //角色标识,程序中判断使用,如"admin"
    private String roleSign;

    //角色描述,UI界面显示使用
    private String description;

    private static final long serialVersionUID = 1L;

    /**
     * 获取角色id
     *
     * @return id - 角色id
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置角色id
     *
     * @param id 角色id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取角色名
     *
     * @return roleName - 角色名
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * 设置角色名
     *
     * @param roleName 角色名
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    /**
     * 获取角色标识,程序中判断使用,如"admin"
     *
     * @return roleSign - 角色标识,程序中判断使用,如"admin"
     */
    public String getRoleSign() {
        return roleSign;
    }

    /**
     * 设置角色标识,程序中判断使用,如"admin"
     *
     * @param roleSign 角色标识,程序中判断使用,如"admin"
     */
    public void setRoleSign(String roleSign) {
        this.roleSign = roleSign == null ? null : roleSign.trim();
    }

    /**
     * 获取角色描述,UI界面显示使用
     *
     * @return description - 角色描述,UI界面显示使用
     */
    public String getDescription() {
        return description;
    }

    /**
     * 设置角色描述,UI界面显示使用
     *
     * @param description 角色描述,UI界面显示使用
     */
    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", roleName=").append(roleName);
        sb.append(", roleSign=").append(roleSign);
        sb.append(", description=").append(description);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}