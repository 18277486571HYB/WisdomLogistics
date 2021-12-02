package com.buuhybWL.www.service;

import com.buuhybWL.www.bean.OrderPrice;
import com.buuhybWL.www.bean.OrderPriceExample;
import com.buuhybWL.www.dao.OrderPriceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 黄渝斌
 */
@Service
public class OrderPriceService {


    @Autowired
    OrderPriceMapper orderPriceMapper;

    public Double getPrice(Integer weight, String kinds) {

        OrderPriceExample e = new OrderPriceExample();
        e.createCriteria().andOpWeightEqualTo(weight);
        e.createCriteria().andOpKindsEqualTo(kinds);
        List<OrderPrice> orderPrices = orderPriceMapper.selectByExample(e);
        if (orderPrices.size()==0){
            return 0.00;
        }
        return orderPrices.get(0).getOpPrice();
    }
}
