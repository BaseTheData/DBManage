<%@ page contentType="text/html; charset=Big5" import="java.util.*, java.io.*, java.sql.*, java.lang.*"%>
<HTML>
	<HEAD>
	<TITLE>
		Query3_result
	</TITLE>
	</HEAD>

	<BODY>
	<FONT SIZE = 3 COLOR = BLUE face="Arial">
	3. Find all stores along with city name and phone that hold items ordered by a given customer.
	<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							  	
	String a, f2, f3, f4;
	a = request.getParameter("Query3_select");
		
	ResultSet rs = stmt.executeQuery("SELECT Order_contains_items.item_id as id FROM Order_contains_items WHERE Order_contains_items.order_no = Orders.order_no AND Orders.Customer_id ='"+a+";");

	HashSet<String> h = new HashSet<String>();
	while (rs1.next())
		h.add(rs1.getString("id"));
	rs1.close();
	
	Iterator<String> i = h.iterator();

	while (i.hasNext())
	{
		a = i.next();
		rs = stmt.executeQuery("SELECT Store_hold_Item.store_id as stores, city.city_name as cityname, store.phone as phone FROM Store_hold_Item, store, city WHERE Store_hold_Item.item_id='"+a+"' AND Store_hold_Item.store_id=store.store_id AND store.city_id=city.city_id;");
	%>
	<br>
	<FONT SIZE = 4 COLOR = BLACK face="Arial">
		Item ID <%= a %>
		</FONT>
		<br>

	<TABLE  bgcolor=DodgerBlue>
		<TR  bgcolor=SkyBlue>
			<TD><B><font>Store ID</font></B></TD>
			<TD><B><font>City Name</font></B></TD>
			<TD><B><font>Phone Number</font></B></TD>
		</TR>	
		<%	
	 	while ( rs.next())
		{
			f2 = rs.getString("stores");
			f3 = rs.getString("cityname");
			f4 = rs.getString("phone");
		%>
		<TR bgcolor=white>
			<TD><%= f2 %></TD>
			<TD><%= f3 %></TD>
			<TD><%= f4 %></TD>
		</TR>
		<%
		}
		%>
	</TABLE>
	<%
	}
	%>
	</FONT>
	</BODY>
</HTML>