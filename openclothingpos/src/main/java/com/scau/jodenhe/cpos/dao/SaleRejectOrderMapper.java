package com.scau.jodenhe.cpos.dao;

import com.scau.jodenhe.cpos.entity.SaleRejectOrder;
import com.scau.jodenhe.cpos.entity.SaleRejectOrderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SaleRejectOrderMapper {
    long countByExample(SaleRejectOrderExample example);

    int deleteByExample(SaleRejectOrderExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SaleRejectOrder record);

    int insertSelective(SaleRejectOrder record);

    List<SaleRejectOrder> selectByExample(SaleRejectOrderExample example);

    SaleRejectOrder selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SaleRejectOrder record, @Param("example") SaleRejectOrderExample example);

    int updateByExample(@Param("record") SaleRejectOrder record, @Param("example") SaleRejectOrderExample example);

    int updateByPrimaryKeySelective(SaleRejectOrder record);

    int updateByPrimaryKey(SaleRejectOrder record);
}