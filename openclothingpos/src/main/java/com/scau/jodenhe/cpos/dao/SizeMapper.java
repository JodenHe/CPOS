package com.scau.jodenhe.cpos.dao;

import com.scau.jodenhe.cpos.entity.Size;
import com.scau.jodenhe.cpos.entity.SizeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SizeMapper {
    long countByExample(SizeExample example);

    int deleteByExample(SizeExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Size record);

    int insertSelective(Size record);

    List<Size> selectByExample(SizeExample example);

    Size selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Size record, @Param("example") SizeExample example);

    int updateByExample(@Param("record") Size record, @Param("example") SizeExample example);

    int updateByPrimaryKeySelective(Size record);

    int updateByPrimaryKey(Size record);
}