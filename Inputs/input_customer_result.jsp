<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, java.sql.*"%>
<HTML><HEAD><TITLE>Insert into customer from HTML</TITLE></HEAD><BODY>
<FONT SIZE = 3 COLOR = BLUE face="Arial">

<% Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
%>		
	<a href="input_result.jsp">Back to the form</a><br> 	
	<%								  	
        int a=1;
		String c1,c2,c3;
		String cr= "111";
		c1 = request.getParameter("cid");
		c2 = request.getParameter("cfod"); 
	    c3 = request.getParameter("ccity"); 
	%> <hr>
	<%
	ResultSet rs = stmt.executeQuery("SELECT Customer_id from Customer WHERE Customer_id = '"+c1+"';");
	if(rs.next()){
	%>	
			Data cannot be inserted	because this customer_id already exists.
	<%
	}
	else{
		try {
			cr = "INSERT INTO customer(Customer_id, First_order_date, City_id) values ('" + c1 + "', '" + c2 + "', '" + c3 + "')";
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
