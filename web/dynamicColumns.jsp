<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.thxopen.dt.bean.User" %>
<%@ page import="com.thxopen.dt.sys.Config" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    ResultSet rs = null;
    Statement stmt = null;
    Connection conn = new Config(application).getConn();
    String table = "user";

    //前台传过来的列名
    String columns = request.getParameter("cols");

    List<User> users = new ArrayList<User>();
    if (conn != null) {
        //根据列名从数据库中查出相应的数据
        String sql = "SELECT " + columns + " FROM " + table;
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
        while (rs.next()) {
            String name = columns.indexOf("name") > 0 ? rs.getString("name") : "DataTables 中文网";
            String position = columns.indexOf("position") > 0 ? rs.getString("position") : "";
            String salary = columns.indexOf("salary") > 0 ? rs.getString("salary") : "";
            String start_date = columns.indexOf("start_date") > 0 ? rs.getString("start_date") : "";
            String office = columns.indexOf("office") > 0 ? rs.getString("office") : "";
            String extn = columns.indexOf("extn") > 0 ? rs.getString("extn") : "";
            users.add(new User(name, position, salary, start_date, office, extn));
        }
    }


    Map<Object, Object> info = new HashMap<Object, Object>();
    info.put("data", users);
    String json = new Gson().toJson(info);
    rs.close();
    stmt.close();
    conn.close();
    out.write(json);
%>
