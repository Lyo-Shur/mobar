package common.mysql.info.bean;

import java.util.List;

/**
 * 数据库表信息实体
 * 保存数据库表相关信息
 * @author ls 2018-05-05 10:40:57
 * V1.0 初次编写
 * @author ls 2019-10-29 10:56:23
 * V1.0.5 重新整理
 */
public class Table {

	/**
	 * 表名
	 */
	private String name;
	
	/**
	 * 引擎
	 */
	private String engine;
	
	/**
	 * 排序规则
	 */
	private String collation;
	
	/**
	 * 注释
	 */
	private String comment;
	
	/**
	 * 列信息列表
	 */
	private List<Column> columnList;
	
	/**
	 * 索引信息列表
	 */
	private List<Index> indexList;

	/**
	 * @return name 返回表名
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name 设置表名
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return engine 返回引擎
	 */
	public String getEngine() {
		return engine;
	}

	/**
	 * @param engine 设置引擎
	 */
	public void setEngine(String engine) {
		this.engine = engine;
	}

	/**
	 * @return collation 返回排序规则
	 */
	public String getCollation() {
		return collation;
	}

	/**
	 * @param collation 设置排序规则
	 */
	public void setCollation(String collation) {
		this.collation = collation;
	}

	/**
	 * @return comment 返回注释
	 */
	public String getComment() {
		return comment;
	}

	/**
	 * @param comment 设置注释
	 */
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	/**
	 * @return columnList 返回列信息列表
	 */
	public List<Column> getColumnList() {
		return columnList;
	}

	/**
	 * @param columnList 设置列信息列表
	 */
	public void setColumnList(List<Column> columnList) {
		this.columnList = columnList;
	}

	/**
	 * @return indexList 返回索引信息列表
	 */
	public List<Index> getIndexList() {
		return indexList;
	}

	/**
	 * @param indexList 设置索引信息列表
	 */
	public void setIndexList(List<Index> indexList) {
		this.indexList = indexList;
	}
}