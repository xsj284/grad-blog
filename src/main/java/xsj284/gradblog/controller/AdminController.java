package xsj284.gradblog.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import xsj284.gradblog.annotation.ApiV1RestController;
import xsj284.gradblog.controller.common.R;
import xsj284.gradblog.model.dto.LoginInfoDTO;
import xsj284.gradblog.service.UserService;

/**
 * @author xsj284
 */
@ApiV1RestController
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private UserService userService;

    /**
     * 登录请求
     *
     * @param loginInfo 登录信息
     * @return 登录结果
     */
    @SaIgnore
    @PostMapping("/login")
    public R login(@RequestBody LoginInfoDTO loginInfo) {
        R r;
        switch (userService.loginVerify(loginInfo)) {
            case 0 -> r = R.error(3001, "password_incorrect");
            case 1 -> r = R.ok(null);
            case 2 -> r = R.error(3002, "account_not_exist");
            default -> r = R.error(3003, "unknown_error");
        }
        return r;
    }

    /**
     * 注册请求
     *
     * @return 注册结果
     */
    @PostMapping("/register")
    public R register(@RequestBody LoginInfoDTO registerInfo) {
        R r;
        switch (userService.registerVerify(registerInfo)) {
            case 0 -> r = R.error(3004, "account_exist");
            case 1 -> r = R.ok(null);
            case 2 -> r = R.error(3005, "insert_error");
            default -> r = R.error(3006, "unknown_error");
        }
        return r;
    }

    @GetMapping
    public R test() {
        return R.ok(null);
    }
}
