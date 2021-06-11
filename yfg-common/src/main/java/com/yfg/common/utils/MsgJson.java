package com.yfg.common.utils;

public class MsgJson {
//	private boolean success=true;
//	private String msg="请求成功";
//	private Object obj;
	
	
	private String code;
	private Object data;
	private String msg;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	@Override
	public String toString() {
		return "MsgJson [code=" + code + ", data=" + data + ", msg=" + msg + "]";
	}
	
	
	
}
