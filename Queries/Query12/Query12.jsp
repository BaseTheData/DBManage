<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML>
	<HEAD>
	<TITLE>
		Query12_result
	</TITLE>
	</HEAD>

	<BODY>
	<FONT SIZE = 3 COLOR = BLUE face="Arial">
	<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
							  	
	String f1;
		
	ResultSet rs = stmt.executeQuery("SELECT walkin.Walkin_customer_name as name FROM walkin ORDER BY walkin.Walkin_customer_name;");

	%>
	12. Find a list of walk-in customer sorted by name.
	<br><br>
	<TABLE  bgcolor=DodgerBlue>
		<TR  bgcolor=SkyBlue>
			<TD><B><font>Walkin Customer Name</font></B></TD>
		</TR>	
		<%	
	 	while ( rs.next())
		{
			f1 = rs.getString("name");
		%>
		<TR bgcolor=white>
			<TD><%= f1 %></TD>
		</TR>
	<%
	}
	%>
	</TABLE>	
	</FONT>
	</BODY>
</HTML>