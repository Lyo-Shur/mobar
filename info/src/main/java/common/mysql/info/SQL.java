package common.mysql.info;

/**
 * 数据库查询SQL
 * @author ls 2018-05-05 22:06:02
 * V1.0 初次编写
 * @author ls 2019-10-29 10:56:23
 * V1.0.5 重新整理
 */
class SQL {

    /**
	 * 得到查询表信息SQL
	 * @param dbName 数据库名
	 * @return 表信息查询SQL
	 */
	static String tableInfo(String dbName) {
        String TABLE_INFO = "SELECT TABLE_NAME,`ENGINE`,TABLE_COLLATION,TABLE_COMMENT FROM TABLES WHERE TABLE_SCHEMA = '[DB_NAME]' AND TABLE_TYPE = 'BASE TABLE'";
        return TABLE_INFO.replace("[DB_NAME]", dbName);
	}
	
	/**
	 * 得到查询列信息的SQL
	 * @param dbName 数据库名
	 * @param tableName 表名
	 * @return 查询列信息的SQL
	 */
	static String columnInfo(String dbName, String tableName){
        String COLUMN_INFO = "SELECT ORDINAL_POSITION,COLUMN_NAME,COLUMN_TYPE,IS_NULLABLE,COLUMN_DEFAULT,COLUMN_COMMENT FROM COLUMNS WHERE TABLE_SCHEMA = '[DB_NAME]' AND TABLE_NAME = '[TABLE_NAME]'";
        return COLUMN_INFO.replace("[DB_NAME]", dbName).replace("[TABLE_NAME]", tableName);
	}
	
	/**
	 * 得到查询索引信息的SQL
	 * @param dbName 数据库名
	 * @param tableName 表名
	 * @return 查询索引信息的SQL
	 */
	static String indexInfo(String dbName, String tableName){
        String INDEX_INFO = "SELECT INDEX_NAME,COLUMN_NAME,NON_UNIQUE,INDEX_TYPE FROM STATISTICS WHERE TABLE_SCHEMA = '[DB_NAME]' AND TABLE_NAME = '[TABLE_NAME]'";
        return INDEX_INFO.replace("[DB_NAME]", dbName).replace("[TABLE_NAME]", tableName);
	}
}