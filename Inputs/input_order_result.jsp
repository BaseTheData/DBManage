<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML><HEAD><TITLE>Insert into customer from HTML</TITLE></HEAD><BODY>
<FONT SIZE = 3 COLOR = BLUE face="Arial">

<% Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
%>		
	<a href="input_order.jsp">Back to the form</a><br> 	
	<%								  	
        int a=1;
		float d = -1;
		int c5;
		String c1,c2,c3,c4;
		String cr= "111";
		c1 = request.getParameter("on");
		c2 = request.getParameter("od"); 
	    c3 = request.getParameter("ocustomerid"); 
		c4 = request.getParameter("oitem"); 
		c5 = Integer.parseInt(request.getParameter("oqtt")); 
	%> <hr>
	<%
	ResultSet rs = stmt.executeQuery("SELECT Customer_id FROM Customer WHERE Customer_id = '"+c3+"';");
	if( !rs.next() ){
	%>	
			Data cannot be inserted	because this customer doesn't exist.
	<%
	}
	else if( !(rs = stmt.executeQuery("SELECT Unit_price FROM Item WHERE Item_id = '"+c4+"';")).next() ){
	%>	
			Data cannot be inserted	because this item doesn't exist.
	<%
	}
	else{
		d = Float.parseFloat(rs.getString("Unit_price"))*c5;
		try {
			cr = "INSERT INTO Orders values ('" + c1 + "', '" + c2 + "', '" + c3 + "')";
			a = stmt.executeUpdate(cr);
			cr = "INSERT INTO Order_contains_items values ('" + c4 + "','" + c1 + "', '" + c5 + "', '" + d + "')";
			a = stmt.executeUpdate(cr);
			
		%>	
			Data successfully inserted.
		<%
		}
		catch (SQLException e) {
		%>	
			console.log("result : c1 = "+<%=c1%>+" c2 = "+<%=c2%>+" c3 = "+<%=c3%>);
			Data cannot be inserted because a value is incorrect.
		<%
		}
	}
	%>
</FONT>		
</H2></CENTER></BODY></HTML>