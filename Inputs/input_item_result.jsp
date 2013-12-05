<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML><HEAD><TITLE>Insert into items from HTML</TITLE></HEAD><BODY>
<FONT SIZE = 3 COLOR = BLUE face="Arial">

<% Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
%>		
	<a href="input_item.jsp">Back to the form</a><br> 	
	<%								  	
        int a=1;
		String c1,c2,c3,c4,c5;
		String cr= "111";
		c1 = request.getParameter("iid");
		c2 = request.getParameter("idesc"); 
	    c3 = request.getParameter("isize"); 
		c4 = request.getParameter("iw"); 
		c5 = request.getParameter("iup"); 
	%> <hr>
	<%
	ResultSet rs = stmt.executeQuery("SELECT Item_id from Item WHERE Item_id = '"+c1+"';");
	
	if(rs.next()){
	%>	
			Data cannot be inserted	because this Item_id already exists.
	<%
	}
	else{
		try {
			cr = "INSERT INTO Item values ('" + c1 + "', '" + c2 + "', '" + c3 + "', '" + c4 + "', '" + c5 + "')";
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
