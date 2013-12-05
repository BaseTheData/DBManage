<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML>
	<HEAD>
		<TITLE>
			Query 3
		</TITLE>
	</HEAD>

	<BODY>
	<FONT SIZE = 3 COLOR = BLUE face="Arial">
	<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
						  	
	try
	{ 
		ResultSet rs = stmt.executeQuery("SELECT customer_id FROM Customer");
	%>

	3. Find all stores along with city name and phone that hold items ordered by a given customer.
	<br><br>

	Customer ID:
	<Form Action="Query3_result.jsp" , method =post name=Form1>  
  		<select name=Query3_select size=1>
   		<%
   		while (rs.next())
		{
		%> 
			<option><%= rs.getString("customer_id")%></option>
		<%
		}
		%>
		</select>
		<Input type="submit" value="Find" name=submit1>
	</Form>
	<%
	}
	catch (SQLException e)
	{
    %>
    <br>
    No record in database or unable to connect to database
    <%
	}   
  	%>
  	<br> 
  	</FONT>
	</BODY>
</HTML>