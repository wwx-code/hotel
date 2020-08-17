package com.hotel.ssm.controller;

import com.hotel.ssm.domain.Product;
import com.hotel.ssm.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private IProductService productService;

    //查询全部产品
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Product> ps = productService.findAll();
        mv.addObject("productList",ps);
        mv.setViewName("product-list1");
        return mv;
    }

    //添加产品
    @RequestMapping("/save.do")
    public String save(Product product) throws Exception{
        productService.save(product);
        //保存完后重定向查询所有
        return "redirect:findAll.do";
    }
}
