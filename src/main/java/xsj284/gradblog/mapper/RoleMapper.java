package xsj284.gradblog.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import xsj284.gradblog.domain.Role;

import java.util.ArrayList;

@Mapper
public interface RoleMapper extends BaseMapper<Role> {
    ArrayList<String> getRoleListByUserId(Integer userId);
}
