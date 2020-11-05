package music.mapper;

import music.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    @Select("select * from user where loginId=#{loginid} and  password=#{password}")
    User login (@Param("loginid") String loginid ,@Param("password") String password);


    @Insert("insert into user(userId,loginId,password,userName,userSex,userType,sign,headSculptureUrl,registationDate,birthday,userstate) " +
            "values(uuid(),#{loginId},#{password},#{userName},null,null,null,null,now(),now(),'1')")
    void  register(User user);
    @Update("update user set password=#{password} where userId=#{userid}")
    void updatepwd(User user);
    @Update("update user set userName=#{userName},userSex=#{userSex},sign=#{sign},headSculptureUrl=#{headSculptureUrl},birthday=#{birthday} where userId=#{userid}")
    void updateuser(User user);
}
