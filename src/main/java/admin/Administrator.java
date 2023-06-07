package admin;

import User.User;

public class Administrator extends User{
	private int adminId;
	
	public Administrator(int roleId, String username, String password) {
		super(roleId, username, password);
	}
	
	public int getAdminId() {
		return adminId;
	}
	
	public void setAdminId(int adminID) {
		adminId = adminID;
	}
	
	public int getUserId() {
		return super.getUserId();
	}
	
	public void setUserId(int userid) {
		super.setUserId(userid);
	}
}
