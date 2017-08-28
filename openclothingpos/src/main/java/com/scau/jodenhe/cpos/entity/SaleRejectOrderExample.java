package com.scau.jodenhe.cpos.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SaleRejectOrderExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SaleRejectOrderExample() {
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

        public Criteria andRejectOrderNoIsNull() {
            addCriterion("rejectOrderNo is null");
            return (Criteria) this;
        }

        public Criteria andRejectOrderNoIsNotNull() {
            addCriterion("rejectOrderNo is not null");
            return (Criteria) this;
        }

        public Criteria andRejectOrderNoEqualTo(String value) {
            addCriterion("rejectOrderNo =", value, "rejectOrderNo");
            return (Criteria) this;
        }

        public Criteria andRejectOrderNoNotEqualTo(String value) {
            addCriterion("rejectOrderNo <>", value, "rejectOrderNo");
            return (Criteria) this;
        }

        public Criteria andRejectOrderNoGreaterThan(String value) {
            addCriterion("rejectOrderNo >", value, "rejectOrderNo");
            return (Criteria) this;
        }

        public Criteria andRejectOrderNoGreaterThanOrEqualTo(String value) {
            addCriterion("rejectOrderNo >=", value, "rejectOrderNo");
            return (Criteria) this;
        }

        public Criteria andRejectOrderNoLessThan(String value) {
            addCriterion("rejectOrderNo <", value, "rejectOrderNo");
            return (Criteria) this;
        }

        public Criteria andRejectOrderNoLessThanOrEqualTo(String value) {
            addCriterion("rejectOrderNo <=", value, "rejectOrderNo");
            return (Criteria) this;
        }

        public Criteria andRejectOrderNoLike(String value) {
            addCriterion("rejectOrderNo like", value, "rejectOrderNo");
            return (Criteria) this;
        }

        public Criteria andRejectOrderNoNotLike(String value) {
            addCriterion("rejectOrderNo not like", value, "rejectOrderNo");
            return (Criteria) this;
        }

        public Criteria andRejectOrderNoIn(List<String> values) {
            addCriterion("rejectOrderNo in", values, "rejectOrderNo");
            return (Criteria) this;
        }

        public Criteria andRejectOrderNoNotIn(List<String> values) {
            addCriterion("rejectOrderNo not in", values, "rejectOrderNo");
            return (Criteria) this;
        }

        public Criteria andRejectOrderNoBetween(String value1, String value2) {
            addCriterion("rejectOrderNo between", value1, value2, "rejectOrderNo");
            return (Criteria) this;
        }

        public Criteria andRejectOrderNoNotBetween(String value1, String value2) {
            addCriterion("rejectOrderNo not between", value1, value2, "rejectOrderNo");
            return (Criteria) this;
        }

        public Criteria andRejectDateTimeIsNull() {
            addCriterion("rejectDateTime is null");
            return (Criteria) this;
        }

        public Criteria andRejectDateTimeIsNotNull() {
            addCriterion("rejectDateTime is not null");
            return (Criteria) this;
        }

        public Criteria andRejectDateTimeEqualTo(Date value) {
            addCriterion("rejectDateTime =", value, "rejectDateTime");
            return (Criteria) this;
        }

        public Criteria andRejectDateTimeNotEqualTo(Date value) {
            addCriterion("rejectDateTime <>", value, "rejectDateTime");
            return (Criteria) this;
        }

        public Criteria andRejectDateTimeGreaterThan(Date value) {
            addCriterion("rejectDateTime >", value, "rejectDateTime");
            return (Criteria) this;
        }

        public Criteria andRejectDateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("rejectDateTime >=", value, "rejectDateTime");
            return (Criteria) this;
        }

        public Criteria andRejectDateTimeLessThan(Date value) {
            addCriterion("rejectDateTime <", value, "rejectDateTime");
            return (Criteria) this;
        }

        public Criteria andRejectDateTimeLessThanOrEqualTo(Date value) {
            addCriterion("rejectDateTime <=", value, "rejectDateTime");
            return (Criteria) this;
        }

        public Criteria andRejectDateTimeIn(List<Date> values) {
            addCriterion("rejectDateTime in", values, "rejectDateTime");
            return (Criteria) this;
        }

        public Criteria andRejectDateTimeNotIn(List<Date> values) {
            addCriterion("rejectDateTime not in", values, "rejectDateTime");
            return (Criteria) this;
        }

        public Criteria andRejectDateTimeBetween(Date value1, Date value2) {
            addCriterion("rejectDateTime between", value1, value2, "rejectDateTime");
            return (Criteria) this;
        }

        public Criteria andRejectDateTimeNotBetween(Date value1, Date value2) {
            addCriterion("rejectDateTime not between", value1, value2, "rejectDateTime");
            return (Criteria) this;
        }

        public Criteria andTotalIsNull() {
            addCriterion("total is null");
            return (Criteria) this;
        }

        public Criteria andTotalIsNotNull() {
            addCriterion("total is not null");
            return (Criteria) this;
        }

        public Criteria andTotalEqualTo(BigDecimal value) {
            addCriterion("total =", value, "total");
            return (Criteria) this;
        }

        public Criteria andTotalNotEqualTo(BigDecimal value) {
            addCriterion("total <>", value, "total");
            return (Criteria) this;
        }

        public Criteria andTotalGreaterThan(BigDecimal value) {
            addCriterion("total >", value, "total");
            return (Criteria) this;
        }

        public Criteria andTotalGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("total >=", value, "total");
            return (Criteria) this;
        }

        public Criteria andTotalLessThan(BigDecimal value) {
            addCriterion("total <", value, "total");
            return (Criteria) this;
        }

        public Criteria andTotalLessThanOrEqualTo(BigDecimal value) {
            addCriterion("total <=", value, "total");
            return (Criteria) this;
        }

        public Criteria andTotalIn(List<BigDecimal> values) {
            addCriterion("total in", values, "total");
            return (Criteria) this;
        }

        public Criteria andTotalNotIn(List<BigDecimal> values) {
            addCriterion("total not in", values, "total");
            return (Criteria) this;
        }

        public Criteria andTotalBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("total between", value1, value2, "total");
            return (Criteria) this;
        }

        public Criteria andTotalNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("total not between", value1, value2, "total");
            return (Criteria) this;
        }

        public Criteria andOperatorIdIsNull() {
            addCriterion("operatorId is null");
            return (Criteria) this;
        }

        public Criteria andOperatorIdIsNotNull() {
            addCriterion("operatorId is not null");
            return (Criteria) this;
        }

        public Criteria andOperatorIdEqualTo(Long value) {
            addCriterion("operatorId =", value, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdNotEqualTo(Long value) {
            addCriterion("operatorId <>", value, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdGreaterThan(Long value) {
            addCriterion("operatorId >", value, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdGreaterThanOrEqualTo(Long value) {
            addCriterion("operatorId >=", value, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdLessThan(Long value) {
            addCriterion("operatorId <", value, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdLessThanOrEqualTo(Long value) {
            addCriterion("operatorId <=", value, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdIn(List<Long> values) {
            addCriterion("operatorId in", values, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdNotIn(List<Long> values) {
            addCriterion("operatorId not in", values, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdBetween(Long value1, Long value2) {
            addCriterion("operatorId between", value1, value2, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdNotBetween(Long value1, Long value2) {
            addCriterion("operatorId not between", value1, value2, "operatorId");
            return (Criteria) this;
        }

        public Criteria andShopIdIsNull() {
            addCriterion("shopId is null");
            return (Criteria) this;
        }

        public Criteria andShopIdIsNotNull() {
            addCriterion("shopId is not null");
            return (Criteria) this;
        }

        public Criteria andShopIdEqualTo(Long value) {
            addCriterion("shopId =", value, "shopId");
            return (Criteria) this;
        }

        public Criteria andShopIdNotEqualTo(Long value) {
            addCriterion("shopId <>", value, "shopId");
            return (Criteria) this;
        }

        public Criteria andShopIdGreaterThan(Long value) {
            addCriterion("shopId >", value, "shopId");
            return (Criteria) this;
        }

        public Criteria andShopIdGreaterThanOrEqualTo(Long value) {
            addCriterion("shopId >=", value, "shopId");
            return (Criteria) this;
        }

        public Criteria andShopIdLessThan(Long value) {
            addCriterion("shopId <", value, "shopId");
            return (Criteria) this;
        }

        public Criteria andShopIdLessThanOrEqualTo(Long value) {
            addCriterion("shopId <=", value, "shopId");
            return (Criteria) this;
        }

        public Criteria andShopIdIn(List<Long> values) {
            addCriterion("shopId in", values, "shopId");
            return (Criteria) this;
        }

        public Criteria andShopIdNotIn(List<Long> values) {
            addCriterion("shopId not in", values, "shopId");
            return (Criteria) this;
        }

        public Criteria andShopIdBetween(Long value1, Long value2) {
            addCriterion("shopId between", value1, value2, "shopId");
            return (Criteria) this;
        }

        public Criteria andShopIdNotBetween(Long value1, Long value2) {
            addCriterion("shopId not between", value1, value2, "shopId");
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