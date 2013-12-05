<%@ page contentType="text/html; charset=Big5" import="java.util.Date, java.io.*, , java.sql.*"%>
<HTML> <HEAD> <TITLE>insertValue.jsp</TITLE> </HEAD>
<BODY> <CENTER> <FONT SIZE = 5 COLOR = blue>Insert Project Table</FONT> </CENTER> <HR> 
<%
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:project");
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);

	ResultSet rs;
						  	
    int a=1; int i;
		
    Statement statement = con.createStatement();
	
	String command = "INSERT INTO State values('France','HQA1');";
	statement.executeUpdate(command);
	command = "INSERT INTO State values('Japan','HQA2');";
	statement.executeUpdate(command);
	command = "INSERT INTO State values('India','HQA3');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO City values('1','Montpellier','France');";
	statement.executeUpdate(command);
	command = "INSERT INTO City values('2','Tokyo','Japan');";
	statement.executeUpdate(command);
	command = "INSERT INTO City values('3','Deli','India');";
	statement.executeUpdate(command);
	
    command = "INSERT INTO Customer values('1','17/10/2008','1');";
	statement.executeUpdate(command);
	command = "INSERT INTO Customer values('2','13/10/2009','2');";
	statement.executeUpdate(command);
	command = "INSERT INTO Customer values('3','4/1/2010','3');";
	statement.executeUpdate(command);
	command = "INSERT INTO Customer values('4','25/9/2011','2');";
	statement.executeUpdate(command);
	command = "INSERT INTO Customer values('5','1/2/2012','1');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Store values('1','1','063210');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store values('2','1','064567');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store values('3','2','067896');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store values('4','3','978456');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store values('5','3','230245');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Item values('1','First item','200*200','10','250');";
	statement.executeUpdate(command);
	command = "INSERT INTO Item values('2','Second item','10*15','1','100');";
	statement.executeUpdate(command);
	command = "INSERT INTO Item values('3','Third item','100*30','2','41');";
	statement.executeUpdate(command);
	command = "INSERT INTO Item values('4','Fourth item','60*23','7','212');";
	statement.executeUpdate(command);
	command = "INSERT INTO Item values('5','Fifth item','500*240','10','2600');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Store_hold_Item values('1','1','20');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('1','2','30');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('1','4','15');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('2','1','25');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('2','3','4');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('3','5','12');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('3','2','32');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('3','3','5');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('4','4','50');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('5','3','10');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('5','5','31');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('5','1','2');";
	statement.executeUpdate(command);
	
	
	command = "INSERT INTO Orders (Order_no, Order_date, Customer_id) values(1,'12/3/2013','1');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Order_contains_items values('1',1,'2',500);";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Person VALUES('1');";
	statement.executeUpdate(command);
	command = "INSERT INTO Person VALUES('3');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Company VALUES('2');";
	statement.executeUpdate(command);
	command = "INSERT INTO Company VALUES('4');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Government VALUES('5');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Employee VALUES('1','Bob','2','HQA1');";
	statement.executeUpdate(command);
	command = "INSERT INTO Employee VALUES('3','Joe','5','HQA2');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Regular VALUES('2','Brassens and co','SF street');";
	statement.executeUpdate(command);
	command = "INSERT INTO Regular VALUES('4','Fersen and cie','Paris street');";
	statement.executeUpdate(command);
	command = "INSERT INTO Regular VALUES('5','French gov','London street');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO WalkIn VALUES('1','Bob','Lyon street');";
	statement.executeUpdate(command);
	command = "INSERT INTO WalkIn VALUES('4','Fersen and cie','Paris street');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO ECommerce VALUES('2','Brassens','Brassens@123.com');";
	statement.executeUpdate(command);
	command = "INSERT INTO ECommerce VALUES('3','Joe','Joe@mymail.com');";
	statement.executeUpdate(command);
	command = "INSERT INTO ECommerce VALUES('5','French Gov','france@gov.fr');";
	statement.executeUpdate(command);
	
	if(stmt != null) stmt.close(); 
	if(con != null) con.close(); 
%>
</BODY>
</HTML>
