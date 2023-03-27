package xsj284.gradblog.service;

import xsj284.gradblog.model.dto.LoginInfoDTO;

/**
 * 用户业务层
 *
 * @author xsj284
 */
public interface UserService {
    /**
     * 登录验证
     *
     * @param loginInfo 登录信息
     * @return 0:密码错误 1:登录成功 2:账号不存在
     */
    byte loginVerify(LoginInfoDTO loginInfo);

    /**
     * 注册验证
     *
     * @param registerInfo 注册信息
     * @return 0:账号已存在 1:注册成功 2.数据库插入失败
     */
    byte registerVerify(LoginInfoDTO registerInfo);
}
