<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML>
	<HEAD>
		<TITLE>
			Query 7
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
		ResultSet rs = stmt.executeQuery("SELECT city_name FROM City");
	%>

	7. Find the stock level of a particular item in all stores in a particular city.
	<br><br>

	City name:
	<Form Action="Query7_result.jsp" , method =post name=Form1>  
  		<select name=Query7_select1 size=1>
   		<%
   		while (rs.next())
		{
		%> 
			<option><%= rs.getString("city_name")%></option>
		<%
		}
		%>
		</select>
		<select name=Query7_select2 size=1>
   		<%
		rs = stmt.executeQuery("SELECT item_id FROM Item");
   		while (rs.next())
		{
		%> 
			<option><%= rs.getString("item_id")%></option>
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