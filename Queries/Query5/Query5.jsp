<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML>
	<HEAD>
	<TITLE>
		Query5_result
	</TITLE>
	</HEAD>

	<BODY>
	<FONT SIZE = 3 COLOR = BLUE face="Arial">
	5. For each customer order, show the items ordered along with description, store id and city name and the stores that hold the items.
	<br>
	<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							  	
	String a, f1, f2, f3, f4;

	ResultSet rs1 = stmt.executeQuery("SELECT Order_no FROM Order");
	
	while (rs1.next())
	{
		a = rs1.getString("Order_no");
		ResultSet rs2 = stmt.executeQuery("SELECT Order_contains_items.item_id as id, item.description as des, store.store_id as store, city.city_name as city FROM Order_contains_items, item, store, city, Store_hold_Item WHERE Order_contains_items.order_no='"+a+"' AND Order_contains_items.item_id=item.item_id AND Store_hold_Item.item_id=item.item_id AND Store_hold_Item.store_id=store.store_id AND store.city_id=city.city_id;");
	%>
		<FONT SIZE = 4 COLOR = BLACK face="Arial">
		Order No. <%= a %>
		</FONT>
		<br>

		<TABLE  bgcolor=DodgerBlue>
		<TR  bgcolor=SkyBlue>
			<TD><B><font>Item ID</font></B></TD>
			<TD><B><font>Item Description</font></B></TD>
			<TD><B><font>Store ID</font></B></TD>
			<TD><B><font>City</font></B></TD>
		</TR>
		<%	
	 	while ( rs2.next())
		{
			f1 = rs.getString("id");
			f2 = rs.getString("des");
			f3 = rs.getString("store");
			f4 = rs.getString("city");
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
		<br><br>
		</TABLE>
	<%
	}
	%>
	</FONT>
	</BODY>
</HTML>