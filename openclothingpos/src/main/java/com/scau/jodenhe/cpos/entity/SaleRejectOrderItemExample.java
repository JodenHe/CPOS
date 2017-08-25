package com.scau.jodenhe.cpos.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class SaleRejectOrderItemExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SaleRejectOrderItemExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andRejectnoIsNull() {
            addCriterion("rejectNo is null");
            return (Criteria) this;
        }

        public Criteria andRejectnoIsNotNull() {
            addCriterion("rejectNo is not null");
            return (Criteria) this;
        }

        public Criteria andRejectnoEqualTo(String value) {
            addCriterion("rejectNo =", value, "rejectno");
            return (Criteria) this;
        }

        public Criteria andRejectnoNotEqualTo(String value) {
            addCriterion("rejectNo <>", value, "rejectno");
            return (Criteria) this;
        }

        public Criteria andRejectnoGreaterThan(String value) {
            addCriterion("rejectNo >", value, "rejectno");
            return (Criteria) this;
        }

        public Criteria andRejectnoGreaterThanOrEqualTo(String value) {
            addCriterion("rejectNo >=", value, "rejectno");
            return (Criteria) this;
        }

        public Criteria andRejectnoLessThan(String value) {
            addCriterion("rejectNo <", value, "rejectno");
            return (Criteria) this;
        }

        public Criteria andRejectnoLessThanOrEqualTo(String value) {
            addCriterion("rejectNo <=", value, "rejectno");
            return (Criteria) this;
        }

        public Criteria andRejectnoLike(String value) {
            addCriterion("rejectNo like", value, "rejectno");
            return (Criteria) this;
        }

        public Criteria andRejectnoNotLike(String value) {
            addCriterion("rejectNo not like", value, "rejectno");
            return (Criteria) this;
        }

        public Criteria andRejectnoIn(List<String> values) {
            addCriterion("rejectNo in", values, "rejectno");
            return (Criteria) this;
        }

        public Criteria andRejectnoNotIn(List<String> values) {
            addCriterion("rejectNo not in", values, "rejectno");
            return (Criteria) this;
        }

        public Criteria andRejectnoBetween(String value1, String value2) {
            addCriterion("rejectNo between", value1, value2, "rejectno");
            return (Criteria) this;
        }

        public Criteria andRejectnoNotBetween(String value1, String value2) {
            addCriterion("rejectNo not between", value1, value2, "rejectno");
            return (Criteria) this;
        }

        public Criteria andItemidIsNull() {
            addCriterion("itemId is null");
            return (Criteria) this;
        }

        public Criteria andItemidIsNotNull() {
            addCriterion("itemId is not null");
            return (Criteria) this;
        }

        public Criteria andItemidEqualTo(String value) {
            addCriterion("itemId =", value, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidNotEqualTo(String value) {
            addCriterion("itemId <>", value, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidGreaterThan(String value) {
            addCriterion("itemId >", value, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidGreaterThanOrEqualTo(String value) {
            addCriterion("itemId >=", value, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidLessThan(String value) {
            addCriterion("itemId <", value, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidLessThanOrEqualTo(String value) {
            addCriterion("itemId <=", value, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidLike(String value) {
            addCriterion("itemId like", value, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidNotLike(String value) {
            addCriterion("itemId not like", value, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidIn(List<String> values) {
            addCriterion("itemId in", values, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidNotIn(List<String> values) {
            addCriterion("itemId not in", values, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidBetween(String value1, String value2) {
            addCriterion("itemId between", value1, value2, "itemid");
            return (Criteria) this;
        }

        public Criteria andItemidNotBetween(String value1, String value2) {
            addCriterion("itemId not between", value1, value2, "itemid");
            return (Criteria) this;
        }

        public Criteria andQuantityIsNull() {
            addCriterion("quantity is null");
            return (Criteria) this;
        }

        public Criteria andQuantityIsNotNull() {
            addCriterion("quantity is not null");
            return (Criteria) this;
        }

        public Criteria andQuantityEqualTo(Integer value) {
            addCriterion("quantity =", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityNotEqualTo(Integer value) {
            addCriterion("quantity <>", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityGreaterThan(Integer value) {
            addCriterion("quantity >", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityGreaterThanOrEqualTo(Integer value) {
            addCriterion("quantity >=", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityLessThan(Integer value) {
            addCriterion("quantity <", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityLessThanOrEqualTo(Integer value) {
            addCriterion("quantity <=", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityIn(List<Integer> values) {
            addCriterion("quantity in", values, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityNotIn(List<Integer> values) {
            addCriterion("quantity not in", values, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityBetween(Integer value1, Integer value2) {
            addCriterion("quantity between", value1, value2, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityNotBetween(Integer value1, Integer value2) {
            addCriterion("quantity not between", value1, value2, "quantity");
            return (Criteria) this;
        }

        public Criteria andRejectpriceIsNull() {
            addCriterion("rejectPrice is null");
            return (Criteria) this;
        }

        public Criteria andRejectpriceIsNotNull() {
            addCriterion("rejectPrice is not null");
            return (Criteria) this;
        }

        public Criteria andRejectpriceEqualTo(BigDecimal value) {
            addCriterion("rejectPrice =", value, "rejectprice");
            return (Criteria) this;
        }

        public Criteria andRejectpriceNotEqualTo(BigDecimal value) {
            addCriterion("rejectPrice <>", value, "rejectprice");
            return (Criteria) this;
        }

        public Criteria andRejectpriceGreaterThan(BigDecimal value) {
            addCriterion("rejectPrice >", value, "rejectprice");
            return (Criteria) this;
        }

        public Criteria andRejectpriceGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("rejectPrice >=", value, "rejectprice");
            return (Criteria) this;
        }

        public Criteria andRejectpriceLessThan(BigDecimal value) {
            addCriterion("rejectPrice <", value, "rejectprice");
            return (Criteria) this;
        }

        public Criteria andRejectpriceLessThanOrEqualTo(BigDecimal value) {
            addCriterion("rejectPrice <=", value, "rejectprice");
            return (Criteria) this;
        }

        public Criteria andRejectpriceIn(List<BigDecimal> values) {
            addCriterion("rejectPrice in", values, "rejectprice");
            return (Criteria) this;
        }

        public Criteria andRejectpriceNotIn(List<BigDecimal> values) {
            addCriterion("rejectPrice not in", values, "rejectprice");
            return (Criteria) this;
        }

        public Criteria andRejectpriceBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("rejectPrice between", value1, value2, "rejectprice");
            return (Criteria) this;
        }

        public Criteria andRejectpriceNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("rejectPrice not between", value1, value2, "rejectprice");
            return (Criteria) this;
        }

        public Criteria andSubtotalIsNull() {
            addCriterion("subTotal is null");
            return (Criteria) this;
        }

        public Criteria andSubtotalIsNotNull() {
            addCriterion("subTotal is not null");
            return (Criteria) this;
        }

        public Criteria andSubtotalEqualTo(BigDecimal value) {
            addCriterion("subTotal =", value, "subtotal");
            return (Criteria) this;
        }

        public Criteria andSubtotalNotEqualTo(BigDecimal value) {
            addCriterion("subTotal <>", value, "subtotal");
            return (Criteria) this;
        }

        public Criteria andSubtotalGreaterThan(BigDecimal value) {
            addCriterion("subTotal >", value, "subtotal");
            return (Criteria) this;
        }

        public Criteria andSubtotalGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("subTotal >=", value, "subtotal");
            return (Criteria) this;
        }

        public Criteria andSubtotalLessThan(BigDecimal value) {
            addCriterion("subTotal <", value, "subtotal");
            return (Criteria) this;
        }

        public Criteria andSubtotalLessThanOrEqualTo(BigDecimal value) {
            addCriterion("subTotal <=", value, "subtotal");
            return (Criteria) this;
        }

        public Criteria andSubtotalIn(List<BigDecimal> values) {
            addCriterion("subTotal in", values, "subtotal");
            return (Criteria) this;
        }

        public Criteria andSubtotalNotIn(List<BigDecimal> values) {
            addCriterion("subTotal not in", values, "subtotal");
            return (Criteria) this;
        }

        public Criteria andSubtotalBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("subTotal between", value1, value2, "subtotal");
            return (Criteria) this;
        }

        public Criteria andSubtotalNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("subTotal not between", value1, value2, "subtotal");
            return (Criteria) this;
        }

        public Criteria andRejectreasonIsNull() {
            addCriterion("rejectReason is null");
            return (Criteria) this;
        }

        public Criteria andRejectreasonIsNotNull() {
            addCriterion("rejectReason is not null");
            return (Criteria) this;
        }

        public Criteria andRejectreasonEqualTo(String value) {
            addCriterion("rejectReason =", value, "rejectreason");
            return (Criteria) this;
        }

        public Criteria andRejectreasonNotEqualTo(String value) {
            addCriterion("rejectReason <>", value, "rejectreason");
            return (Criteria) this;
        }

        public Criteria andRejectreasonGreaterThan(String value) {
            addCriterion("rejectReason >", value, "rejectreason");
            return (Criteria) this;
        }

        public Criteria andRejectreasonGreaterThanOrEqualTo(String value) {
            addCriterion("rejectReason >=", value, "rejectreason");
            return (Criteria) this;
        }

        public Criteria andRejectreasonLessThan(String value) {
            addCriterion("rejectReason <", value, "rejectreason");
            return (Criteria) this;
        }

        public Criteria andRejectreasonLessThanOrEqualTo(String value) {
            addCriterion("rejectReason <=", value, "rejectreason");
            return (Criteria) this;
        }

        public Criteria andRejectreasonLike(String value) {
            addCriterion("rejectReason like", value, "rejectreason");
            return (Criteria) this;
        }

        public Criteria andRejectreasonNotLike(String value) {
            addCriterion("rejectReason not like", value, "rejectreason");
            return (Criteria) this;
        }

        public Criteria andRejectreasonIn(List<String> values) {
            addCriterion("rejectReason in", values, "rejectreason");
            return (Criteria) this;
        }

        public Criteria andRejectreasonNotIn(List<String> values) {
            addCriterion("rejectReason not in", values, "rejectreason");
            return (Criteria) this;
        }

        public Criteria andRejectreasonBetween(String value1, String value2) {
            addCriterion("rejectReason between", value1, value2, "rejectreason");
            return (Criteria) this;
        }

        public Criteria andRejectreasonNotBetween(String value1, String value2) {
            addCriterion("rejectReason not between", value1, value2, "rejectreason");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}