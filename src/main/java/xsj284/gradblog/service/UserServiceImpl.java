package xsj284.gradblog.service;

import cn.dev33.satoken.stp.StpUtil;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import xsj284.gradblog.mapper.UserMapper;
import xsj284.gradblog.model.bo.LoginUserBO;
import xsj284.gradblog.model.dto.LoginInfoDTO;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    @Override
    public byte loginVerify(LoginInfoDTO loginInfo) {
        LoginUserBO loginUser = userMapper.getLoginUserByAccount(loginInfo.getAccount());
        if (loginUser == null || loginUser.getIsDeleted()) {
            return 2;
        }
        boolean isPasswordCorrect = loginUser.getPassword().equals(loginInfo.getPassword());
        if (isPasswordCorrect) {
            StpUtil.login(loginUser.getUid());
            return 1;
        } else {
            return 0;
        }
    }

    @Override
    public byte registerVerify(LoginInfoDTO registerInfo) {
        LoginUserBO loginUser = userMapper.getLoginUserByAccount(registerInfo.getAccount());
        if (loginUser == null) {
            if (userMapper.insertUserByRegisterInfo(registerInfo.getAccount(), registerInfo.getPassword())) {
                return 1;
            }
            return 2;
        } else if (loginUser.getIsDeleted()) {
            return 0;
        }
        return 0;
    }
}
