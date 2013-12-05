<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML><HEAD><TITLE>Insert into store from HTML</TITLE></HEAD><BODY>
<FONT SIZE = 3 COLOR = BLUE face="Arial">

<% Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
%>		
	<a href="input_store.jsp">Back to the form</a><br> 	
	<%								  	
        int a=1;
		String c1,c2,c3;
		String cr= "111";
		c1 = request.getParameter("sid");
		c2 = request.getParameter("scityid"); 
	    c3 = request.getParameter("spn"); 
	%> <hr>
	<%
	ResultSet rs = stmt.executeQuery("SELECT Store_id from Store WHERE Store_id = '"+c1+"';");
	
	if(rs.next()){
	%>	
			Data cannot be inserted	because this Store_id already exists.
	<%
	}
	else if(! (rs = stmt.executeQuery("SELECT City_id from City WHERE City_id = '"+c2+"';")).next()){
	%>	
			Data cannot be inserted	because this city doesn't exist.
	<%
	}
	else{
		try {
			cr = "INSERT INTO Store values ('" + c1 + "', '" + c2 + "', '" + c3 + "')";
			a = stmt.executeUpdate(cr);
		%>	
			Data successfully inserted.
		<%
		}
		catch (SQLException e) {
		%>	
			Data cannot be inserted because a value is incorrect.
		<%
		}
	}
	%>
</FONT>		
</H2></CENTER></BODY></HTML>
