<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML>
	<HEAD>
	<TITLE>
		Query11_result
	</TITLE>
	</HEAD>

	<BODY>
	<FONT SIZE = 3 COLOR = BLUE face="Arial">
	<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							  	
	String f1, f2;
		
	ResultSet rs = stmt.executeQuery("SELECT Customer.customer_id as id, SUM(Order_contains_items.ordered_price) as sales FROM customer, orders, Order_contains_items WHERE Customer.Customer_id=orders.Customer_id AND Order_contains_items.order_no=orders.order_no ORDER BY sales;");

	%>
	11. Find a list of all customers sorted by sales volume in ascending order.
	<br><br>
	<TABLE  bgcolor=DodgerBlue>
		<TR  bgcolor=SkyBlue>
			<TD><B><font>Customer Name</font></B></TD>
			<TD><B><font>Sales Volume</font></B></TD>
		</TR>	
		<%	
	 	while ( rs.next())
		{
			f1 = rs.getString("id");
			f2 = rs.getString("sales");
		%>
		<TR bgcolor=white>
			<TD><%= f1 %></TD>
			<TD><%= f2 %></TD>
		</TR>
	<%
	}
	%>
	</TABLE>	
	</FONT>
	</BODY>
</HTML>