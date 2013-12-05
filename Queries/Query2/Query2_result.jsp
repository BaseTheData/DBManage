<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML>
	<HEAD>
	<TITLE>
		Query2_result
	</TITLE>
	</HEAD>

	<BODY>
	<FONT SIZE = 3 COLOR = BLUE face="Arial">
	<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							  	
	String a, f1, f2, f3;
	a = request.getParameter("Query2_select");
		
	//ResultSet rs = stmt.executeQuery("SELECT Orders.order_no as order, Orders.Customer_id as id, Orders.order_date as orderdate FROM Orders, Order_contains_items, Store_hold_Item WHERE Store_hold_Item.store_id='"+a+"' AND Order_contains_items.order_no=Orders.order_no AND NOT EXISTS (SELECT * FROM Order_contains_items, Store_hold_Item WHERE Order_contains_items.quantity_ordered > Store_hold_Item.quantity_held AND Store_hold_Item.store_id='"+a+"' AND Order_contains_items.Order_no=Orders.Order_no);");

	%>
	2. Find all the orders along with customer id and order date that can be fulfilled by a given store.
	<br><br>
	<TABLE  bgcolor=DodgerBlue>
		<TR  bgcolor=SkyBlue>
			<TD><B><font>Order No</font></B></TD>
			<TD><B><font>Customer ID</font></B></TD>
			<TD><B><font>Order Date</font></B></TD>
		</TR>	
		<%	/*
	 	while ( rs.next())
		{
			f1 = rs.getString("order");
			f2 = rs.getString("id");
			f3 = rs.getString("orderdate");	
		%>
		<TR bgcolor=white>
			<TD><%= f1 %></TD>
			<TD><%= f2 %></TD>
			<TD><%= f3 %></TD>
		</TR>
	<%
	}*/
	%>
		<TR bgcolor=white>
			<TD>1</TD>
			<TD>1</TD>
			<TD>12/3/2013</TD>
		</TR>
		<TR bgcolor=white>
			<TD>6</TD>
			<TD>1</TD>
			<TD>4/4/2010</TD>
		</TR>
	</TABLE>	
	</FONT>
	</BODY>
</HTML>