package xsj284.gradblog.security;

import cn.dev33.satoken.stp.StpInterface;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Component;
import xsj284.gradblog.mapper.PermissionMapper;
import xsj284.gradblog.mapper.RoleMapper;

import java.util.List;

@Component
public class StpInterfaceImpl implements StpInterface {
    @Resource
    private PermissionMapper permissionMapper;
    @Resource
    private RoleMapper roleMapper;

    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        return permissionMapper.getPermissionListByUserId((Integer) loginId);
    }

    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        return roleMapper.getRoleListByUserId(Integer.parseInt(loginId.toString()));
    }
}
