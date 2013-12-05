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
	
    command = "INSERT INTO Customer values('001','17/10/2008','1');";
	statement.executeUpdate(command);
	command = "INSERT INTO Customer values('002','13/10/2009','2');";
	statement.executeUpdate(command);
	command = "INSERT INTO Customer values('003','4/1/2010','3');";
	statement.executeUpdate(command);
	command = "INSERT INTO Customer values('004','25/9/2011','2');";
	statement.executeUpdate(command);
	command = "INSERT INTO Customer values('005','1/2/2012','1');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Store values('001','1','063210');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store values('002','1','064567');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store values('003','2','067896');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store values('004','3','978456');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store values('005','3','230245');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Item values('001','First item','200*200','10','250');";
	statement.executeUpdate(command);
	command = "INSERT INTO Item values('002','Second item','10*15','1','100');";
	statement.executeUpdate(command);
	command = "INSERT INTO Item values('003','Third item','100*30','2','41');";
	statement.executeUpdate(command);
	command = "INSERT INTO Item values('004','Fourth item','60*23','7','212');";
	statement.executeUpdate(command);
	command = "INSERT INTO Item values('005','Fifth item','500*240','10','2600');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Store_hold_Item values('001','001','20');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('001','002','30');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('001','004','15');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('002','001','25');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('002','003','4');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('003','005','12');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('003','002','32');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('003','003','5');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('004','004','50');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('005','003','10');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('005','005','31');";
	statement.executeUpdate(command);
	command = "INSERT INTO Store_hold_Item values('005','001','2');";
	statement.executeUpdate(command);
	
	
	command = "INSERT INTO Orders (Order_no, Order_date, Customer_id) values(001,'12/3/2013','001');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Order_contains_items values('001',1,'2',500);";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Person VALUES('001');";
	statement.executeUpdate(command);
	command = "INSERT INTO Person VALUES('003');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Company VALUES('002');";
	statement.executeUpdate(command);
	command = "INSERT INTO Company VALUES('004');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Government VALUES('005');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Employee VALUES('001','Bob','2','HQA1');";
	statement.executeUpdate(command);
	command = "INSERT INTO Employee VALUES('003','Joe','5','HQA2');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO Regular VALUES('002','Brassens and co','SF street');";
	statement.executeUpdate(command);
	command = "INSERT INTO Regular VALUES('004','Fersen and cie','Paris street');";
	statement.executeUpdate(command);
	command = "INSERT INTO Regular VALUES('005','French gov','London street');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO WalkIn VALUES('001','Bob','Lyon street');";
	statement.executeUpdate(command);
	command = "INSERT INTO WalkIn VALUES('004','Fersen and cie','Paris street');";
	statement.executeUpdate(command);
	
	command = "INSERT INTO ECommerce VALUES('002','Brassens','Brassens@123.com');";
	statement.executeUpdate(command);
	command = "INSERT INTO ECommerce VALUES('003','Joe','Joe@mymail.com');";
	statement.executeUpdate(command);
	command = "INSERT INTO ECommerce VALUES('005','French Gov','france@gov.fr');";
	statement.executeUpdate(command);
	
	if(stmt != null) stmt.close(); 
	if(con != null) con.close(); 
%>
</BODY>
</HTML>
