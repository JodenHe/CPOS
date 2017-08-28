package com.scau.jodenhe.cpos.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PaymentExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public PaymentExample() {
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

        public Criteria andPaymentNoIsNull() {
            addCriterion("paymentNo is null");
            return (Criteria) this;
        }

        public Criteria andPaymentNoIsNotNull() {
            addCriterion("paymentNo is not null");
            return (Criteria) this;
        }

        public Criteria andPaymentNoEqualTo(String value) {
            addCriterion("paymentNo =", value, "paymentNo");
            return (Criteria) this;
        }

        public Criteria andPaymentNoNotEqualTo(String value) {
            addCriterion("paymentNo <>", value, "paymentNo");
            return (Criteria) this;
        }

        public Criteria andPaymentNoGreaterThan(String value) {
            addCriterion("paymentNo >", value, "paymentNo");
            return (Criteria) this;
        }

        public Criteria andPaymentNoGreaterThanOrEqualTo(String value) {
            addCriterion("paymentNo >=", value, "paymentNo");
            return (Criteria) this;
        }

        public Criteria andPaymentNoLessThan(String value) {
            addCriterion("paymentNo <", value, "paymentNo");
            return (Criteria) this;
        }

        public Criteria andPaymentNoLessThanOrEqualTo(String value) {
            addCriterion("paymentNo <=", value, "paymentNo");
            return (Criteria) this;
        }

        public Criteria andPaymentNoLike(String value) {
            addCriterion("paymentNo like", value, "paymentNo");
            return (Criteria) this;
        }

        public Criteria andPaymentNoNotLike(String value) {
            addCriterion("paymentNo not like", value, "paymentNo");
            return (Criteria) this;
        }

        public Criteria andPaymentNoIn(List<String> values) {
            addCriterion("paymentNo in", values, "paymentNo");
            return (Criteria) this;
        }

        public Criteria andPaymentNoNotIn(List<String> values) {
            addCriterion("paymentNo not in", values, "paymentNo");
            return (Criteria) this;
        }

        public Criteria andPaymentNoBetween(String value1, String value2) {
            addCriterion("paymentNo between", value1, value2, "paymentNo");
            return (Criteria) this;
        }

        public Criteria andPaymentNoNotBetween(String value1, String value2) {
            addCriterion("paymentNo not between", value1, value2, "paymentNo");
            return (Criteria) this;
        }

        public Criteria andSaleOrderNoIsNull() {
            addCriterion("saleOrderNo is null");
            return (Criteria) this;
        }

        public Criteria andSaleOrderNoIsNotNull() {
            addCriterion("saleOrderNo is not null");
            return (Criteria) this;
        }

        public Criteria andSaleOrderNoEqualTo(String value) {
            addCriterion("saleOrderNo =", value, "saleOrderNo");
            return (Criteria) this;
        }

        public Criteria andSaleOrderNoNotEqualTo(String value) {
            addCriterion("saleOrderNo <>", value, "saleOrderNo");
            return (Criteria) this;
        }

        public Criteria andSaleOrderNoGreaterThan(String value) {
            addCriterion("saleOrderNo >", value, "saleOrderNo");
            return (Criteria) this;
        }

        public Criteria andSaleOrderNoGreaterThanOrEqualTo(String value) {
            addCriterion("saleOrderNo >=", value, "saleOrderNo");
            return (Criteria) this;
        }

        public Criteria andSaleOrderNoLessThan(String value) {
            addCriterion("saleOrderNo <", value, "saleOrderNo");
            return (Criteria) this;
        }

        public Criteria andSaleOrderNoLessThanOrEqualTo(String value) {
            addCriterion("saleOrderNo <=", value, "saleOrderNo");
            return (Criteria) this;
        }

        public Criteria andSaleOrderNoLike(String value) {
            addCriterion("saleOrderNo like", value, "saleOrderNo");
            return (Criteria) this;
        }

        public Criteria andSaleOrderNoNotLike(String value) {
            addCriterion("saleOrderNo not like", value, "saleOrderNo");
            return (Criteria) this;
        }

        public Criteria andSaleOrderNoIn(List<String> values) {
            addCriterion("saleOrderNo in", values, "saleOrderNo");
            return (Criteria) this;
        }

        public Criteria andSaleOrderNoNotIn(List<String> values) {
            addCriterion("saleOrderNo not in", values, "saleOrderNo");
            return (Criteria) this;
        }

        public Criteria andSaleOrderNoBetween(String value1, String value2) {
            addCriterion("saleOrderNo between", value1, value2, "saleOrderNo");
            return (Criteria) this;
        }

        public Criteria andSaleOrderNoNotBetween(String value1, String value2) {
            addCriterion("saleOrderNo not between", value1, value2, "saleOrderNo");
            return (Criteria) this;
        }

        public Criteria andAmountIsNull() {
            addCriterion("amount is null");
            return (Criteria) this;
        }

        public Criteria andAmountIsNotNull() {
            addCriterion("amount is not null");
            return (Criteria) this;
        }

        public Criteria andAmountEqualTo(BigDecimal value) {
            addCriterion("amount =", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotEqualTo(BigDecimal value) {
            addCriterion("amount <>", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountGreaterThan(BigDecimal value) {
            addCriterion("amount >", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("amount >=", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountLessThan(BigDecimal value) {
            addCriterion("amount <", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountLessThanOrEqualTo(BigDecimal value) {
            addCriterion("amount <=", value, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountIn(List<BigDecimal> values) {
            addCriterion("amount in", values, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotIn(List<BigDecimal> values) {
            addCriterion("amount not in", values, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("amount between", value1, value2, "amount");
            return (Criteria) this;
        }

        public Criteria andAmountNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("amount not between", value1, value2, "amount");
            return (Criteria) this;
        }

        public Criteria andPayTypeIsNull() {
            addCriterion("payType is null");
            return (Criteria) this;
        }

        public Criteria andPayTypeIsNotNull() {
            addCriterion("payType is not null");
            return (Criteria) this;
        }

        public Criteria andPayTypeEqualTo(Byte value) {
            addCriterion("payType =", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeNotEqualTo(Byte value) {
            addCriterion("payType <>", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeGreaterThan(Byte value) {
            addCriterion("payType >", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeGreaterThanOrEqualTo(Byte value) {
            addCriterion("payType >=", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeLessThan(Byte value) {
            addCriterion("payType <", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeLessThanOrEqualTo(Byte value) {
            addCriterion("payType <=", value, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeIn(List<Byte> values) {
            addCriterion("payType in", values, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeNotIn(List<Byte> values) {
            addCriterion("payType not in", values, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeBetween(Byte value1, Byte value2) {
            addCriterion("payType between", value1, value2, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTypeNotBetween(Byte value1, Byte value2) {
            addCriterion("payType not between", value1, value2, "payType");
            return (Criteria) this;
        }

        public Criteria andPayTransactionNoIsNull() {
            addCriterion("payTransactionNo is null");
            return (Criteria) this;
        }

        public Criteria andPayTransactionNoIsNotNull() {
            addCriterion("payTransactionNo is not null");
            return (Criteria) this;
        }

        public Criteria andPayTransactionNoEqualTo(String value) {
            addCriterion("payTransactionNo =", value, "payTransactionNo");
            return (Criteria) this;
        }

        public Criteria andPayTransactionNoNotEqualTo(String value) {
            addCriterion("payTransactionNo <>", value, "payTransactionNo");
            return (Criteria) this;
        }

        public Criteria andPayTransactionNoGreaterThan(String value) {
            addCriterion("payTransactionNo >", value, "payTransactionNo");
            return (Criteria) this;
        }

        public Criteria andPayTransactionNoGreaterThanOrEqualTo(String value) {
            addCriterion("payTransactionNo >=", value, "payTransactionNo");
            return (Criteria) this;
        }

        public Criteria andPayTransactionNoLessThan(String value) {
            addCriterion("payTransactionNo <", value, "payTransactionNo");
            return (Criteria) this;
        }

        public Criteria andPayTransactionNoLessThanOrEqualTo(String value) {
            addCriterion("payTransactionNo <=", value, "payTransactionNo");
            return (Criteria) this;
        }

        public Criteria andPayTransactionNoLike(String value) {
            addCriterion("payTransactionNo like", value, "payTransactionNo");
            return (Criteria) this;
        }

        public Criteria andPayTransactionNoNotLike(String value) {
            addCriterion("payTransactionNo not like", value, "payTransactionNo");
            return (Criteria) this;
        }

        public Criteria andPayTransactionNoIn(List<String> values) {
            addCriterion("payTransactionNo in", values, "payTransactionNo");
            return (Criteria) this;
        }

        public Criteria andPayTransactionNoNotIn(List<String> values) {
            addCriterion("payTransactionNo not in", values, "payTransactionNo");
            return (Criteria) this;
        }

        public Criteria andPayTransactionNoBetween(String value1, String value2) {
            addCriterion("payTransactionNo between", value1, value2, "payTransactionNo");
            return (Criteria) this;
        }

        public Criteria andPayTransactionNoNotBetween(String value1, String value2) {
            addCriterion("payTransactionNo not between", value1, value2, "payTransactionNo");
            return (Criteria) this;
        }

        public Criteria andPayDateTimeIsNull() {
            addCriterion("payDateTime is null");
            return (Criteria) this;
        }

        public Criteria andPayDateTimeIsNotNull() {
            addCriterion("payDateTime is not null");
            return (Criteria) this;
        }

        public Criteria andPayDateTimeEqualTo(Date value) {
            addCriterion("payDateTime =", value, "payDateTime");
            return (Criteria) this;
        }

        public Criteria andPayDateTimeNotEqualTo(Date value) {
            addCriterion("payDateTime <>", value, "payDateTime");
            return (Criteria) this;
        }

        public Criteria andPayDateTimeGreaterThan(Date value) {
            addCriterion("payDateTime >", value, "payDateTime");
            return (Criteria) this;
        }

        public Criteria andPayDateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("payDateTime >=", value, "payDateTime");
            return (Criteria) this;
        }

        public Criteria andPayDateTimeLessThan(Date value) {
            addCriterion("payDateTime <", value, "payDateTime");
            return (Criteria) this;
        }

        public Criteria andPayDateTimeLessThanOrEqualTo(Date value) {
            addCriterion("payDateTime <=", value, "payDateTime");
            return (Criteria) this;
        }

        public Criteria andPayDateTimeIn(List<Date> values) {
            addCriterion("payDateTime in", values, "payDateTime");
            return (Criteria) this;
        }

        public Criteria andPayDateTimeNotIn(List<Date> values) {
            addCriterion("payDateTime not in", values, "payDateTime");
            return (Criteria) this;
        }

        public Criteria andPayDateTimeBetween(Date value1, Date value2) {
            addCriterion("payDateTime between", value1, value2, "payDateTime");
            return (Criteria) this;
        }

        public Criteria andPayDateTimeNotBetween(Date value1, Date value2) {
            addCriterion("payDateTime not between", value1, value2, "payDateTime");
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