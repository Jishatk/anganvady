<%-- 
    Document   : vacview
    Created on : Mar 11, 2019, 3:18:56 PM
    Author     : STUDENTS
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
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
        <style>
            #tbl {
                 font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 90%;
                margin-left:0px;
            }
            #tbl td, #tbl th {
              border: 1px solid #ddd;
              padding: 4px;
            }

            #tbl tr:nth-child(even){background-color: #f2f2f2;}
            #tbl tr:nth-child(odd){background-color: #d6d6d6;}
            #tbl tr:hover {background-color: #ddd;}

            #tbl th {
              padding-top: 12px;
              padding-bottom: 12px;
              text-align: left;
              background-color: #0087b4;
              color: white;
            }
        </style>
    </head>
    <body>
        <br><br><br>
        <form action="" method="post">
            
        <table id="tbl">
            <tr><th>Child Name</th><th>DOB</th><th>Email</th><th>Action</th></tr>
        <%
            String vnam="";
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
                <td><%=rs.getString("email")%></td>
                <td><a href="sendemail.jsp?email=<%=rs.getString("email")%>">Details</a></td></tr>  
            <% } %>
        </table>
        </form> 
    </body>
</html>
