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

        public Criteria andPaymentnoIsNull() {
            addCriterion("paymentNo is null");
            return (Criteria) this;
        }

        public Criteria andPaymentnoIsNotNull() {
            addCriterion("paymentNo is not null");
            return (Criteria) this;
        }

        public Criteria andPaymentnoEqualTo(String value) {
            addCriterion("paymentNo =", value, "paymentno");
            return (Criteria) this;
        }

        public Criteria andPaymentnoNotEqualTo(String value) {
            addCriterion("paymentNo <>", value, "paymentno");
            return (Criteria) this;
        }

        public Criteria andPaymentnoGreaterThan(String value) {
            addCriterion("paymentNo >", value, "paymentno");
            return (Criteria) this;
        }

        public Criteria andPaymentnoGreaterThanOrEqualTo(String value) {
            addCriterion("paymentNo >=", value, "paymentno");
            return (Criteria) this;
        }

        public Criteria andPaymentnoLessThan(String value) {
            addCriterion("paymentNo <", value, "paymentno");
            return (Criteria) this;
        }

        public Criteria andPaymentnoLessThanOrEqualTo(String value) {
            addCriterion("paymentNo <=", value, "paymentno");
            return (Criteria) this;
        }

        public Criteria andPaymentnoLike(String value) {
            addCriterion("paymentNo like", value, "paymentno");
            return (Criteria) this;
        }

        public Criteria andPaymentnoNotLike(String value) {
            addCriterion("paymentNo not like", value, "paymentno");
            return (Criteria) this;
        }

        public Criteria andPaymentnoIn(List<String> values) {
            addCriterion("paymentNo in", values, "paymentno");
            return (Criteria) this;
        }

        public Criteria andPaymentnoNotIn(List<String> values) {
            addCriterion("paymentNo not in", values, "paymentno");
            return (Criteria) this;
        }

        public Criteria andPaymentnoBetween(String value1, String value2) {
            addCriterion("paymentNo between", value1, value2, "paymentno");
            return (Criteria) this;
        }

        public Criteria andPaymentnoNotBetween(String value1, String value2) {
            addCriterion("paymentNo not between", value1, value2, "paymentno");
            return (Criteria) this;
        }

        public Criteria andSaleordernoIsNull() {
            addCriterion("saleOrderNo is null");
            return (Criteria) this;
        }

        public Criteria andSaleordernoIsNotNull() {
            addCriterion("saleOrderNo is not null");
            return (Criteria) this;
        }

        public Criteria andSaleordernoEqualTo(String value) {
            addCriterion("saleOrderNo =", value, "saleorderno");
            return (Criteria) this;
        }

        public Criteria andSaleordernoNotEqualTo(String value) {
            addCriterion("saleOrderNo <>", value, "saleorderno");
            return (Criteria) this;
        }

        public Criteria andSaleordernoGreaterThan(String value) {
            addCriterion("saleOrderNo >", value, "saleorderno");
            return (Criteria) this;
        }

        public Criteria andSaleordernoGreaterThanOrEqualTo(String value) {
            addCriterion("saleOrderNo >=", value, "saleorderno");
            return (Criteria) this;
        }

        public Criteria andSaleordernoLessThan(String value) {
            addCriterion("saleOrderNo <", value, "saleorderno");
            return (Criteria) this;
        }

        public Criteria andSaleordernoLessThanOrEqualTo(String value) {
            addCriterion("saleOrderNo <=", value, "saleorderno");
            return (Criteria) this;
        }

        public Criteria andSaleordernoLike(String value) {
            addCriterion("saleOrderNo like", value, "saleorderno");
            return (Criteria) this;
        }

        public Criteria andSaleordernoNotLike(String value) {
            addCriterion("saleOrderNo not like", value, "saleorderno");
            return (Criteria) this;
        }

        public Criteria andSaleordernoIn(List<String> values) {
            addCriterion("saleOrderNo in", values, "saleorderno");
            return (Criteria) this;
        }

        public Criteria andSaleordernoNotIn(List<String> values) {
            addCriterion("saleOrderNo not in", values, "saleorderno");
            return (Criteria) this;
        }

        public Criteria andSaleordernoBetween(String value1, String value2) {
            addCriterion("saleOrderNo between", value1, value2, "saleorderno");
            return (Criteria) this;
        }

        public Criteria andSaleordernoNotBetween(String value1, String value2) {
            addCriterion("saleOrderNo not between", value1, value2, "saleorderno");
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

        public Criteria andPaytypeIsNull() {
            addCriterion("payType is null");
            return (Criteria) this;
        }

        public Criteria andPaytypeIsNotNull() {
            addCriterion("payType is not null");
            return (Criteria) this;
        }

        public Criteria andPaytypeEqualTo(Byte value) {
            addCriterion("payType =", value, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeNotEqualTo(Byte value) {
            addCriterion("payType <>", value, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeGreaterThan(Byte value) {
            addCriterion("payType >", value, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeGreaterThanOrEqualTo(Byte value) {
            addCriterion("payType >=", value, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeLessThan(Byte value) {
            addCriterion("payType <", value, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeLessThanOrEqualTo(Byte value) {
            addCriterion("payType <=", value, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeIn(List<Byte> values) {
            addCriterion("payType in", values, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeNotIn(List<Byte> values) {
            addCriterion("payType not in", values, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeBetween(Byte value1, Byte value2) {
            addCriterion("payType between", value1, value2, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytypeNotBetween(Byte value1, Byte value2) {
            addCriterion("payType not between", value1, value2, "paytype");
            return (Criteria) this;
        }

        public Criteria andPaytransactionnoIsNull() {
            addCriterion("payTransactionNo is null");
            return (Criteria) this;
        }

        public Criteria andPaytransactionnoIsNotNull() {
            addCriterion("payTransactionNo is not null");
            return (Criteria) this;
        }

        public Criteria andPaytransactionnoEqualTo(String value) {
            addCriterion("payTransactionNo =", value, "paytransactionno");
            return (Criteria) this;
        }

        public Criteria andPaytransactionnoNotEqualTo(String value) {
            addCriterion("payTransactionNo <>", value, "paytransactionno");
            return (Criteria) this;
        }

        public Criteria andPaytransactionnoGreaterThan(String value) {
            addCriterion("payTransactionNo >", value, "paytransactionno");
            return (Criteria) this;
        }

        public Criteria andPaytransactionnoGreaterThanOrEqualTo(String value) {
            addCriterion("payTransactionNo >=", value, "paytransactionno");
            return (Criteria) this;
        }

        public Criteria andPaytransactionnoLessThan(String value) {
            addCriterion("payTransactionNo <", value, "paytransactionno");
            return (Criteria) this;
        }

        public Criteria andPaytransactionnoLessThanOrEqualTo(String value) {
            addCriterion("payTransactionNo <=", value, "paytransactionno");
            return (Criteria) this;
        }

        public Criteria andPaytransactionnoLike(String value) {
            addCriterion("payTransactionNo like", value, "paytransactionno");
            return (Criteria) this;
        }

        public Criteria andPaytransactionnoNotLike(String value) {
            addCriterion("payTransactionNo not like", value, "paytransactionno");
            return (Criteria) this;
        }

        public Criteria andPaytransactionnoIn(List<String> values) {
            addCriterion("payTransactionNo in", values, "paytransactionno");
            return (Criteria) this;
        }

        public Criteria andPaytransactionnoNotIn(List<String> values) {
            addCriterion("payTransactionNo not in", values, "paytransactionno");
            return (Criteria) this;
        }

        public Criteria andPaytransactionnoBetween(String value1, String value2) {
            addCriterion("payTransactionNo between", value1, value2, "paytransactionno");
            return (Criteria) this;
        }

        public Criteria andPaytransactionnoNotBetween(String value1, String value2) {
            addCriterion("payTransactionNo not between", value1, value2, "paytransactionno");
            return (Criteria) this;
        }

        public Criteria andPaydatetimeIsNull() {
            addCriterion("payDateTime is null");
            return (Criteria) this;
        }

        public Criteria andPaydatetimeIsNotNull() {
            addCriterion("payDateTime is not null");
            return (Criteria) this;
        }

        public Criteria andPaydatetimeEqualTo(Date value) {
            addCriterion("payDateTime =", value, "paydatetime");
            return (Criteria) this;
        }

        public Criteria andPaydatetimeNotEqualTo(Date value) {
            addCriterion("payDateTime <>", value, "paydatetime");
            return (Criteria) this;
        }

        public Criteria andPaydatetimeGreaterThan(Date value) {
            addCriterion("payDateTime >", value, "paydatetime");
            return (Criteria) this;
        }

        public Criteria andPaydatetimeGreaterThanOrEqualTo(Date value) {
            addCriterion("payDateTime >=", value, "paydatetime");
            return (Criteria) this;
        }

        public Criteria andPaydatetimeLessThan(Date value) {
            addCriterion("payDateTime <", value, "paydatetime");
            return (Criteria) this;
        }

        public Criteria andPaydatetimeLessThanOrEqualTo(Date value) {
            addCriterion("payDateTime <=", value, "paydatetime");
            return (Criteria) this;
        }

        public Criteria andPaydatetimeIn(List<Date> values) {
            addCriterion("payDateTime in", values, "paydatetime");
            return (Criteria) this;
        }

        public Criteria andPaydatetimeNotIn(List<Date> values) {
            addCriterion("payDateTime not in", values, "paydatetime");
            return (Criteria) this;
        }

        public Criteria andPaydatetimeBetween(Date value1, Date value2) {
            addCriterion("payDateTime between", value1, value2, "paydatetime");
            return (Criteria) this;
        }

        public Criteria andPaydatetimeNotBetween(Date value1, Date value2) {
            addCriterion("payDateTime not between", value1, value2, "paydatetime");
            return (Criteria) this;
        }

        public Criteria andOperatoridIsNull() {
            addCriterion("operatorId is null");
            return (Criteria) this;
        }

        public Criteria andOperatoridIsNotNull() {
            addCriterion("operatorId is not null");
            return (Criteria) this;
        }

        public Criteria andOperatoridEqualTo(Long value) {
            addCriterion("operatorId =", value, "operatorid");
            return (Criteria) this;
        }

        public Criteria andOperatoridNotEqualTo(Long value) {
            addCriterion("operatorId <>", value, "operatorid");
            return (Criteria) this;
        }

        public Criteria andOperatoridGreaterThan(Long value) {
            addCriterion("operatorId >", value, "operatorid");
            return (Criteria) this;
        }

        public Criteria andOperatoridGreaterThanOrEqualTo(Long value) {
            addCriterion("operatorId >=", value, "operatorid");
            return (Criteria) this;
        }

        public Criteria andOperatoridLessThan(Long value) {
            addCriterion("operatorId <", value, "operatorid");
            return (Criteria) this;
        }

        public Criteria andOperatoridLessThanOrEqualTo(Long value) {
            addCriterion("operatorId <=", value, "operatorid");
            return (Criteria) this;
        }

        public Criteria andOperatoridIn(List<Long> values) {
            addCriterion("operatorId in", values, "operatorid");
            return (Criteria) this;
        }

        public Criteria andOperatoridNotIn(List<Long> values) {
            addCriterion("operatorId not in", values, "operatorid");
            return (Criteria) this;
        }

        public Criteria andOperatoridBetween(Long value1, Long value2) {
            addCriterion("operatorId between", value1, value2, "operatorid");
            return (Criteria) this;
        }

        public Criteria andOperatoridNotBetween(Long value1, Long value2) {
            addCriterion("operatorId not between", value1, value2, "operatorid");
            return (Criteria) this;
        }

        public Criteria andShopidIsNull() {
            addCriterion("shopId is null");
            return (Criteria) this;
        }

        public Criteria andShopidIsNotNull() {
            addCriterion("shopId is not null");
            return (Criteria) this;
        }

        public Criteria andShopidEqualTo(Long value) {
            addCriterion("shopId =", value, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidNotEqualTo(Long value) {
            addCriterion("shopId <>", value, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidGreaterThan(Long value) {
            addCriterion("shopId >", value, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidGreaterThanOrEqualTo(Long value) {
            addCriterion("shopId >=", value, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidLessThan(Long value) {
            addCriterion("shopId <", value, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidLessThanOrEqualTo(Long value) {
            addCriterion("shopId <=", value, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidIn(List<Long> values) {
            addCriterion("shopId in", values, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidNotIn(List<Long> values) {
            addCriterion("shopId not in", values, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidBetween(Long value1, Long value2) {
            addCriterion("shopId between", value1, value2, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidNotBetween(Long value1, Long value2) {
            addCriterion("shopId not between", value1, value2, "shopid");
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