<%-- 
    Document   : show_markrule
    Created on : 2021-11-22, 20:25:25
    Author     : SUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<!--公共头开始-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            html{
                background: url(/bookshop/server/image/yellow_blue.jpg);
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
        <title>Bookshop 管理端</title>
    </head>
    <body>
    <%
    String name=(String)session.getAttribute("username");
    if(name==null){response.sendRedirect("/bookshop/server/root_login.html");}
    %>
    <a href="/bookshop/server/login/hello.jsp">返回</a>
    <h1 align="center">欢迎来到留言管理</h1>
    <!--<h2>欢迎您：</h2>-->
    <%
    Class.forName("com.mysql.jdbc.Driver");  
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
    Statement stmt=conn.createStatement();
    ResultSet rs; //建立ResultSet(结果集)对象
    rs=stmt.executeQuery("Select * From remarks");
    %>
    <table border="1" bgcolor="C0D9D9" align="center">
        <tr bgcolor="yellow"><b>	
            <td align="center">留言记录id</td>
            <td align="center">留言人</td>
            <td align="center">留言书籍</td>
            <td align="center">留言内容</td>
            <td align="center">留言日期</td>
            <td align="center">功能</td>
        </b></tr>
        <%
            while(rs.next()){
        %>
        <tr>
            <td align="center"><%=rs.getString("markid")%></td>
            <td align="center"><%=rs.getString("username")%></td>
            <td align="center"><%=rs.getString("bookname")%></td>
            <td align="center"><%=rs.getString("content")%></td>
            <td align="center"><%=rs.getString("date")%></td>
            <td align="center">
            <a href="/bookshop/server/mark/delete_mark.jsp?markid=<%=rs.getString("markid")%>">删除</a><br><br>
            <a href="/bookshop/server/mark/change_mark_content.jsp?markid=<%=rs.getString("markid")%>&content=<%=rs.getString("content")%>">更改</a></td>
        </tr>
        <%
           }
        %>
    </table>
    </body>
</html>

