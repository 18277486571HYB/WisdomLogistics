package com.buuhybWL.www.dao;

import com.buuhybWL.www.bean.Logistics;
import com.buuhybWL.www.bean.LogisticsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface LogisticsMapper {
    long countByExample(LogisticsExample example);

    int deleteByExample(LogisticsExample example);

    int deleteByPrimaryKey(Integer lId);

    int insert(Logistics record);

    int insertSelective(Logistics record);

    List<Logistics> selectByExample(LogisticsExample example);

    Logistics selectByPrimaryKey(Integer lId);

    List<Logistics> selectByExampleWithOrders(LogisticsExample example);

    Logistics selectByPrimaryKeyWithOrders(Integer lId);

    int updateByExampleSelective(@Param("record") Logistics record, @Param("example") LogisticsExample example);

    int updateByExample(@Param("record") Logistics record, @Param("example") LogisticsExample example);

    int updateByPrimaryKeySelective(Logistics record);

    int updateByPrimaryKey(Logistics record);
}