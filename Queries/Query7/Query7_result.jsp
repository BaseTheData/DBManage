<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML>
	<HEAD>
	<TITLE>
		Query7_result
	</TITLE>
	</HEAD>

	<BODY>
	<FONT SIZE = 3 COLOR = BLUE face="Arial">
	<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							  	
	String a, b, f1, f2, f3, f4;
	a = request.getParameter("Query7_select1");
	b = request.getParameter("Query7_select2");
		
	ResultSet rs = stmt.executeQuery("SELECT SUM(Store_hold_Item.quantity_held) as stock, city.city_name as city, item.item_id as id, item.description as des FROM Store_hold_Item, city, store WHERE Store_hold_Item.item_id='"+b+"' AND store.store_id=Store_hold_Item.store_id AND city.city_id=store.city_id AND city.city_name='"+a+"';");
	%>
	7. Find the stock level of a particular item in all stores in a particular city.
	<br><br>
	<TABLE  bgcolor=DodgerBlue>
		<TR  bgcolor=SkyBlue>
			<TD><B><font>City</font></B></TD>
			<TD><B><font>Item ID</font></B></TD>
			<TD><B><font>Item Description</font></B></TD>
			<TD><B><font>Stock</font></B></TD>
		</TR>	
		<%	
	 	while ( rs.next())
		{
			f1 = rs.getString("city");
			f2 = rs.getString("id");
			f3 = rs.getString("des");
			f4 = rs.getString("stock");
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