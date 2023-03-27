package xsj284.gradblog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import xsj284.gradblog.domain.Permission;

import java.util.ArrayList;

@Mapper
public interface PermissionMapper extends BaseMapper<Permission> {

    ArrayList<String> getPermissionListByUserId(int userId);
}
