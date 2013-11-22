<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML>
	<HEAD>
		<TITLE>
			Query 1
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
		ResultSet rs = stmt.executeQuery("SELECT  Item_ID FROM Item");
	%>

	1. Find all the stores along with city, state, phone, description, size, weight and unit price that hold a particular item of stock.
	<br><br>

	Item_ID:
	<Form Action="Query1_result.jsp" , method =post name=Form1>  
  		<select name=Query1_select size=1>
   		<%
   		while (rs.next())
		{
		%> 
			<option><%= rs.getString("Item_ID")%></option>
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