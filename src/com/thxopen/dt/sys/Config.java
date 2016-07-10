package com.thxopen.dt.sys;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by Administrator on 2015/4/16.
 */
public class Config {
    String deUrl= "jdbc:sqlite:/";
    public String url = "";
    public ServletContext application;

    public  Config(ServletContext application){
        this.application = application;
        try {
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConn(){
        url = deUrl+application.getRealPath("").replace("\\", "/") + "/dt.sqlite3";
//        url = deUrl + "d:\\workspaces\\workspaces\\Datatables-serverSide\\web\\".replace("\\", "/") + "/dt.sqlite3";
        try {
            return DriverManager.getConnection(url);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
