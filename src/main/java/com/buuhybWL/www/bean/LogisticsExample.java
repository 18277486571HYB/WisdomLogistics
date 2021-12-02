package com.buuhybWL.www.bean;

import java.util.ArrayList;
import java.util.List;

public class LogisticsExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public LogisticsExample() {
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

        public Criteria andLIdIsNull() {
            addCriterion("l_id is null");
            return (Criteria) this;
        }

        public Criteria andLIdIsNotNull() {
            addCriterion("l_id is not null");
            return (Criteria) this;
        }

        public Criteria andLIdEqualTo(Integer value) {
            addCriterion("l_id =", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdNotEqualTo(Integer value) {
            addCriterion("l_id <>", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdGreaterThan(Integer value) {
            addCriterion("l_id >", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("l_id >=", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdLessThan(Integer value) {
            addCriterion("l_id <", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdLessThanOrEqualTo(Integer value) {
            addCriterion("l_id <=", value, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdIn(List<Integer> values) {
            addCriterion("l_id in", values, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdNotIn(List<Integer> values) {
            addCriterion("l_id not in", values, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdBetween(Integer value1, Integer value2) {
            addCriterion("l_id between", value1, value2, "lId");
            return (Criteria) this;
        }

        public Criteria andLIdNotBetween(Integer value1, Integer value2) {
            addCriterion("l_id not between", value1, value2, "lId");
            return (Criteria) this;
        }

        public Criteria andToAddressIsNull() {
            addCriterion("to_Address is null");
            return (Criteria) this;
        }

        public Criteria andToAddressIsNotNull() {
            addCriterion("to_Address is not null");
            return (Criteria) this;
        }

        public Criteria andToAddressEqualTo(String value) {
            addCriterion("to_Address =", value, "toAddress");
            return (Criteria) this;
        }

        public Criteria andToAddressNotEqualTo(String value) {
            addCriterion("to_Address <>", value, "toAddress");
            return (Criteria) this;
        }

        public Criteria andToAddressGreaterThan(String value) {
            addCriterion("to_Address >", value, "toAddress");
            return (Criteria) this;
        }

        public Criteria andToAddressGreaterThanOrEqualTo(String value) {
            addCriterion("to_Address >=", value, "toAddress");
            return (Criteria) this;
        }

        public Criteria andToAddressLessThan(String value) {
            addCriterion("to_Address <", value, "toAddress");
            return (Criteria) this;
        }

        public Criteria andToAddressLessThanOrEqualTo(String value) {
            addCriterion("to_Address <=", value, "toAddress");
            return (Criteria) this;
        }

        public Criteria andToAddressLike(String value) {
            addCriterion("to_Address like", value, "toAddress");
            return (Criteria) this;
        }

        public Criteria andToAddressNotLike(String value) {
            addCriterion("to_Address not like", value, "toAddress");
            return (Criteria) this;
        }

        public Criteria andToAddressIn(List<String> values) {
            addCriterion("to_Address in", values, "toAddress");
            return (Criteria) this;
        }

        public Criteria andToAddressNotIn(List<String> values) {
            addCriterion("to_Address not in", values, "toAddress");
            return (Criteria) this;
        }

        public Criteria andToAddressBetween(String value1, String value2) {
            addCriterion("to_Address between", value1, value2, "toAddress");
            return (Criteria) this;
        }

        public Criteria andToAddressNotBetween(String value1, String value2) {
            addCriterion("to_Address not between", value1, value2, "toAddress");
            return (Criteria) this;
        }

        public Criteria andToNameIsNull() {
            addCriterion("to_Name is null");
            return (Criteria) this;
        }

        public Criteria andToNameIsNotNull() {
            addCriterion("to_Name is not null");
            return (Criteria) this;
        }

        public Criteria andToNameEqualTo(String value) {
            addCriterion("to_Name =", value, "toName");
            return (Criteria) this;
        }

        public Criteria andToNameNotEqualTo(String value) {
            addCriterion("to_Name <>", value, "toName");
            return (Criteria) this;
        }

        public Criteria andToNameGreaterThan(String value) {
            addCriterion("to_Name >", value, "toName");
            return (Criteria) this;
        }

        public Criteria andToNameGreaterThanOrEqualTo(String value) {
            addCriterion("to_Name >=", value, "toName");
            return (Criteria) this;
        }

        public Criteria andToNameLessThan(String value) {
            addCriterion("to_Name <", value, "toName");
            return (Criteria) this;
        }

        public Criteria andToNameLessThanOrEqualTo(String value) {
            addCriterion("to_Name <=", value, "toName");
            return (Criteria) this;
        }

        public Criteria andToNameLike(String value) {
            addCriterion("to_Name like", value, "toName");
            return (Criteria) this;
        }

        public Criteria andToNameNotLike(String value) {
            addCriterion("to_Name not like", value, "toName");
            return (Criteria) this;
        }

        public Criteria andToNameIn(List<String> values) {
            addCriterion("to_Name in", values, "toName");
            return (Criteria) this;
        }

        public Criteria andToNameNotIn(List<String> values) {
            addCriterion("to_Name not in", values, "toName");
            return (Criteria) this;
        }

        public Criteria andToNameBetween(String value1, String value2) {
            addCriterion("to_Name between", value1, value2, "toName");
            return (Criteria) this;
        }

        public Criteria andToNameNotBetween(String value1, String value2) {
            addCriterion("to_Name not between", value1, value2, "toName");
            return (Criteria) this;
        }

        public Criteria andToPhoneIsNull() {
            addCriterion("to_Phone is null");
            return (Criteria) this;
        }

        public Criteria andToPhoneIsNotNull() {
            addCriterion("to_Phone is not null");
            return (Criteria) this;
        }

        public Criteria andToPhoneEqualTo(String value) {
            addCriterion("to_Phone =", value, "toPhone");
            return (Criteria) this;
        }

        public Criteria andToPhoneNotEqualTo(String value) {
            addCriterion("to_Phone <>", value, "toPhone");
            return (Criteria) this;
        }

        public Criteria andToPhoneGreaterThan(String value) {
            addCriterion("to_Phone >", value, "toPhone");
            return (Criteria) this;
        }

        public Criteria andToPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("to_Phone >=", value, "toPhone");
            return (Criteria) this;
        }

        public Criteria andToPhoneLessThan(String value) {
            addCriterion("to_Phone <", value, "toPhone");
            return (Criteria) this;
        }

        public Criteria andToPhoneLessThanOrEqualTo(String value) {
            addCriterion("to_Phone <=", value, "toPhone");
            return (Criteria) this;
        }

        public Criteria andToPhoneLike(String value) {
            addCriterion("to_Phone like", value, "toPhone");
            return (Criteria) this;
        }

        public Criteria andToPhoneNotLike(String value) {
            addCriterion("to_Phone not like", value, "toPhone");
            return (Criteria) this;
        }

        public Criteria andToPhoneIn(List<String> values) {
            addCriterion("to_Phone in", values, "toPhone");
            return (Criteria) this;
        }

        public Criteria andToPhoneNotIn(List<String> values) {
            addCriterion("to_Phone not in", values, "toPhone");
            return (Criteria) this;
        }

        public Criteria andToPhoneBetween(String value1, String value2) {
            addCriterion("to_Phone between", value1, value2, "toPhone");
            return (Criteria) this;
        }

        public Criteria andToPhoneNotBetween(String value1, String value2) {
            addCriterion("to_Phone not between", value1, value2, "toPhone");
            return (Criteria) this;
        }

        public Criteria andAddressIsNull() {
            addCriterion("address is null");
            return (Criteria) this;
        }

        public Criteria andAddressIsNotNull() {
            addCriterion("address is not null");
            return (Criteria) this;
        }

        public Criteria andAddressEqualTo(String value) {
            addCriterion("address =", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotEqualTo(String value) {
            addCriterion("address <>", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThan(String value) {
            addCriterion("address >", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressGreaterThanOrEqualTo(String value) {
            addCriterion("address >=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThan(String value) {
            addCriterion("address <", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLessThanOrEqualTo(String value) {
            addCriterion("address <=", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressLike(String value) {
            addCriterion("address like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotLike(String value) {
            addCriterion("address not like", value, "address");
            return (Criteria) this;
        }

        public Criteria andAddressIn(List<String> values) {
            addCriterion("address in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotIn(List<String> values) {
            addCriterion("address not in", values, "address");
            return (Criteria) this;
        }

        public Criteria andAddressBetween(String value1, String value2) {
            addCriterion("address between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andAddressNotBetween(String value1, String value2) {
            addCriterion("address not between", value1, value2, "address");
            return (Criteria) this;
        }

        public Criteria andNameIsNull() {
            addCriterion("name is null");
            return (Criteria) this;
        }

        public Criteria andNameIsNotNull() {
            addCriterion("name is not null");
            return (Criteria) this;
        }

        public Criteria andNameEqualTo(String value) {
            addCriterion("name =", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotEqualTo(String value) {
            addCriterion("name <>", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThan(String value) {
            addCriterion("name >", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameGreaterThanOrEqualTo(String value) {
            addCriterion("name >=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThan(String value) {
            addCriterion("name <", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLessThanOrEqualTo(String value) {
            addCriterion("name <=", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameLike(String value) {
            addCriterion("name like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotLike(String value) {
            addCriterion("name not like", value, "name");
            return (Criteria) this;
        }

        public Criteria andNameIn(List<String> values) {
            addCriterion("name in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotIn(List<String> values) {
            addCriterion("name not in", values, "name");
            return (Criteria) this;
        }

        public Criteria andNameBetween(String value1, String value2) {
            addCriterion("name between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andNameNotBetween(String value1, String value2) {
            addCriterion("name not between", value1, value2, "name");
            return (Criteria) this;
        }

        public Criteria andPhoneIsNull() {
            addCriterion("phone is null");
            return (Criteria) this;
        }

        public Criteria andPhoneIsNotNull() {
            addCriterion("phone is not null");
            return (Criteria) this;
        }

        public Criteria andPhoneEqualTo(String value) {
            addCriterion("phone =", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotEqualTo(String value) {
            addCriterion("phone <>", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneGreaterThan(String value) {
            addCriterion("phone >", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("phone >=", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLessThan(String value) {
            addCriterion("phone <", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLessThanOrEqualTo(String value) {
            addCriterion("phone <=", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneLike(String value) {
            addCriterion("phone like", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotLike(String value) {
            addCriterion("phone not like", value, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneIn(List<String> values) {
            addCriterion("phone in", values, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotIn(List<String> values) {
            addCriterion("phone not in", values, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneBetween(String value1, String value2) {
            addCriterion("phone between", value1, value2, "phone");
            return (Criteria) this;
        }

        public Criteria andPhoneNotBetween(String value1, String value2) {
            addCriterion("phone not between", value1, value2, "phone");
            return (Criteria) this;
        }

        public Criteria andWayIsNull() {
            addCriterion("way is null");
            return (Criteria) this;
        }

        public Criteria andWayIsNotNull() {
            addCriterion("way is not null");
            return (Criteria) this;
        }

        public Criteria andWayEqualTo(String value) {
            addCriterion("way =", value, "way");
            return (Criteria) this;
        }

        public Criteria andWayNotEqualTo(String value) {
            addCriterion("way <>", value, "way");
            return (Criteria) this;
        }

        public Criteria andWayGreaterThan(String value) {
            addCriterion("way >", value, "way");
            return (Criteria) this;
        }

        public Criteria andWayGreaterThanOrEqualTo(String value) {
            addCriterion("way >=", value, "way");
            return (Criteria) this;
        }

        public Criteria andWayLessThan(String value) {
            addCriterion("way <", value, "way");
            return (Criteria) this;
        }

        public Criteria andWayLessThanOrEqualTo(String value) {
            addCriterion("way <=", value, "way");
            return (Criteria) this;
        }

        public Criteria andWayLike(String value) {
            addCriterion("way like", value, "way");
            return (Criteria) this;
        }

        public Criteria andWayNotLike(String value) {
            addCriterion("way not like", value, "way");
            return (Criteria) this;
        }

        public Criteria andWayIn(List<String> values) {
            addCriterion("way in", values, "way");
            return (Criteria) this;
        }

        public Criteria andWayNotIn(List<String> values) {
            addCriterion("way not in", values, "way");
            return (Criteria) this;
        }

        public Criteria andWayBetween(String value1, String value2) {
            addCriterion("way between", value1, value2, "way");
            return (Criteria) this;
        }

        public Criteria andWayNotBetween(String value1, String value2) {
            addCriterion("way not between", value1, value2, "way");
            return (Criteria) this;
        }

        public Criteria andWeightIsNull() {
            addCriterion("weight is null");
            return (Criteria) this;
        }

        public Criteria andWeightIsNotNull() {
            addCriterion("weight is not null");
            return (Criteria) this;
        }

        public Criteria andWeightEqualTo(Integer value) {
            addCriterion("weight =", value, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightNotEqualTo(Integer value) {
            addCriterion("weight <>", value, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightGreaterThan(Integer value) {
            addCriterion("weight >", value, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightGreaterThanOrEqualTo(Integer value) {
            addCriterion("weight >=", value, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightLessThan(Integer value) {
            addCriterion("weight <", value, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightLessThanOrEqualTo(Integer value) {
            addCriterion("weight <=", value, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightIn(List<Integer> values) {
            addCriterion("weight in", values, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightNotIn(List<Integer> values) {
            addCriterion("weight not in", values, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightBetween(Integer value1, Integer value2) {
            addCriterion("weight between", value1, value2, "weight");
            return (Criteria) this;
        }

        public Criteria andWeightNotBetween(Integer value1, Integer value2) {
            addCriterion("weight not between", value1, value2, "weight");
            return (Criteria) this;
        }

        public Criteria andMoneyIsNull() {
            addCriterion("money is null");
            return (Criteria) this;
        }

        public Criteria andMoneyIsNotNull() {
            addCriterion("money is not null");
            return (Criteria) this;
        }

        public Criteria andMoneyEqualTo(Double value) {
            addCriterion("money =", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotEqualTo(Double value) {
            addCriterion("money <>", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyGreaterThan(Double value) {
            addCriterion("money >", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyGreaterThanOrEqualTo(Double value) {
            addCriterion("money >=", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyLessThan(Double value) {
            addCriterion("money <", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyLessThanOrEqualTo(Double value) {
            addCriterion("money <=", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyIn(List<Double> values) {
            addCriterion("money in", values, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotIn(List<Double> values) {
            addCriterion("money not in", values, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyBetween(Double value1, Double value2) {
            addCriterion("money between", value1, value2, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotBetween(Double value1, Double value2) {
            addCriterion("money not between", value1, value2, "money");
            return (Criteria) this;
        }

        public Criteria andKindsIsNull() {
            addCriterion("kinds is null");
            return (Criteria) this;
        }

        public Criteria andKindsIsNotNull() {
            addCriterion("kinds is not null");
            return (Criteria) this;
        }

        public Criteria andKindsEqualTo(String value) {
            addCriterion("kinds =", value, "kinds");
            return (Criteria) this;
        }

        public Criteria andKindsNotEqualTo(String value) {
            addCriterion("kinds <>", value, "kinds");
            return (Criteria) this;
        }

        public Criteria andKindsGreaterThan(String value) {
            addCriterion("kinds >", value, "kinds");
            return (Criteria) this;
        }

        public Criteria andKindsGreaterThanOrEqualTo(String value) {
            addCriterion("kinds >=", value, "kinds");
            return (Criteria) this;
        }

        public Criteria andKindsLessThan(String value) {
            addCriterion("kinds <", value, "kinds");
            return (Criteria) this;
        }

        public Criteria andKindsLessThanOrEqualTo(String value) {
            addCriterion("kinds <=", value, "kinds");
            return (Criteria) this;
        }

        public Criteria andKindsLike(String value) {
            addCriterion("kinds like", value, "kinds");
            return (Criteria) this;
        }

        public Criteria andKindsNotLike(String value) {
            addCriterion("kinds not like", value, "kinds");
            return (Criteria) this;
        }

        public Criteria andKindsIn(List<String> values) {
            addCriterion("kinds in", values, "kinds");
            return (Criteria) this;
        }

        public Criteria andKindsNotIn(List<String> values) {
            addCriterion("kinds not in", values, "kinds");
            return (Criteria) this;
        }

        public Criteria andKindsBetween(String value1, String value2) {
            addCriterion("kinds between", value1, value2, "kinds");
            return (Criteria) this;
        }

        public Criteria andKindsNotBetween(String value1, String value2) {
            addCriterion("kinds not between", value1, value2, "kinds");
            return (Criteria) this;
        }

        public Criteria andLNumberIsNull() {
            addCriterion("l_number is null");
            return (Criteria) this;
        }

        public Criteria andLNumberIsNotNull() {
            addCriterion("l_number is not null");
            return (Criteria) this;
        }

        public Criteria andLNumberEqualTo(String value) {
            addCriterion("l_number =", value, "lNumber");
            return (Criteria) this;
        }

        public Criteria andLNumberNotEqualTo(String value) {
            addCriterion("l_number <>", value, "lNumber");
            return (Criteria) this;
        }

        public Criteria andLNumberGreaterThan(String value) {
            addCriterion("l_number >", value, "lNumber");
            return (Criteria) this;
        }

        public Criteria andLNumberGreaterThanOrEqualTo(String value) {
            addCriterion("l_number >=", value, "lNumber");
            return (Criteria) this;
        }

        public Criteria andLNumberLessThan(String value) {
            addCriterion("l_number <", value, "lNumber");
            return (Criteria) this;
        }

        public Criteria andLNumberLessThanOrEqualTo(String value) {
            addCriterion("l_number <=", value, "lNumber");
            return (Criteria) this;
        }

        public Criteria andLNumberLike(String value) {
            addCriterion("l_number like", value, "lNumber");
            return (Criteria) this;
        }

        public Criteria andLNumberNotLike(String value) {
            addCriterion("l_number not like", value, "lNumber");
            return (Criteria) this;
        }

        public Criteria andLNumberIn(List<String> values) {
            addCriterion("l_number in", values, "lNumber");
            return (Criteria) this;
        }

        public Criteria andLNumberNotIn(List<String> values) {
            addCriterion("l_number not in", values, "lNumber");
            return (Criteria) this;
        }

        public Criteria andLNumberBetween(String value1, String value2) {
            addCriterion("l_number between", value1, value2, "lNumber");
            return (Criteria) this;
        }

        public Criteria andLNumberNotBetween(String value1, String value2) {
            addCriterion("l_number not between", value1, value2, "lNumber");
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