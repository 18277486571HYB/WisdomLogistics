package com.buuhybWL.www.dao;

import com.buuhybWL.www.bean.pageAddress;
import com.buuhybWL.www.bean.pageAddressExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface pageAddressMapper {
    long countByExample(pageAddressExample example);

    int deleteByExample(pageAddressExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(pageAddress record);

    int insertSelective(pageAddress record);

    List<pageAddress> selectByExample(pageAddressExample example);

    pageAddress selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") pageAddress record, @Param("example") pageAddressExample example);

    int updateByExample(@Param("record") pageAddress record, @Param("example") pageAddressExample example);

    int updateByPrimaryKeySelective(pageAddress record);

    int updateByPrimaryKey(pageAddress record);
}