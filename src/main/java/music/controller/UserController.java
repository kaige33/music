package music.controller;

import music.entity.User;
import music.service.UserSvice;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;


@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserSvice userSvice;
    @RequestMapping(value = "/login")
    public String login(String loginid, String password, HttpSession session){
        User userCustom=userSvice.login(loginid,password);
        if (userCustom!=null){
        session.setAttribute("userCustom",userCustom);
            return "head";
        }else {
            return "head";
        }

    }

    @RequestMapping("/register")
    public String  register(User user){
        userSvice.register(user);
        return "head";
    }

    @RequestMapping("/updatepwd")
    public String  updatepwd(User user){
        userSvice.updatepwd(user);
        return "head";
    }
    @RequestMapping(value = "/updateuser")
    public String  updateuser(User user){
        if (StringUtils.isNotEmpty(user.getBirth())){
            user.setBirthday(new java.sql.Date(new Date(user.getBirth().replace("-","/")).getTime()));
            userSvice.updateuser(user);
            return "head";
        }
        else {
            return "head";
        }



    }
}
