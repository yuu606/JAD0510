package book;

public class Book {
	private String ISBN;
	private String Title;
	private String Author;
	private String Publisher;
	private int Quantity;
	private double Price;
	
	public Book(String iSBN, String title, String author, String publisher, int quantity, double price) {
		ISBN = iSBN;
		Title = title;
		Author = author;
		Publisher = publisher;
		Quantity = quantity;
		Price = price;
	}
	
	public String getISBN() {
		return ISBN;
	}
	
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	
	public String getTitle() {
		return Title;
	}
	
	public void setTitle(String title) {
		Title = title;
	}
	
	public String getAuthor() {
		return Author;
	}
	
	public void setAuthor(String author) {
		Author = author;
	}
	
	public String getPublisher() {
		return Publisher;
	}
	
	public void setPublisher(String publisher) {
		Publisher = publisher;
	}
	
	public int getQuantity() {
		return Quantity;
	}
	
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	
	public double getPrice() {
		return Price;
	}
	
	public void setPrice(double price) {
		Price = price;
	}
}
