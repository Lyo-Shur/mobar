package common.mysql.info.bean;

/**
 * 列信息实体
 * 保存数据库表列信息
 * @author ls 2018-05-05 22:53:27
 * V1.0 初次编写
 * @author ls 2019-10-29 10:56:23
 * V1.0.5 重新整理
 */
public class Column {

	/**
	 * 序号
	 */
	private String number;
	
	/**
	 * 列名
	 */
	private String name;
	
	/**
	 * 列类型
	 */
	private String type;
	
	/**
	 * 是否允许为空
	 */
	private String nullAble;
	
	/**
	 * 默认值
	 */
	private String defaule;
	
	/**
	 * 注释
	 */
	private String comment;

	/**
	 * @return number 返回序号
	 */
	public String getNumber() {
		return number;
	}

	/**
	 * @param number 设置序号
	 */
	public void setNumber(String number) {
		this.number = number;
	}

	/**
	 * @return name 返回列名
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name 设置列名
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return type 返回列类型
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type 设置列类型
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @return nullAble 返回是否允许为空
	 */
	public String getNullAble() {
		return nullAble;
	}

	/**
	 * @param nullAble 设置是否允许为空
	 */
	public void setNullAble(String nullAble) {
		this.nullAble = nullAble;
	}

	/**
	 * @return defaule 返回默认值
	 */
	public String getDefaule() {
		return defaule;
	}

	/**
	 * @param defaule 设置默认值
	 */
	public void setDefaule(String defaule) {
		this.defaule = defaule;
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
}