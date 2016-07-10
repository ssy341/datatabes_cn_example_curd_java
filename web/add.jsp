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
    String position = request.getParameter("position");
    String salary = request.getParameter("salary");
    String start_date = request.getParameter("start_date");
    String office = request.getParameter("office");
    String extn = request.getParameter("extn");

    PreparedStatement stmt = null;
    Connection conn = new Config(application).getConn();
    if (conn != null) {
        String sql = "insert into user values (?,?,?,?,?,?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1,name);
        stmt.setString(2,position);
        stmt.setString(3,salary);
        stmt.setString(4,start_date);
        stmt.setString(5,office);
        stmt.setString(6,extn);

        int flag = stmt.executeUpdate();
        out.print(flag);
    }
    stmt.close();
    conn.close();
%>
