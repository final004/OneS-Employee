package com.hanains.webrtc.vo;

public class CounselVo {
	private String employeeId;
	private String password;
	
	public CounselVo(){
		
	}
	
	public CounselVo(String employeeId, String password) {
		super();
		this.employeeId = employeeId;
		this.password = password;
	}
	
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "CounselVo [employeeId=" + employeeId + ", password=" + password + "]";
	}
}
