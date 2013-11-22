<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML>
	<HEAD>
	<TITLE>
		Query1_result
	</TITLE>
	</HEAD>

	<BODY>
	<FONT SIZE = 3 COLOR = BLUE face="Arial">
	<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							  	
	String a, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10;
	a = request.getParameter("Query1_select");
		
	ResultSet rs = stmt.executeQuery("SELECT item.item_id as a, store.store_id as b, city.city_id as c, city.city_name as d, city.state as e, store.phone as f, item.description as g,item.sizes as h, item.weight as i, item.unit_price as j from city, store, item, store_hold_item where city.city_id = store.city_id and store.store_id = store_hold_item.store_id and store_hold_item.item_id = item.item_id and item.item_id ='"+a+"' order by store.store_id;");

	%>
	1. Find all the stores along with city, state, phone, description, size, weight and unit price that hold a particular item of stock.
	<br><br>
	<TABLE  bgcolor=DodgerBlue>
		<TR  bgcolor=SkyBlue>
			<TD><B><font>item_id</font></B></TD>
			<TD><B><font>store_id</font></B></TD>
			<TD><B><font>city_id</font></B></TD>
			<TD><B><font>city_name</font></B></TD>
			<TD><B><font>state</font></B></TD>
			<TD><B><font>phone</font></B></TD>
			<TD><B><font>description</font></B></TD>
			<TD><B><font>sizes</font></B></TD>
			<TD><B><font>weight</font></B></TD>
			<TD><B><font>unit_price</font></B></TD>
		</TR>	
		<%	
	 	while ( rs.next())
		{
			f1 = rs.getString("a");
			f2 = rs.getString("b");
			f3 = rs.getString("c");
			f4 = rs.getString("d");
			f5 = rs.getString("e");
			f6 = rs.getString("f");
			f7 = rs.getString("g");
			f8 = rs.getString("h");
			f9 = rs.getString("i");
			f10 = rs.getString("j");
	
		%>
		<TR bgcolor=white>
			<TD><%= f1 %></TD>
			<TD><%= f2 %></TD>
			<TD><%= f3 %></TD>
			<TD><%= f4 %></TD>
			<TD><%= f5 %></TD>
			<TD><%= f6 %></TD>
			<TD><%= f7 %></TD>
			<TD><%= f8 %></TD>
			<TD><%= f9 %></TD>
			<TD><%= f10 %></TD>
		</TR>
	<%
	}
	%>
	</TABLE>	
	</FONT>
	</BODY>
</HTML>