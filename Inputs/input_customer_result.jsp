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
		String c1,c2,c3, c4, c5;
		String cr;

		c1 = request.getParameter("cid");
		c2 = request.getParameter("cfod"); 
	    c3 = request.getParameter("ccity"); 
	    c4 = request.getParameter("cust1");
	    c5 = request.getParameter("cust2");
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
																																																																																																									
			if (c4 == "employee")
			{
			%>
				<FORM Action="employee.jsp", method=post name=FORM6>
				<P>Customer name<INPUT type=text name=cname value=""></P>
				<P>Discount rate<INPUT type=number name=cfod value=""></P>
				<P>HQ Address<INPUT type=text name=ccity value="" size=4 maxlength=4></P>
				<INPUT name=submitEmp type=submit value="Insert">
			<%	
			}
			else
			{
			%>

			<%
			}
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
