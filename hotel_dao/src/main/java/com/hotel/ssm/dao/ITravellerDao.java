package com.hotel.ssm.dao;

import com.hotel.ssm.domain.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ITravellerDao {
    //首先从中间表order_traveller中根据订单id（orderid）查询出游客id（travellerid），然后从游客表（traveller）中把相应的数据找到
    @Select("SELECT * FROM traveller WHERE id IN (SELECT travellerid FROM order_traveller WHERE orderid = #{ordersId});")
    public List<Traveller> findByOrdersId(String ordersId) throws Exception;
}
