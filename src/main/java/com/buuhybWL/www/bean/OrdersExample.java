package com.buuhybWL.www.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrdersExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public OrdersExample() {
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

        public Criteria andOIdIsNull() {
            addCriterion("o_id is null");
            return (Criteria) this;
        }

        public Criteria andOIdIsNotNull() {
            addCriterion("o_id is not null");
            return (Criteria) this;
        }

        public Criteria andOIdEqualTo(Integer value) {
            addCriterion("o_id =", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdNotEqualTo(Integer value) {
            addCriterion("o_id <>", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdGreaterThan(Integer value) {
            addCriterion("o_id >", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("o_id >=", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdLessThan(Integer value) {
            addCriterion("o_id <", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdLessThanOrEqualTo(Integer value) {
            addCriterion("o_id <=", value, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdIn(List<Integer> values) {
            addCriterion("o_id in", values, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdNotIn(List<Integer> values) {
            addCriterion("o_id not in", values, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdBetween(Integer value1, Integer value2) {
            addCriterion("o_id between", value1, value2, "oId");
            return (Criteria) this;
        }

        public Criteria andOIdNotBetween(Integer value1, Integer value2) {
            addCriterion("o_id not between", value1, value2, "oId");
            return (Criteria) this;
        }

        public Criteria andONumberIsNull() {
            addCriterion("o_number is null");
            return (Criteria) this;
        }

        public Criteria andONumberIsNotNull() {
            addCriterion("o_number is not null");
            return (Criteria) this;
        }

        public Criteria andONumberEqualTo(String value) {
            addCriterion("o_number =", value, "oNumber");
            return (Criteria) this;
        }

        public Criteria andONumberNotEqualTo(String value) {
            addCriterion("o_number <>", value, "oNumber");
            return (Criteria) this;
        }

        public Criteria andONumberGreaterThan(String value) {
            addCriterion("o_number >", value, "oNumber");
            return (Criteria) this;
        }

        public Criteria andONumberGreaterThanOrEqualTo(String value) {
            addCriterion("o_number >=", value, "oNumber");
            return (Criteria) this;
        }

        public Criteria andONumberLessThan(String value) {
            addCriterion("o_number <", value, "oNumber");
            return (Criteria) this;
        }

        public Criteria andONumberLessThanOrEqualTo(String value) {
            addCriterion("o_number <=", value, "oNumber");
            return (Criteria) this;
        }

        public Criteria andONumberLike(String value) {
            addCriterion("o_number like", value, "oNumber");
            return (Criteria) this;
        }

        public Criteria andONumberNotLike(String value) {
            addCriterion("o_number not like", value, "oNumber");
            return (Criteria) this;
        }

        public Criteria andONumberIn(List<String> values) {
            addCriterion("o_number in", values, "oNumber");
            return (Criteria) this;
        }

        public Criteria andONumberNotIn(List<String> values) {
            addCriterion("o_number not in", values, "oNumber");
            return (Criteria) this;
        }

        public Criteria andONumberBetween(String value1, String value2) {
            addCriterion("o_number between", value1, value2, "oNumber");
            return (Criteria) this;
        }

        public Criteria andONumberNotBetween(String value1, String value2) {
            addCriterion("o_number not between", value1, value2, "oNumber");
            return (Criteria) this;
        }

        public Criteria andODateIsNull() {
            addCriterion("o_date is null");
            return (Criteria) this;
        }

        public Criteria andODateIsNotNull() {
            addCriterion("o_date is not null");
            return (Criteria) this;
        }

        public Criteria andODateEqualTo(Date value) {
            addCriterion("o_date =", value, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateNotEqualTo(Date value) {
            addCriterion("o_date <>", value, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateGreaterThan(Date value) {
            addCriterion("o_date >", value, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateGreaterThanOrEqualTo(Date value) {
            addCriterion("o_date >=", value, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateLessThan(Date value) {
            addCriterion("o_date <", value, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateLessThanOrEqualTo(Date value) {
            addCriterion("o_date <=", value, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateIn(List<Date> values) {
            addCriterion("o_date in", values, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateNotIn(List<Date> values) {
            addCriterion("o_date not in", values, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateBetween(Date value1, Date value2) {
            addCriterion("o_date between", value1, value2, "oDate");
            return (Criteria) this;
        }

        public Criteria andODateNotBetween(Date value1, Date value2) {
            addCriterion("o_date not between", value1, value2, "oDate");
            return (Criteria) this;
        }

        public Criteria andOStatusIsNull() {
            addCriterion("o_status is null");
            return (Criteria) this;
        }

        public Criteria andOStatusIsNotNull() {
            addCriterion("o_status is not null");
            return (Criteria) this;
        }

        public Criteria andOStatusEqualTo(String value) {
            addCriterion("o_status =", value, "oStatus");
            return (Criteria) this;
        }

        public Criteria andOStatusNotEqualTo(String value) {
            addCriterion("o_status <>", value, "oStatus");
            return (Criteria) this;
        }

        public Criteria andOStatusGreaterThan(String value) {
            addCriterion("o_status >", value, "oStatus");
            return (Criteria) this;
        }

        public Criteria andOStatusGreaterThanOrEqualTo(String value) {
            addCriterion("o_status >=", value, "oStatus");
            return (Criteria) this;
        }

        public Criteria andOStatusLessThan(String value) {
            addCriterion("o_status <", value, "oStatus");
            return (Criteria) this;
        }

        public Criteria andOStatusLessThanOrEqualTo(String value) {
            addCriterion("o_status <=", value, "oStatus");
            return (Criteria) this;
        }

        public Criteria andOStatusLike(String value) {
            addCriterion("o_status like", value, "oStatus");
            return (Criteria) this;
        }

        public Criteria andOStatusNotLike(String value) {
            addCriterion("o_status not like", value, "oStatus");
            return (Criteria) this;
        }

        public Criteria andOStatusIn(List<String> values) {
            addCriterion("o_status in", values, "oStatus");
            return (Criteria) this;
        }

        public Criteria andOStatusNotIn(List<String> values) {
            addCriterion("o_status not in", values, "oStatus");
            return (Criteria) this;
        }

        public Criteria andOStatusBetween(String value1, String value2) {
            addCriterion("o_status between", value1, value2, "oStatus");
            return (Criteria) this;
        }

        public Criteria andOStatusNotBetween(String value1, String value2) {
            addCriterion("o_status not between", value1, value2, "oStatus");
            return (Criteria) this;
        }

        public Criteria andOSIdIsNull() {
            addCriterion("o_s_id is null");
            return (Criteria) this;
        }

        public Criteria andOSIdIsNotNull() {
            addCriterion("o_s_id is not null");
            return (Criteria) this;
        }

        public Criteria andOSIdEqualTo(Integer value) {
            addCriterion("o_s_id =", value, "oSId");
            return (Criteria) this;
        }

        public Criteria andOSIdNotEqualTo(Integer value) {
            addCriterion("o_s_id <>", value, "oSId");
            return (Criteria) this;
        }

        public Criteria andOSIdGreaterThan(Integer value) {
            addCriterion("o_s_id >", value, "oSId");
            return (Criteria) this;
        }

        public Criteria andOSIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("o_s_id >=", value, "oSId");
            return (Criteria) this;
        }

        public Criteria andOSIdLessThan(Integer value) {
            addCriterion("o_s_id <", value, "oSId");
            return (Criteria) this;
        }

        public Criteria andOSIdLessThanOrEqualTo(Integer value) {
            addCriterion("o_s_id <=", value, "oSId");
            return (Criteria) this;
        }

        public Criteria andOSIdIn(List<Integer> values) {
            addCriterion("o_s_id in", values, "oSId");
            return (Criteria) this;
        }

        public Criteria andOSIdNotIn(List<Integer> values) {
            addCriterion("o_s_id not in", values, "oSId");
            return (Criteria) this;
        }

        public Criteria andOSIdBetween(Integer value1, Integer value2) {
            addCriterion("o_s_id between", value1, value2, "oSId");
            return (Criteria) this;
        }

        public Criteria andOSIdNotBetween(Integer value1, Integer value2) {
            addCriterion("o_s_id not between", value1, value2, "oSId");
            return (Criteria) this;
        }

        public Criteria andOPriceIsNull() {
            addCriterion("o_price is null");
            return (Criteria) this;
        }

        public Criteria andOPriceIsNotNull() {
            addCriterion("o_price is not null");
            return (Criteria) this;
        }

        public Criteria andOPriceEqualTo(Double value) {
            addCriterion("o_price =", value, "oPrice");
            return (Criteria) this;
        }

        public Criteria andOPriceNotEqualTo(Double value) {
            addCriterion("o_price <>", value, "oPrice");
            return (Criteria) this;
        }

        public Criteria andOPriceGreaterThan(Double value) {
            addCriterion("o_price >", value, "oPrice");
            return (Criteria) this;
        }

        public Criteria andOPriceGreaterThanOrEqualTo(Double value) {
            addCriterion("o_price >=", value, "oPrice");
            return (Criteria) this;
        }

        public Criteria andOPriceLessThan(Double value) {
            addCriterion("o_price <", value, "oPrice");
            return (Criteria) this;
        }

        public Criteria andOPriceLessThanOrEqualTo(Double value) {
            addCriterion("o_price <=", value, "oPrice");
            return (Criteria) this;
        }

        public Criteria andOPriceIn(List<Double> values) {
            addCriterion("o_price in", values, "oPrice");
            return (Criteria) this;
        }

        public Criteria andOPriceNotIn(List<Double> values) {
            addCriterion("o_price not in", values, "oPrice");
            return (Criteria) this;
        }

        public Criteria andOPriceBetween(Double value1, Double value2) {
            addCriterion("o_price between", value1, value2, "oPrice");
            return (Criteria) this;
        }

        public Criteria andOPriceNotBetween(Double value1, Double value2) {
            addCriterion("o_price not between", value1, value2, "oPrice");
            return (Criteria) this;
        }

        public Criteria andOUidIsNull() {
            addCriterion("o_uId is null");
            return (Criteria) this;
        }

        public Criteria andOUidIsNotNull() {
            addCriterion("o_uId is not null");
            return (Criteria) this;
        }

        public Criteria andOUidEqualTo(Integer value) {
            addCriterion("o_uId =", value, "oUid");
            return (Criteria) this;
        }

        public Criteria andOUidNotEqualTo(Integer value) {
            addCriterion("o_uId <>", value, "oUid");
            return (Criteria) this;
        }

        public Criteria andOUidGreaterThan(Integer value) {
            addCriterion("o_uId >", value, "oUid");
            return (Criteria) this;
        }

        public Criteria andOUidGreaterThanOrEqualTo(Integer value) {
            addCriterion("o_uId >=", value, "oUid");
            return (Criteria) this;
        }

        public Criteria andOUidLessThan(Integer value) {
            addCriterion("o_uId <", value, "oUid");
            return (Criteria) this;
        }

        public Criteria andOUidLessThanOrEqualTo(Integer value) {
            addCriterion("o_uId <=", value, "oUid");
            return (Criteria) this;
        }

        public Criteria andOUidIn(List<Integer> values) {
            addCriterion("o_uId in", values, "oUid");
            return (Criteria) this;
        }

        public Criteria andOUidNotIn(List<Integer> values) {
            addCriterion("o_uId not in", values, "oUid");
            return (Criteria) this;
        }

        public Criteria andOUidBetween(Integer value1, Integer value2) {
            addCriterion("o_uId between", value1, value2, "oUid");
            return (Criteria) this;
        }

        public Criteria andOUidNotBetween(Integer value1, Integer value2) {
            addCriterion("o_uId not between", value1, value2, "oUid");
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