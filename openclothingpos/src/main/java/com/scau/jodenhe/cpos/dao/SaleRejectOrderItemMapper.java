package com.scau.jodenhe.cpos.dao;

import com.scau.jodenhe.cpos.entity.SaleRejectOrderItem;
import com.scau.jodenhe.cpos.entity.SaleRejectOrderItemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SaleRejectOrderItemMapper {
    long countByExample(SaleRejectOrderItemExample example);

    int deleteByExample(SaleRejectOrderItemExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SaleRejectOrderItem record);

    int insertSelective(SaleRejectOrderItem record);

    List<SaleRejectOrderItem> selectByExample(SaleRejectOrderItemExample example);

    SaleRejectOrderItem selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SaleRejectOrderItem record, @Param("example") SaleRejectOrderItemExample example);

    int updateByExample(@Param("record") SaleRejectOrderItem record, @Param("example") SaleRejectOrderItemExample example);

    int updateByPrimaryKeySelective(SaleRejectOrderItem record);

    int updateByPrimaryKey(SaleRejectOrderItem record);
}