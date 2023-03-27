package xsj284.gradblog.controller.common;

import lombok.Getter;

@Getter
public class R {
    /**
     * 返回状态码
     */
    private Integer code;
    /**
     * 返回消息
     */
    private String msg;
    /**
     * 返回内容
     */
    private Object data;

    public R() {
    }

    public R(Integer code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static R ok(Object data) {
        return new R(RHttpStatusEnum.SUCCESS.getCode(), RHttpStatusEnum.SUCCESS.getMsg(), data);
    }

    public static R ok(String msg, Object data) {
        return new R(RHttpStatusEnum.SUCCESS.getCode(), msg, data);
    }

    public static R error(RHttpStatusEnum rHttpStatusEnum) {
        return new R(rHttpStatusEnum.getCode(), rHttpStatusEnum.getMsg(), null);
    }

    public static R error(Integer code, String msg) {
        R r = new R();
        r.code(code).msg(msg).data(null);
        return r;
    }

    public R code(Integer code) {
        this.code = code;
        return this;
    }

    public R msg(String msg) {
        this.msg = msg;
        return this;
    }

    public R data(Object data) {
        this.data = data;
        return this;
    }
}
