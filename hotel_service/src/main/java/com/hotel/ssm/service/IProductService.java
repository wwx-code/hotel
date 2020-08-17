package com.hotel.ssm.service;

import com.hotel.ssm.domain.Product;

import java.util.List;

public interface IProductService {

    //查询所有的产品信息
    public List<Product> findAll() throws Exception;

    //添加产品
    void save(Product product) throws Exception;
}
