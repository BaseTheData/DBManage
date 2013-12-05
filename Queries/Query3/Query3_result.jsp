<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML>
	<HEAD>
	<TITLE>
		Query3_result
	</TITLE>
	</HEAD>

	<BODY>
	<FONT SIZE = 3 COLOR = BLUE face="Arial">
	<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							  	
	String a, f1, f2, f3, f4;
	a = request.getParameter("Query3_select");
		
	ResultSet rs = stmt.executeQuery("SELECT Store_hold_Item.item_id as items, Store_hold_Item.store_id as stores, city.city_name as city, store.phone as phone FROM Store_hold_Item, store, city WHERE (Store_hold_Item.item_id IN (SELECT Order_contains_items.item_id FROM Order_contains_items WHERE Order_contains_items.order_no = Orders.order_no AND Orders.Customer_id ='"+a+"')) AND Store_hold_Item.store_id=store.store_id AND store.city_id=city.city_id;");
	%>
	3. Find all stores along with city name and phone that hold items ordered by a given customer.
	<br><br>
	<TABLE  bgcolor=DodgerBlue>
		<TR  bgcolor=SkyBlue>
			<TD><B><font>Item ID</font></B></TD>
			<TD><B><font>Store ID</font></B></TD>
			<TD><B><font>City Name</font></B></TD>
			<TD><B><font>Phone Number</font></B></TD>
		</TR>	
		<%	
	 	while ( rs.next())
		{
			f1 = rs.getString("items");
			f2 = rs.getString("stores");
			f3 = rs.getString("city");
			f4 = rs.getString("phone");
		%>
		<TR bgcolor=white>
			<TD><%= f1 %></TD>
			<TD><%= f2 %></TD>
			<TD><%= f3 %></TD>
			<TD><%= f4 %></TD>
		</TR>
	<%
	}
	%>
	</TABLE>	
	</FONT>
	</BODY>
</HTML>