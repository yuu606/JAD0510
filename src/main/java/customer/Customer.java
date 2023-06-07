package customer;

import User.User;

public class Customer extends User{
	private int customerId;
	private String email;
	private String address;
	private String firstName;
	private String lastName;
	
	public Customer(int roleId, String username, String password) {
		super(roleId, username, password);
	}
	
	public int getCustomerId() {
		return customerId;
	}
	
	public void setCustomerId(int customerID) {
		customerId = customerID;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String Email) {
		email = Email;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String Address) {
		address = Address;
	}
	
	public String getFirstName() {
		return firstName;
	}
	
	public void setFirstName(String FirstName) {
		firstName = FirstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public void setLastName(String LastName) {
		lastName = LastName;
	}
	
	public int getUserId() {
		return super.getUserId();
	}
	
	public void setUserId(int userid) {
		super.setUserId(userid);
	}
}
