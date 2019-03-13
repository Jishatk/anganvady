<%-- 
    Document   : nutrinfo
    Created on : Mar 13, 2019, 2:44:41 PM
    Author     : STUDENTS
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <form action="nutrimailServlet" method="post">
            <br>   <br>    <br>    
        <table id="tbl">
            <tr><th>Child Name</th><th>DOB</th><th>Email</th></tr>
        <%
            String vnam="";
            int i=0;
            DateFormat df=new SimpleDateFormat("dd-MM-yyyy");
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");            
            String s="jdbc:sqlserver://localhost;databaseName=angdb;user=sa;password=password123";
            Connection con=DriverManager.getConnection(s);
            Statement st=con.createStatement();
            String q="select * from child";
            ResultSet rs=st.executeQuery(q);
            while(rs.next()){
               
       
        %>
            <tr><td><%=rs.getString("fname")%></td>
                <td><%=df.format(rs.getDate("dob"))%></td>                
                <td><%=rs.getString("email")%><input type="hidden" name="em" value="<%=rs.getString("email")%>"/></td>
                  
            <% } %>
             <tr><td>Message</td><td><textarea name="msg" rows="4" cols="40"></textarea></td></tr>
            <tr><td><input type="submit" value="Send Email"/></td><td></td></tr>
        </table>
        </form> 
    </body>
</html>
