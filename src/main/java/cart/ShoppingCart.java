package cart;

import java.util.ArrayList;

import customer.Customer;
import order.Order;

public class ShoppingCart {
	private int cartId;
	private Customer customer;
	private ArrayList<Order> orders;
	
	ShoppingCart(int cartID, Customer Customer, ArrayList<Order> Orders){
		cartId = cartID;
		customer = Customer;
		orders = Orders;
	}
	
	public int getCartId() {
		return cartId;
	}
	
	public void setCartId(int cartID) {
		cartId = cartID;
	}
	
	public Customer getCustomer() {
		return customer;
	}
	
	public ArrayList<Order> getOrderArray() {
		return orders;
	}
}
