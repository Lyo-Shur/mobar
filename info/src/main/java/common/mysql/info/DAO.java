package common.mysql.info;

import common.mysql.info.bean.Column;
import common.mysql.info.bean.Index;
import common.mysql.info.bean.Table;
import common.mysql.DBHelper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 数据库查询工具
 * @author ls 2018-05-05 18:40:21
 * V1.0 初次编写
 * @author ls 2019-10-29 10:56:23
 * V1.0.5 重新整理
 */
public class DAO {

	private DBHelper dbHelper;
	
	/**
	 * 数据库查询工具-默认构造
	 * @param dbHelper 数据库连接工具
	 */
	public DAO(DBHelper dbHelper){
		this.dbHelper = dbHelper;
	}
	
	/**
	 * 获取数据库信息
	 * @param dbName 数据库名
	 * @return 数据库中的表信息
	 */
	public List<Table> getDataBaseInfo(String dbName){
		List<Table> tableList = getTableList(dbName);
		for (Table table : tableList) {
			table.setColumnList(getColumnList(dbName, table.getName()));
			table.setIndexList(getIndexList(dbName, table.getName()));
		}
		return tableList;
	}
	
	/**
	 * 获取表信息列表
	 * @param dbName 数据库名
	 * @return 表信息列表
	 */
	private List<Table> getTableList(String dbName){
		List<Table> list = new ArrayList<>();
		
		ResultSet resultSet;
		try {
			resultSet = dbHelper.conn.prepareStatement(SQL.tableInfo(dbName)).executeQuery();
			while (resultSet.next()) {
				Table table = new Table();
				table.setName(resultSet.getString(1));
				table.setEngine(resultSet.getString(2));
				table.setCollation(resultSet.getString(3));
				table.setComment(resultSet.getString(4));
				list.add(table);
			}
			resultSet.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	/**
	 * 获取栏位信息列表
	 * @param dbName 数据库名
	 * @param tableName 表名
	 * @return 栏位信息列表
	 */
	private List<Column> getColumnList(String dbName, String tableName){
		List<Column> list = new ArrayList<>();
		
		ResultSet resultSet;
		try {
			resultSet = dbHelper.conn.prepareStatement(SQL.columnInfo(dbName, tableName)).executeQuery();
			while (resultSet.next()) {
				Column column = new Column();
				column.setNumber(resultSet.getString(1));
				column.setName(resultSet.getString(2));
				column.setType(resultSet.getString(3));
				column.setNullAble(resultSet.getString(4));
				column.setDefaule(resultSet.getString(5));
				column.setComment(resultSet.getString(6));
				list.add(column);
			}
			resultSet.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * 获取索引信息列表
	 * @param dbName 数据库名
	 * @param tableName 表名
	 * @return 索引信息列表
	 */
	private List<Index> getIndexList(String dbName, String tableName){
		List<Index> list = new ArrayList<>();
		
		ResultSet resultSet;
		try {
			resultSet = dbHelper.conn.prepareStatement(SQL.indexInfo(dbName, tableName)).executeQuery();
			while (resultSet.next()) {
				Index index = new Index();
				index.setName(resultSet.getString(1));
				index.setColumnName(resultSet.getString(2));
				index.setUnique(resultSet.getString(3));
				index.setType(resultSet.getString(4));
				list.add(index);
			}
			resultSet.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}