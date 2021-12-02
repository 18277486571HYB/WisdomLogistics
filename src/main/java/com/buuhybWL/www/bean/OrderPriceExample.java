package com.buuhybWL.www.bean;

import java.util.ArrayList;
import java.util.List;

public class OrderPriceExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public OrderPriceExample() {
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

        public Criteria andOpIdIsNull() {
            addCriterion("op_id is null");
            return (Criteria) this;
        }

        public Criteria andOpIdIsNotNull() {
            addCriterion("op_id is not null");
            return (Criteria) this;
        }

        public Criteria andOpIdEqualTo(Integer value) {
            addCriterion("op_id =", value, "opId");
            return (Criteria) this;
        }

        public Criteria andOpIdNotEqualTo(Integer value) {
            addCriterion("op_id <>", value, "opId");
            return (Criteria) this;
        }

        public Criteria andOpIdGreaterThan(Integer value) {
            addCriterion("op_id >", value, "opId");
            return (Criteria) this;
        }

        public Criteria andOpIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("op_id >=", value, "opId");
            return (Criteria) this;
        }

        public Criteria andOpIdLessThan(Integer value) {
            addCriterion("op_id <", value, "opId");
            return (Criteria) this;
        }

        public Criteria andOpIdLessThanOrEqualTo(Integer value) {
            addCriterion("op_id <=", value, "opId");
            return (Criteria) this;
        }

        public Criteria andOpIdIn(List<Integer> values) {
            addCriterion("op_id in", values, "opId");
            return (Criteria) this;
        }

        public Criteria andOpIdNotIn(List<Integer> values) {
            addCriterion("op_id not in", values, "opId");
            return (Criteria) this;
        }

        public Criteria andOpIdBetween(Integer value1, Integer value2) {
            addCriterion("op_id between", value1, value2, "opId");
            return (Criteria) this;
        }

        public Criteria andOpIdNotBetween(Integer value1, Integer value2) {
            addCriterion("op_id not between", value1, value2, "opId");
            return (Criteria) this;
        }

        public Criteria andOpWeightIsNull() {
            addCriterion("op_weight is null");
            return (Criteria) this;
        }

        public Criteria andOpWeightIsNotNull() {
            addCriterion("op_weight is not null");
            return (Criteria) this;
        }

        public Criteria andOpWeightEqualTo(Integer value) {
            addCriterion("op_weight =", value, "opWeight");
            return (Criteria) this;
        }

        public Criteria andOpWeightNotEqualTo(Integer value) {
            addCriterion("op_weight <>", value, "opWeight");
            return (Criteria) this;
        }

        public Criteria andOpWeightGreaterThan(Integer value) {
            addCriterion("op_weight >", value, "opWeight");
            return (Criteria) this;
        }

        public Criteria andOpWeightGreaterThanOrEqualTo(Integer value) {
            addCriterion("op_weight >=", value, "opWeight");
            return (Criteria) this;
        }

        public Criteria andOpWeightLessThan(Integer value) {
            addCriterion("op_weight <", value, "opWeight");
            return (Criteria) this;
        }

        public Criteria andOpWeightLessThanOrEqualTo(Integer value) {
            addCriterion("op_weight <=", value, "opWeight");
            return (Criteria) this;
        }

        public Criteria andOpWeightIn(List<Integer> values) {
            addCriterion("op_weight in", values, "opWeight");
            return (Criteria) this;
        }

        public Criteria andOpWeightNotIn(List<Integer> values) {
            addCriterion("op_weight not in", values, "opWeight");
            return (Criteria) this;
        }

        public Criteria andOpWeightBetween(Integer value1, Integer value2) {
            addCriterion("op_weight between", value1, value2, "opWeight");
            return (Criteria) this;
        }

        public Criteria andOpWeightNotBetween(Integer value1, Integer value2) {
            addCriterion("op_weight not between", value1, value2, "opWeight");
            return (Criteria) this;
        }

        public Criteria andOpKindsIsNull() {
            addCriterion("op_kinds is null");
            return (Criteria) this;
        }

        public Criteria andOpKindsIsNotNull() {
            addCriterion("op_kinds is not null");
            return (Criteria) this;
        }

        public Criteria andOpKindsEqualTo(String value) {
            addCriterion("op_kinds =", value, "opKinds");
            return (Criteria) this;
        }

        public Criteria andOpKindsNotEqualTo(String value) {
            addCriterion("op_kinds <>", value, "opKinds");
            return (Criteria) this;
        }

        public Criteria andOpKindsGreaterThan(String value) {
            addCriterion("op_kinds >", value, "opKinds");
            return (Criteria) this;
        }

        public Criteria andOpKindsGreaterThanOrEqualTo(String value) {
            addCriterion("op_kinds >=", value, "opKinds");
            return (Criteria) this;
        }

        public Criteria andOpKindsLessThan(String value) {
            addCriterion("op_kinds <", value, "opKinds");
            return (Criteria) this;
        }

        public Criteria andOpKindsLessThanOrEqualTo(String value) {
            addCriterion("op_kinds <=", value, "opKinds");
            return (Criteria) this;
        }

        public Criteria andOpKindsLike(String value) {
            addCriterion("op_kinds like", value, "opKinds");
            return (Criteria) this;
        }

        public Criteria andOpKindsNotLike(String value) {
            addCriterion("op_kinds not like", value, "opKinds");
            return (Criteria) this;
        }

        public Criteria andOpKindsIn(List<String> values) {
            addCriterion("op_kinds in", values, "opKinds");
            return (Criteria) this;
        }

        public Criteria andOpKindsNotIn(List<String> values) {
            addCriterion("op_kinds not in", values, "opKinds");
            return (Criteria) this;
        }

        public Criteria andOpKindsBetween(String value1, String value2) {
            addCriterion("op_kinds between", value1, value2, "opKinds");
            return (Criteria) this;
        }

        public Criteria andOpKindsNotBetween(String value1, String value2) {
            addCriterion("op_kinds not between", value1, value2, "opKinds");
            return (Criteria) this;
        }

        public Criteria andOpPriceIsNull() {
            addCriterion("op_price is null");
            return (Criteria) this;
        }

        public Criteria andOpPriceIsNotNull() {
            addCriterion("op_price is not null");
            return (Criteria) this;
        }

        public Criteria andOpPriceEqualTo(Double value) {
            addCriterion("op_price =", value, "opPrice");
            return (Criteria) this;
        }

        public Criteria andOpPriceNotEqualTo(Double value) {
            addCriterion("op_price <>", value, "opPrice");
            return (Criteria) this;
        }

        public Criteria andOpPriceGreaterThan(Double value) {
            addCriterion("op_price >", value, "opPrice");
            return (Criteria) this;
        }

        public Criteria andOpPriceGreaterThanOrEqualTo(Double value) {
            addCriterion("op_price >=", value, "opPrice");
            return (Criteria) this;
        }

        public Criteria andOpPriceLessThan(Double value) {
            addCriterion("op_price <", value, "opPrice");
            return (Criteria) this;
        }

        public Criteria andOpPriceLessThanOrEqualTo(Double value) {
            addCriterion("op_price <=", value, "opPrice");
            return (Criteria) this;
        }

        public Criteria andOpPriceIn(List<Double> values) {
            addCriterion("op_price in", values, "opPrice");
            return (Criteria) this;
        }

        public Criteria andOpPriceNotIn(List<Double> values) {
            addCriterion("op_price not in", values, "opPrice");
            return (Criteria) this;
        }

        public Criteria andOpPriceBetween(Double value1, Double value2) {
            addCriterion("op_price between", value1, value2, "opPrice");
            return (Criteria) this;
        }

        public Criteria andOpPriceNotBetween(Double value1, Double value2) {
            addCriterion("op_price not between", value1, value2, "opPrice");
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