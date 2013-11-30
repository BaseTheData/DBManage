<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML>
	<HEAD>
	<TITLE>
		Query4_result
	</TITLE>
	</HEAD>

	<BODY>
	<FONT SIZE = 3 COLOR = BLUE face="Arial">
	<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							  	
	String a, b, f1, f2, f3, f4;
	a = request.getParameter("Query4_select1");
	b = request.getParameter("Query4_select2");
		
	ResultSet rs = stmt.executeQuery("SELECT city.city_name as city, state.state as state, state.headquarter_addr as hq, Store_hold_Item.quantity_held as stock FROM city, state, Store_hold_Item, store WHERE Store_hold_Item.item_id='"+a"' AND Store_hold_Item.quantity_held>'"+b+"' AND Store_hold_Item.store_id=store.store_id AND store.city_id=city.city_id AND city.state=state.state;");
	%>
	4. Find the headquarter address along with city and state of all stores that hold stocks of an item above a particular level.
	<br><br>
	<TABLE  bgcolor=DodgerBlue>
		<TR  bgcolor=SkyBlue>
			<TD><B><font>City</font></B></TD>
			<TD><B><font>State</font></B></TD>
			<TD><B><font>Headquarter Address</font></B></TD>
			<TD><B><font>Stock</font></B></TD>
		</TR>	
		<%	
	 	while ( rs.next())
		{
			f1 = rs.getString("city");
			f2 = rs.getString("state");
			f3 = rs.getString("hq");
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