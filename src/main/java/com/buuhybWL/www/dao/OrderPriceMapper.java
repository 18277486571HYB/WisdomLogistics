package com.buuhybWL.www.dao;

import com.buuhybWL.www.bean.OrderPrice;
import com.buuhybWL.www.bean.OrderPriceExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderPriceMapper {
    long countByExample(OrderPriceExample example);

    int deleteByExample(OrderPriceExample example);

    int deleteByPrimaryKey(Integer opId);

    int insert(OrderPrice record);

    int insertSelective(OrderPrice record);

    List<OrderPrice> selectByExample(OrderPriceExample example);

    OrderPrice selectByPrimaryKey(Integer opId);

    int updateByExampleSelective(@Param("record") OrderPrice record, @Param("example") OrderPriceExample example);

    int updateByExample(@Param("record") OrderPrice record, @Param("example") OrderPriceExample example);

    int updateByPrimaryKeySelective(OrderPrice record);

    int updateByPrimaryKey(OrderPrice record);
}