package order;

import book.Book;
import customer.Customer;

public class Order {
	private int orderId;
	private Customer customer;
	private Book book;
	private int orderQuantity;
	
	Order(int orderID, Customer Customer, Book Book, int OrderQuantity){
		orderId = orderID;
		customer = Customer;
		book = Book;
		orderQuantity = OrderQuantity;
	}
	
	public int getOrderId() {
		return orderId;
	}
	
	public void setOrderId(int orderID) {
		orderId = orderID;
	}
	
	public Customer getCustomer() {
		return customer;
	}
	
	public Book getBook() {
		return book;
	}
	
	public int getOrderQuantity() {
		return orderQuantity;
	}
	
	public void setOrderQuantity(int OrderQuantity) {
		orderQuantity = OrderQuantity;
	}
}
