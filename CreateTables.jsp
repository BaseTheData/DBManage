<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, , java.sql.*"%>
<HTML> <HEAD> <TITLE>CS3462_TableCreation.jsp</TITLE> </HEAD>
<BODY> <CENTER> <FONT SIZE = 5 COLOR = blue>Create Project Table</FONT> </CENTER> <HR> 
<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

	ResultSet rs;
						  	
    int a=1; int i;
		
    Statement statement = con.createStatement();
								
    String command = "CREATE TABLE States (State CHAR(20), Headquarter_addr CHAR(4), PRIMARY KEY(State));";
	statement.executeUpdate(command);

	command = "CREATE TABLE City (City_id CHAR(4), City_name CHAR(15), State CHAR(15), PRIMARY KEY(City_id), FOREIGN KEY(State) REFERENCES States(State));";
	statement.executeUpdate(command);
	
	command = "CREATE TABLE Store(Store_id CHAR(4), City_id CHAR(4), Phone CHAR(8), PRIMARY KEY(Store_id), FOREIGN KEY(City_id) REFERENCES City(City_id));";
	statement.executeUpdate(command);

	command = "CREATE TABLE Item (Item_id CHAR(4), Description CHAR(40), Sizes CHAR(40), Weight REAL, Unit_price REAL, PRIMARY KEY(Item_id));";
	statement.executeUpdate(command);

	command = "CREATE TABLE Store_hold_Item (Store_id CHAR(4), Item_id CHAR(4), Quantity_held INT, PRIMARY KEY(Store_id, Item_id), FOREIGN KEY(Store_id) REFERENCES Store(Store_id), FOREIGN KEY (Item_id) REFERENCES Item(Item_id));";
	statement.executeUpdate(command);
	
	command = "CREATE TABLE Customer (Customer_id CHAR(4), First_order_date DATE, City_id CHAR(4), PRIMARY KEY(Customer_id), FOREIGN KEY(City_id) REFERENCES City(City_id));";
	statement.executeUpdate(command);

	command = "CREATE TABLE Order (Order_no INT, Order_date DATE, Customer_id CHAR(4), PRIMARY KEY(Order_no), FOREIGN KEY(Customer_id) REFERENCES Customer(Customer_id));";
	statement.executeUpdate(command);

	command = "CREATE TABLE Order_contains_items (Item_id CHAR(4), Order_no INT, Quantity_ordered INT, Ordered_price REAL, PRIMARY KEY(Item_id, Order_no), FOREIGN KEY(Order_no) REFERENCES Order(Order_no), FOREIGN KEY(Item_id) REFERENCES Item(Item_id));";
	statement.executeUpdate(command);

	command = "CREATE TABLE Person (Customer_id CHAR(4), PRIMARY KEY(Customer_id));";
	statement.executeUpdate(command);

	command = "CREATE TABLE Company (Customer_id CHAR(4), PRIMARY KEY(Customer_id));";
	statement.executeUpdate(command);

	command = "CREATE TABLE Government (Customer_id CHAR(4), PRIMARY KEY(Customer_id));";
	statement.executeUpdate(command);

	command = "CREATE TABLE Employee (Customer_id CHAR(4), Employee_customer_name CHAR(15), Employee_discount_rate FLOAT, Headquarter_addr CHAR(4), PRIMARY KEY(Customer_id), FOREIGN KEY(Customer_id) REFERENCES Customer(Customer_id));";
	statement.executeUpdate(command);

	command = "CREATE TABLE Regular (Customer_id CHAR(4), Regular_customer_name CHAR(15), Regular_customer_address CHAR(80), PRIMARY KEY(Customer_id), FOREIGN KEY(Customer_id) REFERENCES Customer(Customer_id));";
	statement.executeUpdate(command);

	command = "CREATE TABLE WalkIn (Customer_id CHAR(4), Walkin_customer_name CHAR(15), Walkin_customer_address CHAR(80), PRIMARY KEY(Customer_id), FOREIGN KEY(Customer_id) REFERENCES Customer(Customer_id));";
	statement.executeUpdate(command);

	command = "CREATE TABLE ECommerce (Customer_id CHAR(4), Ecommerce_customer_name CHAR(15), Ecommerce_customer_email CHAR(80), PRIMARY KEY(Customer_id), FOREIGN KEY(Customer_id)  REFERENCES Customer(Customer_id));";
	statement.executeUpdate(command);

	if(stmt != null) stmt.close(); 
	if(con != null) con.close(); 
%>
</BODY>
</HTML>