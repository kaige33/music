package music.service.impl;

import music.entity.User;
import music.mapper.UserMapper;
import music.service.UserSvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserSviceimpl implements UserSvice {
@Autowired
private UserMapper userMapper;
    @Override
    public User login(String loginid, String password) {
        return userMapper.login(loginid,password);
    }

    @Override
    public void register(User user) {
        userMapper.register(user);
    }

    @Override
    public void updatepwd(User user) {
        userMapper.updatepwd(user);
    }

    @Override
    public void updateuser(User user) {
        userMapper.updateuser(user);
    }
}
