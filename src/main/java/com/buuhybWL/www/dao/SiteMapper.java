package com.buuhybWL.www.dao;

import com.buuhybWL.www.bean.Site;
import com.buuhybWL.www.bean.SiteExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SiteMapper {
    long countByExample(SiteExample example);

    int deleteByExample(SiteExample example);

    int deleteByPrimaryKey(Integer sId);

    int insert(Site record);

    int insertSelective(Site record);

    List<Site> selectByExample(SiteExample example);

    Site selectByPrimaryKey(Integer sId);

    int updateByExampleSelective(@Param("record") Site record, @Param("example") SiteExample example);

    int updateByExample(@Param("record") Site record, @Param("example") SiteExample example);

    int updateByPrimaryKeySelective(Site record);

    int updateByPrimaryKey(Site record);
}