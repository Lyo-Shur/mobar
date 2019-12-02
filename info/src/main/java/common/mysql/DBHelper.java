package common.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 数据库连接工具
 * @author ls 2018-05-05 18:32:35
 * V1.0 初次编写
 * @author ls 2019-10-29 10:53:21
 * V1.0.5 重新整理
 */
public class DBHelper {

	/**
	 * 数据库链接
	 */
	public Connection conn = null;

	/**
	 * 构造函数
	 * @param url 数据库链接地址
	 * @param username 用户名
	 * @param password 密码
	 */
	public DBHelper(String url, String username, String password){
		url = "jdbc:mysql://" + url + "/information_schema?charset=utf8&parseTime=true&serverTimezone=UTC";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 关闭数据库链接
	 */
	public void close(){
		try {
			this.conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}