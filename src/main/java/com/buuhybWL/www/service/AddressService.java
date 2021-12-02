package com.buuhybWL.www.service;

import com.buuhybWL.www.bean.pageAddress;
import com.buuhybWL.www.bean.pageAddressExample;
import com.buuhybWL.www.dao.pageAddressMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressService {

    @Autowired
    pageAddressMapper pageAddressMapper;

    public void insertAddress(pageAddress address){
        pageAddressMapper.insertSelective(address);
    }

    public void delAddress(Integer id){
        pageAddressMapper.deleteByPrimaryKey(id);
    }

    public void updateAddress(pageAddress address){
        pageAddressMapper.updateByPrimaryKeySelective(address);
    }

    public  List<pageAddress> selectAll(Integer id){
        pageAddressExample e = new pageAddressExample();
        e.createCriteria().andUIdEqualTo(id);
        return pageAddressMapper.selectByExample(e);
    }

    public void delPathAddress(List<Integer> list) {
        pageAddressExample e = new pageAddressExample();
        e.createCriteria().andIdIn(list);
        pageAddressMapper.deleteByExample(e);
    }

    public void updatePathAddress(pageAddress oldAddress,List<Integer> list) {
        pageAddressExample e = new pageAddressExample();
        e.createCriteria().andIdIn(list);
        pageAddressMapper.updateByExampleSelective(oldAddress,e);
    }

    public List<pageAddress> selectDetail(String s, Integer uId) {
        pageAddressExample e = new pageAddressExample();
        e.createCriteria().andUIdEqualTo(uId).andStatusEqualTo(s);
        return pageAddressMapper.selectByExample(e);
    }
}
