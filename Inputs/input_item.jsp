<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, , java.sql.*"%>
<HTML> <HEAD> <TITLE>Project input items.jsp</TITLE> </HEAD>
<BODY> <CENTER> <FONT SIZE = 5 COLOR = blue>Input items</FONT> </CENTER> <HR> 
<a href="../main.html">Back to the main page</a><br> 	
<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
%>

	<FORM Action="input_item_result.jsp", method=post name=FORM5>
		<P>Item id<INPUT type=text name=iid value="" size=4 maxlength=4></P>
		<P>Item description<INPUT type=text name=idesc value="" size=40 maxlength=40></P>
		<P>Item size<INPUT type=String name=isize value="" size=40 maxlength=40></P>
		<P>Item weight<INPUT type=Float name=iw value="" ></P>
		<P>Item unit_price<INPUT type=Float name=iup value="" ></P>
		<INPUT name=submitItem type=submit value="Insert">
	</FORM>
</BODY>
</HTML>