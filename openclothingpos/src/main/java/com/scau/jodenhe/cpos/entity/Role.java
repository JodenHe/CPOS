package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;

public class Role implements Serializable {
    private Long id;

    private String rolename;

    private String rolesign;

    private String description;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename == null ? null : rolename.trim();
    }

    public String getRolesign() {
        return rolesign;
    }

    public void setRolesign(String rolesign) {
        this.rolesign = rolesign == null ? null : rolesign.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}