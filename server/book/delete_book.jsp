<%-- 
    Document   : delete_book
    Created on : 2021-11-21, 21:33:28
    Author     : SUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
   <% 
   request.setCharacterEncoding("utf-8");
   String  bookid=request.getParameter("bookid");
   Class.forName("com.mysql.jdbc.Driver");  
   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
   Statement stmt=conn.createStatement();  
   stmt.executeUpdate("DELETE FROM book WHERE bookid="+bookid+"");
   response.sendRedirect("show_bookrule.jsp");
   %>
</html>
