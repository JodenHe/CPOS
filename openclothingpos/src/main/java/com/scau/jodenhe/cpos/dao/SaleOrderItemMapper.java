package com.scau.jodenhe.cpos.dao;

import com.scau.jodenhe.cpos.entity.SaleOrderItem;
import com.scau.jodenhe.cpos.entity.SaleOrderItemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SaleOrderItemMapper {
    long countByExample(SaleOrderItemExample example);

    int deleteByExample(SaleOrderItemExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SaleOrderItem record);

    int insertSelective(SaleOrderItem record);

    List<SaleOrderItem> selectByExample(SaleOrderItemExample example);

    SaleOrderItem selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SaleOrderItem record, @Param("example") SaleOrderItemExample example);

    int updateByExample(@Param("record") SaleOrderItem record, @Param("example") SaleOrderItemExample example);

    int updateByPrimaryKeySelective(SaleOrderItem record);

    int updateByPrimaryKey(SaleOrderItem record);
}