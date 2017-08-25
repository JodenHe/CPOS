package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;

public class Permission implements Serializable {
    private Long id;

    private Long pid;

    private String name;

    private String permissionsign;

    private String description;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPermissionsign() {
        return permissionsign;
    }

    public void setPermissionsign(String permissionsign) {
        this.permissionsign = permissionsign == null ? null : permissionsign.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}