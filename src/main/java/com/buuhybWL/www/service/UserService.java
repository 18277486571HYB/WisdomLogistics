package com.buuhybWL.www.service;

import com.buuhybWL.www.bean.User;
import com.buuhybWL.www.bean.UserExample;
import com.buuhybWL.www.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 黄渝斌
 */
@Service
public class UserService {


    @Autowired
    UserMapper userMapper;

    public Integer queryUserIdByUserName(String name){
        UserExample e = new UserExample();
        e.createCriteria().andUsernameEqualTo(name);
        List<User> users = userMapper.selectByExample(e);
        return users.get(0).getuId();
    }

    public List<User> getUserByName(String name){
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUsernameEqualTo(name);
        return userMapper.selectByExample(userExample);
    }

    public boolean queryIsEmptyUserName(String username) {
        UserExample example = new UserExample();
        example.createCriteria().andUsernameEqualTo(username);
        return userMapper.countByExample(example)==1;
    }


    public void createUser(User user) {
        userMapper.insertSelective(user);
    }

    public Integer getUserIdbyUsername(String username){
        UserExample u = new UserExample();
        u.createCriteria().andUsernameEqualTo(username);
        return userMapper.selectByExample(u).get(0).getuId();
    }

    public void updateUser(User user,User oldUser) {
        UserExample e = new UserExample();
        e.createCriteria().andUsernameEqualTo(oldUser.getUsername());
        e.createCriteria().andPasswordEqualTo(oldUser.getPassword());
        userMapper.updateByExampleSelective(user,e);
    }
}
