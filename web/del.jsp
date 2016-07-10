<%@ page import="java.sql.*" %>
<%@ page import="com.thxopen.dt.sys.Config" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/4/13
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%


    String name = request.getParameter("name");
    PreparedStatement stmt = null;
    Connection conn = new Config(application).getConn();
    if (conn != null) {
        String sql = "delete from user where name = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1,name);
        int flag = stmt.executeUpdate();
        out.print(flag);
    }
    stmt.close();
    conn.close();
%>
