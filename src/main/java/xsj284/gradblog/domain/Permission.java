package xsj284.gradblog.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 权限表
 */
@Schema(description = "权限表")
@Data
@TableName(value = "tb_permission")
public class Permission {
    public static final String COL_ID = "id";
    public static final String COL_VALUE = "value";
    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    @Schema(description = "id")
    private Integer id;
    /**
     * 权限值
     */
    @TableField(value = "`value`")
    @Schema(description = "权限值")
    private String value;
}
