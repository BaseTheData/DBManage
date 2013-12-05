<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, , java.sql.*"%>
<HTML> <HEAD> <TITLE>Project input store.jsp</TITLE> </HEAD>
<BODY> <CENTER> <FONT SIZE = 5 COLOR = blue>Input store</FONT> </CENTER> <HR> 
<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
%>

	<FORM Action="input_store_result.jsp", method=post name=FORM5>
		<P>Store id<INPUT type=text name=sid value="" size=4 maxlength=4></P>
		<P>City id<INPUT type=text name=scityid value="" size=4 maxlength=4></P>
		<P>Store phone number<INPUT type=String name=spn value=""></P>
		<INPUT name=submitCustomer type=submit value="Insert">
	</FORM>
</BODY>
</HTML>