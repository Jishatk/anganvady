/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author STUDENTS
 */
public class vacservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String vn=request.getParameter("vnam");
            String us=request.getParameter("auser");
            String ds=request.getParameter("desc");
            int age1=Integer.parseInt(request.getParameter("frm"));
            String unit=request.getParameter("to");
            String dt=request.getParameter("vdate");out.print(dt);
            DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
            Date vd=df.parse(dt);
             java.sql.Date sqldt=new java.sql.Date(vd.getTime());
              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");            
            String s="jdbc:sqlserver://localhost;databaseName=angdb;user=sa;password=password123";
            Connection con=DriverManager.getConnection(s);
            String q="insert into vaccine values(?,?,?,?,?,?)";            
            PreparedStatement ps=con.prepareStatement(q);
            ps.setString(1, vn);
            ps.setString(2, us);
            ps.setString(3, ds);
            ps.setInt(4,age1);
            ps.setString(5,unit);
            ps.setDate(6, sqldt);
            int c=ps.executeUpdate();
            
        } catch (ParseException ex) {
           ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
           ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
