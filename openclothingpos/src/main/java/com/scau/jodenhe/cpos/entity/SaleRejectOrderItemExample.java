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

        public Criteria andRejectNoIsNull() {
            addCriterion("rejectNo is null");
            return (Criteria) this;
        }

        public Criteria andRejectNoIsNotNull() {
            addCriterion("rejectNo is not null");
            return (Criteria) this;
        }

        public Criteria andRejectNoEqualTo(String value) {
            addCriterion("rejectNo =", value, "rejectNo");
            return (Criteria) this;
        }

        public Criteria andRejectNoNotEqualTo(String value) {
            addCriterion("rejectNo <>", value, "rejectNo");
            return (Criteria) this;
        }

        public Criteria andRejectNoGreaterThan(String value) {
            addCriterion("rejectNo >", value, "rejectNo");
            return (Criteria) this;
        }

        public Criteria andRejectNoGreaterThanOrEqualTo(String value) {
            addCriterion("rejectNo >=", value, "rejectNo");
            return (Criteria) this;
        }

        public Criteria andRejectNoLessThan(String value) {
            addCriterion("rejectNo <", value, "rejectNo");
            return (Criteria) this;
        }

        public Criteria andRejectNoLessThanOrEqualTo(String value) {
            addCriterion("rejectNo <=", value, "rejectNo");
            return (Criteria) this;
        }

        public Criteria andRejectNoLike(String value) {
            addCriterion("rejectNo like", value, "rejectNo");
            return (Criteria) this;
        }

        public Criteria andRejectNoNotLike(String value) {
            addCriterion("rejectNo not like", value, "rejectNo");
            return (Criteria) this;
        }

        public Criteria andRejectNoIn(List<String> values) {
            addCriterion("rejectNo in", values, "rejectNo");
            return (Criteria) this;
        }

        public Criteria andRejectNoNotIn(List<String> values) {
            addCriterion("rejectNo not in", values, "rejectNo");
            return (Criteria) this;
        }

        public Criteria andRejectNoBetween(String value1, String value2) {
            addCriterion("rejectNo between", value1, value2, "rejectNo");
            return (Criteria) this;
        }

        public Criteria andRejectNoNotBetween(String value1, String value2) {
            addCriterion("rejectNo not between", value1, value2, "rejectNo");
            return (Criteria) this;
        }

        public Criteria andItemIdIsNull() {
            addCriterion("itemId is null");
            return (Criteria) this;
        }

        public Criteria andItemIdIsNotNull() {
            addCriterion("itemId is not null");
            return (Criteria) this;
        }

        public Criteria andItemIdEqualTo(String value) {
            addCriterion("itemId =", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdNotEqualTo(String value) {
            addCriterion("itemId <>", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdGreaterThan(String value) {
            addCriterion("itemId >", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdGreaterThanOrEqualTo(String value) {
            addCriterion("itemId >=", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdLessThan(String value) {
            addCriterion("itemId <", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdLessThanOrEqualTo(String value) {
            addCriterion("itemId <=", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdLike(String value) {
            addCriterion("itemId like", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdNotLike(String value) {
            addCriterion("itemId not like", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdIn(List<String> values) {
            addCriterion("itemId in", values, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdNotIn(List<String> values) {
            addCriterion("itemId not in", values, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdBetween(String value1, String value2) {
            addCriterion("itemId between", value1, value2, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdNotBetween(String value1, String value2) {
            addCriterion("itemId not between", value1, value2, "itemId");
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

        public Criteria andRejectPriceIsNull() {
            addCriterion("rejectPrice is null");
            return (Criteria) this;
        }

        public Criteria andRejectPriceIsNotNull() {
            addCriterion("rejectPrice is not null");
            return (Criteria) this;
        }

        public Criteria andRejectPriceEqualTo(BigDecimal value) {
            addCriterion("rejectPrice =", value, "rejectPrice");
            return (Criteria) this;
        }

        public Criteria andRejectPriceNotEqualTo(BigDecimal value) {
            addCriterion("rejectPrice <>", value, "rejectPrice");
            return (Criteria) this;
        }

        public Criteria andRejectPriceGreaterThan(BigDecimal value) {
            addCriterion("rejectPrice >", value, "rejectPrice");
            return (Criteria) this;
        }

        public Criteria andRejectPriceGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("rejectPrice >=", value, "rejectPrice");
            return (Criteria) this;
        }

        public Criteria andRejectPriceLessThan(BigDecimal value) {
            addCriterion("rejectPrice <", value, "rejectPrice");
            return (Criteria) this;
        }

        public Criteria andRejectPriceLessThanOrEqualTo(BigDecimal value) {
            addCriterion("rejectPrice <=", value, "rejectPrice");
            return (Criteria) this;
        }

        public Criteria andRejectPriceIn(List<BigDecimal> values) {
            addCriterion("rejectPrice in", values, "rejectPrice");
            return (Criteria) this;
        }

        public Criteria andRejectPriceNotIn(List<BigDecimal> values) {
            addCriterion("rejectPrice not in", values, "rejectPrice");
            return (Criteria) this;
        }

        public Criteria andRejectPriceBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("rejectPrice between", value1, value2, "rejectPrice");
            return (Criteria) this;
        }

        public Criteria andRejectPriceNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("rejectPrice not between", value1, value2, "rejectPrice");
            return (Criteria) this;
        }

        public Criteria andSubTotalIsNull() {
            addCriterion("subTotal is null");
            return (Criteria) this;
        }

        public Criteria andSubTotalIsNotNull() {
            addCriterion("subTotal is not null");
            return (Criteria) this;
        }

        public Criteria andSubTotalEqualTo(BigDecimal value) {
            addCriterion("subTotal =", value, "subTotal");
            return (Criteria) this;
        }

        public Criteria andSubTotalNotEqualTo(BigDecimal value) {
            addCriterion("subTotal <>", value, "subTotal");
            return (Criteria) this;
        }

        public Criteria andSubTotalGreaterThan(BigDecimal value) {
            addCriterion("subTotal >", value, "subTotal");
            return (Criteria) this;
        }

        public Criteria andSubTotalGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("subTotal >=", value, "subTotal");
            return (Criteria) this;
        }

        public Criteria andSubTotalLessThan(BigDecimal value) {
            addCriterion("subTotal <", value, "subTotal");
            return (Criteria) this;
        }

        public Criteria andSubTotalLessThanOrEqualTo(BigDecimal value) {
            addCriterion("subTotal <=", value, "subTotal");
            return (Criteria) this;
        }

        public Criteria andSubTotalIn(List<BigDecimal> values) {
            addCriterion("subTotal in", values, "subTotal");
            return (Criteria) this;
        }

        public Criteria andSubTotalNotIn(List<BigDecimal> values) {
            addCriterion("subTotal not in", values, "subTotal");
            return (Criteria) this;
        }

        public Criteria andSubTotalBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("subTotal between", value1, value2, "subTotal");
            return (Criteria) this;
        }

        public Criteria andSubTotalNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("subTotal not between", value1, value2, "subTotal");
            return (Criteria) this;
        }

        public Criteria andRejectReasonIsNull() {
            addCriterion("rejectReason is null");
            return (Criteria) this;
        }

        public Criteria andRejectReasonIsNotNull() {
            addCriterion("rejectReason is not null");
            return (Criteria) this;
        }

        public Criteria andRejectReasonEqualTo(String value) {
            addCriterion("rejectReason =", value, "rejectReason");
            return (Criteria) this;
        }

        public Criteria andRejectReasonNotEqualTo(String value) {
            addCriterion("rejectReason <>", value, "rejectReason");
            return (Criteria) this;
        }

        public Criteria andRejectReasonGreaterThan(String value) {
            addCriterion("rejectReason >", value, "rejectReason");
            return (Criteria) this;
        }

        public Criteria andRejectReasonGreaterThanOrEqualTo(String value) {
            addCriterion("rejectReason >=", value, "rejectReason");
            return (Criteria) this;
        }

        public Criteria andRejectReasonLessThan(String value) {
            addCriterion("rejectReason <", value, "rejectReason");
            return (Criteria) this;
        }

        public Criteria andRejectReasonLessThanOrEqualTo(String value) {
            addCriterion("rejectReason <=", value, "rejectReason");
            return (Criteria) this;
        }

        public Criteria andRejectReasonLike(String value) {
            addCriterion("rejectReason like", value, "rejectReason");
            return (Criteria) this;
        }

        public Criteria andRejectReasonNotLike(String value) {
            addCriterion("rejectReason not like", value, "rejectReason");
            return (Criteria) this;
        }

        public Criteria andRejectReasonIn(List<String> values) {
            addCriterion("rejectReason in", values, "rejectReason");
            return (Criteria) this;
        }

        public Criteria andRejectReasonNotIn(List<String> values) {
            addCriterion("rejectReason not in", values, "rejectReason");
            return (Criteria) this;
        }

        public Criteria andRejectReasonBetween(String value1, String value2) {
            addCriterion("rejectReason between", value1, value2, "rejectReason");
            return (Criteria) this;
        }

        public Criteria andRejectReasonNotBetween(String value1, String value2) {
            addCriterion("rejectReason not between", value1, value2, "rejectReason");
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