package com.hotel.ssm.service;

import com.hotel.ssm.domain.Orders;

import java.util.List;

public interface IOrdersService {
    //查询所有订单
    List<Orders> findAll(int page,int size) throws Exception;

    //根据id查询订单
    Orders findById(String ordersId) throws Exception;
}
