package xsj284.gradblog.model.bo;

import lombok.Data;

@Data
public class LoginUserBO {
    private Integer uid;
    private String account;
    private String password;
    private Boolean isDeleted;
}
