package xsj284.gradblog.controller.common;

import lombok.Getter;

@Getter
public enum RHttpStatusEnum {
    SUCCESS(200, "success"),
    HTTP_NOT_FOUND(404, "未找到相关内容"),
    SERVER_ERROR(500, "服务器忙，请稍后在试");

    private final Integer code;
    private final String msg;

    RHttpStatusEnum(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
