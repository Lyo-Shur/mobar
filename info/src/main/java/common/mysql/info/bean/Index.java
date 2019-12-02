package common.mysql.info.bean;

/**
 * 索引信息实体
 * 保存表中的索引信息
 * @author ls 2018-05-05 22:57:55
 * V1.0 初次编写
 * @author ls 2019-10-29 10:56:23
 * V1.0.5 重新整理
 */
public class Index {

	/**
	 * 索引名
	 */
	private String name;
	
	/**
	 * 列名
	 */
	private String columnName;
	
	/**
	 * 是否是唯一约束
	 */
	private String unique;
	
	/**
	 * 索引类型
	 */
	private String type;

	/**
	 * @return name 返回索引名
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name 设置索引名
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return columnName 返回列名
	 */
	public String getColumnName() {
		return columnName;
	}

	/**
	 * @param columnName 设置列名
	 */
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	/**
	 * @return unique 返回是否是唯一约束
	 */
	public String getUnique() {
		return unique;
	}

	/**
	 * @param unique 设置是否是唯一约束
	 */
	public void setUnique(String unique) {
		this.unique = unique;
	}

	/**
	 * @return type 返回索引类型
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type 设置索引类型
	 */
	public void setType(String type) {
		this.type = type;
	}
}