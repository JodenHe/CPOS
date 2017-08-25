package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;

public class MemberKey implements Serializable {
    private Long id;

    private String telephone;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }
}