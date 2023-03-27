package xsj284.gradblog.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.util.Date;

/**
 * 用户表(前100000个保留为管理员账户)
 */
@Schema(description = "用户表(前100000个保留为管理员账户)")
@Data
@TableName(value = "tb_user")
public class User {
    /**
     * 用户id
     */
    @TableId(value = "uid", type = IdType.AUTO)
    @Schema(description = "用户id")
    private Integer uid;
    /**
     * 用户账号
     */
    @TableField(value = "account")
    @Schema(description = "用户账号")
    private String account;
    /**
     * 用户密码
     */
    @TableField(value = "`password`")
    @Schema(description = "用户密码")
    private String password;
    /**
     * 用户创建时间
     */
    @TableField(value = "create_time")
    @Schema(description = "用户创建时间")
    private Date createTime;
    /**
     * 用户密码更新时间
     */
    @TableField(value = "update_time")
    @Schema(description = "用户密码更新时间")
    private Date updateTime;
    /**
     * 是否已注销
     */
    @TableField(value = "is_deleted")
    @Schema(description = "是否已注销")
    private Boolean isDeleted;
}
