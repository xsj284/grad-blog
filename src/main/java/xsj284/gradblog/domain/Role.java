package xsj284.gradblog.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 角色表
 */
@Schema(description = "角色表")
@Data
@TableName(value = "tb_role")
public class Role {
    public static final String COL_ID = "id";
    public static final String COL_VALUE = "value";
    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    @Schema(description = "id")
    private Integer id;
    /**
     * 角色值
     */
    @TableField(value = "`value`")
    @Schema(description = "角色值")
    private String value;
}
