package xsj284.gradblog.controller.common;

import lombok.Getter;

@Getter
public class RT<T> {

    private Integer code;

    private String msg;

    private T data;

    public RT() {
    }

    public RT(Integer code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static <T> RT<T> ok(T data) {
        return new RT<>(RHttpStatusEnum.SUCCESS.getCode(), RHttpStatusEnum.SUCCESS.getMsg(), data);
    }

    public static <T> RT<T> ok(T data, String msg) {
        return new RT<>(RHttpStatusEnum.SUCCESS.getCode(), msg, data);
    }

    public static <T> RT<T> error(RHttpStatusEnum rHttpStatusEnum) {
        return new RT<>(rHttpStatusEnum.getCode(), rHttpStatusEnum.getMsg(), null);
    }

    public static <T> RT<T> error(Integer code, String msg) {
        RT<T> r = new RT<>();
        r.code(code).msg(msg).data(null);
        return r;
    }

    public RT<T> code(Integer code) {
        this.code = code;
        return this;
    }

    public RT<T> msg(String msg) {
        this.msg = msg;
        return this;
    }

    public RT<T> data(T data) {
        this.data = data;
        return this;
    }
}
