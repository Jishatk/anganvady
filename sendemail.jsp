<%-- 
    Document   : sendemail
    Created on : Mar 11, 2019, 4:31:34 PM
    Author     : STUDENTS
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
    </head>
    <body>
        <%
            
            String email=request.getParameter("email");
           DateFormat df=new SimpleDateFormat("dd/MM/yyyy");
             Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");            
            String s="jdbc:sqlserver://localhost;databaseName=angdb;user=sa;password=password123";
            Connection con=DriverManager.getConnection(s);
             String q1 ="select * from child where email=? ";
            PreparedStatement ps=con.prepareStatement(q1);
            ps.setString(1, email);
            ResultSet rs1=ps.executeQuery();
            rs1.next();
            String nm=rs1.getString("fname");
            String db=rs1.getString("dob");
             String y[]=db.split("-");
            LocalDate d1=LocalDate.of(Integer.parseInt(y[0]),Integer.parseInt(y[1]),Integer.parseInt(y[2]));
            LocalDate d2=LocalDate.now();
             Period diff=Period.between(d1, d2);
             int yr=diff.getYears();int mth=diff.getMonths();int dy=diff.getDays();
            Statement st=con.createStatement();          
            String q ="select * from vaccine ";
           
            ResultSet rs=st.executeQuery(q);
        %>  
        <form action="mlServlet" method="post">
        <table>
            <tr><td>Name</td><td><input type="text" name="nam" value="<%=nm%>" /></td></tr>
            <tr><td>Email</td><td><input type="text" name="em" value="<%=email%>" /></td></tr>
            
            <tr><td>Age</td><td><input type="text" name="age" value="<%=yr%>yrs<%=mth%>mths"/></td></tr>
            <tr><td>Vaccine Name</td><td><select name="vnam" id="vnam" >
                <option value="">select</option>
            <%
                while(rs.next()){
            %>   
           
            <option value="<%=rs.getString("vname")%>" ><%=rs.getString("vname")%>-<%=rs.getString("minage")%><%=rs.getString("unit")%>-<%=df.format(rs.getDate("vdate"))%></option>
                   
            <%
                }
            %>  
             </select></td></tr>
            <tr><td>Subject</td><td><input type="text" name="sub"  /></td></tr>
            <tr><td>Message</td><td><textarea name="msg" rows="4" cols="20"></textarea></td></tr>
            <tr><td><input type="submit" value="Send Email"/></td><td></td></tr>   
        </table>
        </form>
    </body>
</html>
