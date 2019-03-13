<%-- 
    Document   : vaccine
    Created on : Mar 11, 2019, 2:42:04 PM
    Author     : STUDENTS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="vacservlet" method="post">
        <table>
            <tr><td>Vaccine Name</td><td><input type="text" name="vnam" value="" /></td></tr>
            <tr><td>User</td><td><input type="text" name="auser" value="" /></td></tr>
            <tr><td>Description</td><td><textarea name="desc" cols="20" rows="5"></textarea></td></tr>
            <tr><td>Age</td><td>From <select name="frm">
                        <option value="0">0</option>
                        <option value="1">1</option> 
                        <option value="2">2</option> 
                        <option value="3">3</option>
                        <option value="4">4</option> 
                        <option value="5">5</option> 
                        <option value="6">6</option>
                    </select>To <select name="to">
                        <option value="">select</option>
                        <option value="months">months</option>
                        <option value="yrs">yrs</option>
                       
                    </select></td></tr>
            <tr><td>Vaccine Date</td><td><input type="date" name="vdate"  /></td></tr>
            <tr><td></td><td><input type="submit" value="Enter"  /></td></tr>
        </table>
        </form>
    </body>
</html>
