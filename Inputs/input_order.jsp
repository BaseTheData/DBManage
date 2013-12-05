<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, , java.sql.*"%>
<HTML> <HEAD> <TITLE>Project input order.jsp</TITLE> </HEAD>
<BODY> <CENTER> <FONT SIZE = 5 COLOR = blue>Input orders</FONT> </CENTER> <HR> 
<a href="../main.html">Back to the main page</a><br> 	
<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
%>

	<FORM Action="input_order_result.jsp", method=post name=FORM5>
		<P>Order number<INPUT type=text name=on value="" size=4 maxlength=4></P>
		<P>Order date<INPUT type=DATE name=od value="" ></P>
		<P>Customer id<INPUT type=String name=ocustomerid value="" size=4 maxlength=4></P>
		
		<P>Item ordered<INPUT type=String name=oitem value="" ></P>
		<P>Quantity ordered<INPUT type=int name=oqtt value="" ></P>
		<INPUT name=submitorder type=submit value="Insert">
	</FORM>
</BODY>
</HTML>