package com.wechat.domain.json;

/**
 * Created with IntelliJ IDEA.
 * User: YUNFENG
 * Date: 13-5-9
 * Time: ����12:44
 * To change this template use File | Settings | File Templates.
 */
public class RegisterJSON {
    private Integer status;
    private String mess;
    private String code;

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
