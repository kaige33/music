package music.entity;

import java.sql.Date;
import java.sql.Timestamp;


public class User {
    private String userid;
    private String  loginId;
    private String  password;
    private String userName;
    private String userSex;
    private String  userType;
    private String  sign;
    private String  headSculptureUrl;
    private Date registationDate;
    private  Date   birthday;
    private String birth;

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    private  String usertate;

    public String getUsertate() {
        return usertate;
    }

    public void setUsertate(String usertate) {
        this.usertate = usertate;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getLoginId() {
        return loginId;
    }

    public void setLoginId(String loginId) {
        this.loginId = loginId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getHeadSculptureUrl() {
        return headSculptureUrl;
    }

    public void setHeadSculptureUrl(String headSculptureUrl) {
        this.headSculptureUrl = headSculptureUrl;
    }

    public Date getRegistationDate() {
        return registationDate;
    }

    public void setRegistationDate(Date registationDate) {
        this.registationDate = registationDate;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
}


