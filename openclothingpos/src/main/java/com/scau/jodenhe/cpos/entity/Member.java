package com.scau.jodenhe.cpos.entity;

import java.io.Serializable;
import java.util.Date;

public class Member implements Serializable {
    //id标识
    private Long id;

    //手机
    private String telephone;

    //店铺id，参照shop表
    private Long shopId;

    //操作员id，参照user表
    private Long operatorId;

    //会员编号，0000默认为散客
    private String customerNo;

    //姓名
    private String name;

    //性别
    private String sex;

    //email
    private String email;

    //住址
    private String address;

    //生日
    private Date birthday;

    //密码
    private String password;

    //等级
    private String grade;

    //描述
    private String script;

    private Date createTime;

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

    /**
     * 获取店铺id，参照shop表
     *
     * @return shopId - 店铺id，参照shop表
     */
    public Long getShopId() {
        return shopId;
    }

    /**
     * 设置店铺id，参照shop表
     *
     * @param shopId 店铺id，参照shop表
     */
    public void setShopId(Long shopId) {
        this.shopId = shopId;
    }

    /**
     * 获取操作员id，参照user表
     *
     * @return operatorId - 操作员id，参照user表
     */
    public Long getOperatorId() {
        return operatorId;
    }

    /**
     * 设置操作员id，参照user表
     *
     * @param operatorId 操作员id，参照user表
     */
    public void setOperatorId(Long operatorId) {
        this.operatorId = operatorId;
    }

    /**
     * 获取会员编号，0000默认为散客
     *
     * @return customerNo - 会员编号，0000默认为散客
     */
    public String getCustomerNo() {
        return customerNo;
    }

    /**
     * 设置会员编号，0000默认为散客
     *
     * @param customerNo 会员编号，0000默认为散客
     */
    public void setCustomerNo(String customerNo) {
        this.customerNo = customerNo == null ? null : customerNo.trim();
    }

    /**
     * 获取姓名
     *
     * @return name - 姓名
     */
    public String getName() {
        return name;
    }

    /**
     * 设置姓名
     *
     * @param name 姓名
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * 获取性别
     *
     * @return sex - 性别
     */
    public String getSex() {
        return sex;
    }

    /**
     * 设置性别
     *
     * @param sex 性别
     */
    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    /**
     * 获取email
     *
     * @return email - email
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置email
     *
     * @param email email
     */
    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
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
     * 获取生日
     *
     * @return birthday - 生日
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * 设置生日
     *
     * @param birthday 生日
     */
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    /**
     * 获取密码
     *
     * @return password - 密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置密码
     *
     * @param password 密码
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    /**
     * 获取等级
     *
     * @return grade - 等级
     */
    public String getGrade() {
        return grade;
    }

    /**
     * 设置等级
     *
     * @param grade 等级
     */
    public void setGrade(String grade) {
        this.grade = grade == null ? null : grade.trim();
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

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", telephone=").append(telephone);
        sb.append(", shopId=").append(shopId);
        sb.append(", operatorId=").append(operatorId);
        sb.append(", customerNo=").append(customerNo);
        sb.append(", name=").append(name);
        sb.append(", sex=").append(sex);
        sb.append(", email=").append(email);
        sb.append(", address=").append(address);
        sb.append(", birthday=").append(birthday);
        sb.append(", password=").append(password);
        sb.append(", grade=").append(grade);
        sb.append(", script=").append(script);
        sb.append(", createTime=").append(createTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}