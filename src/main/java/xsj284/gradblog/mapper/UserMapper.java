package xsj284.gradblog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import xsj284.gradblog.domain.User;
import xsj284.gradblog.model.bo.LoginUserBO;

@Mapper
public interface UserMapper extends BaseMapper<User> {
    LoginUserBO getLoginUserByAccount(String account);
    
    Boolean insertUserByRegisterInfo(String account, String password);
}
