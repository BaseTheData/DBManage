<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML>
	<HEAD>
	<TITLE>
		Query8_result
	</TITLE>
	</HEAD>

	<BODY>
	<FONT SIZE = 3 COLOR = BLUE face="Arial">
	<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							  	
	String a, b, f1, f2, f3, f4, f5;
	a = request.getParameter("Query8_select");
		
	ResultSet rs = stmt.executeQuery("SELECT Order_contains_items.item_id as item, item.description as des, Order_contains_items.quantity_ordered as qo, Orders.Customer_id as customer, city.city_name as city FROM orders, item, Order_contains_items, customer, city WHERE Order_contains_items.order_no= '"+a+"' AND Order_contains_items.order_no=orders.order_no AND item.item_id=Order_contains_items.item_id AND Orders.Customer_id=Customer.Customer_id AND Customer.city_id=city.city_id;");
	%>
	8. Find the items, quantity ordered, customer and city of an order.
	<br><br>
	<TABLE  bgcolor=DodgerBlue>
		<TR  bgcolor=SkyBlue>
			<TD><B><font>Item ID</font></B></TD>
			<TD><B><font>Item Description</font></B></TD>
			<TD><B><font>Quantity Ordered</font></B></TD>
			<TD><B><font>Customer ID</font></B></TD>
			<TD><B><font>City Name</font></B></TD>
		</TR>	
		<%	
	 	while ( rs.next())
		{
			f1 = rs.getString("item");
			f2 = rs.getString("des");
			f3 = rs.getString("qo");
			f4 = rs.getString("customer");
			f5 = rs.getString("city");
		
		%>
		<TR bgcolor=white>
			<TD><%= f1 %></TD>
			<TD><%= f2 %></TD>
			<TD><%= f3 %></TD>
			<TD><%= f4 %></TD>
			<TD><%= f5 %></TD>
		</TR>
		<%
		}
		%>
	</TABLE>	
	</FONT>
	</BODY>
</HTML>