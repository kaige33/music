package music.service;

import music.entity.User;

public interface UserSvice {
User login (String loginid , String password);
    void  register(User user);
    void updatepwd(User user);
    void updateuser(User user);
}
