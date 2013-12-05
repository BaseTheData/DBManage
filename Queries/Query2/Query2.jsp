<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML>
	<HEAD>
		<TITLE>
			Query 2
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
		ResultSet rs = stmt.executeQuery("SELECT store_id FROM store");
	%>

	2. Find all the orders along with customer id and order date that can be fulfilled by a given store.
	<br><br>

	Store ID:
	<Form Action="Query2_result.jsp" , method =post name=Form1>  
  		<select name=Query2_select size=1>
   		<%
   		while (rs.next())
		{
		%> 
			<option><%= rs.getString("store_id")%></option>
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