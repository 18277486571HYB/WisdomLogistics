package com.buuhybWL.www.service;

import com.buuhybWL.www.bean.Logistics;
import com.buuhybWL.www.bean.LogisticsExample;
import com.buuhybWL.www.dao.LogisticsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 黄渝斌
 */
@Service
public class LogisticsService {

    @Autowired
    LogisticsMapper logisticsMapper;


    public void create(Logistics newLogistics) {
        logisticsMapper.insertSelective(newLogistics);
    }

    public List<Logistics> queryBathLogistics(List<String> list) {
        LogisticsExample e = new LogisticsExample();
        e.createCriteria().andLNumberIn(list);
        return logisticsMapper.selectByExampleWithOrders(e);
    }

    public List<Logistics> queryByNumber(String number) {
        LogisticsExample e = new LogisticsExample();
        e.createCriteria().andLNumberEqualTo(number);
        return logisticsMapper.selectByExampleWithOrders(e);
    }

    public List<Logistics> queryByPhone(String phone) {
        LogisticsExample e = new LogisticsExample();
        e.createCriteria().andToPhoneEqualTo(phone);
        e.or(e.createCriteria().andPhoneEqualTo(phone));
        return logisticsMapper.selectByExampleWithOrders(e);
    }
}
