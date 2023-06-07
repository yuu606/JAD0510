package User;

public class User {
	private int User_Id;
	private int Role_Id;
	private String Username;
	private String Password;
	
	public User(int roleId, String username, String password) {
		Role_Id = roleId;
		Username = username;
		Password = password;
	}
	
	public int getUserId() {
		return User_Id;
	}
	
	public void setUserId(int userId) {
		User_Id = userId;
	}
	
	public int getRoleId() {
		return Role_Id;
	}
	
	public void setRoleId(int roleId) {
		Role_Id = roleId;
	}
	
	public String getUsername() {
		return Username;
	}
	
	public void setUsername(String username) {
		Username = username;
	}
	
	public String getPassword() {
		return Password;
	}
	
	public void setUPassword(String password) {
		Password = password;
	}
}
