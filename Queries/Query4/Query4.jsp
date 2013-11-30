<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML>
	<HEAD>
		<TITLE>
			Query 4
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
		ResultSet rs = stmt.executeQuery("SELECT item_id FROM Item");
	%>

	4. Find the headquarter address along with city and state of all stores that hold stocks of an item above a particular level.
	<br><br>

	Item ID:
	<Form Action="Query4_result.jsp" , method =post name=Form1>  
  		<select name=Query4_select1 size=1>
   		<%
   		while (rs.next())
		{
		%> 
			<option><%= rs.getString("item_id")%></option>
		<%
		}
		%>
		</select>
		<br>
		Quantity greater than: <INPUT type="text" name=Query4_select2>
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