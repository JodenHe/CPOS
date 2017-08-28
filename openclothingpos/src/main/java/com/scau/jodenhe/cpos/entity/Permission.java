package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;

public class Permission implements Serializable {
    //权限id
    private Long id;

    private Long pId;

    //权限名
    private String name;

    //权限标识,程序中判断使用,如"user:create"
    private String permissionSign;

    //权限描述,UI界面显示使用
    private String description;

    private static final long serialVersionUID = 1L;

    /**
     * 获取权限id
     *
     * @return id - 权限id
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置权限id
     *
     * @param id 权限id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return pId
     */
    public Long getpId() {
        return pId;
    }

    /**
     * @param pId
     */
    public void setpId(Long pId) {
        this.pId = pId;
    }

    /**
     * 获取权限名
     *
     * @return name - 权限名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置权限名
     *
     * @param name 权限名
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * 获取权限标识,程序中判断使用,如"user:create"
     *
     * @return permissionSign - 权限标识,程序中判断使用,如"user:create"
     */
    public String getPermissionSign() {
        return permissionSign;
    }

    /**
     * 设置权限标识,程序中判断使用,如"user:create"
     *
     * @param permissionSign 权限标识,程序中判断使用,如"user:create"
     */
    public void setPermissionSign(String permissionSign) {
        this.permissionSign = permissionSign == null ? null : permissionSign.trim();
    }

    /**
     * 获取权限描述,UI界面显示使用
     *
     * @return description - 权限描述,UI界面显示使用
     */
    public String getDescription() {
        return description;
    }

    /**
     * 设置权限描述,UI界面显示使用
     *
     * @param description 权限描述,UI界面显示使用
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
        sb.append(", pId=").append(pId);
        sb.append(", name=").append(name);
        sb.append(", permissionSign=").append(permissionSign);
        sb.append(", description=").append(description);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}